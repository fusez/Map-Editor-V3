public OnFilterScriptInit() {
    for(new pickupid; pickupid < MAX_PICKUPS; pickupid ++) {
        DestroyPickup(pickupid);
    }

    #if defined pick_OnFilterScriptInit
        pick_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit pick_OnFilterScriptInit
#if defined pick_OnFilterScriptInit
    forward pick_OnFilterScriptInit();
#endif


public OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ) {
    new pickupid = GetPlayerEditPickup(playerid);

    if(
        playerobject &&
        objectid == g_PlayerData[playerid][PLAYER_DATA_CLICKDRAG_POID] &&
        IsValidPickup(pickupid)
    ) {
        switch(response) {
            case EDIT_RESPONSE_FINAL: {
                g_PickupData[pickupid][PICKUP_DATA_X] = fX;
                g_PickupData[pickupid][PICKUP_DATA_Y] = fY;
                g_PickupData[pickupid][PICKUP_DATA_Z] = fZ;

                if( RecreatePickup(pickupid) == INVALID_PICKUP_ID) {
                    SendClientMessage(playerid, RGBA_RED, "ERROR: This pickup could not be moved / re-created");
                }

                DestroyClickDragObject(playerid);
                ShowPickupDialog(playerid, DIALOGID_PICKUP_MAIN);
            }
            case EDIT_RESPONSE_CANCEL: {
                g_PickupData[pickupid][PICKUP_DATA_X] = g_PickupData[pickupid][PICKUP_DATA_MEMORY_X];
                g_PickupData[pickupid][PICKUP_DATA_Y] = g_PickupData[pickupid][PICKUP_DATA_MEMORY_Y];
                g_PickupData[pickupid][PICKUP_DATA_Z] = g_PickupData[pickupid][PICKUP_DATA_MEMORY_Z];

                if( RecreatePickup(pickupid) == INVALID_PICKUP_ID) {
                    SendClientMessage(playerid, RGBA_RED, "ERROR: This pickup could not be moved / re-created");
                }
            }
            case EDIT_RESPONSE_UPDATE: {
                g_PickupData[pickupid][PICKUP_DATA_X] = fX;
                g_PickupData[pickupid][PICKUP_DATA_Y] = fY;
                g_PickupData[pickupid][PICKUP_DATA_Z] = fZ;

                RecreatePickup(pickupid);
            }
        }
    }

    #if defined pick_OnPlayerEditObject
        return pick_OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerEditObject
    #undef OnPlayerEditObject
#else
    #define _ALS_OnPlayerEditObject
#endif
#define OnPlayerEditObject pick_OnPlayerEditObject
#if defined pick_OnPlayerEditObject
    forward pick_OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ);
