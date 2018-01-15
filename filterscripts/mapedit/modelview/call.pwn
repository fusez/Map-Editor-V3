public OnFilterScriptInit() {
    CreateGenericModelView();

    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            DefaultModelViewData(playerid);
        }
    }

    g_ModelViewTimer = SetTimer("OnModelViewUpdate", MODELVIEW_UPDATE_INTERVAL_MS, true);

    #if defined mv_OnFilterScriptInit
        mv_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit mv_OnFilterScriptInit
#if defined mv_OnFilterScriptInit
    forward mv_OnFilterScriptInit();
#endif


public OnFilterScriptExit() {
    DestroyGenericModelView();

    KillTimer(g_ModelViewTimer);

    #if defined mv_OnFilterScriptExit
        mv_OnFilterScriptExit();
    #endif
}
#if defined _ALS_OnFilterScriptExit
    #undef OnFilterScriptExit
#else
    #define _ALS_OnFilterScriptExit
#endif
#define OnFilterScriptExit mv_OnFilterScriptExit
#if defined mv_OnFilterScriptExit
    forward mv_OnFilterScriptExit();
#endif


public OnPlayerConnect(playerid) {
    DefaultModelViewData(playerid);

    #if defined mv_OnPlayerConnect
        return mv_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect mv_OnPlayerConnect
#if defined mv_OnPlayerConnect
    forward mv_OnPlayerConnect(playerid);
#endif


public OnPlayerClickTextDraw(playerid, Text:clickedid) {
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_CLOSE] ) {
        return HideModelView(playerid), 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RX_MOD][MODELVIEW_MOD_S2] ) {
        g_ModelViewData[playerid][MODELVIEW_DATA_RX] = fixrot(g_ModelViewData[playerid][MODELVIEW_DATA_RX] - MODELVIEW_ROTATE_ADD_2);
        ApplyModelViewRX(playerid);
        if( g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] != INVALID_MODEL_ID ) {
            ApplyModelViewRot(playerid, .showtd = true);
        }
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RX_MOD][MODELVIEW_MOD_S1] ) {
        g_ModelViewData[playerid][MODELVIEW_DATA_RX] = fixrot(g_ModelViewData[playerid][MODELVIEW_DATA_RX] - MODELVIEW_ROTATE_ADD_1);
        ApplyModelViewRX(playerid);
        if( g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] != INVALID_MODEL_ID ) {
            ApplyModelViewRot(playerid, .showtd = true);
        }
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RX_MOD][MODELVIEW_MOD_R] ) {
        g_ModelViewData[playerid][MODELVIEW_DATA_RX] = 0.0;
        ApplyModelViewRX(playerid);
        if( g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] != INVALID_MODEL_ID ) {
            ApplyModelViewRot(playerid, .showtd = true);
        }
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RX_MOD][MODELVIEW_MOD_A1] ) {
        g_ModelViewData[playerid][MODELVIEW_DATA_RX] = fixrot(g_ModelViewData[playerid][MODELVIEW_DATA_RX] + MODELVIEW_ROTATE_ADD_1);
        ApplyModelViewRX(playerid);
        if( g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] != INVALID_MODEL_ID ) {
            ApplyModelViewRot(playerid, .showtd = true);
        }
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RX_MOD][MODELVIEW_MOD_A2] ) {
        g_ModelViewData[playerid][MODELVIEW_DATA_RX] = fixrot(g_ModelViewData[playerid][MODELVIEW_DATA_RX] + MODELVIEW_ROTATE_ADD_2);
        ApplyModelViewRX(playerid);
        if( g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] != INVALID_MODEL_ID ) {
            ApplyModelViewRot(playerid, .showtd = true);
        }
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RY_MOD][MODELVIEW_MOD_S2] ) {
        g_ModelViewData[playerid][MODELVIEW_DATA_RY] = fixrot(g_ModelViewData[playerid][MODELVIEW_DATA_RY] - MODELVIEW_ROTATE_ADD_2);
        ApplyModelViewRY(playerid);
        if( g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] != INVALID_MODEL_ID ) {
            ApplyModelViewRot(playerid, .showtd = true);
        }
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RY_MOD][MODELVIEW_MOD_S1] ) {
        g_ModelViewData[playerid][MODELVIEW_DATA_RY] = fixrot(g_ModelViewData[playerid][MODELVIEW_DATA_RY] - MODELVIEW_ROTATE_ADD_1);
        ApplyModelViewRY(playerid);
        if( g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] != INVALID_MODEL_ID ) {
            ApplyModelViewRot(playerid, .showtd = true);
        }
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RY_MOD][MODELVIEW_MOD_R] ) {
        g_ModelViewData[playerid][MODELVIEW_DATA_RY] = 0.0;
        ApplyModelViewRY(playerid);
        if( g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] != INVALID_MODEL_ID ) {
            ApplyModelViewRot(playerid, .showtd = true);
        }
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RY_MOD][MODELVIEW_MOD_A1] ) {
        g_ModelViewData[playerid][MODELVIEW_DATA_RY] = fixrot(g_ModelViewData[playerid][MODELVIEW_DATA_RY] + MODELVIEW_ROTATE_ADD_1);
        ApplyModelViewRY(playerid);
        if( g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] != INVALID_MODEL_ID ) {
            ApplyModelViewRot(playerid, .showtd = true);
        }
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RY_MOD][MODELVIEW_MOD_A2] ) {
        g_ModelViewData[playerid][MODELVIEW_DATA_RY] = fixrot(g_ModelViewData[playerid][MODELVIEW_DATA_RY] + MODELVIEW_ROTATE_ADD_2);
        ApplyModelViewRY(playerid);
        if( g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] != INVALID_MODEL_ID ) {
            ApplyModelViewRot(playerid, .showtd = true);
        }
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RZ_MOD][MODELVIEW_MOD_S2] ) {
        g_ModelViewData[playerid][MODELVIEW_DATA_RZ] = fixrot(g_ModelViewData[playerid][MODELVIEW_DATA_RZ] - MODELVIEW_ROTATE_ADD_2);
        ApplyModelViewRZ(playerid);
        if( g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] != INVALID_MODEL_ID ) {
            ApplyModelViewRot(playerid, .showtd = true);
        }
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RZ_MOD][MODELVIEW_MOD_S1] ) {
        g_ModelViewData[playerid][MODELVIEW_DATA_RZ] = fixrot(g_ModelViewData[playerid][MODELVIEW_DATA_RZ] - MODELVIEW_ROTATE_ADD_1);
        ApplyModelViewRZ(playerid);
        if( g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] != INVALID_MODEL_ID ) {
            ApplyModelViewRot(playerid, .showtd = true);
        }
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RZ_MOD][MODELVIEW_MOD_R] ) {
        g_ModelViewData[playerid][MODELVIEW_DATA_RZ] = 0.0;
        ApplyModelViewRZ(playerid);
        if( g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] != INVALID_MODEL_ID ) {
            ApplyModelViewRot(playerid, .showtd = true);
        }
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RZ_MOD][MODELVIEW_MOD_A1] ) {
        g_ModelViewData[playerid][MODELVIEW_DATA_RZ] = fixrot(g_ModelViewData[playerid][MODELVIEW_DATA_RZ] + MODELVIEW_ROTATE_ADD_1);
        ApplyModelViewRZ(playerid);
        if( g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] != INVALID_MODEL_ID ) {
            ApplyModelViewRot(playerid, .showtd = true);
        }
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RZ_MOD][MODELVIEW_MOD_A2] ) {
        g_ModelViewData[playerid][MODELVIEW_DATA_RZ] = fixrot(g_ModelViewData[playerid][MODELVIEW_DATA_RZ] + MODELVIEW_ROTATE_ADD_2);
        ApplyModelViewRZ(playerid);
        if( g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] != INVALID_MODEL_ID ) {
            ApplyModelViewRot(playerid, .showtd = true);
        }
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_ZM_MOD][MODELVIEW_MOD_S2] ) {
        if( g_ModelViewData[playerid][MODELVIEW_DATA_ZM] == MIN_MODELVIEW_ZOOM ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_ZM] -= MODELVIEW_ZOOM_ADD_2;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_ZM] < MIN_MODELVIEW_ZOOM ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_ZM] = MIN_MODELVIEW_ZOOM;
        }
        ApplyModelViewZoom(playerid);
        if( g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] != INVALID_MODEL_ID ) {
            ApplyModelViewRot(playerid, .showtd = true);
        }
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_ZM_MOD][MODELVIEW_MOD_S1] ) {
        if( g_ModelViewData[playerid][MODELVIEW_DATA_ZM] == MIN_MODELVIEW_ZOOM ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_ZM] -= MODELVIEW_ZOOM_ADD_1;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_ZM] < MIN_MODELVIEW_ZOOM ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_ZM] = MIN_MODELVIEW_ZOOM;
        }
        ApplyModelViewZoom(playerid);
        if( g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] != INVALID_MODEL_ID ) {
            ApplyModelViewRot(playerid, .showtd = true);
        }
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_ZM_MOD][MODELVIEW_MOD_R] ) {
        if( g_ModelViewData[playerid][MODELVIEW_DATA_ZM] == 1.0 ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_ZM] = 1.0;
        ApplyModelViewZoom(playerid);
        if( g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] != INVALID_MODEL_ID ) {
            ApplyModelViewRot(playerid, .showtd = true);
        }
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_ZM_MOD][MODELVIEW_MOD_A1] ) {
        if( g_ModelViewData[playerid][MODELVIEW_DATA_ZM] == MAX_MODELVIEW_ZOOM ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_ZM] += MODELVIEW_ZOOM_ADD_1;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_ZM] > MAX_MODELVIEW_ZOOM ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_ZM] = MAX_MODELVIEW_ZOOM;
        }
        ApplyModelViewZoom(playerid);
        if( g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] != INVALID_MODEL_ID ) {
            ApplyModelViewRot(playerid, .showtd = true);
        }
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_ZM_MOD][MODELVIEW_MOD_A2] ) {
        if( g_ModelViewData[playerid][MODELVIEW_DATA_ZM] == MAX_MODELVIEW_ZOOM ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_ZM] += MODELVIEW_ZOOM_ADD_2;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_ZM] > MAX_MODELVIEW_ZOOM ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_ZM] = MAX_MODELVIEW_ZOOM;
        }
        ApplyModelViewZoom(playerid);
        if( g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] != INVALID_MODEL_ID ) {
            ApplyModelViewRot(playerid, .showtd = true);
        }
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RXS_MOD][MODELVIEW_MOD_S2] ) {
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RXS] == MIN_MODELVIEW_SPEED ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_RXS] -= MODELVIEW_SPEED_ADD_2;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RXS] < MIN_MODELVIEW_SPEED ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_RXS] = MIN_MODELVIEW_SPEED;
        }
        ApplyModelViewRXSpeed(playerid);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RXS_MOD][MODELVIEW_MOD_S1] ) {
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RXS] == MIN_MODELVIEW_SPEED ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_RXS] -= MODELVIEW_SPEED_ADD_1;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RXS] < MIN_MODELVIEW_SPEED ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_RXS] = MIN_MODELVIEW_SPEED;
        }
        ApplyModelViewRXSpeed(playerid);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RXS_MOD][MODELVIEW_MOD_R] ) {
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RXS] == 0.0 ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_RXS] = 0.0;
        ApplyModelViewRXSpeed(playerid);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RXS_MOD][MODELVIEW_MOD_A1] ) {
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RXS] == MAX_MODELVIEW_SPEED ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_RXS] += MODELVIEW_SPEED_ADD_1;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RXS] > MAX_MODELVIEW_SPEED ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_RXS] = MAX_MODELVIEW_SPEED;
        }
        ApplyModelViewRXSpeed(playerid);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RXS_MOD][MODELVIEW_MOD_A2] ) {
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RXS] == MAX_MODELVIEW_SPEED ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_RXS] += MODELVIEW_SPEED_ADD_2;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RXS] > MAX_MODELVIEW_SPEED ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_RXS] = MAX_MODELVIEW_SPEED;
        }
        ApplyModelViewRXSpeed(playerid);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RYS_MOD][MODELVIEW_MOD_S2] ) {
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RYS] == MIN_MODELVIEW_SPEED ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_RYS] -= MODELVIEW_SPEED_ADD_2;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RYS] < MIN_MODELVIEW_SPEED ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_RYS] = MIN_MODELVIEW_SPEED;
        }
        ApplyModelViewRYSpeed(playerid);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RYS_MOD][MODELVIEW_MOD_S1] ) {
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RYS] == MIN_MODELVIEW_SPEED ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_RYS] -= MODELVIEW_SPEED_ADD_1;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RYS] < MIN_MODELVIEW_SPEED ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_RYS] = MIN_MODELVIEW_SPEED;
        }
        ApplyModelViewRYSpeed(playerid);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RYS_MOD][MODELVIEW_MOD_R] ) {
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RYS] == 0.0 ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_RYS] = 0.0;
        ApplyModelViewRYSpeed(playerid);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RYS_MOD][MODELVIEW_MOD_A1] ) {
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RYS] == MAX_MODELVIEW_SPEED ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_RYS] += MODELVIEW_SPEED_ADD_1;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RYS] > MAX_MODELVIEW_SPEED ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_RYS] = MAX_MODELVIEW_SPEED;
        }
        ApplyModelViewRYSpeed(playerid);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RYS_MOD][MODELVIEW_MOD_A2] ) {
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RYS] == MAX_MODELVIEW_SPEED ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_RYS] += MODELVIEW_SPEED_ADD_2;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RYS] > MAX_MODELVIEW_SPEED ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_RYS] = MAX_MODELVIEW_SPEED;
        }
        ApplyModelViewRYSpeed(playerid);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RZS_MOD][MODELVIEW_MOD_S2] ) {
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RZS] == MIN_MODELVIEW_SPEED ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_RZS] -= MODELVIEW_SPEED_ADD_2;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RZS] < MIN_MODELVIEW_SPEED ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_RZS] = MIN_MODELVIEW_SPEED;
        }
        ApplyModelViewRZSpeed(playerid);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RZS_MOD][MODELVIEW_MOD_S1] ) {
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RZS] == MIN_MODELVIEW_SPEED ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_RZS] -= MODELVIEW_SPEED_ADD_1;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RZS] < MIN_MODELVIEW_SPEED ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_RZS] = MIN_MODELVIEW_SPEED;
        }
        ApplyModelViewRZSpeed(playerid);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RZS_MOD][MODELVIEW_MOD_R] ) {
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RZS] == 0.0 ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_RZS] = 0.0;
        ApplyModelViewRZSpeed(playerid);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RZS_MOD][MODELVIEW_MOD_A1] ) {
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RZS] == MAX_MODELVIEW_SPEED ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_RZS] += MODELVIEW_SPEED_ADD_1;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RZS] > MAX_MODELVIEW_SPEED ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_RZS] = MAX_MODELVIEW_SPEED;
        }
        ApplyModelViewRZSpeed(playerid);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_RZS_MOD][MODELVIEW_MOD_A2] ) {
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RZS] == MAX_MODELVIEW_SPEED ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_RZS] += MODELVIEW_SPEED_ADD_2;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_RZS] > MAX_MODELVIEW_SPEED ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_RZS] = MAX_MODELVIEW_SPEED;
        }
        ApplyModelViewRZSpeed(playerid);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_VC1_MOD][MODELVIEW_MOD_S2] ) {
        if( !IsValidVehicleModel(g_ModelViewData[playerid][MODELVIEW_DATA_MODELID]) ) {
            return 1;
        }

        if( g_ModelViewData[playerid][MODELVIEW_DATA_VC1] == MIN_VEHCOLOR_ID ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_VC1] -= MODELVIEW_VEHCOL_ADD_2;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_VC1] < MIN_VEHCOLOR_ID ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_VC1] = MIN_VEHCOLOR_ID;
        }

        ApplyModelViewVehCol1(playerid);
        ApplyModelViewVehCol(playerid, .showtd = true);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_VC1_MOD][MODELVIEW_MOD_S1] ) {
        if( !IsValidVehicleModel(g_ModelViewData[playerid][MODELVIEW_DATA_MODELID]) ) {
            return 1;
        }

        if( g_ModelViewData[playerid][MODELVIEW_DATA_VC1] == MIN_VEHCOLOR_ID ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_VC1] -= MODELVIEW_VEHCOL_ADD_1;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_VC1] < MIN_VEHCOLOR_ID ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_VC1] = MIN_VEHCOLOR_ID;
        }

        ApplyModelViewVehCol1(playerid);
        ApplyModelViewVehCol(playerid, .showtd = true);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_VC1_MOD][MODELVIEW_MOD_R] ) {
        if( !IsValidVehicleModel(g_ModelViewData[playerid][MODELVIEW_DATA_MODELID]) ) {
            return 1;
        }

        if( g_ModelViewData[playerid][MODELVIEW_DATA_VC1] == 0 ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_VC1] = 0;

        ApplyModelViewVehCol1(playerid);
        ApplyModelViewVehCol(playerid, .showtd = true);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_VC1_MOD][MODELVIEW_MOD_A1] ) {
        if( !IsValidVehicleModel(g_ModelViewData[playerid][MODELVIEW_DATA_MODELID]) ) {
            return 1;
        }

        if( g_ModelViewData[playerid][MODELVIEW_DATA_VC1] == MAX_VEHCOLOR_ID ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_VC1] += MODELVIEW_VEHCOL_ADD_1;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_VC1] > MAX_VEHCOLOR_ID ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_VC1] = MAX_VEHCOLOR_ID;
        }

        ApplyModelViewVehCol1(playerid);
        ApplyModelViewVehCol(playerid, .showtd = true);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_VC1_MOD][MODELVIEW_MOD_A2] ) {
        if( !IsValidVehicleModel(g_ModelViewData[playerid][MODELVIEW_DATA_MODELID]) ) {
            return 1;
        }

        if( g_ModelViewData[playerid][MODELVIEW_DATA_VC1] == MAX_VEHCOLOR_ID ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_VC1] += MODELVIEW_VEHCOL_ADD_2;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_VC1] > MAX_VEHCOLOR_ID ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_VC1] = MAX_VEHCOLOR_ID;
        }

        ApplyModelViewVehCol1(playerid);
        ApplyModelViewVehCol(playerid, .showtd = true);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_VC2_MOD][MODELVIEW_MOD_S2] ) {
        if( !IsValidVehicleModel(g_ModelViewData[playerid][MODELVIEW_DATA_MODELID]) ) {
            return 1;
        }

        if( g_ModelViewData[playerid][MODELVIEW_DATA_VC2] == MIN_VEHCOLOR_ID ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_VC2] -= MODELVIEW_VEHCOL_ADD_2;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_VC2] < MIN_VEHCOLOR_ID ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_VC2] = MIN_VEHCOLOR_ID;
        }

        ApplyModelViewVehCol2(playerid);
        ApplyModelViewVehCol(playerid, .showtd = true);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_VC2_MOD][MODELVIEW_MOD_S1] ) {
        if( !IsValidVehicleModel(g_ModelViewData[playerid][MODELVIEW_DATA_MODELID]) ) {
            return 1;
        }

        if( g_ModelViewData[playerid][MODELVIEW_DATA_VC2] == MIN_VEHCOLOR_ID ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_VC2] -= MODELVIEW_VEHCOL_ADD_1;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_VC2] < MIN_VEHCOLOR_ID ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_VC2] = MIN_VEHCOLOR_ID;
        }

        ApplyModelViewVehCol2(playerid);
        ApplyModelViewVehCol(playerid, .showtd = true);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_VC2_MOD][MODELVIEW_MOD_R] ) {
        if( !IsValidVehicleModel(g_ModelViewData[playerid][MODELVIEW_DATA_MODELID]) ) {
            return 1;
        }

        if( g_ModelViewData[playerid][MODELVIEW_DATA_VC2] == 0 ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_VC2] = 0;

        ApplyModelViewVehCol2(playerid);
        ApplyModelViewVehCol(playerid, .showtd = true);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_VC2_MOD][MODELVIEW_MOD_A1] ) {
        if( !IsValidVehicleModel(g_ModelViewData[playerid][MODELVIEW_DATA_MODELID]) ) {
            return 1;
        }

        if( g_ModelViewData[playerid][MODELVIEW_DATA_VC2] == MAX_VEHCOLOR_ID ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_VC2] += MODELVIEW_VEHCOL_ADD_1;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_VC2] > MAX_VEHCOLOR_ID ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_VC2] = MAX_VEHCOLOR_ID;
        }

        ApplyModelViewVehCol2(playerid);
        ApplyModelViewVehCol(playerid, .showtd = true);
        return 1;
    }
    if( clickedid == g_ModelViewGTD[MODELVIEW_GTD_VC2_MOD][MODELVIEW_MOD_A2] ) {
        if( !IsValidVehicleModel(g_ModelViewData[playerid][MODELVIEW_DATA_MODELID]) ) {
            return 1;
        }

        if( g_ModelViewData[playerid][MODELVIEW_DATA_VC2] == MAX_VEHCOLOR_ID ) {
            return 1;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_VC2] += MODELVIEW_VEHCOL_ADD_2;
        if( g_ModelViewData[playerid][MODELVIEW_DATA_VC2] > MAX_VEHCOLOR_ID ) {
            g_ModelViewData[playerid][MODELVIEW_DATA_VC2] = MAX_VEHCOLOR_ID;
        }

        ApplyModelViewVehCol2(playerid);
        ApplyModelViewVehCol(playerid, .showtd = true);
        return 1;
    }


    #if defined mv_OnPlayerClickTextDraw
        return mv_OnPlayerClickTextDraw(playerid, Text:clickedid);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerClickTextDraw
    #undef OnPlayerClickTextDraw
