public OnFilterScriptInit() {
    for(new objectid = 1; objectid <= MAX_OBJECTS; objectid ++) {
        if( !IsValidObject(objectid) ) {
            continue;
        }

        if( GetModelName(GetObjectModel(objectid), g_CommentString, sizeof g_CommentString) ) {
            strpack(g_ObjectData[objectid-1][OBJECT_DATA_COMMENT], g_CommentString, sizeof g_CommentString); // Set Object Comment
        }

        g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_MODCOUNT] = MAX_MATERIALINDEX_MODCOUNT;
        for(new materialindex; materialindex < MAX_OBJECT_INDEX; materialindex ++) {
            g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] = MATERIALINDEX_TYPE_NONE;
        }
    }

    #if defined obj_OnFilterScriptInit
        obj_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit obj_OnFilterScriptInit
#if defined obj_OnFilterScriptInit
    forward obj_OnFilterScriptInit();
#endif


public OnPlayerSelectObject(playerid, type, objectid, modelid, Float:fX, Float:fY, Float:fZ) {
    if( type == SELECT_OBJECT_GLOBAL_OBJECT && IsValidObject(objectid) ) {
        CancelEdit(playerid);
        g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_OBJECT;
        g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = objectid;
        ShowObjectDialog(playerid, DIALOGID_OBJECT_MAIN);
    }

    #if defined obj_OnPlayerSelectObject
        return obj_OnPlayerSelectObject(playerid, type, objectid, modelid, Float:fX, Float:fY, Float:fZ);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerSelectObject
    #undef OnPlayerSelectObject
#else
    #define _ALS_OnPlayerSelectObject
#endif
#define OnPlayerSelectObject obj_OnPlayerSelectObject
#if defined obj_OnPlayerSelectObject
    forward obj_OnPlayerSelectObject(playerid, type, objectid, modelid, Float:fX, Float:fY, Float:fZ);
#endif


public OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ) {
    if( !playerobject && objectid == GetPlayerEditObject(playerid) ) {
        switch(response) {
            case EDIT_RESPONSE_FINAL: {
                SetObjectPos(objectid, fX, fY, fZ);
                SetObjectRot(objectid, fRotX, fRotY, fRotZ);
                ShowObjectDialog(playerid, DIALOGID_OBJECT_MAIN);
            }
            case EDIT_RESPONSE_CANCEL: {
                SetObjectPos(objectid, g_ObjectData[objectid-1][OBJECT_DATA_MEMORY_X], g_ObjectData[objectid-1][OBJECT_DATA_MEMORY_Y], g_ObjectData[objectid-1][OBJECT_DATA_MEMORY_Z]);
                SetObjectRot(objectid, g_ObjectData[objectid-1][OBJECT_DATA_MEMORY_RX], g_ObjectData[objectid-1][OBJECT_DATA_MEMORY_RY], g_ObjectData[objectid-1][OBJECT_DATA_MEMORY_RZ]);
                ShowObjectDialog(playerid, DIALOGID_OBJECT_MAIN);
            }
            case EDIT_RESPONSE_UPDATE: {
                SetObjectPos(objectid, fX, fY, fZ);
                SetObjectRot(objectid, fRotX, fRotY, fRotZ);
            }
        }

    }

    #if defined obj_OnPlayerEditObject
        return obj_OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerEditObject
    #undef OnPlayerEditObject
#else
    #define _ALS_OnPlayerEditObject
#endif
#define OnPlayerEditObject obj_OnPlayerEditObject
#if defined obj_OnPlayerEditObject
    forward obj_OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ);
