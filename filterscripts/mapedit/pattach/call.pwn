public OnFilterScriptInit() {
    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( !IsPlayerConnected(playerid) ) {
            continue;
        }

        for(new attach_idx; attach_idx < MAX_PLAYERATTACH_INDEX; attach_idx ++) {
            DefaultPlayerAttachData(playerid, attach_idx);
            RemovePlayerAttachedObject(playerid, attach_idx);
        }
    }

    #if defined patt_OnFilterScriptInit
        patt_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit patt_OnFilterScriptInit
#if defined patt_OnFilterScriptInit
    forward patt_OnFilterScriptInit();
#endif


public OnPlayerConnect(playerid) {
    for(new attach_idx; attach_idx < MAX_PLAYERATTACH_INDEX; attach_idx ++) {
        DefaultPlayerAttachData(playerid, attach_idx);
    }

    #if defined patt_OnPlayerConnect
        return patt_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect patt_OnPlayerConnect
#if defined patt_OnPlayerConnect
    forward patt_OnPlayerConnect(playerid);
#endif


public OnPlayerSpawn(playerid) {
    for(new attach_idx; attach_idx < MAX_PLAYERATTACH_INDEX; attach_idx ++) {
        ApplyPlayerAttachData(playerid, attach_idx);
    }

    #if defined patt_OnPlayerSpawn
        return patt_OnPlayerSpawn(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerSpawn
    #undef OnPlayerSpawn
#else
    #define _ALS_OnPlayerSpawn
#endif
#define OnPlayerSpawn patt_OnPlayerSpawn
#if defined patt_OnPlayerSpawn
    forward patt_OnPlayerSpawn(playerid);
#endif


public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ) {
    if( GetPlayerEditAttached(playerid) == index ) {
        if( response ) {
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_MODEL] = modelid;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_BONE] = boneid;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_X ] = fOffsetX;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_Y ] = fOffsetY;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_Z ] = fOffsetZ;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_RX] = fRotX;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_RY] = fRotY;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_RZ] = fRotZ;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_SX] = fScaleX;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_SY] = fScaleY;
            g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_SZ] = fScaleZ;
        }

        ApplyPlayerAttachData(playerid, index);
        ShowAttachedDialog(playerid, DIALOGID_ATTACH_MAIN);
        SelectTextDraw(playerid, SELECT_TD_COLOR);
    }

    #if defined patt_OnPlayerEditAttachedObject
        return patt_OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerEditAttachedObject
    #undef OnPlayerEditAttachedObject
#else
    #define _ALS_OnPlayerEditAttachedObject
#endif
#define OnPlayerEditAttachedObject patt_OnPlayerEditAttachedObject
#if defined patt_OnPlayerEditAttachedObject
    forward patt_OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ);