#endif


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    switch(dialogid) {
        case DIALOGID_PICKUP_MAIN: {
            new pickupid = GetPlayerEditPickup(playerid);
            if( pickupid == INVALID_PICKUP_ID || !g_PickupData[pickupid][PICKUP_DATA_ISVALID] ) {
                return g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE, 1;
            }

            if( !response ) {
                return 1;
            }

            switch(listitem) {
                case LISTITEM_PICKUP_GOTO: {
                    new
                        Float:x = g_PickupData[pickupid][PICKUP_DATA_X],
                        Float:y = g_PickupData[pickupid][PICKUP_DATA_Y],
                        Float:z = g_PickupData[pickupid][PICKUP_DATA_Z]
                    ;

                    if( g_CamModeData[playerid][CAMMODE_DATA_TOGGLE] ) {
                        StopPlayerObject(playerid, g_CamModeData[playerid][CAMMODE_DATA_POID]);
                        SetPlayerObjectPos(playerid, g_CamModeData[playerid][CAMMODE_DATA_POID], x, y, z);
                    } else {
                        SetPlayerPos(playerid, x, y, z);
                    }
                }
                case LISTITEM_PICKUP_GET: {
                    GetPlayerPos(playerid, g_PickupData[pickupid][PICKUP_DATA_X], g_PickupData[pickupid][PICKUP_DATA_Y], g_PickupData[pickupid][PICKUP_DATA_Z]);

                    new new_pickupid = RecreatePickup(pickupid);
                    if( new_pickupid == INVALID_PICKUP_ID) {
                        SendClientMessage(playerid, RGBA_RED, "ERROR: This pickup could not be moved / re-created");
                    }
                }
                case LISTITEM_PICKUP_COORD: {
                    return ShowPickupDialog(playerid, DIALOGID_PICKUP_COORD), 1;
                }
                case LISTITEM_PICKUP_MOVE: {
                    new objectid = RefreshClickDragObject(playerid);
                    if(objectid == INVALID_OBJECT_ID) {
                        SendClientMessage(playerid, RGBA_RED, "ERROR: This pickup cannot be moved right now!");
                    } else {
                        g_PickupData[pickupid][PICKUP_DATA_MEMORY_X] = g_PickupData[pickupid][PICKUP_DATA_X];
                        g_PickupData[pickupid][PICKUP_DATA_MEMORY_Y] = g_PickupData[pickupid][PICKUP_DATA_Y];
                        g_PickupData[pickupid][PICKUP_DATA_MEMORY_Z] = g_PickupData[pickupid][PICKUP_DATA_Z];

                        EditPlayerObject(playerid, objectid);

                        SendClientMessage(playerid, RGBA_ORANGE, "Click & Drag Edit: {FFFFFF}Hold ~k~~PED_SPRINT~ to look around and press ESC to cancel.");
                        return 1;
                    }
                }
                case LISTITEM_PICKUP_REMOVE: {
                    DestroyPickup(pickupid);
                    return 1;
                }
                case LISTITEM_PICKUP_DUPLICATE: {
                    new new_pickupid = CopyPickup(pickupid);
                    if( new_pickupid == INVALID_PICKUP_ID ) {
                        SendClientMessage(playerid, RGBA_RED, "ERROR: This pickup could not be duplicated!");
                    } else {
                        g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_PICKUP;
                        g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = new_pickupid;
                    }
                }
                case LISTITEM_PICKUP_COMMENT: {
                    return ShowPickupDialog(playerid, DIALOGID_PICKUP_COMMENT), 1;
                }
                case LISTITEM_PICKUP_COMMENT_RESET: {
                    GetModelName(g_PickupData[pickupid][PICKUP_DATA_MODEL], g_CommentString, sizeof g_CommentString);
                    strpack(g_PickupData[pickupid][PICKUP_DATA_COMMENT], g_CommentString, MAX_COMMENT_LEN+1); // Set Pickup Comment
                }
            }

            return ShowPickupDialog(playerid, dialogid), 1;
        }
        case DIALOGID_PICKUP_COORD: {
            new pickupid = GetPlayerEditPickup(playerid);
            if( pickupid == INVALID_PICKUP_ID || !g_PickupData[pickupid][PICKUP_DATA_ISVALID] ) {
                return g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE, 1;
            }

            if(!response) {
                return ShowPickupDialog(playerid, DIALOGID_PICKUP_MAIN), 1;
            }

            new cmd[10], Float:value;
            if(sscanf(inputtext, "s[10]f", cmd, value)) {
                return ShowPickupDialog(playerid, dialogid), 1;
            }

            if(!strcmp(cmd, "x", true)) {
                g_PickupData[pickupid][PICKUP_DATA_X] = value;
            } else if(!strcmp(cmd, "y", true)) {
                g_PickupData[pickupid][PICKUP_DATA_Y] = value;
            } else if(!strcmp(cmd, "z", true)) {
                g_PickupData[pickupid][PICKUP_DATA_Z] = value;
            } else {
                return ShowPickupDialog(playerid, dialogid), 1;
            }

            new new_pickupid = RecreatePickup(pickupid);
            if( new_pickupid == INVALID_PICKUP_ID) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: This pickup could not be moved / re-created");
            }

            return ShowPickupDialog(playerid, dialogid), 1;
        }
        case DIALOGID_PICKUP_COMMENT: {
            new pickupid = GetPlayerEditPickup(playerid);
            if( pickupid == INVALID_PICKUP_ID || !g_PickupData[pickupid][PICKUP_DATA_ISVALID] ) {
                return g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE, 1;
            }

            if(!response) {
                ShowPickupDialog(playerid, DIALOGID_PICKUP_MAIN);
            } else {
                strpack(g_PickupData[pickupid][PICKUP_DATA_COMMENT], inputtext, MAX_COMMENT_LEN+1); // Set Comment
                ShowPickupDialog(playerid, dialogid);
            }
            return 1;
        }
    }

    #if defined pick_OnDialogResponse
        return pick_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif
#define OnDialogResponse pick_OnDialogResponse
#if defined pick_OnDialogResponse
    forward pick_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif
