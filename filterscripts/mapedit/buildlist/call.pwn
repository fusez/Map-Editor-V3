public OnFilterScriptInit() {
    CreateGenericBuildList();

    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            DefaultBuildListData(playerid);
        }
    }

    #if defined bl_OnFilterScriptInit
        bl_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit bl_OnFilterScriptInit
#if defined bl_OnFilterScriptInit
    forward bl_OnFilterScriptInit();
#endif


public OnFilterScriptExit() {
    DestroyGenericBuildList();

    #if defined bl_OnFilterScriptExit
        bl_OnFilterScriptExit();
    #endif
}
#if defined _ALS_OnFilterScriptExit
    #undef OnFilterScriptExit
#else
    #define _ALS_OnFilterScriptExit
#endif
#define OnFilterScriptExit bl_OnFilterScriptExit
#if defined bl_OnFilterScriptExit
    forward bl_OnFilterScriptExit();
#endif


public OnPlayerConnect(playerid) {
    DefaultBuildListData(playerid);

    #if defined bl_OnPlayerConnect
        return bl_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect bl_OnPlayerConnect
#if defined bl_OnPlayerConnect
    forward bl_OnPlayerConnect(playerid);
#endif


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    switch(dialogid) {
        case DIALOGID_BUILDLIST_PAGE: {
            if( !response ) {
                return 1;
            }

            new page;

            if( sscanf(inputtext, "i", page) ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a valid page number!");
                ShowBuildListDialog(playerid, dialogid);
                return 1;
            }

            page --;

            if( page < MIN_BUILDLIST_PAGE || page > MAX_BUILDLIST_PAGE ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a valid page number!");
                ShowBuildListDialog(playerid, dialogid);
                return 1;
            }

            g_BuildListData[playerid][BUILDLIST_DATA_PAGE] = page;
            LoadBuildListRowData(playerid);

            ApplyBuildListPage(playerid);
            for(new row; row < MAX_BUILDLIST_ROWS; row ++) {
                ApplyBuildListRowData(playerid, row);
            }
            return 1;
        }
        case DIALOGID_BUILDLIST_RECREATE: {
            if( !response ) {
                return 1;
            }

            new buildingid = GetPlayerEditBuilding(playerid);
            if( buildingid == INVALID_BUILDING_ID ) {
                return 1;
            }

            g_BuildingData[buildingid][BUILDING_DATA_ISREMOVED] = false;

            SendClientMessage(playerid, RGBA_GREEN, "Building recreated successfully. You need to reconnect in order to see recreated building(s).");
            return 1;
        }
        case DIALOGID_BUILDLIST_REMOVE: {
            if( !response ) {
                return 1;
            }

            new buildingid = GetPlayerEditBuilding(playerid);
            if( buildingid == INVALID_BUILDING_ID ) {
                return 1;
            }

            RemoveBuildingIDForAll(buildingid);

            g_BuildingData[buildingid][BUILDING_DATA_ISREMOVED] = true;
            return 1;
        }
    }

    #if defined bl_OnDialogResponse
        return bl_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif
#define OnDialogResponse bl_OnDialogResponse
#if defined bl_OnDialogResponse
    forward bl_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif


public OnPlayerClickTextDraw(playerid, Text:clickedid) {
    if( g_PlayerData[playerid][PLAYER_DATA_TDMODE] == TDMODE_BUILDLIST && ( clickedid == g_BuildListGTD[BUILDLIST_GTD_CLOSE] || clickedid == Text: INVALID_TEXT_DRAW ) ) {
        if( g_PlayerData[playerid][PLAYER_DATA_POS_SAVED] ) {
            if( g_CamModeData[playerid][CAMMODE_DATA_TOGGLE] ) {
                SetPlayerObjectPos(playerid, g_CamModeData[playerid][CAMMODE_DATA_POID], g_PlayerData[playerid][PLAYER_DATA_POS_X], g_PlayerData[playerid][PLAYER_DATA_POS_Y], g_PlayerData[playerid][PLAYER_DATA_POS_Z]);
            } else {
                SetPlayerPos(playerid, g_PlayerData[playerid][PLAYER_DATA_POS_X], g_PlayerData[playerid][PLAYER_DATA_POS_Y], g_PlayerData[playerid][PLAYER_DATA_POS_Z]);
            }
            g_PlayerData[playerid][PLAYER_DATA_POS_SAVED] = false;
        }

        g_BuildListData[playerid][BUILDLIST_DATA_EDIT_VIEWED] = false;

        HidePlayerTextdrawMode(playerid);

        if( clickedid == g_BuildListGTD[BUILDLIST_GTD_CLOSE] ) {
            return 1; // ESCAPE key was not used, return 1
        }
    }

    if( clickedid == g_BuildListGTD[BUILDLIST_GTD_PAGE_F] ) {
        if( g_BuildListData[playerid][BUILDLIST_DATA_PAGE] == MIN_BUILDLIST_PAGE ) {
            return 1;
        }

        g_BuildListData[playerid][BUILDLIST_DATA_PAGE] = MIN_BUILDLIST_PAGE;
        LoadBuildListRowData(playerid);

        ApplyBuildListPage(playerid);
        for(new row; row < MAX_BUILDLIST_ROWS; row ++) {
            ApplyBuildListRowData(playerid, row);
        }
        return 1;
    }
    if( clickedid == g_BuildListGTD[BUILDLIST_GTD_PAGE_P] ) {
        if( g_BuildListData[playerid][BUILDLIST_DATA_PAGE] == MIN_BUILDLIST_PAGE ) {
            return 1;
        }

        if( -- g_BuildListData[playerid][BUILDLIST_DATA_PAGE] < MIN_BUILDLIST_PAGE ) {
            g_BuildListData[playerid][BUILDLIST_DATA_PAGE] = MIN_BUILDLIST_PAGE;
        }

        LoadBuildListRowData(playerid);

        ApplyBuildListPage(playerid);
        for(new row; row < MAX_BUILDLIST_ROWS; row ++) {
            ApplyBuildListRowData(playerid, row);
        }
        return 1;
    }
    if( clickedid == g_BuildListGTD[BUILDLIST_GTD_PAGE_N] ) {
        if( g_BuildListData[playerid][BUILDLIST_DATA_PAGE] == MAX_BUILDLIST_PAGE ) {
            return 1;
        }

        if( ++ g_BuildListData[playerid][BUILDLIST_DATA_PAGE] > MAX_BUILDLIST_PAGE ) {
            g_BuildListData[playerid][BUILDLIST_DATA_PAGE] = MAX_BUILDLIST_PAGE;
        }

        LoadBuildListRowData(playerid);

        ApplyBuildListPage(playerid);
        for(new row; row < MAX_BUILDLIST_ROWS; row ++) {
            ApplyBuildListRowData(playerid, row);
        }
        return 1;
    }
    if( clickedid == g_BuildListGTD[BUILDLIST_GTD_PAGE_L] ) {
        if( g_BuildListData[playerid][BUILDLIST_DATA_PAGE] == MAX_BUILDLIST_PAGE ) {
            return 1;
        }

        g_BuildListData[playerid][BUILDLIST_DATA_PAGE] = MAX_BUILDLIST_PAGE;
        LoadBuildListRowData(playerid);

        ApplyBuildListPage(playerid);
        for(new row; row < MAX_BUILDLIST_ROWS; row ++) {
            ApplyBuildListRowData(playerid, row);
        }
        return 1;
    }

    #if defined bl_OnPlayerClickTextDraw
        return bl_OnPlayerClickTextDraw(playerid, Text:clickedid);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerClickTextDraw
    #undef OnPlayerClickTextDraw
#else
    #define _ALS_OnPlayerClickTextDraw
#endif
#define OnPlayerClickTextDraw bl_OnPlayerClickTextDraw
#if defined bl_OnPlayerClickTextDraw
    forward bl_OnPlayerClickTextDraw(playerid, Text:clickedid);
#endif


public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid) {
    if( playertextid == g_BuildListPTD[playerid][BUILDLIST_PTD_PAGE] ) {
        ShowBuildListDialog(playerid, DIALOGID_BUILDLIST_PAGE);
        return 1;
    }
    if( playertextid == g_BuildListPTD[playerid][BUILDLIST_PTD_INCMODE] ) {
        switch( g_BuildListData[playerid][BUILDLIST_DATA_INCMODE] ) {
            case BUILDING_INCMODE_ALL: {
                g_BuildListData[playerid][BUILDLIST_DATA_INCMODE] = BUILDING_INCMODE_REMOVED;
            }
            case BUILDING_INCMODE_REMOVED: {
                g_BuildListData[playerid][BUILDLIST_DATA_INCMODE] = BUILDING_INCMODE_EXISTING;
            }
            default: {
                g_BuildListData[playerid][BUILDLIST_DATA_INCMODE] = BUILDING_INCMODE_ALL;
            }
        }

        g_BuildListData[playerid][BUILDLIST_DATA_PAGE] = MIN_BUILDLIST_PAGE;
        LoadBuildListRowData(playerid);

        ApplyBuildListPage(playerid);
        ApplyBuildListIncludeMode(playerid);
        for(new row; row < MAX_BUILDLIST_ROWS; row ++) {
            ApplyBuildListRowData(playerid, row);
        }
        return 1;
    }
    for(new row; row < MAX_BUILDLIST_ROWS; row ++) {
        if(
            playertextid == g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_ROW][row] ||
            playertextid == g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_ROW][row] ||
            playertextid == g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_ROW][row]
        ) {
            new buildingid = g_BuildListData[playerid][BUILDLIST_DATA_ROW_ID][row];

            if( buildingid == INVALID_BUILDING_ID ) {
                return 1;
            }

            new prev_row = g_BuildListData[playerid][BUILDLIST_DATA_EDIT_ROW];
            if( row != prev_row) {
                g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = buildingid;
                g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_BUILDING;

                g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] = g_BuildingData[buildingid][BUILDING_DATA_MODEL];
                if( g_ModelViewData[playerid][MODELVIEW_DATA_TOGGLE] ) {
                    ApplyModelViewModel(playerid, .showtd = true);
                } else {
                    ShowModelView(playerid);
                }
            }

            new bool:prev_is_viewed = g_BuildListData[playerid][BUILDLIST_DATA_EDIT_VIEWED];
            if( row == prev_row && prev_is_viewed ) {
                ShowBuildListDialog(playerid, g_BuildingData[buildingid][BUILDING_DATA_ISREMOVED] ? DIALOGID_BUILDLIST_RECREATE : DIALOGID_BUILDLIST_REMOVE);
                return 1;
            }

            new
                       build_modelid = g_BuildingData[buildingid][BUILDING_DATA_MODEL],
                Float: build_x       = g_BuildingData[buildingid][BUILDING_DATA_X],
                Float: build_y       = g_BuildingData[buildingid][BUILDING_DATA_Y],
                Float: build_z       = g_BuildingData[buildingid][BUILDING_DATA_Z],
                Float: build_rx      = g_BuildingData[buildingid][BUILDING_DATA_RX],
                Float: build_ry      = g_BuildingData[buildingid][BUILDING_DATA_RY],
                Float: build_rz      = g_BuildingData[buildingid][BUILDING_DATA_RZ],
                Float: sphere_radius,
                Float: sphere_off_x,
                Float: sphere_off_y,
                Float: sphere_off_z,
                Float: x,
                Float: y,
                Float: z,
                Float: distance
            ;

            GetModelSphere(build_modelid, sphere_radius, sphere_off_x, sphere_off_y, sphere_off_z);

            PositionFromOffset(build_x, build_y, build_z, build_rx, build_ry, build_rz, sphere_off_x, sphere_off_y, sphere_off_z, x, y, z);

            distance = sphere_radius + 10.0;

            if( g_CamModeData[playerid][CAMMODE_DATA_TOGGLE] ) {
                new
                    Float: vec_x,
                    Float: vec_y,
                    Float: vec_z
                ;

                GetPlayerCameraFrontVector(playerid, vec_x, vec_y, vec_z);

                x -= (vec_x * distance);
                y -= (vec_y * distance);
                z -= (vec_z * distance);

                SetPlayerObjectPos(playerid, g_CamModeData[playerid][CAMMODE_DATA_POID], x, y, z);
            } else {
                new Float:a;
                GetPlayerFacingAngle(playerid, a);

                x -= (distance * floatsin(-a, degrees));
                y -= (distance * floatcos(-a, degrees));

                SetPlayerPos(playerid, x, y, z);
                SetCameraBehindPlayer(playerid);
            }

            if( !prev_is_viewed || row != prev_row ) {
                g_BuildListData[playerid][BUILDLIST_DATA_EDIT_VIEWED] = true;
                g_BuildListData[playerid][BUILDLIST_DATA_EDIT_ROW] = row;

                ApplyBuildListRowColor(playerid, row);

                if( prev_row != INVALID_ROW ) {
                    ApplyBuildListRowColor(playerid, prev_row);
                }
            }

            if( !g_PlayerData[playerid][PLAYER_DATA_POS_SAVED] ) {
                GetPlayerPos(playerid, g_PlayerData[playerid][PLAYER_DATA_POS_X], g_PlayerData[playerid][PLAYER_DATA_POS_Y], g_PlayerData[playerid][PLAYER_DATA_POS_Z]);
                g_PlayerData[playerid][PLAYER_DATA_POS_SAVED] = true;
            }
            return 1;
        }
    }

    #if defined bl_OnPlayerClickPlayerTD
        return bl_OnPlayerClickPlayerTD(playerid, PlayerText:playertextid);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerClickPlayerTD
    #undef OnPlayerClickPlayerTextDraw
#else
    #define _ALS_OnPlayerClickPlayerTD
#endif
#define OnPlayerClickPlayerTextDraw bl_OnPlayerClickPlayerTD
#if defined bl_OnPlayerClickPlayerTD
    forward bl_OnPlayerClickPlayerTD(playerid, PlayerText:playertextid);
#endif
