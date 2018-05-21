public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    switch( dialogid ) {
        case DIALOGID_MAP_NEW: {
            if( !response ) {
                return 1;
            }

            if( isempty(inputtext) || strcmp(inputtext, NEWMAP_COMMAND) != 0 ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter the correct command into the textfield!");
                ShowMapNewDialog(playerid, dialogid);
            } else {
                new
                    objects_removed,
                    vehicles_removed,
                    pickups_removed,
                    actors_removed,
                    buildings_recreated,
                    attachments_removed
                ;

                NewMap(
                    .objects_removed = objects_removed,
                    .vehicles_removed = vehicles_removed,
                    .pickups_removed = pickups_removed,
                    .actors_removed = actors_removed,
                    .buildings_recreated = buildings_recreated,
                    .attachments_removed = attachments_removed,
                    .playerid = playerid
                );

                format(g_ClientMessage, sizeof g_ClientMessage, "[%i] %s has started a new map.", playerid, ret_GetPlayerName(playerid));
                SendClientMessageToAll(RGBA_WHITE, g_ClientMessage);

                format(g_ClientMessage, sizeof g_ClientMessage, "Reset: %i Object(s), %i Vehicle(s), %i or more Pickup(s), %i Actor(s), %i Building(s) recreated.", objects_removed, vehicles_removed, pickups_removed, actors_removed, buildings_recreated);
                SendClientMessageToAll(RGBA_WHITE, g_ClientMessage);

                if( attachments_removed > 0 ) {
                    format(g_ClientMessage, sizeof g_ClientMessage, "+ %i or more of your attachment(s).", attachments_removed);
                    SendClientMessage(playerid, RGBA_WHITE, g_ClientMessage);
                }

                if( buildings_recreated > 0 ) {
                    SendClientMessageToAll(RGBA_ORANGE, "Please note that you need to reconnect to see recreated buildings.");
                }

                g_MapLoadedID = INVALID_MAP_ID;
                RefreshMapLoadedTextdraw();
            }
            return 1;
        }
    }

    #if defined mnew_OnDialogResponse
        return mnew_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif
#define OnDialogResponse mnew_OnDialogResponse
#if defined mnew_OnDialogResponse
    forward mnew_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif
