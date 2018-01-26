ShowPickupDialog(playerid, dialogid) {
    switch( dialogid ) {
        case DIALOGID_PICKUP_MAIN: {
            new pickupid = GetPlayerEditPickup(playerid);
            if( !IsValidPickup(pickupid) ) {
                return 1;
            }

            g_DialogInfo = "";

            for(new listitem; listitem < MAX_LISTITEMS_PICKUP; listitem ++) {
                switch(listitem) {
                    case LISTITEM_PICKUP_GOTO: {
                        strcat(g_DialogInfo, "Goto\t \n");
                    }
                    case LISTITEM_PICKUP_GET: {
                        strcat(g_DialogInfo, "Get\t \n");
                    }
                    case LISTITEM_PICKUP_COORD: {
                        strcat(g_DialogInfo, "Coordinates\t \n");
                    }
                    case LISTITEM_PICKUP_MOVE: {
                        strcat(g_DialogInfo, "Click & Drag Move\t \n");
                    }
                    case LISTITEM_PICKUP_REMOVE: {
                        strcat(g_DialogInfo, "Remove\t \n");
                    }
                    case LISTITEM_PICKUP_DUPLICATE: {
                        strcat(g_DialogInfo, "Duplicate\t \n");
                    }
                    case LISTITEM_PICKUP_COMMENT: {
                        strunpack(g_CommentString, g_PickupData[pickupid][PICKUP_DATA_COMMENT], sizeof g_CommentString); // Get Comment
                        format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Comment\t%s\n", g_CommentString);
                        strcat(g_DialogInfo, g_DialogInfoRow);
                    }
                    case LISTITEM_PICKUP_COMMENT_RESET: {
                        GetModelName(g_PickupData[pickupid][PICKUP_DATA_MODEL], g_ModelString, sizeof g_ModelString);
                        format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Reset Comment To\t%s\n", g_ModelString);
                        strcat(g_DialogInfo, g_DialogInfoRow);
                    }
                    default: {
                        strcat(g_DialogInfo, " \t \n");
                    }
                }
            }
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, "Pickup", g_DialogInfo, "Select", "Cancel");
        }
        case DIALOGID_PICKUP_COORD: {
            new pickupid = GetPlayerEditPickup(playerid);
            if( !IsValidPickup(pickupid) ) {
                return 1;
            }

            g_DialogInfo = "";
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "x\t%f\n", g_PickupData[pickupid][PICKUP_DATA_X]);
            strcat(g_DialogInfo, g_DialogInfoRow);
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "y\t%f\n", g_PickupData[pickupid][PICKUP_DATA_Y]);
            strcat(g_DialogInfo, g_DialogInfoRow);
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "z\t%f\n", g_PickupData[pickupid][PICKUP_DATA_Z]);
            strcat(g_DialogInfo, g_DialogInfoRow);
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Pickup Coordinates", g_DialogInfo, "Enter", "Cancel");
        }
        case DIALOGID_PICKUP_COMMENT: {
            new pickupid = GetPlayerEditPickup(playerid);
            if( !IsValidPickup(pickupid) ) {
                return 1;
            }

            strunpack(g_CommentString, g_PickupData[pickupid][PICKUP_DATA_COMMENT], sizeof g_CommentString);
            format(g_DialogInfo, sizeof g_DialogInfo, "Current Comment: %s", g_CommentString);
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Pickup Comment", g_DialogInfo, "Enter", "Cancel");
        }
        default: {
            return 0;
        }
    }
    return 1;
}

RecreatePickup(copy_pickupid) {
    new paste_pickupid = CopyPickup(copy_pickupid);
    if( paste_pickupid != INVALID_PICKUP_ID ) {
        for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
            if( !IsPlayerConnected(playerid) ) {
                continue;
            }

            if( GetPlayerEditPickup(playerid) == copy_pickupid ) {
                g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = paste_pickupid;
            }

            for(new row; row < MAX_SELECTLIST_ROWS; row ++) {
                if( copy_pickupid != g_SelectPickListData[playerid][SELECTLIST_DATA_ROW_ID][row] ) {
                    continue;
                }

                g_SelectPickListData[playerid][SELECTLIST_DATA_ROW_ID][row] = paste_pickupid;

                if( g_PlayerData[playerid][PLAYER_DATA_TDMODE] == TDMODE_SELECTLIST_PICKUP ) {
                    ApplySelectListRowData(playerid, row);
                }
            }
        }

        DestroyPickup(copy_pickupid);
    }
    return paste_pickupid;
}

CopyPickup(copy_pickupid) {
    new paste_pickupid = CreatePickup(
        g_PickupData[copy_pickupid][PICKUP_DATA_MODEL],
        1,
        g_PickupData[copy_pickupid][PICKUP_DATA_X],
        g_PickupData[copy_pickupid][PICKUP_DATA_Y],
        g_PickupData[copy_pickupid][PICKUP_DATA_Z]
    );

    if( paste_pickupid != INVALID_PICKUP_ID ) {
        strunpack(g_CommentString, g_PickupData[copy_pickupid][PICKUP_DATA_COMMENT], sizeof g_CommentString); // Get Comment
        strpack(g_PickupData[paste_pickupid][PICKUP_DATA_COMMENT], g_CommentString, sizeof g_CommentString); // Set Comment

        g_PickupData[paste_pickupid][PICKUP_DATA_MEMORY_X] = g_PickupData[copy_pickupid][PICKUP_DATA_MEMORY_X];
        g_PickupData[paste_pickupid][PICKUP_DATA_MEMORY_Y] = g_PickupData[copy_pickupid][PICKUP_DATA_MEMORY_Y];
        g_PickupData[paste_pickupid][PICKUP_DATA_MEMORY_Z] = g_PickupData[copy_pickupid][PICKUP_DATA_MEMORY_Z];
    }
    return paste_pickupid;
}

FindPickups(result[], result_size, search[], offset, &max_offset) {
    new
        rows_found,
        rows_added,
        search_int = -1,
        packed_search[MAX_SEARCH_LEN+1 char]
    ;

    sscanf(search, "i", search_int);

    strpack(packed_search, search);

    for(new pickupid, modelid, cache_index; pickupid < MAX_PICKUPS; pickupid ++) {
        if( !g_PickupData[pickupid][PICKUP_DATA_ISVALID] ) {
            continue;
        }

        modelid = g_PickupData[pickupid][PICKUP_DATA_MODEL];
        cache_index = GetModelCacheIndex(modelid);

        if(
            isempty(search) ||
            search_int == pickupid ||
            search_int == modelid ||
            strfind(g_PickupData[pickupid][PICKUP_DATA_COMMENT], packed_search, true) != -1 ||
            ( cache_index != INVALID_ARRAY_INDEX && strfind(g_ModelCache[cache_index][MODEL_CACHE_NAME], packed_search, true) != -1 )
        ){
            if( rows_found ++ < offset ) {
                continue;
            }

            if( rows_added < result_size ) {
                result[rows_added ++] = pickupid;
            }
        }
    }

    max_offset = rows_found - 1;
    if( max_offset < 0 ) {
        max_offset = 0;
    }

    return rows_added;
}
