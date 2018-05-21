public OnPlayerClickTextDraw(playerid, Text:clickedid) {
    if( clickedid == Text: INVALID_TEXT_DRAW ) {
        g_PlayerData[playerid][PLAYER_DATA_SELECTTD] = false;
    }

    #if defined std_OnPlayerClickTextDraw
        return std_OnPlayerClickTextDraw(playerid, Text:clickedid);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerClickTextDraw
    #undef OnPlayerClickTextDraw
#else
    #define _ALS_OnPlayerClickTextDraw
#endif
#define OnPlayerClickTextDraw std_OnPlayerClickTextDraw
#if defined std_OnPlayerClickTextDraw
    forward std_OnPlayerClickTextDraw(playerid, Text:clickedid);
#endif
