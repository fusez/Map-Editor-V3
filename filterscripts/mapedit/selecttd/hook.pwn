hook_SelectTextDraw(playerid, hovercolor) {
    SelectTextDraw(playerid, hovercolor);
    g_PlayerData[playerid][PLAYER_DATA_SELECTTD] = true;

    for(new td; td < MAX_TOOLBAR_TEXTDRAWS; td ++) {
        TextDrawShowForPlayer(playerid, g_ToolbarTextdraw[td]);
    }

    CreateToolbarKeyTextdraw(playerid, .mousemode = true);
}
#if defined _ALS_SelectTextDraw
    #undef SelectTextDraw
#else
    #define _ALS_SelectTextDraw
#endif
#define SelectTextDraw hook_SelectTextDraw


hook_CancelSelectTextDraw(playerid) {
    CancelSelectTextDraw(playerid);
    g_PlayerData[playerid][PLAYER_DATA_SELECTTD] = false;

    for(new td; td < MAX_TOOLBAR_TEXTDRAWS; td ++) {
        TextDrawHideForPlayer(playerid, g_ToolbarTextdraw[td]);
    }

    CreateToolbarKeyTextdraw(playerid, .mousemode = false);

    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_SELECTLIST_OBJECT, TDMODE_SELECTLIST_VEHICLE, TDMODE_SELECTLIST_PICKUP, TDMODE_SELECTLIST_ACTOR: {
            if( g_PlayerData[playerid][PLAYER_DATA_POS_SAVED] ) {
                if( g_CamModeData[playerid][CAMMODE_DATA_TOGGLE] ) {
                    SetPlayerObjectPos(playerid, g_CamModeData[playerid][CAMMODE_DATA_POID], g_PlayerData[playerid][PLAYER_DATA_POS_X], g_PlayerData[playerid][PLAYER_DATA_POS_Y], g_PlayerData[playerid][PLAYER_DATA_POS_Z]);
                } else {
                    SetPlayerPos(playerid, g_PlayerData[playerid][PLAYER_DATA_POS_X], g_PlayerData[playerid][PLAYER_DATA_POS_Y], g_PlayerData[playerid][PLAYER_DATA_POS_Z]);
                }
                g_PlayerData[playerid][PLAYER_DATA_POS_SAVED] = false;
            }

            SetSelectListEditViewed(playerid, false);
        }
    }

    if( g_PlayerData[playerid][PLAYER_DATA_TDMODE] != TDMODE_NONE ) {
        HidePlayerTextdrawMode(playerid);
    }
}
#if defined _ALS_CancelSelectTextDraw
    #undef CancelSelectTextDraw
#else
    #define _ALS_CancelSelectTextDraw
#endif
#define CancelSelectTextDraw hook_CancelSelectTextDraw
