public OnFilterScriptInit() {
    CreateGenericHelpWindow();

    #if defined help_OnFilterScriptInit
        help_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit help_OnFilterScriptInit
#if defined help_OnFilterScriptInit
    forward help_OnFilterScriptInit();
#endif


public OnFilterScriptExit() {
    DestroyGenericHelpWindow();

    #if defined help_OnFilterScriptExit
        help_OnFilterScriptExit();
    #endif
}
#if defined _ALS_OnFilterScriptExit
    #undef OnFilterScriptExit
#else
    #define _ALS_OnFilterScriptExit
#endif
#define OnFilterScriptExit help_OnFilterScriptExit
#if defined help_OnFilterScriptExit
    forward help_OnFilterScriptExit();
#endif


public OnPlayerClickTextDraw(playerid, Text:clickedid) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_HELP_INFO, TDMODE_HELP_KEYBIND, TDMODE_HELP_CREDIT: {
            if( clickedid == Text: INVALID_TEXT_DRAW ) {
                HidePlayerTextdrawMode(playerid);
            } else if( clickedid == g_HelpGTD[HELP_GTD_CLOSE] ) {
                return HidePlayerTextdrawMode(playerid), 1;
            }
        }
    }

    if( clickedid == g_HelpGTD[HELP_GTD_INFO_TAB] ) {
        return ShowPlayerTextdrawMode(playerid, TDMODE_HELP_INFO), 1;
    }
    if( clickedid == g_HelpGTD[HELP_GTD_KEYBIND_TAB] ) {
        return ShowPlayerTextdrawMode(playerid, TDMODE_HELP_KEYBIND), 1;
    }
    if( clickedid == g_HelpGTD[HELP_GTD_CREDIT_TAB] ) {
        return ShowPlayerTextdrawMode(playerid, TDMODE_HELP_CREDIT), 1;
    }

    #if defined help_OnPlayerClickTextDraw
        return help_OnPlayerClickTextDraw(playerid, Text:clickedid);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerClickTextDraw
    #undef OnPlayerClickTextDraw
#else
    #define _ALS_OnPlayerClickTextDraw
#endif
#define OnPlayerClickTextDraw help_OnPlayerClickTextDraw
#if defined help_OnPlayerClickTextDraw
    forward help_OnPlayerClickTextDraw(playerid, Text:clickedid);
#endif
