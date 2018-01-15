stock hook_CreateActor(modelid, Float:X, Float:Y, Float:Z, Float:Rotation) {
    new actorid = CreateActor(modelid, Float:X, Float:Y, Float:Z, Float:Rotation);
    if( actorid != INVALID_ACTOR_ID ) {
        g_ActorData[actorid][ACTOR_DATA_SKIN] = modelid;

        if( GetSkinName(modelid, g_CommentString, sizeof g_CommentString) ) {
            strpack(g_ActorData[actorid][ACTOR_DATA_COMMENT], g_CommentString, sizeof g_CommentString);
        }

        DefaultActorAnimationData(actorid);
    }
    return actorid;
}
#if defined _ALS_CreateActor
    #undef CreateActor
#else
    #define _ALS_CreateActor
#endif
#define CreateActor hook_CreateActor


stock hook_DestroyActor(actorid) {
    new success = DestroyActor(actorid);
    if( success ) {
        for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
            if( !IsPlayerConnected(playerid) ) {
                continue;
            }

            if( GetPlayerEditActor(playerid) == actorid ) {
                g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE;
            }

            new edit_row = g_SelectActListData[playerid][SELECTLIST_DATA_EDIT_ROW];
            if( edit_row != INVALID_ROW ) {
                new edit_actorid = g_SelectActListData[playerid][SELECTLIST_DATA_ROW_ID][edit_row];

                if( actorid == edit_actorid ) {
                    g_SelectActListData[playerid][SELECTLIST_DATA_EDIT_ROW] = INVALID_ROW;
                }
            }

            for(new row; row < MAX_SELECTLIST_ROWS; row ++) {
                if( actorid != g_SelectActListData[playerid][SELECTLIST_DATA_ROW_ID][row] ) {
                    continue;
                }

                g_SelectActListData[playerid][SELECTLIST_DATA_ROW_ID][row] = INVALID_ACTOR_ID;

                if( g_PlayerData[playerid][PLAYER_DATA_TDMODE] != TDMODE_SELECTLIST_ACTOR ) {
                    continue;
                }

                PlayerTextDrawHide(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_ROW][row]);
                PlayerTextDrawHide(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_ROW][row]);
            }
        }
    }
    return success;
}
#if defined _ALS_DestroyActor
    #undef DestroyActor
#else
    #define _ALS_DestroyActor
#endif
#define DestroyActor hook_DestroyActor
