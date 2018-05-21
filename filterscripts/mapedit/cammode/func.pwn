forward OnCamModeUpdate();

DefaultCamModeData(playerid) {
    g_CamModeData[playerid][CAMMODE_DATA_TOGGLE]      = false;
    g_CamModeData[playerid][CAMMODE_DATA_MOVING]      = false;
    g_CamModeData[playerid][CAMMODE_DATA_MULTIPLIER]  = 0.0;
    g_CamModeData[playerid][CAMMODE_DATA_POID]        = INVALID_OBJECT_ID;
    g_CamModeData[playerid][CAMMODE_DATA_SPAWN_SAVED] = false;
    g_CamModeData[playerid][CAMMODE_DATA_SPAWN_X]     = 0.0;
    g_CamModeData[playerid][CAMMODE_DATA_SPAWN_Y]     = 0.0;
    g_CamModeData[playerid][CAMMODE_DATA_SPAWN_Z]     = 0.0;
}

ToggleCam(playerid, bool:toggle) {
    if( toggle == g_CamModeData[playerid][CAMMODE_DATA_TOGGLE] ) {
        return 0;
    }

    g_CamModeData[playerid][CAMMODE_DATA_TOGGLE] = toggle;

    if( toggle ) {
        new Float:x, Float:y, Float:z;

        switch(GetPlayerState(playerid)) {
            case PLAYER_STATE_DRIVER, PLAYER_STATE_PASSENGER: {
                GetVehiclePos(GetPlayerVehicleID(playerid), x, y, z);
                SetPlayerPos(playerid, x, y, z);
            }
            case PLAYER_STATE_ONFOOT: {
                GetPlayerPos(playerid, x, y, z);
            }
            default: {
                return 0;
            }
        }

        g_CamModeData[playerid][CAMMODE_DATA_MOVING] = false;
        g_CamModeData[playerid][CAMMODE_DATA_POID] = CreatePlayerObject(playerid, CAMMODE_OBJECT_MODEL, x, y, z, 0.0, 0.0, 0.0);
        g_CamModeData[playerid][CAMMODE_DATA_MULTIPLIER] = 0.0;

        TogglePlayerSpectating(playerid, true);
        AttachCameraToPlayerObject(playerid, g_CamModeData[playerid][CAMMODE_DATA_POID]);
        GameTextForPlayer(playerid, "~w~camera mode ~g~toggled", 2000, 4);

        SendClientMessage(playerid, RGBA_ORANGE, "Camera Mode Keys: ");
        SendClientMessage(playerid, RGBA_ORANGE, "Direction: {FFFFFF}~k~~GO_FORWARD~ / ~k~~GO_BACK~ / ~k~~GO_LEFT~ / ~k~~GO_RIGHT~");
        SendClientMessage(playerid, RGBA_ORANGE, "Faster: {FFFFFF}~k~~PED_JUMPING~ + Direction Key");
        SendClientMessage(playerid, RGBA_ORANGE, "Slower: {FFFFFF}~k~~SNEAK_ABOUT~ + Direction Key");
        SendClientMessage(playerid, RGBA_ORANGE, " ");
    } else {
        GetPlayerPos(playerid, g_CamModeData[playerid][CAMMODE_DATA_SPAWN_X], g_CamModeData[playerid][CAMMODE_DATA_SPAWN_Y], g_CamModeData[playerid][CAMMODE_DATA_SPAWN_Z]);
        g_CamModeData[playerid][CAMMODE_DATA_SPAWN_SAVED] = true;

        DestroyPlayerObject(playerid, g_CamModeData[playerid][CAMMODE_DATA_POID]);
        g_CamModeData[playerid][CAMMODE_DATA_POID] = INVALID_OBJECT_ID;

        TogglePlayerSpectating(playerid, false);
        GameTextForPlayer(playerid, "~w~camera mode ~r~untoggled", 2000, 4);
    }
    return 1;
}
