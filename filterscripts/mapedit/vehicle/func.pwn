ShowVehicleDialog(playerid, dialogid) {
    switch(dialogid) {
        case DIALOGID_VEHICLE_MAIN: {
            new vehicleid = GetPlayerEditVehicle(playerid);
            if( !IsValidVehicle(vehicleid) ) {
                return 1;
            }

            g_DialogInfo = "";

            for(new listitem; listitem < MAX_LISTITEMS_VEHICLE; listitem ++) {
                switch(listitem) {
                    case LISTITEM_VEHICLE_GOTO: {
                        strcat(g_DialogInfo, "Goto\t \n");
                    }
                    case LISTITEM_VEHICLE_GET: {
                        strcat(g_DialogInfo, "Get\t \n");
                    }
                    case LISTITEM_VEHICLE_DRIVE: {
                        strcat(g_DialogInfo, "Drive\t \n");
                    }
                    case LISTITEM_VEHICLE_COORD: {
                        strcat(g_DialogInfo, "Coordinates & Rotation\t \n");
                    }
                    case LISTITEM_VEHICLE_MOVE: {
                        strcat(g_DialogInfo, "Click & Drag Move\t \n");
                    }
                    case LISTITEM_VEHICLE_ATTACH: {
                        new objectid = g_PlayerData[playerid][PLAYER_DATA_EDIT_ATTACHOBJECT];
                        if( !IsValidObject(objectid) ) {
                            strcat(g_DialogInfo, " \t \n");
                        } else {
                            strunpack(g_CommentString, g_ObjectData[objectid-1][OBJECT_DATA_COMMENT], MAX_COMMENT_LEN+1);
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Attach Selected Object\t%s\n", g_CommentString);
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        }
                    }
                    case LISTITEM_VEHICLE_DUPLICATE: {
                        strcat(g_DialogInfo, "Duplicate\t \n");
                    }
                    case LISTITEM_VEHICLE_RECREATE: {
                        strcat(g_DialogInfo, "Re-Create\t \n");
                    }
                    case LISTITEM_VEHICLE_REMOVE: {
                        strcat(g_DialogInfo, "Remove\t \n");
                    }
                    case LISTITEM_VEHICLE_COMMENT: {
                        strunpack(g_CommentString, g_VehicleData[vehicleid-1][VEHICLE_DATA_COMMENT], MAX_COMMENT_LEN+1);
                        format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Comment\t%s\n", g_CommentString);
                        strcat(g_DialogInfo, g_DialogInfoRow);
                    }
                    case LISTITEM_VEHICLE_COMMENT_RESET: {
                        GetVehicleModelName(GetVehicleModel(vehicleid), g_VehModelString, sizeof g_VehModelString);
                        format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Reset Comment To\t%s\n", g_VehModelString);
                        strcat(g_DialogInfo, g_DialogInfoRow);
                    }
                    case LISTITEM_VEHICLE_COLOR1: {
                        new colorid = g_VehicleData[vehicleid-1][VEHICLE_DATA_COLOR_1];
                        if( colorid == INVALID_COLOR_ID ) {
                            strcat(g_DialogInfo, "Color 1\tUnknown\n");
                        } else {
                            new rgb = GetVehicleColorRGB(colorid);
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Color 1\t{%06x}ID %i\n", rgb, colorid);
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        }
                    }
                    case LISTITEM_VEHICLE_COLOR2: {
                        new colorid = g_VehicleData[vehicleid-1][VEHICLE_DATA_COLOR_2];
                        if( colorid == INVALID_COLOR_ID ) {
                            strcat(g_DialogInfo, "Color 2\tUnknown\n");
                        } else {
                            new rgb = GetVehicleColorRGB(colorid);
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Color 2\t{%06x}ID %i\n", rgb, colorid);
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        }
                    }
                    case LISTITEM_VEHICLE_MODSHOP: {
                        new modshopid = GetVehicleModelModShop(GetVehicleModel(vehicleid));
                        if( modshopid == INVALID_MODSHOP_ID ) {
                            strcat(g_DialogInfo, " \t \n");
                        } else {
                            GetModShopName(modshopid, g_ModShopString, sizeof g_ModShopString);
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Teleport to Modshop\t%s\n", g_ModShopString);
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        }
                    }
                    case LISTITEM_VEHICLE_REMOVEMODS: {
                        strcat(g_DialogInfo, "Remove Modifications\t \n");
                    }
                    default: {
                        strcat(g_DialogInfo, " \t \n");
                    }
                }
            }
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, "Vehicle", g_DialogInfo, "Select", "Cancel");
        }
        case DIALOGID_VEHICLE_COORD: {
            new vehicleid = GetPlayerEditVehicle(playerid);
            if( !IsValidVehicle(vehicleid) ) {
                return 1;
            }

            new Float:x, Float:y, Float:z, Float:a;
            GetVehiclePos(vehicleid, x, y, z);
            GetVehicleZAngle(vehicleid, a);

            g_DialogInfo = "";
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "x\t%f\n", x), strcat(g_DialogInfo, g_DialogInfoRow);
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "y\t%f\n", y), strcat(g_DialogInfo, g_DialogInfoRow);
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "z\t%f\n", z), strcat(g_DialogInfo, g_DialogInfoRow);
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "a\t%f\n", a), strcat(g_DialogInfo, g_DialogInfoRow);

            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Vehicle Coordinates", g_DialogInfo, "Enter", "Cancel");
        }
        case DIALOGID_VEHICLE_COMMENT: {
            new vehicleid = GetPlayerEditVehicle(playerid);
            if( !IsValidVehicle(vehicleid) ) {
                return 1;
            }

            strunpack(g_CommentString, g_VehicleData[vehicleid-1][VEHICLE_DATA_COMMENT], MAX_COMMENT_LEN+1); // Get Comment
            format(g_DialogInfo, sizeof g_DialogInfo, "Current Comment: %s", g_CommentString);
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Vehicle Comment", g_DialogInfo, "Enter", "Cancel");
        }
        default: {
            return 0;
        }
    }
    return 1;
}

