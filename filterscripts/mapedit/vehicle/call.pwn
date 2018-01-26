public OnFilterScriptInit() {
    for(new vehicleid = 1, max_vehicleid = GetVehiclePoolSize(); vehicleid <= max_vehicleid; vehicleid ++) {
        if( !IsValidVehicle(vehicleid) ) {
            continue;
        }

        if( GetVehicleModelName(GetVehicleModel(vehicleid), g_CommentString, sizeof g_CommentString) ) {
            strpack(g_VehicleData[vehicleid-1][VEHICLE_DATA_COMMENT], g_CommentString, sizeof g_CommentString); // Set Vehicle Comment
        }

        g_VehicleData[vehicleid-1][VEHICLE_DATA_COLOR_1] = INVALID_COLOR_ID;
        g_VehicleData[vehicleid-1][VEHICLE_DATA_COLOR_2] = INVALID_COLOR_ID;
        g_VehicleData[vehicleid-1][VEHICLE_DATA_PAINTJOB] = INVALID_PAINTJOB_ID;
    }

    #if defined veh_OnFilterScriptInit
        veh_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit veh_OnFilterScriptInit
#if defined veh_OnFilterScriptInit
    forward veh_OnFilterScriptInit();
#endif


public OnVehicleRespray(playerid, vehicleid, color1, color2) {
    g_VehicleData[vehicleid-1][VEHICLE_DATA_COLOR_1] = color1;
    g_VehicleData[vehicleid-1][VEHICLE_DATA_COLOR_2] = color2;

    #if defined veh_OnVehicleRespray
        return veh_OnVehicleRespray(playerid, vehicleid, color1, color2);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnVehicleRespray
    #undef OnVehicleRespray
#else
    #define _ALS_OnVehicleRespray
#endif
#define OnVehicleRespray veh_OnVehicleRespray
#if defined veh_OnVehicleRespray
    forward veh_OnVehicleRespray(playerid, vehicleid, color1, color2);
#endif


public OnVehiclePaintjob(playerid, vehicleid, paintjobid) {
    g_VehicleData[vehicleid-1][VEHICLE_DATA_PAINTJOB] = paintjobid;

    #if defined veh_OnVehiclePaintjob
        veh_OnVehiclePaintjob(playerid, vehicleid, paintjobid);
    #endif
}
#if defined _ALS_OnVehiclePaintjob
    #undef OnVehiclePaintjob
#else
    #define _ALS_OnVehiclePaintjob
#endif
#define OnVehiclePaintjob veh_OnVehiclePaintjob
#if defined veh_OnVehiclePaintjob
    forward veh_OnVehiclePaintjob(playerid, vehicleid, paintjobid);
#endif


public OnEnterExitModShop(playerid, enterexit, interiorid) {
    if( !enterexit ) { // Exit
        new vehicleid = GetPlayerVehicleID(playerid);
        if( g_VehicleData[vehicleid-1][VEHICLE_DATA_MODTP_TOGGLE] ) {
            g_VehicleData[vehicleid-1][VEHICLE_DATA_MODTP_TOGGLE] = false;
            SetVehiclePos(vehicleid, g_VehicleData[vehicleid-1][VEHICLE_DATA_MODTP_X], g_VehicleData[vehicleid-1][VEHICLE_DATA_MODTP_Y], g_VehicleData[vehicleid-1][VEHICLE_DATA_MODTP_Z]);
            SetVehicleZAngle(vehicleid, g_VehicleData[vehicleid-1][VEHICLE_DATA_MODTP_A]);

            g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_VEHICLE;
            g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = vehicleid;
            ShowVehicleDialog(playerid, DIALOGID_VEHICLE_MAIN);
        }
    }

    #if defined veh_OnEnterExitModShop
        veh_OnEnterExitModShop(playerid, enterexit, interiorid);
    #endif
}
#if defined _ALS_OnEnterExitModShop
    #undef OnEnterExitModShop
#else
    #define _ALS_OnEnterExitModShop
#endif
#define OnEnterExitModShop veh_OnEnterExitModShop
#if defined veh_OnEnterExitModShop
    forward veh_OnEnterExitModShop(playerid, enterexit, interiorid);
#endif


public OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ) {
    new vehicleid = GetPlayerEditVehicle(playerid);

    if(
        playerobject &&
        objectid == g_PlayerData[playerid][PLAYER_DATA_CLICKDRAG_POID] &&
        IsValidVehicle(vehicleid)
    ) {
        switch( response ) {
            case EDIT_RESPONSE_FINAL: {
                new new_vehicleid = RecreateVehicle(vehicleid, fRotZ);
                if( IsValidVehicle(new_vehicleid) ) {
                    SetVehiclePos(new_vehicleid, fX, fY, fZ);
                } else {
                    SetVehiclePos(vehicleid, fX, fY, fZ);
                    SetVehicleZAngle(vehicleid, fRotZ);
                }

                DestroyClickDragObject(playerid);
                ShowVehicleDialog(playerid, DIALOGID_VEHICLE_MAIN);
            }
            case EDIT_RESPONSE_CANCEL: {
                new new_vehicleid = RecreateVehicle(vehicleid, g_VehicleData[vehicleid-1][VEHICLE_DATA_MEMORY_RZ]);
                if( IsValidVehicle(new_vehicleid) ) {
                    SetVehiclePos(new_vehicleid, g_VehicleData[new_vehicleid-1][VEHICLE_DATA_MEMORY_X], g_VehicleData[new_vehicleid-1][VEHICLE_DATA_MEMORY_Y], g_VehicleData[new_vehicleid-1][VEHICLE_DATA_MEMORY_Z]);
                } else {
                    SetVehiclePos(vehicleid, g_VehicleData[vehicleid-1][VEHICLE_DATA_MEMORY_X], g_VehicleData[vehicleid-1][VEHICLE_DATA_MEMORY_Y], g_VehicleData[vehicleid-1][VEHICLE_DATA_MEMORY_Z]);
                    SetVehicleZAngle(vehicleid, g_VehicleData[vehicleid-1][VEHICLE_DATA_MEMORY_RZ]);
                }
            }
            case EDIT_RESPONSE_UPDATE: {
                new new_vehicleid = RecreateVehicle(vehicleid, fRotZ);
                if( IsValidVehicle(new_vehicleid) ) {
                    SetVehiclePos(new_vehicleid, fX, fY, fZ);
                } else {
                    SetVehiclePos(vehicleid, fX, fY, fZ);
                    SetVehicleZAngle(vehicleid, fRotZ);
                }
            }
        }
    }

    #if defined veh_OnPlayerEditObject
        return veh_OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerEditObject
    #undef OnPlayerEditObject
#else
    #define _ALS_OnPlayerEditObject
#endif
#define OnPlayerEditObject veh_OnPlayerEditObject
#if defined veh_OnPlayerEditObject
    forward veh_OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ);
#endif


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    switch(dialogid) {
        case DIALOGID_VEHICLE_MAIN: {
            new vehicleid = GetPlayerEditVehicle(playerid);
            if( !IsValidVehicle(vehicleid) ) {
                return g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE, 1;
            }

            if( !response ) {
                return 1;
            }

            switch(listitem) {
                case LISTITEM_VEHICLE_GOTO: {
                    new Float:x, Float:y, Float:z;
                    GetVehiclePos(vehicleid, x, y, z);
                    if( g_CamModeData[playerid][CAMMODE_DATA_TOGGLE] ) {
                        StopPlayerObject(playerid, g_CamModeData[playerid][CAMMODE_DATA_POID]);
                        SetPlayerObjectPos(playerid, g_CamModeData[playerid][CAMMODE_DATA_POID], x, y, z);
                    } else {
                        SetPlayerPos(playerid, x, y, z);
                    }
                }
                case LISTITEM_VEHICLE_GET: {
                    new Float:x, Float:y, Float:z;
                    GetPlayerPos(playerid, x, y, z);
                    SetVehiclePos(vehicleid, x, y, z);
                }
                case LISTITEM_VEHICLE_DRIVE: {
                    if( IsVehicleOccupied(vehicleid, 0) ) {
                        SendClientMessage(playerid, RGBA_RED, "ERROR: Someone is already driving this vehicle!");
                    } else if( GetPlayerState(playerid) == PLAYER_STATE_SPECTATING ) {
                        SendClientMessage(playerid, RGBA_RED, "ERROR: You need to spawned to do this!");
                    } else {
                        PutPlayerInVehicle(playerid, vehicleid, 0);
                    }
                }
                case LISTITEM_VEHICLE_COORD: {
                    return ShowVehicleDialog(playerid, DIALOGID_VEHICLE_COORD), 1;
                }
                case LISTITEM_VEHICLE_MOVE: {
                    new objectid = RefreshClickDragObject(playerid);
                    if(objectid == INVALID_OBJECT_ID) {
                        SendClientMessage(playerid, RGBA_RED, "ERROR: This vehicle cannot be moved right now!");
                    } else {
                        GetVehiclePos(vehicleid, g_VehicleData[vehicleid-1][VEHICLE_DATA_MEMORY_X], g_VehicleData[vehicleid-1][VEHICLE_DATA_MEMORY_Y], g_VehicleData[vehicleid-1][VEHICLE_DATA_MEMORY_Z]);
                        GetVehicleZAngle(vehicleid, g_VehicleData[vehicleid-1][VEHICLE_DATA_MEMORY_RZ]);

                        EditPlayerObject(playerid, objectid);

                        SendClientMessage(playerid, RGBA_ORANGE, "Click & Drag Edit: {FFFFFF}Hold ~k~~PED_SPRINT~ to look around and press ESC to cancel.");
                        return 1;
                    }
                }
                case LISTITEM_VEHICLE_ATTACH: {
                    new objectid = g_PlayerData[playerid][PLAYER_DATA_EDIT_ATTACHOBJECT];
                    if( IsValidObject(objectid) ) {
                        g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_IDTYPE] = ID_TYPE_VEHICLE;
                        g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_ID] = vehicleid;
                        ApplyObjectAttachData(objectid);

                        g_PlayerData[playerid][PLAYER_DATA_EDIT_ATTACHOBJECT] = INVALID_OBJECT_ID;
                        g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_OBJECT;
                        g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = objectid;
                        return ShowObjectDialog(playerid, DIALOGID_OBJECT_MAIN), 1;
                    }
                }
                case LISTITEM_VEHICLE_DUPLICATE: {
                    new Float:a;
                    GetVehicleZAngle(vehicleid, a);

                    new new_vehicleid = CopyVehicle(vehicleid, a);
                    if( new_vehicleid == INVALID_VEHICLE_ID ) {
                        SendClientMessage(playerid, RGBA_RED, "ERROR: This vehicle could not be duplicated!");
                    } else {
                        if( !CopyVehicleAttachments(.from_vehicleid = vehicleid, .to_vehicleid = new_vehicleid) ) {
                            SendClientMessage(playerid, RGBA_RED, "WARNING: All vehicle attachments could not be duplicated!");
                        }

                        g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_VEHICLE;
                        g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = new_vehicleid;
                    }
                }
                case LISTITEM_VEHICLE_RECREATE: {
                    new Float:a, new_vehicleid;
                    GetVehicleZAngle(vehicleid, a);

                    new_vehicleid = RecreateVehicle(vehicleid, a);
                    if( new_vehicleid == INVALID_VEHICLE_ID ) {
                        SendClientMessage(playerid, RGBA_RED, "ERROR: This vehicle could not be re-created!");
                    }
                }
                case LISTITEM_VEHICLE_REMOVE: {
                    DestroyVehicle(vehicleid);
                    return 1;
                }
                case LISTITEM_VEHICLE_COMMENT: {
                    return ShowVehicleDialog(playerid, DIALOGID_VEHICLE_COMMENT), 1;
                }
                case LISTITEM_VEHICLE_COMMENT_RESET: {
                    GetVehicleModelName(GetVehicleModel(vehicleid), g_CommentString, sizeof g_CommentString);
                    strpack(g_VehicleData[vehicleid-1][VEHICLE_DATA_COMMENT], g_CommentString, MAX_COMMENT_LEN+1); // Set Vehicle Comment
                }
                case LISTITEM_VEHICLE_COLOR1: {
                    SelectTextDraw(playerid, SELECT_TD_COLOR);
                    return ShowPlayerTextdrawMode(playerid, TDMODE_COLORLIST_VEHICLE_1), 1;
                }
                case LISTITEM_VEHICLE_COLOR2: {
                    SelectTextDraw(playerid, SELECT_TD_COLOR);
                    return ShowPlayerTextdrawMode(playerid, TDMODE_COLORLIST_VEHICLE_2), 1;
                }
                case LISTITEM_VEHICLE_MODSHOP: {
                    new modshopid = GetVehicleModelModShop(GetVehicleModel(vehicleid));
                    if( modshopid == INVALID_MODSHOP_ID ) {
                        return ShowVehicleDialog(playerid, dialogid), 1;
                    }

                    if( GetPlayerState(playerid) == PLAYER_STATE_SPECTATING ) {
                        SendClientMessage(playerid, RGBA_RED, "ERROR: You need to spawned to do this!");
                        return ShowVehicleDialog(playerid, dialogid), 1;
                    }

                    if( GetPlayerVehicleID(playerid) != vehicleid || GetPlayerVehicleSeat(playerid) != 0 ) {
                        if( IsVehicleOccupied(vehicleid, 0) ) {
                            SendClientMessage(playerid, RGBA_RED, "ERROR: Someone else is driving this vehicle!");
                            return ShowVehicleDialog(playerid, dialogid), 1;
                        } else {
                            PutPlayerInVehicle(playerid, vehicleid, 0);
                        }
                    }

                    g_VehicleData[vehicleid-1][VEHICLE_DATA_MODTP_TOGGLE] = true;
                    GetVehiclePos(vehicleid, g_VehicleData[vehicleid-1][VEHICLE_DATA_MODTP_X], g_VehicleData[vehicleid-1][VEHICLE_DATA_MODTP_Y], g_VehicleData[vehicleid-1][VEHICLE_DATA_MODTP_Z]);
                    GetVehicleZAngle(vehicleid, g_VehicleData[vehicleid-1][VEHICLE_DATA_MODTP_A]);

                    new Float:x, Float:y, Float:z, Float:a;
                    GetModShopPosition(modshopid, x, y, z, a);
                    SetVehiclePos(vehicleid, x, y, z);
                    SetVehicleZAngle(vehicleid, a);
                    CancelSelectTextDraw(playerid);
                    return 1;
                   }
                case LISTITEM_VEHICLE_REMOVEMODS: {
                    new components_removed;
                    for(new slot; slot < MAX_COMPONENT_SLOTS; slot ++) {
                        new componentid = GetVehicleComponentInSlot(vehicleid, slot);
                        if(componentid != 0) {
                            RemoveVehicleComponent(vehicleid, componentid);
                            components_removed ++;
                        }
                    }

                    if(components_removed == 0) {
                        SendClientMessage(playerid, RGBA_RED, "ERROR: This vehicle does not have any modifications!");
                    }
                }
            }

            return ShowVehicleDialog(playerid, dialogid), 1;
        }
        case DIALOGID_VEHICLE_COORD: {
            new vehicleid = GetPlayerEditVehicle(playerid);
            if( !IsValidVehicle(vehicleid) ) {
                return g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE, 1;
            }

            if( !response ) {
                return ShowVehicleDialog(playerid, DIALOGID_VEHICLE_MAIN), 1;
            }

            new cmd[10], Float:value;
            if(sscanf(inputtext, "s[10]f", cmd, value)) {
                return ShowVehicleDialog(playerid, dialogid), 1;
            }

            new Float:x, Float:y, Float:z, Float:a;
            GetVehiclePos(vehicleid, x, y, z);
            GetVehicleZAngle(vehicleid, a);

            if(!strcmp(cmd, "x", true)) {
                x = value;
            } else if(!strcmp(cmd, "y", true)) {
                y = value;
            } else if(!strcmp(cmd, "z", true)) {
                z = value;
            } else if(!strcmp(cmd, "a", true)) {
                a = value;
            } else {
                return ShowVehicleDialog(playerid, dialogid), 1;
            }

            SetVehiclePos(vehicleid, x, y, z);
            SetVehicleZAngle(vehicleid, a);

            return ShowVehicleDialog(playerid, dialogid), 1;
        }
        case DIALOGID_VEHICLE_COMMENT: {
            new vehicleid = GetPlayerEditVehicle(playerid);
            if( !IsValidVehicle(vehicleid) ) {
                return g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE, 1;
            }

            if( !response ) {
                ShowVehicleDialog(playerid, DIALOGID_VEHICLE_MAIN);
            } else {
                strpack(g_VehicleData[vehicleid-1][VEHICLE_DATA_COMMENT], inputtext, MAX_COMMENT_LEN+1); // Set Vehicle Comment
                ShowVehicleDialog(playerid, dialogid);
            }
            return 1;
        }
    }

    #if defined veh_OnDialogResponse
        return veh_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif
#define OnDialogResponse veh_OnDialogResponse
#if defined veh_OnDialogResponse
    forward veh_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif
