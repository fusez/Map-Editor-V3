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
                NewMap(playerid);

                g_MapLoadedID = INVALID_MAP_ID;
                RefreshMapLoadedTextdraw();

                format(g_ClientMessage, sizeof g_ClientMessage, "[%i] %s has started a new map.", playerid, ret_GetPlayerName(playerid));
                SendClientMessageToAll(RGBA_WHITE, g_ClientMessage);
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