#endif


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    switch(dialogid) {
        case DIALOGID_ATTACH_INDEXLIST: {
            if( !IsValidPlayerAttachIndex(listitem) ) {
                return g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE, 1;
            }

            if( !response ) {
                return 1;
            }

            g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_ATTACH;
            g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = listitem;

            if( g_PlayerAttachData[playerid][listitem][PLAYERATTACH_DATA_TOGGLE] ) {
                ShowAttachedDialog(playerid, DIALOGID_ATTACH_MAIN);
            } else {
                SelectTextDraw(playerid, SELECT_TD_COLOR);
                ShowPlayerTextdrawMode(playerid, TDMODE_CREATELIST_ATTACH);
            }
            return 1;
        }
        case DIALOGID_ATTACH_MAIN: {
            new attach_index = GetPlayerEditAttached(playerid);
            if( attach_index == INVALID_PLAYERATTACH_INDEX || !g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_TOGGLE]) {
                return g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE, 1;
            }

            if(!response) {
                return ShowAttachedDialog(playerid, DIALOGID_ATTACH_INDEXLIST), 1;
            }

            switch(listitem) {
                case LISTITEM_ATTACH_REMOVE: {
                    DefaultPlayerAttachData(playerid, attach_index);
                    RemovePlayerAttachedObject(playerid, attach_index);
                    g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE;
                    return ShowAttachedDialog(playerid, DIALOGID_ATTACH_INDEXLIST), 1;
                }
                case LISTITEM_ATTACH_MODEL: {
                    SelectTextDraw(playerid, SELECT_TD_COLOR);
                    return ShowPlayerTextdrawMode(playerid, TDMODE_CREATELIST_ATTACH), 1;
                }
                case LISTITEM_ATTACH_BONE: {
                    return ShowAttachedDialog(playerid, DIALOGID_ATTACH_BONE), 1;
                }
                case LISTITEM_ATTACH_COORD: {
                    return ShowAttachedDialog(playerid, DIALOGID_ATTACH_COORD), 1;
                }
                case LISTITEM_ATTACH_MOVE: {
                    CancelSelectTextDraw(playerid);
                    return EditAttachedObject(playerid, attach_index), 1;
                }
                case LISTITEM_ATTACH_COLOR1: {
                    SelectTextDraw(playerid, SELECT_TD_COLOR);
                    return ShowPlayerTextdrawMode(playerid, TDMODE_COLORLIST_ATTACH_1), 1;
                }
                case LISTITEM_ATTACH_ALPHA1: {
                    return ShowAttachedDialog(playerid, DIALOGID_COLORALPHA_ATTACH_1), 1;
                }
                case LISTITEM_ATTACH_COLOR2: {
                    SelectTextDraw(playerid, SELECT_TD_COLOR);
                    return ShowPlayerTextdrawMode(playerid, TDMODE_COLORLIST_ATTACH_2), 1;
                }
                case LISTITEM_ATTACH_ALPHA2: {
                    return ShowAttachedDialog(playerid, DIALOGID_COLORALPHA_ATTACH_2), 1;
                }
            }

            return ShowAttachedDialog(playerid, dialogid), 1;
        }
        case DIALOGID_ATTACH_BONE: {
            new attach_index = GetPlayerEditAttached(playerid);
            if( attach_index == INVALID_PLAYERATTACH_INDEX || !g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_TOGGLE]) {
                return g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE, 1;
            }

            if(!response) {
                ShowAttachedDialog(playerid, DIALOGID_ATTACH_MAIN);
            } else {
                g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_BONE] = listitem + 1;
                ApplyPlayerAttachData(playerid, attach_index);
                ShowAttachedDialog(playerid, dialogid);
            }
            return 1;
        }
        case DIALOGID_ATTACH_COORD: {
            new attach_index = GetPlayerEditAttached(playerid);
            if( attach_index == INVALID_PLAYERATTACH_INDEX || !g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_TOGGLE] ) {
                return g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE, 1;
            }

            if( !response ) {
                return ShowAttachedDialog(playerid, DIALOGID_ATTACH_MAIN), 1;
            }

            new cmd[10], Float:value;
            if( sscanf(inputtext, "s[10]f", cmd, value) ) {
                return ShowAttachedDialog(playerid, dialogid), 1;
            }

            if(!strcmp(cmd, "x", true)) {
                g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_X ] = value;
            } else if(!strcmp(cmd, "y", true)) {
                g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_Y ] = value;
            } else if(!strcmp(cmd, "z", true)) {
                g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_Z ] = value;
            } else if(!strcmp(cmd, "rx", true)) {
                g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_RX] = fixrot(value);
            } else if(!strcmp(cmd, "ry", true)) {
                g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_RY] = fixrot(value);
            } else if(!strcmp(cmd, "rz", true)) {
                g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_RZ] = fixrot(value);
            } else if(!strcmp(cmd, "sx", true)) {
                g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_SX] = value;
            } else if(!strcmp(cmd, "sy", true)) {
                g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_SY] = value;
            } else if(!strcmp(cmd, "sz", true)) {
                g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_SZ] = value;
            } else {
                return ShowAttachedDialog(playerid, dialogid), 1;
            }

            ApplyPlayerAttachData(playerid, attach_index);

            return ShowAttachedDialog(playerid, dialogid), 1;
        }
        case DIALOGID_COLORALPHA_ATTACH_1, DIALOGID_COLORALPHA_ATTACH_2: {
            new attach_index = GetPlayerEditAttached(playerid);
            if( attach_index == INVALID_PLAYERATTACH_INDEX || !g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_TOGGLE] ) {
                return 1;
            }

            if( !response ) {
                return ShowAttachedDialog(playerid, DIALOGID_ATTACH_MAIN), 1;
            }

            new alpha;
            if( sscanf(inputtext, "i", alpha) && sscanf(inputtext, "h", alpha) ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You must enter a decimal or hexadecimal value!");
                return ShowAttachedDialog(playerid, dialogid), 1;
            }

            if( alpha < 0x00 || alpha > 0xFF ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You must enter a value between 0 - 255!");
                return ShowAttachedDialog(playerid, dialogid), 1;
            }

            switch( dialogid ) {
                case DIALOGID_COLORALPHA_ATTACH_1: {
                    g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_COLOR1] = SetARGBAlpha(g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_COLOR1], alpha);
                }
                case DIALOGID_COLORALPHA_ATTACH_2: {
                    g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_COLOR2] = SetARGBAlpha(g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_COLOR2], alpha);
                }
            }

            ApplyPlayerAttachData(playerid, attach_index);
            return ShowAttachedDialog(playerid, dialogid), 1;
        }
    }

    #if defined patt_OnDialogResponse
        return patt_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif
#define OnDialogResponse patt_OnDialogResponse
#if defined patt_OnDialogResponse
    forward patt_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif
