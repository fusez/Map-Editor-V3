public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    switch( dialogid ) {
        case DIALOGID_MAP_LOAD: {
            if( !response ) {
                return 1;
            }

            if( isempty(inputtext) ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter anything into the textfield!");
                ShowMapLoadDialog(playerid, dialogid);
            } else if( MapLoad(inputtext, playerid) ) {
                if( GetMapID(inputtext) == INVALID_MAP_ID ) {
                    CreateMapID(inputtext);
                }

                g_MapLoadedID = GetMapID(inputtext);
                RefreshMapLoadedTextdraw();

                format(g_ClientMessage, sizeof g_ClientMessage, "[%i] %s has loaded the map: %s", playerid, ret_GetPlayerName(playerid), inputtext);
                SendClientMessageToAll(RGBA_WHITE, g_ClientMessage);
            } else {
                SendClientMessage(playerid, RGBA_RED, "ERROR: This map could not be loaded!");
                ShowMapLoadDialog(playerid, dialogid);
            }
            return 1;
        }
    }

    #if defined mload_OnDialogResponse
        return mload_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif
#define OnDialogResponse mload_OnDialogResponse
#if defined mload_OnDialogResponse
    forward mload_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif
