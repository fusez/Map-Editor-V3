public OnFilterScriptInit() {
    CreateToolbarTextdraws();

    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            CreateToolbarKeyTextdraw(playerid, .mousemode = false);
        }
    }

    #if defined tb_OnFilterScriptInit
        tb_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit tb_OnFilterScriptInit
#if defined tb_OnFilterScriptInit
    forward tb_OnFilterScriptInit();
#endif


public OnFilterScriptExit() {
    DestroyToolbarTextdraws();

    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            DestroyToolbarKeyTextdraw(playerid);
        }
    }

    #if defined tb_OnFilterScriptExit
        tb_OnFilterScriptExit();
    #endif
}
#if defined _ALS_OnFilterScriptExit
    #undef OnFilterScriptExit
#else
    #define _ALS_OnFilterScriptExit
#endif
#define OnFilterScriptExit tb_OnFilterScriptExit
#if defined tb_OnFilterScriptExit
    forward tb_OnFilterScriptExit();
#endif


public OnPlayerConnect(playerid) {
    CreateToolbarKeyTextdraw(playerid, .mousemode = false);

    #if defined tb_OnPlayerConnect
        return tb_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect tb_OnPlayerConnect
#if defined tb_OnPlayerConnect
    forward tb_OnPlayerConnect(playerid);
#endif


public OnPlayerStateChange(playerid, newstate, oldstate) {
    if( newstate == PLAYER_STATE_SPECTATING || oldstate == PLAYER_STATE_SPECTATING ) {
        CreateToolbarKeyTextdraw(playerid, .mousemode = g_PlayerData[playerid][PLAYER_DATA_SELECTTD]);
    }

    #if defined tb_OnPlayerStateChange
        tb_OnPlayerStateChange(playerid, newstate, oldstate);
    #endif
}
#if defined _ALS_OnPlayerStateChange
    #undef OnPlayerStateChange
#else
    #define _ALS_OnPlayerStateChange
#endif
#define OnPlayerStateChange tb_OnPlayerStateChange
#if defined tb_OnPlayerStateChange
    forward tb_OnPlayerStateChange(playerid, newstate, oldstate);
#endif


public OnPlayerClickTextDraw(playerid, Text:clickedid) {
    if( clickedid == Text: INVALID_TEXT_DRAW ) {
        CreateToolbarKeyTextdraw(playerid, .mousemode = false);

        for(new td; td < MAX_TOOLBAR_TEXTDRAWS; td ++) {
            TextDrawHideForPlayer(playerid, g_ToolbarTextdraw[td]);
        }
    }

    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LISTSELECT] ) {
        ShowPlayerTextdrawMode(playerid, TDMODE_SELECTLIST_OBJECT);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_NSELECT] ) {
        new objectid = GetPlayerNearestObject(playerid, 50.0);

        if( objectid == INVALID_OBJECT_ID ) {
            return SendClientMessage(playerid, RGBA_RED, "ERROR: You are not near any object!"), 1;
        }

        g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_OBJECT;
        g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = objectid;
        ShowObjectDialog(playerid, DIALOGID_OBJECT_MAIN);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LOOKSELECT] ) {
        new objectid = GetPlayerCameraTargetObject(playerid);

        if( objectid == INVALID_OBJECT_ID ) {
            return SendClientMessage(playerid, RGBA_RED, "ERROR: You are not looking at any object!"), 1;
        }

        g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_OBJECT;
        g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = objectid;
        ShowObjectDialog(playerid, DIALOGID_OBJECT_MAIN);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_SSELECT] ) {
        new objectid = GetPlayerSurfingObjectID(playerid);

        if( objectid == INVALID_OBJECT_ID ) {
            return SendClientMessage(playerid, RGBA_RED, "ERROR: You are not surfing any object!"), 1;
        }

        g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_OBJECT;
        g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = objectid;
        ShowObjectDialog(playerid, DIALOGID_OBJECT_MAIN);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_3DSELECT] ) {
        SelectObject(playerid);
        SendClientMessage(playerid, RGBA_ORANGE, "3D-Select Object: {FFFFFF}Hold ~k~~PED_SPRINT~ to look around and press ESC to cancel.");
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_CREATE] ) {
        ShowPlayerTextdrawMode(playerid, TDMODE_CREATELIST_OBJECT);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LISTSELECT] ) {
        ShowPlayerTextdrawMode(playerid, TDMODE_SELECTLIST_VEHICLE);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_NSELECT] ) {
        new vehicleid = GetPlayerNearestVehicle(playerid, 50.0);

        if( vehicleid == INVALID_VEHICLE_ID ) {
            return SendClientMessage(playerid, RGBA_RED, "ERROR: You are not near any vehicle!"), 1;
        }

        g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_VEHICLE;
        g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = vehicleid;
        ShowVehicleDialog(playerid, DIALOGID_VEHICLE_MAIN);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LOOKSELECT] ) {
        new vehicleid = GetPlayerCameraTargetVehicle(playerid);

        if( vehicleid == INVALID_VEHICLE_ID ) {
            return SendClientMessage(playerid, RGBA_RED, "ERROR: You are not looking at any vehicle!"), 1;
        }

        g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_VEHICLE;
        g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = vehicleid;
        ShowVehicleDialog(playerid, DIALOGID_VEHICLE_MAIN);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_SSELECT] ) {
        new vehicleid = GetPlayerSurfingVehicleID(playerid);

        if( vehicleid == INVALID_VEHICLE_ID ) {
            return SendClientMessage(playerid, RGBA_RED, "ERROR: You are not surfing any vehicle!"), 1;
        }

        g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_VEHICLE;
        g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = vehicleid;
        ShowVehicleDialog(playerid, DIALOGID_VEHICLE_MAIN);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_CREATE] ) {
        ShowPlayerTextdrawMode(playerid, TDMODE_CREATELIST_VEHICLE);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_LISTSELECT] ) {
        ShowPlayerTextdrawMode(playerid, TDMODE_SELECTLIST_PICKUP);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_NSELECT] ) {
        new pickupid = GetPlayerNearestPickup(playerid, 50.0);

        if( pickupid == INVALID_PICKUP_ID ) {
            return SendClientMessage(playerid, RGBA_RED, "ERROR: You are not near any pickup!"), 1;
        }

        g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_PICKUP;
        g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = pickupid;
        ShowPickupDialog(playerid, DIALOGID_PICKUP_MAIN);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_CREATE] ) {
        ShowPlayerTextdrawMode(playerid, TDMODE_CREATELIST_PICKUP);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_MODEL] ) {
        ShowAttachedDialog(playerid, DIALOGID_ATTACH_INDEXLIST);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LISTSELECT] ) {
        ShowPlayerTextdrawMode(playerid, TDMODE_SELECTLIST_ACTOR);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_NSELECT] ) {
        new actorid = GetPlayerNearestActor(playerid, 50.0);

        if( actorid == INVALID_ACTOR_ID ) {
            return SendClientMessage(playerid, RGBA_RED, "ERROR: You are not near any actor!"), 1;
        }

        g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_ACTOR;
        g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = actorid;
        ShowActorDialog(playerid, DIALOGID_ACTOR_MAIN);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LOOKSELECT] ) {
        new actorid = GetPlayerCameraTargetActor(playerid);

        if( actorid == INVALID_ACTOR_ID ) {
            return SendClientMessage(playerid, RGBA_RED, "ERROR: You are not looking at any actor!"), 1;
        }

        g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_ACTOR;
        g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = actorid;
        ShowActorDialog(playerid, DIALOGID_ACTOR_MAIN);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_CREATE] ) {
        ShowPlayerTextdrawMode(playerid, TDMODE_CREATELIST_ACTOR);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_MAP_NEW] ) {
        ShowMapNewDialog(playerid, DIALOGID_MAP_NEW);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVE] ) {
        ShowMapSaveDialog(playerid, DIALOGID_MAP_SAVE_CONFIRM);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVEAS] ) {
        ShowMapSaveDialog(playerid, DIALOGID_MAP_SAVE_AS);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADLIST] ) {
        LoadMapListData(playerid);
        ShowMapListDialog(playerid, DIALOGID_MAPLIST);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADNAME] ) {
        ShowMapLoadDialog(playerid, DIALOGID_MAP_LOAD);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_CAM_MODEL]) {
        ToggleCam(playerid, g_CamModeData[playerid][CAMMODE_DATA_TOGGLE] ? false : true);
        return 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_MODEL] ) {
        return ShowPlayerTextdrawMode(playerid, TDMODE_BUILDLIST);
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_MISC_CATEGORY] ) {
        return ShowPlayerTextdrawMode(playerid, TDMODE_CATMANAGER_MODELS), 1;
    }
    if( clickedid == g_ToolbarTextdraw[TD_TOOLBAR_MISC_INFO] ) {
        return ShowPlayerTextdrawMode(playerid, TDMODE_HELP_INFO), 1;
    }

    #if defined tb_OnPlayerClickTextDraw
        return tb_OnPlayerClickTextDraw(playerid, Text:clickedid);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerClickTextDraw
    #undef OnPlayerClickTextDraw
#else
    #define _ALS_OnPlayerClickTextDraw
#endif
#define OnPlayerClickTextDraw tb_OnPlayerClickTextDraw
#if defined tb_OnPlayerClickTextDraw
    forward tb_OnPlayerClickTextDraw(playerid, Text:clickedid);
#endif
