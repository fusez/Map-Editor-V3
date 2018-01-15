stock hook_CreateVehicle(vehicletype, Float:x, Float:y, Float:z, Float:rotation, color1, color2, respawn_delay, addsiren = 0) {
    new vehicleid = CreateVehicle(vehicletype, Float:x, Float:y, Float:z, Float:rotation, color1, color2, respawn_delay, addsiren);
    if( vehicleid != INVALID_VEHICLE_ID ) {
        if( GetVehicleModelName(vehicletype, g_CommentString, MAX_COMMENT_LEN+1) ) {
            strpack(g_VehicleData[vehicleid-1][VEHICLE_DATA_COMMENT], g_CommentString, MAX_COMMENT_LEN+1); // Set Vehicle Comment
        }

        g_VehicleData[vehicleid-1][VEHICLE_DATA_COLOR_1] = color1;
        g_VehicleData[vehicleid-1][VEHICLE_DATA_COLOR_2] = color2;
        g_VehicleData[vehicleid-1][VEHICLE_DATA_PAINTJOB] = INVALID_PAINTJOB_ID;
    }
    return vehicleid;
}
#if defined _ALS_CreateVehicle
    #undef CreateVehicle
#else
    #define _ALS_CreateVehicle
#endif
#define CreateVehicle hook_CreateVehicle


stock hook_DestroyVehicle(vehicleid) {
    new success = DestroyVehicle(vehicleid);
    if( success ) {
        for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
            if( !IsPlayerConnected(playerid) ) {
                continue;
            }

            if( GetPlayerEditVehicle(playerid) == vehicleid ) {
                g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE;
            }

            new edit_row = g_SelectVehListData[playerid][SELECTLIST_DATA_EDIT_ROW];
            if( edit_row != INVALID_ROW ) {
                new edit_vehicleid = g_SelectVehListData[playerid][SELECTLIST_DATA_ROW_ID][edit_row];

                if( vehicleid == edit_vehicleid ) {
                    g_SelectVehListData[playerid][SELECTLIST_DATA_EDIT_ROW] = INVALID_ROW;
                }
            }

            for(new row; row < MAX_SELECTLIST_ROWS; row ++) {
                if( vehicleid != g_SelectVehListData[playerid][SELECTLIST_DATA_ROW_ID][row] ) {
                    continue;
                }

                g_SelectVehListData[playerid][SELECTLIST_DATA_ROW_ID][row] = INVALID_VEHICLE_ID;

                if( g_PlayerData[playerid][PLAYER_DATA_TDMODE] != TDMODE_SELECTLIST_VEHICLE ) {
                    continue;
                }

                PlayerTextDrawHide(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_ROW][row]);
                PlayerTextDrawHide(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_ROW][row]);
            }
        }

        for(new objectid = 1; objectid <= MAX_OBJECTS; objectid ++) {
            if( IsValidObject(objectid) && GetObjectAttachVehicle(objectid) == vehicleid) {
                DestroyObject(objectid);
            }
        }
    }

    return success;
}
#if defined _ALS_DestroyVehicle
    #undef DestroyVehicle
#else
    #define _ALS_DestroyVehicle
#endif
#define DestroyVehicle hook_DestroyVehicle
