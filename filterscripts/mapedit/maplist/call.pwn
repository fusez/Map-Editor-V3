public OnFilterScriptInit() {
    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            DefaultMapListData(playerid);
        }
    }

    #if defined mlist_OnFilterScriptInit
        mlist_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit mlist_OnFilterScriptInit
#if defined mlist_OnFilterScriptInit
    forward mlist_OnFilterScriptInit();
#endif


public OnPlayerConnect(playerid) {
    DefaultMapListData(playerid);

    #if defined mlist_OnPlayerConnect
        return mlist_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect mlist_OnPlayerConnect
#if defined mlist_OnPlayerConnect
    forward mlist_OnPlayerConnect(playerid);
#endif


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    switch(dialogid) {
        case DIALOGID_MAPLIST: {
            if( !response ) {
                return 1;
            }

            switch( listitem ) {
                case MAPLIST_LISTITEM_ROW_F..MAPLIST_LISTITEM_ROW_L: {
                    new
                        row = listitem - MAPLIST_LISTITEM_ROW_F,
                        mapid = g_MapListData[playerid][MAPLIST_DATA_ROW_ID][row]
                    ;

                    if( mapid == INVALID_MAP_ID ) {
                        return ShowMapListDialog(playerid, dialogid), 1;
                    }

                    GetMapName(mapid, g_MapString, sizeof g_MapString);

                    new
                        objects_loaded,
                        vehicles_loaded,
                        pickups_loaded,
                        actors_loaded,
                        attachments_loaded,
                        buildings_loaded,
                        load_success
                    ;

                    load_success = MapLoad(
                        .mapname = g_MapString,
                        .objects_loaded = objects_loaded,
                        .vehicles_loaded = vehicles_loaded,
                        .pickups_loaded = pickups_loaded,
                        .actors_loaded = actors_loaded,
                        .attachments_loaded = attachments_loaded,
                        .buildings_loaded = buildings_loaded,
                        .playerid = playerid
                    );

                    if( load_success ) {
                        g_MapLoadedID = mapid;
                        RefreshMapLoadedTextdraw();

                        format(g_ClientMessage, sizeof g_ClientMessage, "[%i] %s has loaded the map: %s", playerid, ret_GetPlayerName(playerid), g_MapString);
                        SendClientMessageToAll(RGBA_WHITE, g_ClientMessage);

                        format(g_ClientMessage, sizeof g_ClientMessage, "Loaded: %i Object(s), %i Vehicle(s), %i Pickup(s), %i Actor(s), %i Building(s) removed.", objects_loaded, vehicles_loaded, pickups_loaded, actors_loaded, buildings_loaded);
                        SendClientMessageToAll(RGBA_WHITE, g_ClientMessage);

                        if( attachments_loaded > 0 ) {
                            format(g_ClientMessage, sizeof g_ClientMessage, "+ %i of your attachment(s).", attachments_loaded);
                            SendClientMessage(playerid, RGBA_WHITE, g_ClientMessage);
                        }
                        return 1;
                    } else {
                        DestroyMapID(mapid);
                        LoadMapListData(playerid);
                    }
                }
                case MAPLIST_LISTITEM_SEARCH: {
                    return ShowMapListDialog(playerid, DIALOGID_MAPLIST_SEARCH), 1;
                }
                case MAPLIST_LISTITEM_PAGE: {
                    return ShowMapListDialog(playerid, DIALOGID_MAPLIST_PAGE), 1;
                }
                case MAPLIST_LISTITEM_PAGE_F: {
                    g_MapListData[playerid][MAPLIST_DATA_PAGE] = MIN_MAPLIST_PAGE;
                    LoadMapListData(playerid);
                }
                case MAPLIST_LISTITEM_PAGE_P: {
                    if( -- g_MapListData[playerid][MAPLIST_DATA_PAGE] < MIN_MAPLIST_PAGE ) {
                        g_MapListData[playerid][MAPLIST_DATA_PAGE] = MIN_MAPLIST_PAGE;
                    }
                    LoadMapListData(playerid);
                }
                case MAPLIST_LISTITEM_PAGE_N: {
                    if( ++ g_MapListData[playerid][MAPLIST_DATA_PAGE] > g_MapListData[playerid][MAPLIST_DATA_MAXPAGE] ) {
                        g_MapListData[playerid][MAPLIST_DATA_PAGE] = g_MapListData[playerid][MAPLIST_DATA_MAXPAGE];
                    }
                    LoadMapListData(playerid);
                }
                case MAPLIST_LISTITEM_PAGE_L: {
                    g_MapListData[playerid][MAPLIST_DATA_PAGE] = g_MapListData[playerid][MAPLIST_DATA_MAXPAGE];
                    LoadMapListData(playerid);
                }
            }

            ShowMapListDialog(playerid, dialogid);
        }
        case DIALOGID_MAPLIST_PAGE: {
            if( !response ) {
                return ShowMapListDialog(playerid, DIALOGID_MAPLIST), 1;
            }

            new page;

            if( sscanf(inputtext, "i", page) ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a valid page number!");
                ShowMapListDialog(playerid, dialogid);
                return 1;
            }

            page --;

            if( page < MIN_MAPLIST_PAGE || page > g_MapListData[playerid][MAPLIST_DATA_MAXPAGE] ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a valid page!");
                ShowMapListDialog(playerid, dialogid);
                return 1;
            }

            g_MapListData[playerid][MAPLIST_DATA_PAGE] = page;
            LoadMapListData(playerid);
            ShowMapListDialog(playerid, DIALOGID_MAPLIST);
            return 1;
        }
        case DIALOGID_MAPLIST_SEARCH: {
            if( response ) {
                g_MapListData[playerid][MAPLIST_DATA_PAGE] = MIN_MAPLIST_PAGE;
                strpack(g_MapListData[playerid][MAPLIST_DATA_SEARCH], inputtext);
                LoadMapListData(playerid);
            }
            ShowMapListDialog(playerid, DIALOGID_MAPLIST);
            return 1;
        }
    }

    #if defined mlist_OnDialogResponse
        return mlist_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif
#define OnDialogResponse mlist_OnDialogResponse
#if defined mlist_OnDialogResponse
    forward mlist_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif
