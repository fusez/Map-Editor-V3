public OnFilterScriptInit() {
    g_OffsetEditTimer = SetTimer("OnOffsetEditUpdate", OFFSETEDIT_UPDATE_INTERVAL, true);

    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            DefaultOffsetEditData(playerid);
        }
    }

    #if defined oe_OnFilterScriptInit
        oe_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit oe_OnFilterScriptInit
#if defined oe_OnFilterScriptInit
    forward oe_OnFilterScriptInit();
#endif


public OnFilterScriptExit() {
    KillTimer(g_OffsetEditTimer);

    #if defined oe_OnFilterScriptExit
        oe_OnFilterScriptExit();
    #endif
}
#if defined _ALS_OnFilterScriptExit
    #undef OnFilterScriptExit
#else
    #define _ALS_OnFilterScriptExit
#endif
#define OnFilterScriptExit oe_OnFilterScriptExit
#if defined oe_OnFilterScriptExit
    forward oe_OnFilterScriptExit();
#endif


public OnPlayerConnect(playerid) {
    DefaultOffsetEditData(playerid);

    #if defined oe_OnPlayerConnect
        return oe_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect oe_OnPlayerConnect
#if defined oe_OnPlayerConnect
    forward oe_OnPlayerConnect(playerid);
#endif


public OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
    if( g_OffsetEditData[playerid][OFFSETEDIT_DATA_TOGGLE] ) {
        if( PRESSED(KEY_SECONDARY_ATTACK) ) {
            ToggleOffsetEdit(playerid, false);
            ClearAnimations(playerid);
            ShowObjectDialog(playerid, DIALOGID_OBJECT_MAIN);
            SelectTextDraw(playerid, SELECT_TD_COLOR);
        }

        if( HOLDING(KEY_SPRINT) ) {
            if( PRESSED(KEY_ANALOG_LEFT) ) {
                if( -- g_OffsetEditData[playerid][OFFSETEDIT_DATA_MODE] < OFFSETEDIT_MODE_X ) {
                    g_OffsetEditData[playerid][OFFSETEDIT_DATA_MODE] = OFFSETEDIT_MODE_RZ;
                }

                ShowOffsetEditMode(playerid);
            } else if( PRESSED(KEY_ANALOG_RIGHT) ) {
                if( ++ g_OffsetEditData[playerid][OFFSETEDIT_DATA_MODE] > OFFSETEDIT_MODE_RZ ) {
                    g_OffsetEditData[playerid][OFFSETEDIT_DATA_MODE] = OFFSETEDIT_MODE_X;
                }

                ShowOffsetEditMode(playerid);
            }
        }
    }

    #if defined oe_OnPlayerKeyStateChange
        oe_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
    #endif
}
#if defined _ALS_OnPlayerKeyStateChange
    #undef OnPlayerKeyStateChange
#else
    #define _ALS_OnPlayerKeyStateChange
#endif
#define OnPlayerKeyStateChange oe_OnPlayerKeyStateChange
#if defined oe_OnPlayerKeyStateChange
    forward oe_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
#endif


public OnOffsetEditUpdate() {
    new keys, ud, lr;

    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( !IsPlayerConnected(playerid) ) {
            continue;
        }

        if( !g_OffsetEditData[playerid][OFFSETEDIT_DATA_TOGGLE] ) {
            continue;
        }

        GetPlayerKeys(playerid, keys, ud, lr);

        if(keys & KEY_SPRINT) {
            continue;
        }

        if(keys & KEY_ANALOG_RIGHT) {
            if(g_OffsetEditData[playerid][OFFSETEDIT_DATA_MULTIPLIER] < 0.0) {
                g_OffsetEditData[playerid][OFFSETEDIT_DATA_MULTIPLIER] = 0.0;
            }

            g_OffsetEditData[playerid][OFFSETEDIT_DATA_MULTIPLIER] += OFFSETEDIT_MULTIPLIER_ADD;
            if(g_OffsetEditData[playerid][OFFSETEDIT_DATA_MULTIPLIER] > OFFSETEDIT_MULTIPLIER_LIMIT) {
                g_OffsetEditData[playerid][OFFSETEDIT_DATA_MULTIPLIER] = OFFSETEDIT_MULTIPLIER_LIMIT;
            }
        } else if(keys & KEY_ANALOG_LEFT) {
            if(g_OffsetEditData[playerid][OFFSETEDIT_DATA_MULTIPLIER] > 0.0) {
                g_OffsetEditData[playerid][OFFSETEDIT_DATA_MULTIPLIER] = 0.0;
            }

            g_OffsetEditData[playerid][OFFSETEDIT_DATA_MULTIPLIER] -= OFFSETEDIT_MULTIPLIER_ADD;
            if(g_OffsetEditData[playerid][OFFSETEDIT_DATA_MULTIPLIER] < -OFFSETEDIT_MULTIPLIER_LIMIT) {
                g_OffsetEditData[playerid][OFFSETEDIT_DATA_MULTIPLIER] = -OFFSETEDIT_MULTIPLIER_LIMIT;
            }
        } else {
            g_OffsetEditData[playerid][OFFSETEDIT_DATA_MULTIPLIER] = 0.0;
            continue;
        }

        new objectid = GetPlayerEditObject(playerid);
        if( !IsValidObject(objectid) ) {
            ToggleOffsetEdit(playerid, false);
            continue;
        }

        new Float:move_amount;
        if(keys & KEY_WALK) {
            move_amount = g_OffsetEditData[playerid][OFFSETEDIT_DATA_MULTIPLIER] * OFFSETEDIT_MOVE_SLOW;
        } else {
            move_amount = g_OffsetEditData[playerid][OFFSETEDIT_DATA_MULTIPLIER] * OFFSETEDIT_MOVE_NORMAL;
        }

        switch(g_OffsetEditData[playerid][OFFSETEDIT_DATA_MODE]) {
            case OFFSETEDIT_MODE_X: {
                g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_X] += move_amount;
            }
            case OFFSETEDIT_MODE_Y: {
                g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Y] += move_amount;
            }
            case OFFSETEDIT_MODE_Z: {
                g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Z] += move_amount;
            }
            case OFFSETEDIT_MODE_RX: {
                g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RX] = fixrot( g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RX] + move_amount );
            }
            case OFFSETEDIT_MODE_RY: {
                g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RY] = fixrot( g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RY] + move_amount );
            }
            case OFFSETEDIT_MODE_RZ: {
                g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RZ] = fixrot( g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RZ] + move_amount );
            }
            default: {
                continue;
            }
        }

        ShowOffsetEditOffset(playerid, objectid);
        ApplyObjectAttachData(objectid);
    }

    #if defined oe_OnOffsetEditUpdate
        oe_OnOffsetEditUpdate();
    #endif
}
#if defined _ALS_OnOffsetEditUpdate
    #undef OnOffsetEditUpdate
#else
    #define _ALS_OnOffsetEditUpdate
#endif
#define OnOffsetEditUpdate oe_OnOffsetEditUpdate
#if defined oe_OnOffsetEditUpdate
    forward oe_OnOffsetEditUpdate();
#endif
