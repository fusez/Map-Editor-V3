public OnFilterScriptExit() {
    DestroyMapLoadedTextdraw();

    #if defined ml_OnFilterScriptExit
        ml_OnFilterScriptExit();
    #endif
}
#if defined _ALS_OnFilterScriptExit
    #undef OnFilterScriptExit
#else
    #define _ALS_OnFilterScriptExit
#endif
#define OnFilterScriptExit ml_OnFilterScriptExit
#if defined ml_OnFilterScriptExit
    forward ml_OnFilterScriptExit();
#endif

public OnPlayerConnect(playerid) {
    if( g_MapLoadedTD != Text: INVALID_TEXT_DRAW ) {
        TextDrawShowForPlayer(playerid, g_MapLoadedTD);
    }
    #if defined ml_OnPlayerConnect
        return ml_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect ml_OnPlayerConnect
#if defined ml_OnPlayerConnect
    forward ml_OnPlayerConnect(playerid);
#endif
