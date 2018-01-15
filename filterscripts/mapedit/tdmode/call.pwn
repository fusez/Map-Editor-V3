public OnFilterScriptInit() {
    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            g_PlayerData[playerid][PLAYER_DATA_TDMODE] = TDMODE_NONE;
        }
    }

    #if defined tdm_OnFilterScriptInit
        tdm_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit tdm_OnFilterScriptInit
#if defined tdm_OnFilterScriptInit
    forward tdm_OnFilterScriptInit();
#endif


public OnFilterScriptExit() {
    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            HidePlayerTextdrawMode(playerid);
        }
    }

    #if defined tdm_OnFilterScriptExit
        tdm_OnFilterScriptExit();
    #endif
}
#if defined _ALS_OnFilterScriptExit
    #undef OnFilterScriptExit
#else
    #define _ALS_OnFilterScriptExit
#endif
#define OnFilterScriptExit tdm_OnFilterScriptExit
#if defined tdm_OnFilterScriptExit
    forward tdm_OnFilterScriptExit();
#endif


public OnPlayerConnect(playerid) {
    g_PlayerData[playerid][PLAYER_DATA_TDMODE] = TDMODE_NONE;

    #if defined tdm_OnPlayerConnect
        return tdm_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect tdm_OnPlayerConnect
#if defined tdm_OnPlayerConnect
    forward tdm_OnPlayerConnect(playerid);
#endif
