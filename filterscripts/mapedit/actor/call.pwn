public OnFilterScriptInit() {
    for(new actorid, max_actorid = GetActorPoolSize(); actorid <= max_actorid; actorid ++) {
        DestroyActor(actorid);
    }

    #if defined act_OnFilterScriptInit
        act_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit act_OnFilterScriptInit
#if defined act_OnFilterScriptInit
    forward act_OnFilterScriptInit();
#endif


public OnActorStreamIn(actorid, forplayerid) {
    ApplyActorAnimationData(actorid);

    #if defined act_OnActorStreamIn
        act_OnActorStreamIn(actorid, forplayerid);
    #endif
}
#if defined _ALS_OnActorStreamIn
    #undef OnActorStreamIn
#else
    #define _ALS_OnActorStreamIn
#endif
#define OnActorStreamIn act_OnActorStreamIn
#if defined act_OnActorStreamIn
    forward act_OnActorStreamIn(actorid, forplayerid);
#endif


public OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ) {
    new actorid = GetPlayerEditActor(playerid);

    if( playerobject && objectid == g_PlayerData[playerid][PLAYER_DATA_CLICKDRAG_POID] && IsValidActor(actorid) ) {
        switch(response) {
            case EDIT_RESPONSE_FINAL: {
                SetActorPos(actorid, fX, fY, fZ);

                new new_actorid = RecreateActor(actorid, fRotZ); // Recreate Actor to apply rotation (SetActorFacingAngle is bugged)
                if( new_actorid == INVALID_ACTOR_ID ) {
                    SendClientMessage(playerid, RGBA_RED, "ERROR: This actor could not be rotated / re-created!");
                }

                DestroyClickDragObject(playerid);
                ShowActorDialog(playerid, DIALOGID_ACTOR_MAIN);
            }
            case EDIT_RESPONSE_CANCEL: {
                SetActorPos(actorid, g_ActorData[actorid][ACTOR_DATA_MEMORY_X], g_ActorData[actorid][ACTOR_DATA_MEMORY_Y], g_ActorData[actorid][ACTOR_DATA_MEMORY_Z]);

                new new_actorid = RecreateActor(actorid, g_ActorData[actorid][ACTOR_DATA_MEMORY_A]); // Recreate Actor to apply rotation (SetActorFacingAngle is bugged)
                if( new_actorid == INVALID_ACTOR_ID ) {
                    SendClientMessage(playerid, RGBA_RED, "ERROR: This actor could not be rotated / re-created!");
                }
            }
            case EDIT_RESPONSE_UPDATE: {
                SetActorPos(actorid, fX, fY, fZ);

                new new_actorid = RecreateActor(actorid, fRotZ); // Recreate Actor to apply rotation (SetActorFacingAngle is bugged)
                if( new_actorid == INVALID_ACTOR_ID ) {
                    SendClientMessage(playerid, RGBA_RED, "ERROR: This actor could not be rotated / re-created!");
                }
            }
        }
    }

    #if defined act_OnPlayerEditObject
        return act_OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerEditObject
    #undef OnPlayerEditObject
#else
    #define _ALS_OnPlayerEditObject
#endif
#define OnPlayerEditObject act_OnPlayerEditObject
#if defined act_OnPlayerEditObject
    forward act_OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ);