CopyVehicle(copy_vehicleid, Float:a) {
    if( !IsValidVehicle(copy_vehicleid) ) {
        return INVALID_VEHICLE_ID;
    }

    new Float:x, Float:y, Float:z, paste_vehicleid;

    GetVehiclePos(copy_vehicleid, x, y, z);

    paste_vehicleid = CreateVehicle(GetVehicleModel(copy_vehicleid), x, y, z, a, g_VehicleData[copy_vehicleid-1][VEHICLE_DATA_COLOR_1], g_VehicleData[copy_vehicleid-1][VEHICLE_DATA_COLOR_2], -1);
    if( paste_vehicleid == INVALID_VEHICLE_ID ) {
        return INVALID_VEHICLE_ID;
    }

    for(new slot; slot < MAX_COMPONENT_SLOTS; slot ++) {
        new componentid = GetVehicleComponentInSlot(copy_vehicleid, slot);

        if(componentid != 0) {
            AddVehicleComponent(paste_vehicleid, componentid);
        }
    }

    strunpack(g_CommentString, g_VehicleData[copy_vehicleid-1][VEHICLE_DATA_COMMENT], MAX_COMMENT_LEN+1); // Get Vehicle Comment
    strpack(g_VehicleData[paste_vehicleid-1][VEHICLE_DATA_COMMENT], g_CommentString, MAX_COMMENT_LEN+1); // Set Vehicle Comment

    g_VehicleData[paste_vehicleid-1][VEHICLE_DATA_MEMORY_X ] = g_VehicleData[copy_vehicleid-1][VEHICLE_DATA_MEMORY_X ];
    g_VehicleData[paste_vehicleid-1][VEHICLE_DATA_MEMORY_Y ] = g_VehicleData[copy_vehicleid-1][VEHICLE_DATA_MEMORY_Y ];
    g_VehicleData[paste_vehicleid-1][VEHICLE_DATA_MEMORY_Z ] = g_VehicleData[copy_vehicleid-1][VEHICLE_DATA_MEMORY_Z ];
    g_VehicleData[paste_vehicleid-1][VEHICLE_DATA_MEMORY_RZ] = g_VehicleData[copy_vehicleid-1][VEHICLE_DATA_MEMORY_RZ];

    return paste_vehicleid;
}

