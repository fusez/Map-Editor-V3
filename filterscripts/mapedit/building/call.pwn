public OnFilterScriptInit() {
    LoadBuildingCache();

    #if defined build_OnFilterScriptInit
        build_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit build_OnFilterScriptInit
#if defined build_OnFilterScriptInit
    forward build_OnFilterScriptInit();
#endif


public OnPlayerConnect(playerid) {
    for(new b; b < BUILDING_DATA_SIZE; b ++) {
        if( g_BuildingData[b][BUILDING_DATA_ISLOADED] && g_BuildingData[b][BUILDING_DATA_ISREMOVED] ) {
            RemoveBuildingIDForPlayer(playerid, b);
        }
    }

    #if defined build_OnPlayerConnect
        return build_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect build_OnPlayerConnect
#if defined build_OnPlayerConnect
    forward build_OnPlayerConnect(playerid);
#endif
