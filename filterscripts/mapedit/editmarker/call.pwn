public OnFilterScriptInit() {
    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            DefaultEditMarkerData(playerid);
        }
    }

    #if defined em_OnFilterScriptInit
        em_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit em_OnFilterScriptInit
#if defined em_OnFilterScriptInit
    forward em_OnFilterScriptInit();
#endif

public OnFilterScriptExit() {
    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( !IsPlayerConnected(playerid) ) {
            continue;
        }

        if( !g_EditMarkerData[playerid][EDITMARKER_DATA_ON] ) {
            continue;
        }

        DestroyPlayerObject(playerid, g_EditMarkerData[playerid][EDITMARKER_DATA_POID]);
        RemovePlayerMapIcon(playerid, EDITMARKER_MAPICONID);
    }

    #if defined em_OnFilterScriptExit
        em_OnFilterScriptExit();
    #endif
}
#if defined _ALS_OnFilterScriptExit
    #undef OnFilterScriptExit
#else
    #define _ALS_OnFilterScriptExit
#endif
#define OnFilterScriptExit em_OnFilterScriptExit
#if defined em_OnFilterScriptExit
    forward em_OnFilterScriptExit();
#endif


public OnPlayerConnect(playerid) {
    DefaultEditMarkerData(playerid);

    #if defined em_OnPlayerConnect
        return em_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect em_OnPlayerConnect
#if defined em_OnPlayerConnect
    forward em_OnPlayerConnect(playerid);
#endif


public OnPlayerUpdate(playerid) {
    if( GetTickCount() > g_EditMarkerData[playerid][EDITMARKER_DATA_TICK] ) {
        RefreshPlayerEditMarker(playerid);

        if( g_EditMarkerData[playerid][EDITMARKER_DATA_ON] ) {
            g_EditMarkerData[playerid][EDITMARKER_DATA_TICK] = GetTickCount() + 200;
        } else {
            g_EditMarkerData[playerid][EDITMARKER_DATA_TICK] = GetTickCount() + 1000;
        }

    }

    #if defined em_OnPlayerUpdate
        return em_OnPlayerUpdate(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerUpdate
    #undef OnPlayerUpdate
#else
    #define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate em_OnPlayerUpdate
#if defined em_OnPlayerUpdate
    forward em_OnPlayerUpdate(playerid);
#endif