RecreateVehicle(copy_vehicleid, Float:a) {
    new paste_vehicleid = CopyVehicle(copy_vehicleid, a);

    if( paste_vehicleid != INVALID_VEHICLE_ID ) {
        TransferVehicleAttachments(copy_vehicleid, paste_vehicleid);

        for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
            if( !IsPlayerConnected(playerid) ) {
                continue;
            }

            if( GetPlayerEditVehicle(playerid) == copy_vehicleid ) {
                g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = paste_vehicleid;
            }

            for(new row; row < MAX_SELECTLIST_ROWS; row ++) {
                if( copy_vehicleid != g_SelectVehListData[playerid][SELECTLIST_DATA_ROW_ID][row] ) {
                    continue;
                }

                g_SelectVehListData[playerid][SELECTLIST_DATA_ROW_ID][row] = paste_vehicleid;

                if( g_PlayerData[playerid][PLAYER_DATA_TDMODE] == TDMODE_SELECTLIST_VEHICLE ) {
                    ApplySelectListRowData(playerid, row);
                }
            }
        }
        DestroyVehicle(copy_vehicleid);
    }

    return paste_vehicleid;
}

CopyVehicleAttachments(from_vehicleid, to_vehicleid) {
    if( !IsValidVehicle(from_vehicleid) || !IsValidVehicle(to_vehicleid) ) {
        return 0;
    }

    for(new loop_objectid = 1; loop_objectid <= MAX_OBJECTS; loop_objectid ++) {
        if( !IsValidObject(loop_objectid) ) {
            continue;
        }

        if( GetObjectAttachVehicle(loop_objectid) != from_vehicleid ) {
            continue;
        }

        new paste_objectid = CopyObject(loop_objectid, .copy_attachto = false);
        
        if( paste_objectid == INVALID_OBJECT_ID ) {
            return 0;
        }

        if( MigrateObjectAttachData(.from_objectid = loop_objectid, .to_objectid = paste_objectid, .attachtoid = to_vehicleid) ) {
            ApplyObjectAttachData(paste_objectid);
        }
    }

    return 1;
}

TransferVehicleAttachments(from_vehicleid, to_vehicleid) {
    if( !IsValidVehicle(from_vehicleid) || !IsValidVehicle(to_vehicleid) ) {
        return 0;
    }

    for(new loop_objectid = 1; loop_objectid <= MAX_OBJECTS; loop_objectid ++) {
        if( !IsValidObject(loop_objectid) ) {
            continue;
        }

        if( GetObjectAttachVehicle(loop_objectid) != from_vehicleid ) {
            continue;
        }

        g_ObjectData[loop_objectid-1][OBJECT_DATA_ATTACH_ID] = to_vehicleid;
        ApplyObjectAttachData(loop_objectid);
    }
    return 1;
}

IsVehicleOccupied(vehicleid, seat) {
    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if(IsPlayerConnected(playerid) && GetPlayerVehicleID(playerid) == vehicleid && GetPlayerVehicleSeat(playerid) == seat) {
            return 1;
        }
    }
    return 0;
}

FindVehicles(result[], result_size, search[], offset, &max_offset) {
    new
        rows_found,
        rows_added,
        search_int = -1,
        packed_search[MAX_SEARCH_LEN+1 char]
    ;

    sscanf(search, "i", search_int);

    strpack(packed_search, search);

    for(new vehicleid = 1, max_vehicleid = GetVehiclePoolSize(), modelid, cache_idx; vehicleid <= max_vehicleid; vehicleid ++) {
        if( !IsValidVehicle(vehicleid) ) {
            continue;
        }

        modelid = GetVehicleModel(vehicleid);
        cache_idx = GetVehicleModelCacheIndex(modelid);

        if(
            isempty(search) ||
            search_int == vehicleid ||
            search_int == modelid ||
            strfind(g_VehicleData[vehicleid-1][VEHICLE_DATA_COMMENT], packed_search, true) != -1 ||
            ( cache_idx != INVALID_ARRAY_INDEX && strfind(g_VehModelNameCache[cache_idx], packed_search, true) != -1 )
        ){
            if( rows_found ++ < offset ) {
                continue;
            }

            if( rows_added < result_size ) {
                result[rows_added ++] = vehicleid;
            }
        }
    }

    max_offset = rows_found - 1;
    if( max_offset < 0 ) {
        max_offset = 0;
    }

    return rows_added;
}
