public OnFilterScriptInit() {
    CreateGenericSelectList();

    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            DefaultSelectListData(playerid);
        }
    }

    #if defined sl_OnFilterScriptInit
        sl_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit sl_OnFilterScriptInit
#if defined sl_OnFilterScriptInit
    forward sl_OnFilterScriptInit();
#endif


public OnFilterScriptExit() {
    DestroyGenericSelectList();

    #if defined sl_OnFilterScriptExit
        sl_OnFilterScriptExit();
    #endif
}
#if defined _ALS_OnFilterScriptExit
    #undef OnFilterScriptExit
#else
    #define _ALS_OnFilterScriptExit
#endif
#define OnFilterScriptExit sl_OnFilterScriptExit
#if defined sl_OnFilterScriptExit
    forward sl_OnFilterScriptExit();
#endif


public OnPlayerConnect(playerid) {
    DefaultSelectListData(playerid);

    #if defined sl_OnPlayerConnect
        return sl_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect sl_OnPlayerConnect
#if defined sl_OnPlayerConnect
    forward sl_OnPlayerConnect(playerid);
#endif


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    switch(dialogid) {
        case DIALOGID_SELECTLIST_PAGE: {
            if( !response ) {
                return 1;
            }

            new page;

            if( sscanf(inputtext, "i", page) ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a valid page number!");
                ShowSelectListDialog(playerid, dialogid);
                return 1;
            }

            page --;

            if( page < MIN_SELECTLIST_PAGE || page > GetSelectListMaxPage(playerid) ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a valid page number!");
                ShowSelectListDialog(playerid, dialogid);
                return 1;
            }

            SetSelectListPage(playerid, page);
            LoadSelectListRowData(playerid);

            ApplySelectListPage(playerid);
            for(new row; row < MAX_SELECTLIST_ROWS; row ++) {
                ApplySelectListRowData(playerid, row);
            }
            return 1;
        }
        case DIALOGID_SELECTLIST_SEARCH: {
            if( !response ) {
                return 1;
            }

            SetSelectListPage(playerid, MIN_SELECTLIST_PAGE);
            SetSelectListSearch(playerid, inputtext);
            LoadSelectListRowData(playerid);

            ApplySelectListPage(playerid);
            ApplySelectListSearch(playerid);
            for(new row; row < MAX_SELECTLIST_ROWS; row ++) {
                ApplySelectListRowData(playerid, row);
            }
            return 1;
        }
    }

    #if defined sl_OnDialogResponse
        return sl_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif
#define OnDialogResponse sl_OnDialogResponse
#if defined sl_OnDialogResponse
    forward sl_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif


public OnPlayerClickTextDraw(playerid, Text:clickedid) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_SELECTLIST_OBJECT, TDMODE_SELECTLIST_VEHICLE, TDMODE_SELECTLIST_ACTOR, TDMODE_SELECTLIST_PICKUP: {
            if( clickedid == g_SelectListGTD[SELECTLIST_GTD_CLOSE] || clickedid == Text: INVALID_TEXT_DRAW ) {
                if( g_PlayerData[playerid][PLAYER_DATA_POS_SAVED] ) {
                    if( g_CamModeData[playerid][CAMMODE_DATA_TOGGLE] ) {
                        SetPlayerObjectPos(playerid, g_CamModeData[playerid][CAMMODE_DATA_POID], g_PlayerData[playerid][PLAYER_DATA_POS_X], g_PlayerData[playerid][PLAYER_DATA_POS_Y], g_PlayerData[playerid][PLAYER_DATA_POS_Z]);
                    } else {
                        SetPlayerPos(playerid, g_PlayerData[playerid][PLAYER_DATA_POS_X], g_PlayerData[playerid][PLAYER_DATA_POS_Y], g_PlayerData[playerid][PLAYER_DATA_POS_Z]);
                    }
                    g_PlayerData[playerid][PLAYER_DATA_POS_SAVED] = false;
                }

                SetSelectListEditViewed(playerid, false);

                HidePlayerTextdrawMode(playerid);

                if( clickedid == g_SelectListGTD[SELECTLIST_GTD_CLOSE] ) {
                    return 1; // ESCAPE key was not used, return 1
                }
            }
        }
    }

    if( clickedid == g_SelectListGTD[SELECTLIST_GTD_PAGE_F] ) {
        if( GetSelectListPage(playerid) == MIN_SELECTLIST_PAGE ) {
            return 1;
        }

        SetSelectListPage(playerid, MIN_SELECTLIST_PAGE);
        LoadSelectListRowData(playerid);

        ApplySelectListPage(playerid);
        for(new row; row < MAX_SELECTLIST_ROWS; row ++) {
            ApplySelectListRowData(playerid, row);
        }
        return 1;
    }
    if( clickedid == g_SelectListGTD[SELECTLIST_GTD_PAGE_P] ) {
        new page = GetSelectListPage(playerid);

        if( page == MIN_SELECTLIST_PAGE ) {
            return 1;
        }

        if( -- page < MIN_SELECTLIST_PAGE ) {
            page = MIN_SELECTLIST_PAGE;
        }

        SetSelectListPage(playerid, page);
        LoadSelectListRowData(playerid);

        ApplySelectListPage(playerid);
        for(new row; row < MAX_SELECTLIST_ROWS; row ++) {
            ApplySelectListRowData(playerid, row);
        }
        return 1;
    }
    if( clickedid == g_SelectListGTD[SELECTLIST_GTD_PAGE_N] ) {
        new
            page  = GetSelectListPage(playerid),
            maxpage = GetSelectListMaxPage(playerid)
        ;

        if( page == maxpage ) {
            return 1;
        }

        if( ++ page > maxpage ) {
            page = maxpage;
        }

        SetSelectListPage(playerid, page);
        LoadSelectListRowData(playerid);

        ApplySelectListPage(playerid);
        for(new row; row < MAX_SELECTLIST_ROWS; row ++) {
            ApplySelectListRowData(playerid, row);
        }
        return 1;
    }
    if( clickedid == g_SelectListGTD[SELECTLIST_GTD_PAGE_L] ) {
        new maxpage = GetSelectListMaxPage(playerid);

        if( GetSelectListPage(playerid) == maxpage ) {
            return 1;
        }

        SetSelectListPage(playerid, maxpage);
        LoadSelectListRowData(playerid);

        ApplySelectListPage(playerid);
        for(new row; row < MAX_SELECTLIST_ROWS; row ++) {
            ApplySelectListRowData(playerid, row);
        }
        return 1;
    }

    #if defined sl_OnPlayerClickTextDraw
        return sl_OnPlayerClickTextDraw(playerid, Text:clickedid);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerClickTextDraw
    #undef OnPlayerClickTextDraw