#else
    #define _ALS_OnPlayerClickTextDraw
#endif
#define OnPlayerClickTextDraw mv_OnPlayerClickTextDraw
#if defined mv_OnPlayerClickTextDraw
    forward mv_OnPlayerClickTextDraw(playerid, Text:clickedid);
#endif


public OnModelViewUpdate() {
    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( !IsPlayerConnected(playerid) ) {
            continue;
        }

        if( !g_ModelViewData[playerid][MODELVIEW_DATA_TOGGLE] ) {
            continue;
        }

        new modelid = g_ModelViewData[playerid][MODELVIEW_DATA_MODELID];
        if( modelid == INVALID_MODEL_ID ) {
            continue;
        }

        new
            Float:speed_rx = g_ModelViewData[playerid][MODELVIEW_DATA_RXS],
            Float:speed_ry = g_ModelViewData[playerid][MODELVIEW_DATA_RYS],
            Float:speed_rz = g_ModelViewData[playerid][MODELVIEW_DATA_RZS]
        ;

        if( speed_rx == 0 && speed_ry == 0 && speed_rz == 0 ) {
            continue;
        }

        g_ModelViewData[playerid][MODELVIEW_DATA_RX] = fixrot(g_ModelViewData[playerid][MODELVIEW_DATA_RX] + speed_rx);
        g_ModelViewData[playerid][MODELVIEW_DATA_RY] = fixrot(g_ModelViewData[playerid][MODELVIEW_DATA_RY] + speed_ry);
        g_ModelViewData[playerid][MODELVIEW_DATA_RZ] = fixrot(g_ModelViewData[playerid][MODELVIEW_DATA_RZ] + speed_rz);

        ApplyModelViewRot(playerid, .showtd = true);

        if( speed_rx != 0.0 ) {
            ApplyModelViewRX(playerid);
        }

        if( speed_ry != 0.0 ) {
            ApplyModelViewRY(playerid);
        }

        if( speed_rz != 0.0 ) {
            ApplyModelViewRZ(playerid);
        }
    }
    #if defined mv_OnModelViewUpdate
        mv_OnModelViewUpdate();
    #endif
}
#if defined _ALS_OnModelViewUpdate
    #undef OnModelViewUpdate
#else
    #define _ALS_OnModelViewUpdate
#endif
#define OnModelViewUpdate mv_OnModelViewUpdate
#if defined mv_OnModelViewUpdate
    forward mv_OnModelViewUpdate();
#endif