#endif


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    switch(dialogid) {
        case DIALOGID_OBJECT_MAIN: {
            new objectid = GetPlayerEditObject(playerid);

            if( !IsValidObject(objectid) ) {
                return g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE, 1;
            }

            if( !response ) {
                return 1;
            }

            switch(listitem) {
                case LISTITEM_OBJECT_GOTO: {
                    new Float:x, Float:y, Float:z;
                    GetObjectPos(objectid, x, y, z);
                    if( g_CamModeData[playerid][CAMMODE_DATA_TOGGLE] ) {
                        StopPlayerObject(playerid, g_CamModeData[playerid][CAMMODE_DATA_POID]);
                        SetPlayerObjectPos(playerid, g_CamModeData[playerid][CAMMODE_DATA_POID], x, y, z);
                    } else {
                        SetPlayerPos(playerid, x, y, z);
                    }
                }
                case LISTITEM_OBJECT_GET: {
                    new Float:x, Float:y, Float:z;
                    GetPlayerPos(playerid, x, y, z);
                    SetObjectPos(objectid, x, y, z);
                }
                case LISTITEM_OBJECT_COORD: {
                    return ShowObjectDialog(playerid, DIALOGID_OBJECT_COORD), 1;
                }
                case LISTITEM_OBJECT_MOVE: {
                    if( g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_IDTYPE] == ID_TYPE_NONE ) {
                        GetObjectPos(objectid, g_ObjectData[objectid-1][OBJECT_DATA_MEMORY_X], g_ObjectData[objectid-1][OBJECT_DATA_MEMORY_Y], g_ObjectData[objectid-1][OBJECT_DATA_MEMORY_Z]);
                        GetObjectRot(objectid, g_ObjectData[objectid-1][OBJECT_DATA_MEMORY_RX], g_ObjectData[objectid-1][OBJECT_DATA_MEMORY_RY], g_ObjectData[objectid-1][OBJECT_DATA_MEMORY_RZ]);

                        EditObject(playerid, objectid);

                        SendClientMessage(playerid, RGBA_ORANGE, "Click & Drag Edit: {FFFFFF}Hold ~k~~PED_SPRINT~ to look around and press ESC to cancel.");
                    } else {
                        CancelSelectTextDraw(playerid);
                        ToggleOffsetEdit(playerid, true);
                    }
                    return 1;
                }
                case LISTITEM_OBJECT_ATTACH_SELECT: {
                    g_PlayerData[playerid][PLAYER_DATA_EDIT_ATTACHOBJECT] = objectid;
                }
                case LISTITEM_OBJECT_ATTACH_APPLY: {
                    new attach_objectid = g_PlayerData[playerid][PLAYER_DATA_EDIT_ATTACHOBJECT];
                    if( IsValidObject(attach_objectid) && attach_objectid != objectid ) {
                        g_ObjectData[attach_objectid-1][OBJECT_DATA_ATTACH_IDTYPE] = ID_TYPE_OBJECT;
                        g_ObjectData[attach_objectid-1][OBJECT_DATA_ATTACH_ID] = objectid;

                        ApplyObjectAttachData(attach_objectid);

                        g_PlayerData[playerid][PLAYER_DATA_EDIT_ATTACHOBJECT] = INVALID_OBJECT_ID;
                        g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_OBJECT;
                        g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = attach_objectid;
                    }
                }
                case LISTITEM_OBJECT_ATTACH_REMOVE: {
                    new new_objectid = RecreateObject(objectid, .copy_attachto = false);
                    if( new_objectid == INVALID_OBJECT_ID ) {
                        SendClientMessage(playerid, RGBA_RED, "ERROR: This object could not be unattached / re-created!");
                    }
                }
                case LISTITEM_OBJECT_MATERIALS_COPY: {
                    g_PlayerData[playerid][PLAYER_DATA_EDIT_MATERIALOBJ] = objectid;
                }
                case LISTITEM_OBJECT_MATERIALS_PASTE: {
                    new copy_from_objectid = g_PlayerData[playerid][PLAYER_DATA_EDIT_MATERIALOBJ];
                    if( IsValidObject(copy_from_objectid) && copy_from_objectid != objectid ) {
                        for(new matidx; matidx < MAX_OBJECT_INDEX; matidx ++) {
                            DefaultObjectMaterialIndexData(objectid, matidx);
                            MigrateObjectMaterialIndexData(copy_from_objectid, objectid, matidx);
                        }

                        new new_objectid = RecreateObject(objectid);
                        if( new_objectid == INVALID_OBJECT_ID ) {
                            SendClientMessage(playerid, RGBA_RED, "ERROR: This object could not be textured / texted / re-created!");
                        }
                    }
                }
                case LISTITEM_OBJECT_DUPLICATE: {
                    new new_objectid = CopyObject(objectid);
                    if( new_objectid == INVALID_OBJECT_ID ) {
                        SendClientMessage(playerid, RGBA_RED, "ERROR: This object could not be duplicated!");
                    } else {
                        if( !CopyObjectAttachments(objectid, new_objectid) ) {
                            SendClientMessage(playerid, RGBA_RED, "WARNING: All attachments could not be duplicated!");
                        }

                        g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_OBJECT;
                        g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = new_objectid;
                    }
                }
                case LISTITEM_OBJECT_RECREATE: {
                    new new_objectid = RecreateObject(objectid);
                    if( new_objectid == INVALID_OBJECT_ID ) {
                        SendClientMessage(playerid, RGBA_RED, "ERROR: This object could not be re-created!");
                    }
                }
                case LISTITEM_OBJECT_REMOVE: {
                    DestroyObject(objectid);
                    return 1;
                }
                case LISTITEM_OBJECT_COMMENT: {
                    return ShowObjectDialog(playerid, DIALOGID_OBJECT_COMMENT), 1;
                }
                case LISTITEM_OBJECT_COMMENT_RESET: {
                    GetModelName(GetObjectModel(objectid), g_CommentString, sizeof g_CommentString);
                    strpack(g_ObjectData[objectid-1][OBJECT_DATA_COMMENT], g_CommentString, MAX_COMMENT_LEN+1); // Set Object Comment
                }
                case LISTITEM_OBJECT_INDEX_START..LISTITEM_OBJECT_INDEX_END: {
                    g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX] = (listitem - LISTITEM_OBJECT_INDEX_START);
                    return ShowObjectDialog(playerid, DIALOGID_OBJECT_INDEX), 1;
                }
            }
            return ShowObjectDialog(playerid, dialogid), 1;
        }
        case DIALOGID_OBJECT_COORD: {
            new objectid = GetPlayerEditObject(playerid);

            if( !IsValidObject(objectid) ) {
                return g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE, 1;
            }

            if(!response) {
                return ShowObjectDialog(playerid, DIALOGID_OBJECT_MAIN), 1;
            }

            new cmd[10], Float:value;
            if(sscanf(inputtext, "s[10]f", cmd, value)) {
                return ShowObjectDialog(playerid, dialogid), 1;
            }

            new Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz;
            switch( g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_IDTYPE] ) {
                case ID_TYPE_OBJECT, ID_TYPE_VEHICLE: {
                    x =  g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_X];
                    y =  g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Y];
                    z =  g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Z];
                    rx = g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RX];
                    ry = g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RY];
                    rz = g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RZ];
                }
                default: {
                    GetObjectPos(objectid, x, y, z);
                    GetObjectRot(objectid, rx, ry, rz);
                }
            }


            if(!strcmp(cmd, "x", true)) {
                x = value;
            } else if(!strcmp(cmd, "y", true)) {
                y = value;
            } else if(!strcmp(cmd, "z", true)) {
                z = value;
            } else if(!strcmp(cmd, "rx", true)) {
                rx = value;
            } else if(!strcmp(cmd, "ry", true)) {
                ry = value;
            } else if(!strcmp(cmd, "rz", true)) {
                rz = value;
            } else {
                return ShowObjectDialog(playerid, dialogid), 1;
            }

            switch( g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_IDTYPE] ) {
                case ID_TYPE_OBJECT, ID_TYPE_VEHICLE: {
                    g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_X]  = x;
                    g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Y]  = y;
                    g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Z]  = z;
                    g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RX] = rx;
                    g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RY] = ry;
                    g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RZ] = rz;
                    ApplyObjectAttachData(objectid);
                }
                default: {
                    SetObjectPos(objectid, x, y, z);
                    SetObjectRot(objectid, rx, ry, rz);
                }
            }

            return ShowObjectDialog(playerid, dialogid), 1;
        }
        case DIALOGID_OBJECT_COMMENT: {
            new objectid = GetPlayerEditObject(playerid);
            if( !IsValidObject(objectid) ) {
                return g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE, 1;
            }

            if(!response) {
                ShowObjectDialog(playerid, DIALOGID_OBJECT_MAIN);
            } else {
                strpack(g_ObjectData[objectid-1][OBJECT_DATA_COMMENT], inputtext, MAX_COMMENT_LEN+1); // Set Object Comment
                ShowObjectDialog(playerid, dialogid);
            }
            return 1;
        }
        case DIALOGID_OBJECT_INDEX: {
            new objectid = GetPlayerEditObject(playerid);
            if( !IsValidObject(objectid) ) {
                return g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE, 1;
            }

            if(!response) {
                return ShowObjectDialog(playerid, DIALOGID_OBJECT_MAIN), 1;
            }

            switch(listitem) {
                case LISTITEM_OINDEX_REMOVE: {
                    g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][ g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX] ] = MATERIALINDEX_TYPE_NONE;

                    new new_objectid = RecreateObject(objectid);
                    if( new_objectid == INVALID_OBJECT_ID ) {
                        SendClientMessage(playerid, RGBA_RED, "ERROR: This object could not be materialindex reset / re-created!");
                    }
                }
                case LISTITEM_OINDEX_MAT: {
                    SelectTextDraw(playerid, SELECT_TD_COLOR);
                    return ShowPlayerTextdrawMode(playerid, TDMODE_TEXTURELIST), 1;
                }
                case LISTITEM_OINDEX_MAT_COLOR_S: {
                    SelectTextDraw(playerid, SELECT_TD_COLOR);
                    return ShowPlayerTextdrawMode(playerid, TDMODE_COLORLIST_TEXTURE), 1;
                }
                case LISTITEM_OINDEX_MAT_COLOR_A: {
                    return ShowObjectDialog(playerid, DIALOGID_COLORALPHA_TEXTURE), 1;
                }
                case LISTITEM_OINDEX_MAT_COLOR_R: {
                    new materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX];
                    if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] != MATERIALINDEX_TYPE_TEXTURE ) {
                        g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] = MATERIALINDEX_TYPE_TEXTURE;
                        DefaultObjectMaterialIndexData(objectid, materialindex);
                    }

                    g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex] = 0x0;

                    if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_MODCOUNT] >= MAX_MATERIALINDEX_MODCOUNT ) {
                        new new_objectid = RecreateObject(objectid);
                        if( new_objectid == INVALID_OBJECT_ID ) {
                            SendClientMessage(playerid, RGBA_RED, "ERROR: This object could not be color reset / re-created!");
                        }
                    } else {
                        ApplyObjectMaterialIndexData(objectid, materialindex);
                    }
                 }
                case LISTITEM_OINDEX_TXT: {
                    return ShowObjectDialog(playerid, DIALOGID_OBJECT_TEXT), 1;
                }
                case LISTITEM_OINDEX_TXT_MATSIZE: {
                    return ShowObjectDialog(playerid, DIALOGID_OBJECT_MATSIZE), 1;
                }
                case LISTITEM_OINDEX_TXT_FONTFACE: {
                    SelectTextDraw(playerid, SELECT_TD_COLOR);
                    return ShowPlayerTextdrawMode(playerid, TDMODE_FONTLIST), 1;
                }
                case LISTITEM_OINDEX_TXT_FONTSIZE: {
                    return ShowObjectDialog(playerid, DIALOGID_OBJECT_FONTSIZE), 1;
                }
                case LISTITEM_OINDEX_TXT_ISBOLD: {
                    new materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX];
                    if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] != MATERIALINDEX_TYPE_TEXT ) {
                        g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] = MATERIALINDEX_TYPE_TEXT;
                        DefaultObjectMaterialIndexData(objectid, materialindex);
                    }

                    g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_ISBOLD][materialindex] = !g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_ISBOLD][materialindex];

                    if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_MODCOUNT] >= MAX_MATERIALINDEX_MODCOUNT ) {
                        new new_objectid = RecreateObject(objectid);
                        if( new_objectid == INVALID_OBJECT_ID ) {
                            SendClientMessage(playerid, RGBA_RED, "ERROR: This object could not be texted / re-created!");
                        }
                    } else {
                        ApplyObjectMaterialIndexData(objectid, materialindex);
                    }
                }
                case LISTITEM_OINDEX_TXT_ALIGN: {
                    new materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX];
                    if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] != MATERIALINDEX_TYPE_TEXT ) {
                        g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] = MATERIALINDEX_TYPE_TEXT;
                        DefaultObjectMaterialIndexData(objectid, materialindex);
                    }

                    g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_ALIGNMENT][materialindex] ++;

                    if( !IsValidMaterialAlignment(g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_ALIGNMENT][materialindex]) ) {
                        g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_ALIGNMENT][materialindex] = 0;
                    }

                    if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_MODCOUNT] >= MAX_MATERIALINDEX_MODCOUNT ) {
                        new new_objectid = RecreateObject(objectid);
                        if( new_objectid == INVALID_OBJECT_ID ) {
                            SendClientMessage(playerid, RGBA_RED, "ERROR: This object could not be texted / re-created!");
                        }
                    } else {
                        ApplyObjectMaterialIndexData(objectid, materialindex);
                    }
                }
                case LISTITEM_OINDEX_TXT_FONTCOLOR_S: {
                    SelectTextDraw(playerid, SELECT_TD_COLOR);
                    return ShowPlayerTextdrawMode(playerid, TDMODE_COLORLIST_FONTFACE), 1;
                }
                case LISTITEM_OINDEX_TXT_FONTCOLOR_A: {
                    return ShowObjectDialog(playerid, DIALOGID_COLORALPHA_FONTFACE), 1;
                }
                case LISTITEM_OINDEX_TXT_BACKCOLOR_S: {
                    SelectTextDraw(playerid, SELECT_TD_COLOR);
                    return ShowPlayerTextdrawMode(playerid, TDMODE_COLORLIST_FONTBACK), 1;
                }
                case LISTITEM_OINDEX_TXT_BACKCOLOR_O: {
                    new materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX];
                    if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] != MATERIALINDEX_TYPE_TEXT ) {
                        g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] = MATERIALINDEX_TYPE_TEXT;
                        DefaultObjectMaterialIndexData(objectid, materialindex);
                    }

                    g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex] = SetARGBAlpha(g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex], 0xFF);

                    if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_MODCOUNT] >= MAX_MATERIALINDEX_MODCOUNT ) {
                        new new_objectid = RecreateObject(objectid);
                        if( new_objectid == INVALID_OBJECT_ID ) {
                            SendClientMessage(playerid, RGBA_RED, "ERROR: This object could not be colored / re-created!");
                        }
                    } else {
                        ApplyObjectMaterialIndexData(objectid, materialindex);
                    }
                }
                case LISTITEM_OINDEX_TXT_BACKCOLOR_T: {
                    new materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX];
                    if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] != MATERIALINDEX_TYPE_TEXT ) {
                        g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] = MATERIALINDEX_TYPE_TEXT;
                        DefaultObjectMaterialIndexData(objectid, materialindex);
                    }

                    g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex] = 0x0;

                    if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_MODCOUNT] >= MAX_MATERIALINDEX_MODCOUNT ) {
                        new new_objectid = RecreateObject(objectid);
                        if( new_objectid == INVALID_OBJECT_ID ) {
                            SendClientMessage(playerid, RGBA_RED, "ERROR: This object could not be texted / re-created!");
                        }
                    } else {
                        ApplyObjectMaterialIndexData(objectid, materialindex);
                    }
                }
            }

            return ShowObjectDialog(playerid, dialogid), 1;
        }
        case DIALOGID_OBJECT_MATSIZE: {
            new objectid = GetPlayerEditObject(playerid);
            if( !IsValidObject(objectid) ) {
                return g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE, 1;
            }

            if(!response) {
                return ShowObjectDialog(playerid, DIALOGID_OBJECT_INDEX), 1;
            }

            new materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX];
            if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] != MATERIALINDEX_TYPE_TEXT ) {
                g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] = MATERIALINDEX_TYPE_TEXT;
                DefaultObjectMaterialIndexData(objectid, materialindex);
            }

            g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_SIZE][materialindex] = (listitem + 1) * 10;

            if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_MODCOUNT] >= MAX_MATERIALINDEX_MODCOUNT ) {
                new new_objectid = RecreateObject(objectid);
                if( new_objectid == INVALID_OBJECT_ID ) {
                    SendClientMessage(playerid, RGBA_RED, "ERROR: This object could not be texted / re-created!");
                }
            } else {
                ApplyObjectMaterialIndexData(objectid, materialindex);
            }

            return ShowObjectDialog(playerid, dialogid), 1;
        }
        case DIALOGID_OBJECT_TEXT: {
            new objectid = GetPlayerEditObject(playerid);
            if( !IsValidObject(objectid) ) {
                return g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE, 1;
            }

            if(!response) {
                return ShowObjectDialog(playerid, DIALOGID_OBJECT_INDEX), 1;
            }

            new materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX];
            if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] != MATERIALINDEX_TYPE_TEXT ) {
                g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] = MATERIALINDEX_TYPE_TEXT;
                DefaultObjectMaterialIndexData(objectid, materialindex);
            }

            strpack(g_ObjectText[objectid-1][materialindex], inputtext, MAX_OBJECT_TEXT+1);

            if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_MODCOUNT] >= MAX_MATERIALINDEX_MODCOUNT ) {
                new new_objectid = RecreateObject(objectid);
                if( new_objectid == INVALID_OBJECT_ID ) {
                    SendClientMessage(playerid, RGBA_RED, "ERROR: This object could not be texted / re-created!");
                }
            } else {
                ApplyObjectMaterialIndexData(objectid, materialindex);
            }

            return ShowObjectDialog(playerid, dialogid), 1;
        }
        case DIALOGID_OBJECT_FONTSIZE: {
            new objectid = GetPlayerEditObject(playerid);
            if( !IsValidObject(objectid) ) {
                return g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_NONE, 1;
            }

            if(!response) {
                return ShowObjectDialog(playerid, DIALOGID_OBJECT_INDEX), 1;
            }

            new fontsize;
            if( sscanf(inputtext, "i", fontsize) ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a numeric value into the textfield!");
                return ShowObjectDialog(playerid, dialogid), 1;
            }

            if( fontsize < 0 || fontsize > MAX_OBJECT_FONTSIZE ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a valid fontsize into the textfield!");
                return ShowObjectDialog(playerid, dialogid), 1;
            }

            new materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX];
            if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] != MATERIALINDEX_TYPE_TEXT ) {
                g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] = MATERIALINDEX_TYPE_TEXT;
                DefaultObjectMaterialIndexData(objectid, materialindex);
            }

            g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_FONTSIZE][materialindex] = fontsize;

            if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_MODCOUNT] >= MAX_MATERIALINDEX_MODCOUNT ) {
                new new_objectid = RecreateObject(objectid);
                if( new_objectid == INVALID_OBJECT_ID ) {
                    SendClientMessage(playerid, RGBA_RED, "ERROR: This object could not be texted / re-created!");
                }
            } else {
                ApplyObjectMaterialIndexData(objectid, materialindex);
            }
            return ShowObjectDialog(playerid, dialogid), 1;
        }
        case DIALOGID_COLORALPHA_TEXTURE, DIALOGID_COLORALPHA_FONTFACE: {
            new objectid = GetPlayerEditObject(playerid);
            if( !IsValidObject(objectid) ) {
                return 1;
            }

            if( !response ) {
                return ShowObjectDialog(playerid, DIALOGID_OBJECT_INDEX), 1;
            }

            new alpha;
            if( sscanf(inputtext, "i", alpha) && sscanf(inputtext, "h", alpha) ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You must enter a decimal or hexadecimal value!");
                return ShowObjectDialog(playerid, dialogid), 1;
            }

            if( alpha < 0x00 || alpha > 0xFF ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You must enter a value between 0 - 255!");
                return ShowObjectDialog(playerid, dialogid), 1;
            }

            new materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX];
            if( !IsValidMaterialIndex(materialindex) ) {
                return 1;
            }

            switch( dialogid ) {
                case DIALOGID_COLORALPHA_TEXTURE: {
                    if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] != MATERIALINDEX_TYPE_TEXTURE ) {
                        g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] = MATERIALINDEX_TYPE_TEXTURE;
                        DefaultObjectMaterialIndexData(objectid, materialindex);
                    }

                    g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex] = SetARGBAlpha(g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex], alpha);
                }
                case DIALOGID_COLORALPHA_FONTFACE: {
                    if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] != MATERIALINDEX_TYPE_TEXT ) {
                        g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] = MATERIALINDEX_TYPE_TEXT;
                        DefaultObjectMaterialIndexData(objectid, materialindex);
                    }

                    g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_FONTCOLOR][materialindex] = SetARGBAlpha(g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_FONTCOLOR][materialindex], alpha);
                }
            }

            if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_MODCOUNT] >= MAX_MATERIALINDEX_MODCOUNT ) {
                new new_objectid = RecreateObject(objectid);
                if( new_objectid == INVALID_OBJECT_ID ) {
                    SendClientMessage(playerid, RGBA_RED, "ERROR: This object could not be colored / re-created!");
                }
            } else {
                ApplyObjectMaterialIndexData(objectid, materialindex);
            }

            return ShowObjectDialog(playerid, dialogid), 1;
        }
    }

    #if defined obj_OnDialogResponse
        return obj_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif
#define OnDialogResponse obj_OnDialogResponse
#if defined obj_OnDialogResponse
    forward obj_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif
