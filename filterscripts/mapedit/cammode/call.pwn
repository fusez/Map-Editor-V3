public OnFilterScriptInit() {
    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            DefaultCamModeData(playerid);
        }
    }

    g_CamModeTimer = SetTimer("OnCamModeUpdate", CAMMODE_UPDATE_INTERVAL_MS, true);

    #if defined cmode_OnFilterScriptInit
        cmode_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit cmode_OnFilterScriptInit
#if defined cmode_OnFilterScriptInit
    forward cmode_OnFilterScriptInit();
#endif


public OnFilterScriptExit() {
    KillTimer(g_CamModeTimer);

    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( !IsPlayerConnected(playerid) ) {
            continue;
        }

        if( g_CamModeData[playerid][CAMMODE_DATA_TOGGLE] ) {
            ToggleCam(playerid, false);
        }
    }
    #if defined cmode_OnFilterScriptExit
        cmode_OnFilterScriptExit();
    #endif
}
#if defined _ALS_OnFilterScriptExit
    #undef OnFilterScriptExit
#else
    #define _ALS_OnFilterScriptExit
#endif
#define OnFilterScriptExit cmode_OnFilterScriptExit
#if defined cmode_OnFilterScriptExit
    forward cmode_OnFilterScriptExit();
#endif


public OnPlayerConnect(playerid) {
    DefaultCamModeData(playerid);

    #if defined cmode_OnPlayerConnect
        return cmode_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect cmode_OnPlayerConnect
#if defined cmode_OnPlayerConnect
    forward cmode_OnPlayerConnect(playerid);
#endif

public OnPlayerSpawn(playerid) {
	if( g_CamModeData[playerid][CAMMODE_DATA_TOGGLE] && IsValidPlayerObject(playerid, g_CamModeData[playerid][CAMMODE_DATA_POID]) ) {
        TogglePlayerSpectating(playerid, true);
        AttachCameraToPlayerObject(playerid, g_CamModeData[playerid][CAMMODE_DATA_POID]);
	}

    #if defined cmode_OnPlayerSpawn
        return cmode_OnPlayerSpawn(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerSpawn
    #undef OnPlayerSpawn
#else
    #define _ALS_OnPlayerSpawn
#endif
#define OnPlayerSpawn cmode_OnPlayerSpawn
#if defined cmode_OnPlayerSpawn
    forward cmode_OnPlayerSpawn(playerid);
#endif

public OnPlayerStateChange(playerid, newstate, oldstate) {
    if( !g_CamModeData[playerid][CAMMODE_DATA_TOGGLE] && g_CamModeData[playerid][CAMMODE_DATA_SPAWN_SAVED] && newstate == PLAYER_STATE_ONFOOT ) {
        SetPlayerPos(playerid, g_CamModeData[playerid][CAMMODE_DATA_SPAWN_X], g_CamModeData[playerid][CAMMODE_DATA_SPAWN_Y], g_CamModeData[playerid][CAMMODE_DATA_SPAWN_Z]);
        g_CamModeData[playerid][CAMMODE_DATA_SPAWN_SAVED] = false;
    }

    #if defined cmode_OnPlayerStateChange
        cmode_OnPlayerStateChange(playerid, newstate, oldstate);
    #endif
}
#if defined _ALS_OnPlayerStateChange
    #undef OnPlayerStateChange
#else
    #define _ALS_OnPlayerStateChange
#endif
#define OnPlayerStateChange cmode_OnPlayerStateChange
#if defined cmode_OnPlayerStateChange
    forward cmode_OnPlayerStateChange(playerid, newstate, oldstate);
#endif

public OnCamModeUpdate() {
    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( !IsPlayerConnected(playerid) ) {
            continue;
        }

        if( !g_CamModeData[playerid][CAMMODE_DATA_TOGGLE] ) {
            continue;
        }

        new keys, ud, lr;
        GetPlayerKeys(playerid, keys, ud, lr);

        if(ud == 0 && lr == 0) {
            if(g_CamModeData[playerid][CAMMODE_DATA_MOVING]) {
                StopPlayerObject(playerid, g_CamModeData[playerid][CAMMODE_DATA_POID]);
                g_CamModeData[playerid][CAMMODE_DATA_MOVING] = false;
                g_CamModeData[playerid][CAMMODE_DATA_MULTIPLIER] = 0.0;
            }
        } else {
            new
                Float:x,
                Float:y,
                Float:z,
                Float:vx,
                Float:vy,
                Float:vz,
                Float:speed
            ;

            GetPlayerCameraPos(playerid, x, y, z);
            GetPlayerCameraFrontVector(playerid, vx, vy, vz);

            if(ud < 0) {
                x += (vx * CAMMODE_MOVE_DISTANCE);
                y += (vy * CAMMODE_MOVE_DISTANCE);
                z += (vz * CAMMODE_MOVE_DISTANCE);
            } else if(ud > 0) {
                x -= (vx * CAMMODE_MOVE_DISTANCE);
                y -= (vy * CAMMODE_MOVE_DISTANCE);
                z -= (vz * CAMMODE_MOVE_DISTANCE);
            }

            if(lr > 0) {
                x += (vy * CAMMODE_MOVE_DISTANCE);
                y -= (vx * CAMMODE_MOVE_DISTANCE);
            } else if(lr < 0) {
                x -= (vy * CAMMODE_MOVE_DISTANCE);
                y += (vx * CAMMODE_MOVE_DISTANCE);
            }

            g_CamModeData[playerid][CAMMODE_DATA_MULTIPLIER] += CAMMODE_MULTIPLIER_ADD;
            if(g_CamModeData[playerid][CAMMODE_DATA_MULTIPLIER] > CAMMODE_MULTIPLIER_LIMIT) {
                g_CamModeData[playerid][CAMMODE_DATA_MULTIPLIER] = CAMMODE_MULTIPLIER_LIMIT;
            }

            if(keys & KEY_JUMP) {
                speed = g_CamModeData[playerid][CAMMODE_DATA_MULTIPLIER] * CAMMODE_SPEED_FAST;
            } else if(keys & KEY_WALK) {
                speed = g_CamModeData[playerid][CAMMODE_DATA_MULTIPLIER] * CAMMODE_SPEED_SLOW;
            } else {
                speed = g_CamModeData[playerid][CAMMODE_DATA_MULTIPLIER] * CAMMODE_SPEED_NORMAL;
            }

            MovePlayerObject(playerid, g_CamModeData[playerid][CAMMODE_DATA_POID], x, y, z, speed, 0.0, 0.0, 0.0);
            g_CamModeData[playerid][CAMMODE_DATA_MOVING] = true;
        }
    }

    #if defined cmode_OnCamModeUpdate
        cmode_OnCamModeUpdate();
    #endif
}
#if defined _ALS_OnCamModeUpdate
    #undef OnCamModeUpdate
#else
    #define _ALS_OnCamModeUpdate
#endif
#define OnCamModeUpdate cmode_OnCamModeUpdate
#if defined cmode_OnCamModeUpdate
    forward cmode_OnCamModeUpdate();
#endif