#else
    #define _ALS_OnPlayerClickTextDraw
#endif
#define OnPlayerClickTextDraw sl_OnPlayerClickTextDraw
#if defined sl_OnPlayerClickTextDraw
    forward sl_OnPlayerClickTextDraw(playerid, Text:clickedid);
#endif


public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid) {
    if( playertextid == g_SelectListPTD[playerid][SELECTLIST_PTD_PAGE] ) {
        ShowSelectListDialog(playerid, DIALOGID_SELECTLIST_PAGE);
        return 1;
    }
    if( playertextid == g_SelectListPTD[playerid][SELECTLIST_PTD_SEARCH] ) {
        ShowSelectListDialog(playerid, DIALOGID_SELECTLIST_SEARCH);
        return 1;
    }
    for(new row; row < MAX_SELECTLIST_ROWS; row ++) {
        if( playertextid == g_SelectListPTD[playerid][SELECTLIST_PTD_ID_ROW][row] || playertextid == g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_ROW][row] || playertextid == g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_ROW][row] ) {
            new
                objectid = INVALID_OBJECT_ID,
                vehicleid = INVALID_VEHICLE_ID,
                pickupid = INVALID_PICKUP_ID,
                actorid = INVALID_ACTOR_ID
            ;

            switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
                case TDMODE_SELECTLIST_OBJECT: {
                    objectid = g_SelectObjListData[playerid][SELECTLIST_DATA_ROW_ID][row];
                    if( !IsValidObject(objectid) ) {
                        return 1;
                    }
                }
                case TDMODE_SELECTLIST_VEHICLE: {
                    vehicleid = g_SelectVehListData[playerid][SELECTLIST_DATA_ROW_ID][row];
                    if( !IsValidVehicle(vehicleid) ) {
                        return 1;
                    }
                }
                case TDMODE_SELECTLIST_PICKUP: {
                    pickupid = g_SelectPickListData[playerid][SELECTLIST_DATA_ROW_ID][row];
                    if( !IsValidPickup(pickupid) ) {
                        return 1;
                    }
                }
                case TDMODE_SELECTLIST_ACTOR: {
                    actorid = g_SelectActListData[playerid][SELECTLIST_DATA_ROW_ID][row];
                    if( !IsValidActor(actorid) ) {
                        return 1;
                    }
                }
                default: {
                    return 1;
                }
            }

            new prev_row = GetSelectListEditRow(playerid);
            if( row != prev_row) {
                switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
                    case TDMODE_SELECTLIST_OBJECT: {
                        g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = objectid;
                        g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_OBJECT;
                    }
                    case TDMODE_SELECTLIST_VEHICLE: {
                        g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = vehicleid;
                        g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_VEHICLE;
                    }
                    case TDMODE_SELECTLIST_PICKUP: {
                        g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = pickupid;
                        g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_PICKUP;
                    }
                    case TDMODE_SELECTLIST_ACTOR: {
                        g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = actorid;
                        g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_ACTOR;
                    }
                    default: {
                        return 0;
                    }
                }
            }

            new bool:prev_is_viewed = IsSelectListEditViewed(playerid);
            if( row == prev_row && prev_is_viewed ) {
                switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
                    case TDMODE_SELECTLIST_OBJECT: {
                        ShowObjectDialog(playerid, DIALOGID_OBJECT_MAIN);
                    }
                    case TDMODE_SELECTLIST_VEHICLE: {
                        ShowVehicleDialog(playerid, DIALOGID_VEHICLE_MAIN);
                    }
                    case TDMODE_SELECTLIST_PICKUP: {
                        ShowPickupDialog(playerid, DIALOGID_PICKUP_MAIN);
                    }
                    case TDMODE_SELECTLIST_ACTOR: {
                        ShowActorDialog(playerid, DIALOGID_ACTOR_MAIN);
                    }
                    default: {
                        return 1;
                    }
                }

                g_PlayerData[playerid][PLAYER_DATA_POS_SAVED] = false;

                SetSelectListEditViewed(playerid, false);

                HidePlayerTextdrawMode(playerid);
                return 1;
            }

            new
                Float:x,
                Float:y,
                Float:z,
                Float:distance
            ;

            switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
                case TDMODE_SELECTLIST_OBJECT: {
                    new
                        attachto_objectid = GetObjectAttachObject(objectid),
                        attachto_vehicleid = GetObjectAttachVehicle(objectid)
                    ;

                    if( IsValidObject(attachto_objectid) ) {
                        new
                            Float: obj_x,
                            Float: obj_y,
                            Float: obj_z,
                            Float: obj_rx,
                            Float: obj_ry,
                            Float: obj_rz,
                            Float: attach_off_x = g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_X],
                            Float: attach_off_y = g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Y],
                            Float: attach_off_z = g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Z],
                            Float: sphere_radius,
                            Float: sphere_off_x,
                            Float: sphere_off_y,
                            Float: sphere_off_z
                        ;

						GetObjectPos(attachto_objectid, obj_x,  obj_y,  obj_z);
						GetObjectRot(attachto_objectid, obj_rx, obj_ry, obj_rz);
                        GetModelSphere(GetObjectModel(objectid), sphere_radius, sphere_off_x, sphere_off_y, sphere_off_z);

                        PositionFromOffset(
							obj_x,
							obj_y,
							obj_z,
							obj_rx,
							obj_ry,
							obj_rz,
                            attach_off_x + sphere_off_x,
                            attach_off_y + sphere_off_y,
                            attach_off_z + sphere_off_z,
                            x, y, z
                        );

                        distance = sphere_radius + 1.0;
                    } else if( IsValidVehicle(attachto_vehicleid) ) {
                        new
                            Float:x_size,
                            Float:y_size,
                            Float:z_size,
                            Float:size
                        ;

                        GetVehicleModelInfo(GetVehicleModel(attachto_vehicleid), VEHICLE_MODEL_INFO_SIZE, x_size, y_size, z_size);

                        if( x_size > size )
                            size = x_size;
                        if( y_size > size)
                            size = y_size;
                        if( z_size > size)
                            size = z_size;

                        GetVehiclePos(attachto_vehicleid, x, y, z);

                        distance = size + 1.0;
                    } else {
                        new
                            Float:obj_x,
                            Float:obj_y,
                            Float:obj_z,
                            Float:obj_rx,
                            Float:obj_ry,
                            Float:obj_rz,
                            Float:sphere_radius,
                            Float:sphere_off_x,
                            Float:sphere_off_y,
                            Float:sphere_off_z
                        ;

                        GetObjectPos(objectid, obj_x,  obj_y,  obj_z);
                        GetObjectRot(objectid, obj_rx, obj_ry, obj_rz);

                        GetModelSphere(GetObjectModel(objectid), sphere_radius, sphere_off_x, sphere_off_y, sphere_off_z);

                        PositionFromOffset(
							obj_x,
							obj_y,
							obj_z,
							obj_rx,
							obj_ry,
							obj_rz,
							sphere_off_x,
							sphere_off_y,
							sphere_off_z,
							x,
							y,
							z
						);

                        distance = sphere_radius + 1.0;
                    }
                }
                case TDMODE_SELECTLIST_VEHICLE: {
                    new
                        Float:size_x,
                        Float:size_y,
                        Float:size_z,
                        Float:size
                    ;

                    GetVehiclePos(vehicleid, x, y, z);

                    GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_SIZE, size_x, size_y, size_z);

                    if( size_x > size ) {
                        size = size_x;
                    }
                    if( size_y > size ) {
                        size = size_y;
                    }
                    if( size_z > size ) {
                        size = size_z;
                    }

                    distance = size + 1.0;
                }
                case TDMODE_SELECTLIST_PICKUP: {
                    new
                        Float: sphere_radius,
                        Float: sphere_off_x,
                        Float: sphere_off_y,
                        Float: sphere_off_z
                    ;

                    x = g_PickupData[pickupid][PICKUP_DATA_X];
                    y = g_PickupData[pickupid][PICKUP_DATA_Y];
                    z = g_PickupData[pickupid][PICKUP_DATA_Z];

                    GetModelSphere(g_PickupData[pickupid][PICKUP_DATA_MODEL], sphere_radius, sphere_off_x, sphere_off_y, sphere_off_z);

                    x += sphere_off_x;
                    y += sphere_off_y;
                    z += sphere_off_z;

                    distance = sphere_radius + 1.0;
                }
                case TDMODE_SELECTLIST_ACTOR: {
                    GetActorPos(actorid, x, y, z);
                    distance = 2.0;
                }
                default: {
                    return 0;
                }
            }

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
                SetSelectListEditViewed(playerid, true);

                SetSelectListEditRow(playerid, row);

                ApplySelectListRowColor(playerid, row);

                if( prev_row != INVALID_ROW ) {
                    ApplySelectListRowColor(playerid, prev_row);
                }
            }

            if( !g_PlayerData[playerid][PLAYER_DATA_POS_SAVED] ) {
                GetPlayerPos(playerid, g_PlayerData[playerid][PLAYER_DATA_POS_X], g_PlayerData[playerid][PLAYER_DATA_POS_Y], g_PlayerData[playerid][PLAYER_DATA_POS_Z]);
                g_PlayerData[playerid][PLAYER_DATA_POS_SAVED] = true;
            }
            return 1;
        }
    }

    #if defined sl_OnPlayerClickPlayerTD
        return sl_OnPlayerClickPlayerTD(playerid, PlayerText:playertextid);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerClickPlayerTD
    #undef OnPlayerClickPlayerTextDraw
#else
    #define _ALS_OnPlayerClickPlayerTD
#endif
#define OnPlayerClickPlayerTextDraw sl_OnPlayerClickPlayerTD
#if defined sl_OnPlayerClickPlayerTD
    forward sl_OnPlayerClickPlayerTD(playerid, PlayerText:playertextid);
#endif
