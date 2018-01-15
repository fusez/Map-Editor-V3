public OnFilterScriptInit() {
    CreateGenericCreateList();

    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            DefaultCreateListData(playerid);
        }
    }

    #if defined cl_OnFilterScriptInit
        cl_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit cl_OnFilterScriptInit
#if defined cl_OnFilterScriptInit
    forward cl_OnFilterScriptInit();
#endif


public OnFilterScriptExit() {
    DestroyGenericCreateList();

    #if defined cl_OnFilterScriptExit
        cl_OnFilterScriptExit();
    #endif
}
#if defined _ALS_OnFilterScriptExit
    #undef OnFilterScriptExit
#else
    #define _ALS_OnFilterScriptExit
#endif
#define OnFilterScriptExit cl_OnFilterScriptExit
#if defined cl_OnFilterScriptExit
    forward cl_OnFilterScriptExit();
#endif


public OnPlayerConnect(playerid) {
    DefaultCreateListData(playerid);

    #if defined cl_OnPlayerConnect
        return cl_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect cl_OnPlayerConnect
#if defined cl_OnPlayerConnect
    forward cl_OnPlayerConnect(playerid);
#endif


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    switch(dialogid) {
        case DIALOGID_CREATELIST_PAGE: {
            if( !response ) {
                return 1;
            }

            new page;

            if( sscanf(inputtext, "i", page) ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a valid page number!");
                ShowCreateListDialog(playerid, dialogid);
                return 1;
            }

            page --;

            if( page < MIN_CREATELIST_PAGE || page > GetCreateListMaxPage(playerid) ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a valid page number!");
                ShowCreateListDialog(playerid, dialogid);
                return 1;
            }

            SetCreateListPage(playerid, page);
            LoadCreateListRowData(playerid);

            ApplyCreateListPage(playerid);
            ApplyCreateListRowData(playerid);
            return 1;
        }
        case DIALOGID_CREATELIST_SEARCH: {
            if( !response ) {
                return 1;
            }

            SetCreateListPage(playerid, MIN_CREATELIST_PAGE);
            SetCreateListSearch(playerid, inputtext);
            LoadCreateListRowData(playerid);

            ApplyCreateListPage(playerid);
            ApplyCreateListSearch(playerid);
            ApplyCreateListRowData(playerid);
            return 1;
        }
    }

    #if defined cl_OnDialogResponse
        return cl_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif
#define OnDialogResponse cl_OnDialogResponse
#if defined cl_OnDialogResponse
    forward cl_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif


public OnPlayerClickTextDraw(playerid, Text:clickedid) {
    if( clickedid == Text: INVALID_TEXT_DRAW ) {
        switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
            case TDMODE_CREATELIST_OBJECT, TDMODE_CREATELIST_VEHICLE, TDMODE_CREATELIST_PICKUP, TDMODE_CREATELIST_ACTOR, TDMODE_CREATELIST_ATTACH: {
                HidePlayerTextdrawMode(playerid);
            }
        }
    }
    
    if( clickedid == g_CreateListGTD[CREATELIST_GTD_CLOSE] ) {
        return HidePlayerTextdrawMode(playerid), 1;
    }
    if( clickedid == g_CreateListGTD[CREATELIST_GTD_PAGE_F] ) {
        if( GetCreateListPage(playerid) == MIN_CREATELIST_PAGE ) {
            return 1;
        }

        SetCreateListPage(playerid, MIN_CREATELIST_PAGE);
        LoadCreateListRowData(playerid);

        ApplyCreateListPage(playerid);
        ApplyCreateListRowData(playerid);
        return 1;
    }
    if( clickedid == g_CreateListGTD[CREATELIST_GTD_PAGE_P] ) {
        new page = GetCreateListPage(playerid);
        if( page == MIN_CREATELIST_PAGE ) {
            return 1;
        }

        if( -- page < MIN_CREATELIST_PAGE) {
            page = MIN_CREATELIST_PAGE;
        }

        SetCreateListPage(playerid, page);
        LoadCreateListRowData(playerid);

        ApplyCreateListPage(playerid);
        ApplyCreateListRowData(playerid);
        return 1;
    }
    if( clickedid == g_CreateListGTD[CREATELIST_GTD_PAGE_N] ) {
        new
            page = GetCreateListPage(playerid),
            maxpage = GetCreateListMaxPage(playerid)
        ;

        if( page == maxpage ) {
            return 1;
        }

        if( ++ page > maxpage ) {
            page = maxpage;
        }

        SetCreateListPage(playerid, page);
        LoadCreateListRowData(playerid);

        ApplyCreateListPage(playerid);
        ApplyCreateListRowData(playerid);
        return 1;
    }
    if( clickedid == g_CreateListGTD[CREATELIST_GTD_PAGE_L] ) {
        new maxpage = GetCreateListMaxPage(playerid);

        if( GetCreateListPage(playerid) == maxpage ) {
            return 1;
        }

        SetCreateListPage(playerid, maxpage);
        LoadCreateListRowData(playerid);

        ApplyCreateListPage(playerid);
        ApplyCreateListRowData(playerid);
        return 1;
    }
    if( clickedid == g_CreateListGTD[CREATELIST_GTD_CATEGORY_R] ) {
        if( GetCreateListCategory(playerid) == INVALID_CATEGORY_ID ) {
            return 1;
        }

        SetCreateListCategory(playerid, INVALID_CATEGORY_ID);
        ApplyCreateListCategory(playerid);

        SetCreateListPage(playerid, MIN_CREATELIST_PAGE);
        LoadCreateListRowData(playerid);

        ApplyCreateListPage(playerid);
        ApplyCreateListRowData(playerid);
    }

    #if defined cl_OnPlayerClickTextDraw
        return cl_OnPlayerClickTextDraw(playerid, Text:clickedid);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerClickTextDraw
    #undef OnPlayerClickTextDraw
#else
    #define _ALS_OnPlayerClickTextDraw
#endif
#define OnPlayerClickTextDraw cl_OnPlayerClickTextDraw
#if defined cl_OnPlayerClickTextDraw
    forward cl_OnPlayerClickTextDraw(playerid, Text:clickedid);
#endif


public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid) {
    if( playertextid == g_CreateListPTD[playerid][CREATELIST_PTD_PAGE] ) {
        return ShowCreateListDialog(playerid, DIALOGID_CREATELIST_PAGE), 1;
    }
    if( playertextid == g_CreateListPTD[playerid][CREATELIST_PTD_SEARCH] ) {
        return ShowCreateListDialog(playerid, DIALOGID_CREATELIST_SEARCH), 1;
    }
    if( playertextid == g_CreateListPTD[playerid][CREATELIST_PTD_CATEGORY] ) {
        DefaultCategorySelectData(playerid);
        LoadCategorySelectData(playerid);
        ShowCategorySelect(playerid);
        return 1;
    }

    for(new row; row < MAX_CREATELIST_ROWS; row ++) {
        if( playertextid == g_CreateListPTD[playerid][CREATELIST_PTD_ID_ROW][row] || playertextid == g_CreateListPTD[playerid][CREATELIST_PTD_NAME_ROW][row] ) {
            new row_modelid = GetCreateListRowModelID(playerid, row);

            if( row_modelid == INVALID_MODEL_ID ) {
                return 1;
            }

            new prev_row = GetCreateListSelectRow(playerid);

            if( row != prev_row ) {
                SetCreateListSelectRow(playerid, row);
                SetCreateListSelectModelID(playerid, row_modelid);

                ApplyCreateListRowColor(playerid, row);

                if( prev_row != INVALID_ROW ) {
                    ApplyCreateListRowColor(playerid, prev_row);
                }

                g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] = row_modelid;
                if( g_ModelViewData[playerid][MODELVIEW_DATA_TOGGLE] ) {
                    ApplyModelViewModel(playerid, .showtd = true);
                } else {
                    ShowModelView(playerid);
                }
                return 1;
            }

            if( g_PlayerData[playerid][PLAYER_DATA_TDMODE] == TDMODE_CREATELIST_ATTACH ) {
                // Attach Model to Player

                new attach_index = GetPlayerEditAttached(playerid);

                if( attach_index == INVALID_PLAYERATTACH_INDEX ) {
                    return 1;
                }

                g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_TOGGLE] = true;
                g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_MODEL] = row_modelid;
                ApplyPlayerAttachData(playerid, attach_index);

                HidePlayerTextdrawMode(playerid);
                ShowAttachedDialog(playerid, DIALOGID_ATTACH_MAIN);
                return 1;
            }

            // Create 3D Model

            new
                Float:x,
                Float:y,
                Float:z,
                Float:distance
            ;

            GetPlayerPos(playerid, x, y, z);

            switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
                case TDMODE_CREATELIST_OBJECT, TDMODE_CREATELIST_PICKUP: {
                    new
                        Float:sphere_radius,
                        Float:sphere_off_x,
                        Float:sphere_off_y,
                        Float:sphere_off_z
                    ;

                    GetModelSphere(row_modelid, sphere_radius, sphere_off_x, sphere_off_y, sphere_off_z);

                    x -= sphere_off_x;
                    y -= sphere_off_y;
                    z -= sphere_off_z;

                    distance = sphere_radius + 1.0;
                }
                case TDMODE_CREATELIST_VEHICLE: {
                    new
                        Float:size_x,
                        Float:size_y,
                        Float:size_z,
                        Float:size_max
                    ;

                    GetVehicleModelInfo(row_modelid, VEHICLE_MODEL_INFO_SIZE, size_x, size_y, size_z);

                    if( size_x > size_max )
                        size_max = size_x;
                    if( size_y > size_max )
                        size_max = size_y;
                    if( size_z > size_max )
                        size_max = size_z;

                    distance = size_max + 1.0;
                }
                case TDMODE_CREATELIST_ACTOR: {
                    distance = 2.0;
                }
                default: {
                    return 1;
                }
            }

            if( g_CamModeData[playerid][CAMMODE_DATA_TOGGLE] ) {
                new
                    Float:vec_x,
                    Float:vec_y,
                    Float:vec_z
                ;

                GetPlayerCameraFrontVector(playerid, vec_x, vec_y, vec_z);
                x += (vec_x * distance);
                y += (vec_y * distance);
                z += (vec_z * distance);
            } else {
                new Float:a;
                GetPlayerFacingAngle(playerid, a);

                x += (distance * floatsin(-a, degrees));
                y += (distance * floatcos(-a, degrees));

                SetCameraBehindPlayer(playerid);
            }

            switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
                case TDMODE_CREATELIST_OBJECT: {
                    g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_OBJECT;
                    g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = CreateObject(row_modelid, x, y, z, 0.0, 0.0, 0.0);

                    if(g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] != INVALID_OBJECT_ID) {
                        HidePlayerTextdrawMode(playerid);
                        ShowObjectDialog(playerid, DIALOGID_OBJECT_MAIN);
                    }
                }
                case TDMODE_CREATELIST_VEHICLE: {
                    new
                        vehcol1 = g_ModelViewData[playerid][MODELVIEW_DATA_VC1],
                        vehcol2 = g_ModelViewData[playerid][MODELVIEW_DATA_VC2]
                    ;

                    g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_VEHICLE;
                    g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = CreateVehicle(row_modelid, x, y, z, 0.0, vehcol1, vehcol2, -1);

                    if( g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] != INVALID_VEHICLE_ID ) {
                        HidePlayerTextdrawMode(playerid);
                        ShowVehicleDialog(playerid, DIALOGID_VEHICLE_MAIN);
                    }
                }
                case TDMODE_CREATELIST_PICKUP: {
                    g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_PICKUP;
                    g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = CreatePickup(row_modelid, 1, x, y, z);

                    if( g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] != INVALID_PICKUP_ID ) {
                        HidePlayerTextdrawMode(playerid);
                        ShowPickupDialog(playerid, DIALOGID_PICKUP_MAIN);
                    }
                }
                case TDMODE_CREATELIST_ACTOR: {
                    g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_ACTOR;
                    g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = CreateActor(row_modelid, x, y, z, 0.0);

                    if( g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] != INVALID_ACTOR_ID ) {
                        HidePlayerTextdrawMode(playerid);
                        ShowActorDialog(playerid, DIALOGID_ACTOR_MAIN);
                    }
                }
                default: {
                    return 1;
                }
            }
            return 1;
        }
    }

    #if defined cl_OnPlayerClickPlayerTD
        return cl_OnPlayerClickPlayerTD(playerid, PlayerText:playertextid);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerClickPlayerTD
    #undef OnPlayerClickPlayerTextDraw
#else
    #define _ALS_OnPlayerClickPlayerTD
#endif
#define OnPlayerClickPlayerTextDraw cl_OnPlayerClickPlayerTD
#if defined cl_OnPlayerClickPlayerTD
    forward cl_OnPlayerClickPlayerTD(playerid, PlayerText:playertextid);
#endif
