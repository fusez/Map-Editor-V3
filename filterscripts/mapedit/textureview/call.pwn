public OnFilterScriptInit() {
    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            DefaultTextureViewData(playerid);
        }
    }

    #if defined tview_OnFilterScriptInit
        tview_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit tview_OnFilterScriptInit
#if defined tview_OnFilterScriptInit
    forward tview_OnFilterScriptInit();
#endif


public OnPlayerConnect(playerid) {
    DefaultTextureViewData(playerid);

    #if defined tview_OnPlayerConnect
        return tview_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect tview_OnPlayerConnect
#if defined tview_OnPlayerConnect
    forward tview_OnPlayerConnect(playerid);
#endif
