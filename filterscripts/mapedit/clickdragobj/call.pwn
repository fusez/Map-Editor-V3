public OnFilterScriptInit() {
    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            DefaultClickDragObjectData(playerid);
        }
    }

    #if defined cdo_OnFilterScriptInit
        cdo_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit cdo_OnFilterScriptInit
#if defined cdo_OnFilterScriptInit
    forward cdo_OnFilterScriptInit();
#endif


public OnFilterScriptExit() {
    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            DefaultClickDragObjectData(playerid);
        }
    }

    #if defined cdo_OnFilterScriptExit
        cdo_OnFilterScriptExit();
    #endif
}
#if defined _ALS_OnFilterScriptExit
    #undef OnFilterScriptExit
#else
    #define _ALS_OnFilterScriptExit
#endif
#define OnFilterScriptExit cdo_OnFilterScriptExit
#if defined cdo_OnFilterScriptExit
    forward cdo_OnFilterScriptExit();
#endif


public OnPlayerConnect(playerid) {
    DefaultClickDragObjectData(playerid);

    #if defined cdo_OnPlayerConnect
        return cdo_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect cdo_OnPlayerConnect
#if defined cdo_OnPlayerConnect
    forward cdo_OnPlayerConnect(playerid);
#endif
