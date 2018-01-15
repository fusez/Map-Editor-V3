stock hook_CreatePickup(model, type, Float:X, Float:Y, Float:Z, virtualworld = 0) {
    new pickupid = CreatePickup(model, type, X, Y, Z, virtualworld);
    if( pickupid != INVALID_PICKUP_ID ) {
        g_PickupData[pickupid][PICKUP_DATA_ISVALID] = true;
        g_PickupData[pickupid][PICKUP_DATA_MODEL] = model;
        g_PickupData[pickupid][PICKUP_DATA_X] = X;
        g_PickupData[pickupid][PICKUP_DATA_Y] = Y;
        g_PickupData[pickupid][PICKUP_DATA_Z] = Z;

        if( GetModelName(model, g_CommentString, MAX_COMMENT_LEN+1) ) {
            strpack(g_PickupData[pickupid][PICKUP_DATA_COMMENT], g_CommentString, MAX_COMMENT_LEN+1); // Set Comment
        }
    }
    return pickupid;
}
#if defined _ALS_CreatePickup
    #undef CreatePickup
#else
    #define _ALS_CreatePickup
#endif
#define CreatePickup hook_CreatePickup


stock hook_DestroyPickup(pickupid) {
    new isvalid = IsValidPickup(pickupid);

    DestroyPickup(pickupid);

    if( isvalid ) {
        g_PickupData[pickupid][PICKUP_DATA_ISVALID] = false;

        for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
            if( !IsPlayerConnected(playerid) ) {
                continue;
            }

            if( GetPlayerEditPickup(playerid) == pickupid ) {
                g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE;
            }

            new edit_row = g_SelectPickListData[playerid][SELECTLIST_DATA_EDIT_ROW];
            if( edit_row != INVALID_ROW ) {
                new edit_pickupid = g_SelectPickListData[playerid][SELECTLIST_DATA_ROW_ID][edit_row];

                if( pickupid == edit_pickupid ) {
                    g_SelectPickListData[playerid][SELECTLIST_DATA_EDIT_ROW] = INVALID_ROW;
                }
            }

            for(new row; row < MAX_SELECTLIST_ROWS; row ++) {
                if( pickupid != g_SelectPickListData[playerid][SELECTLIST_DATA_ROW_ID][row] ) {
                    continue;
                }

                g_SelectPickListData[playerid][SELECTLIST_DATA_ROW_ID][row] = INVALID_PICKUP_ID;

                if( g_PlayerData[playerid][PLAYER_DATA_TDMODE] != TDMODE_SELECTLIST_PICKUP ) {
                    continue;
                }

                PlayerTextDrawHide(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_ROW][row]);
                PlayerTextDrawHide(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_ROW][row]);
            }
        }
    }
}
#if defined _ALS_DestroyPickup
    #undef DestroyPickup
#else
    #define _ALS_DestroyPickup
#endif
#define DestroyPickup hook_DestroyPickup