#endif


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    switch(dialogid) {
        case DIALOGID_ACTOR_MAIN: {
            new actorid = GetPlayerEditActor(playerid);
            if( !IsValidActor(actorid) ) {
                return g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE, 1;
            }

            if( !response ) {
                return 1;
            }

            switch(listitem) {
                case LISTITEM_ACTOR_GOTO: {
                    new Float:x, Float:y, Float:z;
                    GetActorPos(actorid, x, y, z);
                    if( g_CamModeData[playerid][CAMMODE_DATA_TOGGLE] ) {
                        StopPlayerObject(playerid, g_CamModeData[playerid][CAMMODE_DATA_POID]);
                        SetPlayerObjectPos(playerid, g_CamModeData[playerid][CAMMODE_DATA_POID], x, y, z);
                    } else {
                        SetPlayerPos(playerid, x, y, z);
                    }
                }
                case LISTITEM_ACTOR_GET: {
                    new Float:x, Float:y, Float:z;
                    GetPlayerPos(playerid, x, y, z);
                    SetActorPos(actorid, x, y, z);
                }
                case LISTITEM_ACTOR_COORD: {
                    return ShowActorDialog(playerid, DIALOGID_ACTOR_COORD), 1;
                }
                case LISTITEM_ACTOR_MOVE: {
                    new objectid = RefreshClickDragObject(playerid);
                    if(objectid == INVALID_OBJECT_ID) {
                        SendClientMessage(playerid, RGBA_RED, "ERROR: This actor cannot be moved right now!");
                    } else {
                        GetActorPos(actorid, g_ActorData[actorid][ACTOR_DATA_MEMORY_X], g_ActorData[actorid][ACTOR_DATA_MEMORY_Y], g_ActorData[actorid][ACTOR_DATA_MEMORY_Z]);
                        GetActorFacingAngle(actorid, g_ActorData[actorid][ACTOR_DATA_MEMORY_A]);

                        EditPlayerObject(playerid, objectid);

                        SendClientMessage(playerid, RGBA_ORANGE, "Click & Drag Edit: {FFFFFF}Hold ~k~~PED_SPRINT~ to look around and press ESC to cancel.");
                        return 1;
                    }
                }
                case LISTITEM_ACTOR_REMOVE: {
                    DestroyActor(actorid);
                    return 1;
                }
                case LISTITEM_ACTOR_DUPLICATE: {
                    new Float:a;
                    GetActorFacingAngle(actorid, a);

                    new new_actorid = CopyActor(actorid, a);
                    if( new_actorid == INVALID_ACTOR_ID ) {
                        SendClientMessage(playerid, RGBA_RED, "ERROR: This actor could not be duplicated!");
                    } else {
                        g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_ACTOR;
                        g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = new_actorid;
                    }
                }
                case LISTITEM_ACTOR_COMMENT: {
                    return ShowActorDialog(playerid, DIALOGID_ACTOR_COMMENT), 1;
                }
                case LISTITEM_ACTOR_COMMENT_RESET: {
                    GetSkinName(g_ActorData[actorid][ACTOR_DATA_SKIN], g_CommentString, sizeof g_CommentString);
                    strpack(g_ActorData[actorid][ACTOR_DATA_COMMENT], g_CommentString, MAX_COMMENT_LEN+1); // Set Actor Comment
                }
                case LISTITEM_ACTOR_ANIM_INDEX: {
                    SelectTextDraw(playerid, SELECT_TD_COLOR);
                    return ShowPlayerTextdrawMode(playerid, TDMODE_ANIMLIST), 1;
                }
                case LISTITEM_ACTOR_ANIM_DELTA: {
                    return ShowActorDialog(playerid, DIALOGID_ACTOR_ANIM_DELTA), 1;
                }
                case LISTITEM_ACTOR_ANIM_LOOP: {
                    g_ActorData[actorid][ACTOR_DATA_ANIM_LOOP] = !g_ActorData[actorid][ACTOR_DATA_ANIM_LOOP];
                    ApplyActorAnimationData(actorid);
                }
                case LISTITEM_ACTOR_ANIM_LOCKX: {
                    g_ActorData[actorid][ACTOR_DATA_ANIM_LOCKX] = !g_ActorData[actorid][ACTOR_DATA_ANIM_LOCKX];
                    ApplyActorAnimationData(actorid);
                }
                case LISTITEM_ACTOR_ANIM_LOCKY: {
                    g_ActorData[actorid][ACTOR_DATA_ANIM_LOCKY] = !g_ActorData[actorid][ACTOR_DATA_ANIM_LOCKY];
                    ApplyActorAnimationData(actorid);
                }
                case LISTITEM_ACTOR_ANIM_FREEZE: {
                    g_ActorData[actorid][ACTOR_DATA_ANIM_FREEZE] = !g_ActorData[actorid][ACTOR_DATA_ANIM_FREEZE];
                    ApplyActorAnimationData(actorid);
                }
                case LISTITEM_ACTOR_ANIM_TIME: {
                    return ShowActorDialog(playerid, DIALOGID_ACTOR_ANIM_TIME), 1;
                }
                case LISTITEM_ACTOR_ANIM_UPDATE: {
                    ApplyActorAnimationData(actorid);
                }
                case LISTITEM_ACTOR_ANIM_REMOVE: {
                    DefaultActorAnimationData(actorid);
                    ClearActorAnimations(actorid);
                }
            }

            return ShowActorDialog(playerid, dialogid), 1;
        }
        case DIALOGID_ACTOR_COORD: {
            new actorid = GetPlayerEditActor(playerid);
            if( !IsValidActor(actorid) ) {
                return g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE, 1;
            }

            if(!response) {
                return ShowActorDialog(playerid, DIALOGID_ACTOR_MAIN), 1;
            }

            new cmd[10], Float:value;
            if(sscanf(inputtext, "s[10]f", cmd, value)) {
                return ShowActorDialog(playerid, dialogid), 1;
            }

            new Float:x, Float:y, Float:z, Float:a;
            GetActorPos(actorid, x, y, z);
            GetActorFacingAngle(actorid, a);

            if(!strcmp(cmd, "x", true)) {
                x = value;
            } else if(!strcmp(cmd, "y", true)) {
                y = value;
            } else if(!strcmp(cmd, "z", true)) {
                z = value;
            } else if(!strcmp(cmd, "a", true)) {
                a = fixrot(value);
            } else {
                return ShowActorDialog(playerid, dialogid), 1;
            }

            SetActorPos(actorid, x, y, z);
            SetActorFacingAngle(actorid, a);
            return ShowActorDialog(playerid, dialogid), 1;
        }
        case DIALOGID_ACTOR_COMMENT: {
            new actorid = GetPlayerEditActor(playerid);
            if( !IsValidActor(actorid) ) {
                return g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE, 1;
            }

            if(!response) {
                ShowActorDialog(playerid, DIALOGID_ACTOR_MAIN);
            } else {
                strpack(g_ActorData[actorid][ACTOR_DATA_COMMENT], inputtext, MAX_COMMENT_LEN+1); // Set Comment
                ShowActorDialog(playerid, dialogid);
            }
            return 1;
        }
        case DIALOGID_ACTOR_ANIM_DELTA: {
            new actorid = GetPlayerEditActor(playerid);

            if( !IsValidActor(actorid) ) {
                return g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE, 1;
            }

            if( !response ) {
                return ShowActorDialog(playerid, DIALOGID_ACTOR_MAIN), 1;
            }

            new Float:delta;
            if(sscanf(inputtext, "f", delta)) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a float value into the textfield!");
            } else if(delta < 0) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You cannot enter a negative value into the textfield!");
            } else {
                g_ActorData[actorid][ACTOR_DATA_ANIM_DELTA] = delta;
                ApplyActorAnimationData(actorid);
            }
            return ShowActorDialog(playerid, dialogid), 1;
        }
        case DIALOGID_ACTOR_ANIM_TIME: {
            new actorid = GetPlayerEditActor(playerid);

            if( !IsValidActor(actorid) ) {
                return g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE, 1;
            }

            if( !response ) {
                return ShowActorDialog(playerid, DIALOGID_ACTOR_MAIN), 1;
            }

            new time;
            if(sscanf(inputtext, "i", time)) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a numeric value!");
            } else if(time < 0 ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You cannot enter a negative value!");
            } else {
                g_ActorData[actorid][ACTOR_DATA_ANIM_TIME] = time;
                ApplyActorAnimationData(actorid);
            }
            return ShowActorDialog(playerid, dialogid), 1;
        }
    }

    #if defined act_OnDialogResponse
        return act_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif
#define OnDialogResponse act_OnDialogResponse
#if defined act_OnDialogResponse
    forward act_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif
