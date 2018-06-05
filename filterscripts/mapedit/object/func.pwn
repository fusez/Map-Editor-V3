GetObjectAttachObject(objectid) {
    if( g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_IDTYPE] == ID_TYPE_OBJECT ) {
        return g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_ID];
    }
    return INVALID_OBJECT_ID;
}

GetObjectAttachVehicle(objectid) {
    if( g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_IDTYPE] == ID_TYPE_VEHICLE ) {
        return g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_ID];
    }
    return INVALID_VEHICLE_ID;
}

MigrateObjectMaterialIndexData(from_objectid, to_objectid, materialindex) {
    switch( g_ObjectData[from_objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] ) {
        case MATERIALINDEX_TYPE_TEXTURE: {
            g_ObjectData[to_objectid-1][OBJECT_DATA_MATINDEX_TEXTURE][materialindex] = g_ObjectData[from_objectid-1][OBJECT_DATA_MATINDEX_TEXTURE][materialindex];
            g_ObjectData[to_objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex] = g_ObjectData[from_objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex];
        }
        case MATERIALINDEX_TYPE_TEXT: {
            strunpack(g_ObjectTextString, g_ObjectText[from_objectid-1][materialindex], MAX_OBJECT_TEXT+1);
            strunpack(g_FontString, g_ObjectFont[from_objectid-1][materialindex], MAX_FONTNAME_LEN+1);

            strpack(g_ObjectText[to_objectid-1][materialindex], g_ObjectTextString, MAX_OBJECT_TEXT+1);
            strpack(g_ObjectFont[to_objectid-1][materialindex], g_FontString, MAX_FONTNAME_LEN+1);
            g_ObjectData[to_objectid-1][OBJECT_DATA_MATINDEX_SIZE][materialindex] =      g_ObjectData[from_objectid-1][OBJECT_DATA_MATINDEX_SIZE][materialindex];
            g_ObjectData[to_objectid-1][OBJECT_DATA_MATINDEX_FONTSIZE][materialindex] =  g_ObjectData[from_objectid-1][OBJECT_DATA_MATINDEX_FONTSIZE][materialindex];
            g_ObjectData[to_objectid-1][OBJECT_DATA_MATINDEX_ISBOLD][materialindex] =    g_ObjectData[from_objectid-1][OBJECT_DATA_MATINDEX_ISBOLD][materialindex];
            g_ObjectData[to_objectid-1][OBJECT_DATA_MATINDEX_FONTCOLOR][materialindex] = g_ObjectData[from_objectid-1][OBJECT_DATA_MATINDEX_FONTCOLOR][materialindex];
            g_ObjectData[to_objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex] =     g_ObjectData[from_objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex];
            g_ObjectData[to_objectid-1][OBJECT_DATA_MATINDEX_ALIGNMENT][materialindex] = g_ObjectData[from_objectid-1][OBJECT_DATA_MATINDEX_ALIGNMENT][materialindex];
        }
        default: {
            return 0;
        }
    }

    g_ObjectData[to_objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] = g_ObjectData[from_objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex];
    return 1;
}

MigrateObjectAttachData(from_objectid, to_objectid, attachtoid) {
    switch( g_ObjectData[from_objectid-1][OBJECT_DATA_ATTACH_IDTYPE] ) {
        case ID_TYPE_OBJECT, ID_TYPE_VEHICLE: {

        }
        default: {
            return 0;
        }
    }

    g_ObjectData[to_objectid-1][OBJECT_DATA_ATTACH_IDTYPE] = g_ObjectData[from_objectid-1][OBJECT_DATA_ATTACH_IDTYPE];
    g_ObjectData[to_objectid-1][OBJECT_DATA_ATTACH_ID]     = attachtoid;
    g_ObjectData[to_objectid-1][OBJECT_DATA_ATTACH_X]      = g_ObjectData[from_objectid-1][OBJECT_DATA_ATTACH_X];
    g_ObjectData[to_objectid-1][OBJECT_DATA_ATTACH_Y]      = g_ObjectData[from_objectid-1][OBJECT_DATA_ATTACH_Y];
    g_ObjectData[to_objectid-1][OBJECT_DATA_ATTACH_Z]      = g_ObjectData[from_objectid-1][OBJECT_DATA_ATTACH_Z];
    g_ObjectData[to_objectid-1][OBJECT_DATA_ATTACH_RX]     = g_ObjectData[from_objectid-1][OBJECT_DATA_ATTACH_RX];
    g_ObjectData[to_objectid-1][OBJECT_DATA_ATTACH_RY]     = g_ObjectData[from_objectid-1][OBJECT_DATA_ATTACH_RY];
    g_ObjectData[to_objectid-1][OBJECT_DATA_ATTACH_RZ]     = g_ObjectData[from_objectid-1][OBJECT_DATA_ATTACH_RZ];
    return 1;
}

DefaultObjectMaterialIndexData(objectid, materialindex) {
    switch( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] ) {
        case MATERIALINDEX_TYPE_TEXTURE: {
            g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TEXTURE][materialindex] = INVALID_TEXTURE_ID;
            g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex] = 0x0;
        }
        case MATERIALINDEX_TYPE_TEXT: {
            strpack(g_ObjectText[objectid-1][materialindex], "Example Text", MAX_OBJECT_TEXT+1);
            g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_SIZE][materialindex] = OBJECT_MATERIAL_SIZE_256x128;
            strpack(g_ObjectFont[objectid-1][materialindex], "Arial", MAX_FONTNAME_LEN+1);
            g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_FONTSIZE][materialindex] = 24;
            g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_ISBOLD][materialindex] = true;
            g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_FONTCOLOR][materialindex] = 0xFFFFFFFF;
            g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex] = 0x0;
            g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_ALIGNMENT][materialindex] = 0;
        }
    }

}

ApplyObjectMaterialIndexData(objectid, materialindex) {
    switch( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] ) {
        case MATERIALINDEX_TYPE_TEXTURE: {
            new
                textureid = g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TEXTURE][materialindex],
                modelid
            ;

            GetTextureData(textureid, modelid, g_TextureTXDString, sizeof g_TextureTXDString, g_TextureNameString, sizeof g_TextureNameString);

            SetObjectMaterial(objectid, materialindex, modelid, g_TextureTXDString, g_TextureNameString, g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex]);
        }
        case MATERIALINDEX_TYPE_TEXT: {
            strunpack(g_ObjectTextString, g_ObjectText[objectid-1][materialindex], MAX_OBJECT_TEXT+1);
            strunpack(g_FontString, g_ObjectFont[objectid-1][materialindex], MAX_FONTNAME_LEN+1);

            SetObjectMaterialText(objectid,
                g_ObjectTextString,
                materialindex,
                g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_SIZE][materialindex],
                g_FontString,
                g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_FONTSIZE][materialindex],
                g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_ISBOLD][materialindex],
                g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_FONTCOLOR][materialindex],
                g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex],
                g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_ALIGNMENT][materialindex]
            );
        }
        default: {
            return 0;
        }
    }
    return 1;
}

ApplyObjectAttachData(objectid) {
    switch( g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_IDTYPE] ) {
        case ID_TYPE_OBJECT: {
            AttachObjectToObject(objectid,
                g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_ID],
                g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_X],
                g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Y],
                g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Z],
                g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RX],
                g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RY],
                g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RZ]
            );
        }
        case ID_TYPE_VEHICLE: {
            AttachObjectToVehicle(objectid,
                g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_ID],
                g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_X],
                g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Y],
                g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Z],
                g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RX],
                g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RY],
                g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RZ]
            );
        }
        default: {
            return 0;
        }
    }
    return 1;
}

CopyObject(copy_objectid, bool:copy_attachto = true) {
    if( !IsValidObject(copy_objectid) ) {
        return INVALID_OBJECT_ID;
    }

    new
               modelid = GetObjectModel(copy_objectid),
        Float: x,
        Float: y,
        Float: z,
        Float: rx,
        Float: ry,
        Float: rz,
               attachtoid = g_ObjectData[copy_objectid-1][OBJECT_DATA_ATTACH_ID],
        bool:  isvalid_attachto_object,
        bool:  isvalid_attachto_vehicle
    ;

    switch( g_ObjectData[copy_objectid-1][OBJECT_DATA_ATTACH_IDTYPE] ) {
        case ID_TYPE_OBJECT: {
            isvalid_attachto_object  = IsValidObject(attachtoid)  ? true : false;
        }
        case ID_TYPE_VEHICLE: {
            isvalid_attachto_vehicle = IsValidVehicle(attachtoid) ? true : false;
        }
    }

    if( isvalid_attachto_object || isvalid_attachto_vehicle ) {
        new
            Float: att_x,
            Float: att_y,
            Float: att_z,
            Float: att_rx,
            Float: att_ry,
            Float: att_rz,
            Float: off_x,
            Float: off_y,
            Float: off_z,
            Float: off_rx,
            Float: off_ry,
            Float: off_rz
        ;

        if( isvalid_attachto_object ) {
            GetObjectPos(attachtoid, att_x,  att_y,  att_z);
            GetObjectRot(attachtoid, att_rx, att_ry, att_rz);
        } else if( isvalid_attachto_vehicle ) {
            GetVehiclePos(attachtoid, att_x, att_y, att_z);
            GetVehicleZAngle(attachtoid, att_rz);
        }

        off_x  = g_ObjectData[copy_objectid-1][OBJECT_DATA_ATTACH_X ];
        off_y  = g_ObjectData[copy_objectid-1][OBJECT_DATA_ATTACH_Y ];
        off_z  = g_ObjectData[copy_objectid-1][OBJECT_DATA_ATTACH_Z ];
        off_rx = g_ObjectData[copy_objectid-1][OBJECT_DATA_ATTACH_RX];
        off_ry = g_ObjectData[copy_objectid-1][OBJECT_DATA_ATTACH_RY];
        off_rz = g_ObjectData[copy_objectid-1][OBJECT_DATA_ATTACH_RZ];

        PositionFromOffset(
            att_x,
            att_y,
            att_z,
            att_rx,
            att_ry,
            att_rz,
            off_x,
            off_y,
            off_z,
            x,
            y,
            z
        );

        rx = att_rx + off_rx;
        ry = att_ry + off_ry;
        rz = att_rz + off_rz;
    } else {
        GetObjectPos(copy_objectid, x, y, z);
        GetObjectRot(copy_objectid, rx, ry, rz);
    }

    new paste_objectid = CreateObject(modelid, x, y, z, rx, ry, rz);
    if( paste_objectid == INVALID_OBJECT_ID ) {
        return INVALID_OBJECT_ID;
    }

    for(new materialindex; materialindex < MAX_OBJECT_INDEX; materialindex ++) {
        if( MigrateObjectMaterialIndexData(copy_objectid, paste_objectid, materialindex) ) {
            ApplyObjectMaterialIndexData(paste_objectid, materialindex);
        }
    }

    strunpack(g_CommentString, g_ObjectData[copy_objectid-1][OBJECT_DATA_COMMENT], sizeof g_CommentString); // Copy Comment
    strpack(g_ObjectData[paste_objectid-1][OBJECT_DATA_COMMENT], g_CommentString, sizeof g_CommentString); // Paste Comment

    g_ObjectData[paste_objectid-1][OBJECT_DATA_MEMORY_X ] = g_ObjectData[copy_objectid-1][OBJECT_DATA_MEMORY_X ];
    g_ObjectData[paste_objectid-1][OBJECT_DATA_MEMORY_Y ] = g_ObjectData[copy_objectid-1][OBJECT_DATA_MEMORY_Y ];
    g_ObjectData[paste_objectid-1][OBJECT_DATA_MEMORY_Z ] = g_ObjectData[copy_objectid-1][OBJECT_DATA_MEMORY_Z ];
    g_ObjectData[paste_objectid-1][OBJECT_DATA_MEMORY_RX] = g_ObjectData[copy_objectid-1][OBJECT_DATA_MEMORY_RX];
    g_ObjectData[paste_objectid-1][OBJECT_DATA_MEMORY_RY] = g_ObjectData[copy_objectid-1][OBJECT_DATA_MEMORY_RY];
    g_ObjectData[paste_objectid-1][OBJECT_DATA_MEMORY_RZ] = g_ObjectData[copy_objectid-1][OBJECT_DATA_MEMORY_RZ];

    if( copy_attachto ) {
        if( MigrateObjectAttachData(copy_objectid, paste_objectid, attachtoid) ) {
            ApplyObjectAttachData(paste_objectid);
        }
    }

    return paste_objectid;
}

RecreateObject(copy_objectid, bool:copy_attachto = true) {
    new paste_objectid = CopyObject(copy_objectid, copy_attachto);

    if( paste_objectid != INVALID_OBJECT_ID ) {
        TransferObjectAttachments(copy_objectid, paste_objectid);

        for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
            if( !IsPlayerConnected(playerid) ) {
                continue;
            }

            if( GetPlayerEditObject(playerid) == copy_objectid ) {
                g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = paste_objectid;
            }

            if( g_PlayerData[playerid][PLAYER_DATA_EDIT_ATTACHOBJECT] == copy_objectid ) {
                g_PlayerData[playerid][PLAYER_DATA_EDIT_ATTACHOBJECT] = paste_objectid;
            }

            if( g_PlayerData[playerid][PLAYER_DATA_EDIT_MATERIALOBJ] == copy_objectid ) {
                g_PlayerData[playerid][PLAYER_DATA_EDIT_MATERIALOBJ] = paste_objectid;
            }

            for(new row; row < MAX_SELECTLIST_ROWS; row ++) {
                if( copy_objectid != g_SelectObjListData[playerid][SELECTLIST_DATA_ROW_ID][row] ) {
                    continue;
                }

                g_SelectObjListData[playerid][SELECTLIST_DATA_ROW_ID][row] = paste_objectid;

                if( g_PlayerData[playerid][PLAYER_DATA_TDMODE] == TDMODE_SELECTLIST_OBJECT ) {
                    ApplySelectListRowData(playerid, row);
                }
            }
        }

        DestroyObject(copy_objectid);
    }

    return paste_objectid;
}

CopyObjectAttachments(from_objectid, to_objectid) {
    for(new loop_objectid = 1; loop_objectid <= MAX_OBJECTS; loop_objectid ++) {
        if( !IsValidObject(loop_objectid) || loop_objectid == from_objectid || loop_objectid == to_objectid ) {
            continue;
        }

        if( GetObjectAttachObject(loop_objectid) != from_objectid ) {
            continue;
        }

        new paste_objectid = CopyObject(loop_objectid, .copy_attachto = false);

        if( paste_objectid == INVALID_OBJECT_ID ) {
            return 0;
        }

        if( MigrateObjectAttachData(.from_objectid = loop_objectid, .to_objectid = paste_objectid, .attachtoid = to_objectid) ) {
            ApplyObjectAttachData(paste_objectid);
        }
    }
    return 1;
}

TransferObjectAttachments(from_objectid, to_objectid) {
    for(new loop_objectid = 1; loop_objectid <= MAX_OBJECTS; loop_objectid ++) {
        if( !IsValidObject(loop_objectid) || loop_objectid == from_objectid || loop_objectid == to_objectid ) {
            continue;
        }

        if( GetObjectAttachObject(loop_objectid) == from_objectid ) {
            g_ObjectData[loop_objectid-1][OBJECT_DATA_ATTACH_ID] = to_objectid;
            ApplyObjectAttachData(loop_objectid);
        }
    }
}

ShowObjectDialog(playerid, dialogid) {
    switch( dialogid ) {
        case DIALOGID_OBJECT_MAIN: {
            new objectid = GetPlayerEditObject(playerid);
            if( !IsValidObject(objectid) ) {
                return 1;
            }

            g_DialogInfo = "";

            for(new listitem; listitem < MAX_LISTITEMS_OBJECT; listitem ++) {
                switch(listitem) {
                    case LISTITEM_OBJECT_GOTO: {
                        strcat(g_DialogInfo, "Goto\t \n");
                    }
                    case LISTITEM_OBJECT_GET: {
                        strcat(g_DialogInfo, "Get\t \n");
                    }
                    case LISTITEM_OBJECT_COORD: {
                        if( g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_IDTYPE] == ID_TYPE_NONE ) {
                            strcat(g_DialogInfo, "Coordinates & Rotation\t \n");
                        } else {
                            strcat(g_DialogInfo, "Offset & Rotation\t \n");
                        }
                    }
                    case LISTITEM_OBJECT_MOVE: {
                        if( g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_IDTYPE] == ID_TYPE_NONE ) {
                            strcat(g_DialogInfo, "Click & Drag Move\t \n");
                        } else {
                            strcat(g_DialogInfo, "Toggle Offset Editor\t \n");
                        }
                    }
                    case LISTITEM_OBJECT_ATTACH_SELECT: {
                        strcat(g_DialogInfo, "Select as Attachment\t \n");
                    }
                    case LISTITEM_OBJECT_ATTACH_APPLY: {
                        new attachobject = g_PlayerData[playerid][PLAYER_DATA_EDIT_ATTACHOBJECT];
                        if( !IsValidObject(attachobject) || attachobject == objectid ) {
                            strcat(g_DialogInfo, " \t \n");
                        } else {
                            strunpack(g_CommentString, g_ObjectData[attachobject-1][OBJECT_DATA_COMMENT], MAX_COMMENT_LEN+1);
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Attach Selected Object\t%s\n", g_CommentString);
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        }
                    }
                    case LISTITEM_OBJECT_ATTACH_REMOVE: {
                        switch( g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_IDTYPE] ) {
                            case ID_TYPE_OBJECT: {
                                new attachobject = g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_ID];
                                strunpack(g_CommentString, g_ObjectData[attachobject-1][OBJECT_DATA_COMMENT], MAX_COMMENT_LEN+1);
                                format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Un-Attach from Object\t%s\n", g_CommentString );
                                strcat(g_DialogInfo, g_DialogInfoRow);
                            }
                            case ID_TYPE_VEHICLE: {
                                new attachvehicle = g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_ID];
                                strunpack(g_CommentString, g_VehicleData[attachvehicle-1][VEHICLE_DATA_COMMENT], MAX_COMMENT_LEN+1);
                                format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Un-Attach from Vehicle\t%s\n", g_CommentString );
                                strcat(g_DialogInfo, g_DialogInfoRow);
                            }
                            default: {
                                strcat(g_DialogInfo, "Attempt to Un-Attach\t \n");
                            }
                        }
                    }
                    case LISTITEM_OBJECT_MATERIALS_COPY: {
                        strcat(g_DialogInfo, "Select Material Data\t \n");
                    }
                    case LISTITEM_OBJECT_MATERIALS_PASTE: {
                        new copy_from_objectid = g_PlayerData[playerid][PLAYER_DATA_EDIT_MATERIALOBJ];
                        if( !IsValidObject(copy_from_objectid) || objectid == copy_from_objectid ) {
                            strcat(g_DialogInfo, " \t \n");
                        } else {
                            strunpack(g_CommentString, g_ObjectData[copy_from_objectid-1][OBJECT_DATA_COMMENT], MAX_COMMENT_LEN+1);
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Paste Material Data from\t%s\n", g_CommentString);
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        }
                    }
                    case LISTITEM_OBJECT_DUPLICATE: {
                        strcat(g_DialogInfo, "Duplicate\t \n");
                    }
                    case LISTITEM_OBJECT_RECREATE: {
                        strcat(g_DialogInfo, "Recreate\t \n");
                    }
                    case LISTITEM_OBJECT_REMOVE: {
                        strcat(g_DialogInfo, "Remove\t \n");
                    }
                    case LISTITEM_OBJECT_COMMENT: {
                        strunpack(g_CommentString, g_ObjectData[objectid-1][OBJECT_DATA_COMMENT], MAX_COMMENT_LEN+1);
                        format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Comment\t%s\n", g_CommentString);
                        strcat(g_DialogInfo, g_DialogInfoRow);
                    }
                    case LISTITEM_OBJECT_COMMENT_RESET: {
                        GetModelName(GetObjectModel(objectid), g_ModelString, sizeof g_ModelString);
                        format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Reset Comment To\t%s\n", g_ModelString);
                        strcat(g_DialogInfo, g_DialogInfoRow);
                    }
                    case LISTITEM_OBJECT_INDEX_START..LISTITEM_OBJECT_INDEX_END: {
                        new materialindex = listitem - LISTITEM_OBJECT_INDEX_START;
                        switch( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] ) {
                            case MATERIALINDEX_TYPE_TEXTURE: {
                                new
                                    textureid = g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TEXTURE][materialindex],
                                    color_argb = g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex],
                                    color_rgb = ARGBtoRGB(color_argb)
                                ;

                                if( textureid == INVALID_TEXTURE_ID ) {
                                    format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Material Index %i\t{%06x}Color\n", materialindex, color_rgb);
                                } else {
                                    new modelid;
                                    GetTextureData(textureid, modelid, g_TextureTXDString, sizeof g_TextureTXDString, g_TextureNameString, sizeof g_TextureNameString);
                                    format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Material Index %i\t{%06x}%i %s %s\n", materialindex, color_rgb, modelid, g_TextureTXDString, g_TextureNameString);
                                }
                            }
                            case MATERIALINDEX_TYPE_TEXT: {
                                new
                                    color_argb = g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_FONTCOLOR][materialindex],
                                    color_rgb = ARGBtoRGB(color_argb)
                                ;

                                strunpack(g_ObjectTextString, g_ObjectText[objectid-1][materialindex], sizeof g_ObjectTextString);
                                format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Material Index %i\t{%06x}%s\n", materialindex, color_rgb, g_ObjectTextString);
                            }
                            default: {
                                format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Material Index %i\tDefault / Unknown\n", materialindex);
                            }
                        }
                        strcat(g_DialogInfo, g_DialogInfoRow);

                    }
                    default: {
                        strcat(g_DialogInfo, " \t \n");
                    }
                }
            }
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, "Object", g_DialogInfo, "Select", "Cancel");
        }
        case DIALOGID_OBJECT_INDEX: {
            new objectid = GetPlayerEditObject(playerid);
            if( !IsValidObject(objectid) ) {
                return 1;
            }

            new
                materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX],
                indextype = g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex]
            ;

            format(g_DialogCaption, sizeof g_DialogCaption, "Material Index: %i", materialindex);
            g_DialogInfo = "";

            for(new listitem; listitem < MAX_LISTITEMS_OINDEX; listitem ++) {
                switch(listitem) {
                    case LISTITEM_OINDEX_REMOVE: {
                        strcat(g_DialogInfo, "All\tReset Material Index\t-\n");
                    }
                    case LISTITEM_OINDEX_MAT: {
                        if( indextype == MATERIALINDEX_TYPE_TEXTURE ) {
                            new
                                textureid = g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TEXTURE][materialindex],
                                modelid
                            ;

                            GetTextureData(textureid, modelid, g_TextureTXDString, sizeof g_TextureTXDString, g_TextureNameString, sizeof g_TextureNameString);

                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Texture\tTexture\t%i %s %s\n", modelid, g_TextureTXDString, g_TextureNameString);
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        } else {
                            strcat(g_DialogInfo, "Texture\tTexture\t-\n");
                        }
                    }
                    case LISTITEM_OINDEX_MAT_COLOR_S: {
                        if( indextype == MATERIALINDEX_TYPE_TEXTURE ) {
                            new argb = g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex];
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Texture\tColor\t{%06x}Color\n", ARGBtoRGB(argb) );
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        } else {
                            strcat(g_DialogInfo, "Texture\tColor\t-\n");
                        }
                    }
                    case LISTITEM_OINDEX_MAT_COLOR_A: {
                        if( indextype == MATERIALINDEX_TYPE_TEXTURE ) {
                            new argb = g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex];

                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Texture\tAlpha\t%i/%i\n", ARGBtoA(argb), 0xFF );
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        } else {
                            strcat(g_DialogInfo, "Texture\tAlpha\t-\n");
                        }
                    }
                    case LISTITEM_OINDEX_MAT_COLOR_R: {
                        strcat(g_DialogInfo, "Texture\tReset Color\t-\n");
                    }
                    case LISTITEM_OINDEX_TXT: {
                        if( indextype == MATERIALINDEX_TYPE_TEXT ) {
                            strunpack(g_ObjectTextString, g_ObjectText[objectid-1][materialindex], MAX_OBJECT_TEXT+1);
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Text\tString\t%s\n", g_ObjectTextString );
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        } else {
                            strcat(g_DialogInfo, "Text\tString\t-\n");
                        }
                    }
                    case LISTITEM_OINDEX_TXT_MATSIZE: {
                        if( indextype == MATERIALINDEX_TYPE_TEXT ) {
                            new materialsize = g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_SIZE][materialindex];
                            GetMaterialSizeName(materialsize, g_MaterialSizeString, sizeof g_MaterialSizeString);
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Text\tMaterial Size\t%s\n", g_MaterialSizeString);
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        } else {
                            strcat(g_DialogInfo, "Text\tMaterial Size\t-\n");
                        }
                    }
                    case LISTITEM_OINDEX_TXT_FONTFACE: {
                        if(indextype == MATERIALINDEX_TYPE_TEXT) {
                            strunpack(g_FontString, g_ObjectFont[objectid-1][materialindex], MAX_FONTNAME_LEN+1);
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Text\tFont Face\t%s\n", g_FontString );
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        } else {
                            strcat(g_DialogInfo, "Text\tFont Face\t-\n");
                        }
                    }
                    case LISTITEM_OINDEX_TXT_FONTSIZE: {
                        if(indextype == MATERIALINDEX_TYPE_TEXT) {
                            new fontsize = g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_FONTSIZE][materialindex];
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Text\tFont Size\t%i\n", fontsize );
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        } else {
                            strcat(g_DialogInfo, "Text\tFont Size\t-\n");
                        }
                    }
                    case LISTITEM_OINDEX_TXT_ISBOLD: {
                        if(indextype == MATERIALINDEX_TYPE_TEXT) {
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Text\tFont Bold\t%s\n", g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_ISBOLD][materialindex] ? ("Yes") : ("No") );
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        } else {
                            strcat(g_DialogInfo, "Text\tFont Bold\t-\n");
                        }
                    }
                    case LISTITEM_OINDEX_TXT_ALIGN: {
                        if(indextype == MATERIALINDEX_TYPE_TEXT) {
                            new alignment = g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_ALIGNMENT][materialindex];
                            GetAlignmentName(alignment, g_MaterialAlignString, sizeof g_MaterialAlignString);
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Text\tFont Alignment\t%s\n", g_MaterialAlignString );
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        } else {
                            strcat(g_DialogInfo, "Text\tFont Alignment\t-\n");
                        }
                    }
                    case LISTITEM_OINDEX_TXT_FONTCOLOR_S: {
                        if(indextype == MATERIALINDEX_TYPE_TEXT) {
                            new fontcolor = g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_FONTCOLOR][materialindex];
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Text\tFont Color\t{%06x}Color\n", ARGBtoRGB( fontcolor ) );
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        } else {
                            strcat(g_DialogInfo, "Text\tFont Color\t-\n");
                        }
                    }
                    case LISTITEM_OINDEX_TXT_FONTCOLOR_A: {
                        if(indextype == MATERIALINDEX_TYPE_TEXT) {
                            new fontcolor = g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_FONTCOLOR][materialindex];
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Text\tFont Alpha\t%i/%i\n", ARGBtoA( fontcolor ), 0xFF);
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        } else {
                            strcat(g_DialogInfo, "Text\tFont Alpha\t-\n");
                        }
                     }
                    case LISTITEM_OINDEX_TXT_BACKCOLOR_S: {
                        if( indextype == MATERIALINDEX_TYPE_TEXT ) {
                            new argb = g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex];
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Text\tBackground Color\t{%06x}Color\n", ARGBtoRGB( argb ) );
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        } else {
                            strcat(g_DialogInfo, "Text\tBackground Color\t-\n");
                        }
                    }
                    case LISTITEM_OINDEX_TXT_BACKCOLOR_O: {
                        strcat(g_DialogInfo, "Text\tBackground Opaque\t-\n");
                    }
                    case LISTITEM_OINDEX_TXT_BACKCOLOR_T: {
                        strcat(g_DialogInfo, "Text\tBackground Transparent\t-\n");
                     }
                    default: {
                        strcat(g_DialogInfo, "-\t-\t-\n");
                    }
                }
            }
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, g_DialogCaption, g_DialogInfo, "Select", "Cancel");
        }
        case DIALOGID_OBJECT_COORD: {
            new objectid = GetPlayerEditObject(playerid);
            if( !IsValidObject(objectid) ) {
                return 1;
            }

            new Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz;
            if( g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_IDTYPE] == ID_TYPE_NONE ) {
                GetObjectPos(objectid, x, y, z);
                GetObjectRot(objectid, rx, ry, rz);
            } else {
                x = g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_X];
                y = g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Y];
                z = g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Z];
                rx = g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RX];
                ry = g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RY];
                rz = g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RZ];
            }

            g_DialogInfo = "";
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "x \t%f\n", x ), strcat(g_DialogInfo, g_DialogInfoRow);
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "y \t%f\n", y ), strcat(g_DialogInfo, g_DialogInfoRow);
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "z \t%f\n", z ), strcat(g_DialogInfo, g_DialogInfoRow);
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "rx\t%f\n", rx), strcat(g_DialogInfo, g_DialogInfoRow);
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "ry\t%f\n", ry), strcat(g_DialogInfo, g_DialogInfoRow);
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "rz\t%f\n", rz), strcat(g_DialogInfo, g_DialogInfoRow);

            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Object Coordinates", g_DialogInfo, "Enter", "Cancel");
        }
        case DIALOGID_OBJECT_COMMENT: {
            new objectid = GetPlayerEditObject(playerid);
            if( !IsValidObject(objectid) ) {
                return 1;
            }

            strunpack(g_CommentString, g_ObjectData[objectid-1][OBJECT_DATA_COMMENT], MAX_COMMENT_LEN+1);
            format(g_DialogInfo, sizeof g_DialogInfo, "Current Comment: %s", g_CommentString);
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Object Comment", g_DialogInfo, "Enter", "Cancel");
        }
        case DIALOGID_OBJECT_MATSIZE: {
            g_DialogInfo = "";

            for(new i; i < MAX_MATERIAL_SIZES; i ++) {
                new materialsize = (i + 1) * 10;
                GetMaterialSizeName(materialsize, g_MaterialSizeString, sizeof g_MaterialSizeString);
                format(g_DialogInfoRow, sizeof g_DialogInfoRow, "%i\t%s\n", materialsize, g_MaterialSizeString);
                strcat(g_DialogInfo, g_DialogInfoRow);
            }

            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, "Material Sizes", g_DialogInfo, "Select", "Cancel");
        }
        case DIALOGID_OBJECT_TEXT: {
            new objectid = GetPlayerEditObject(playerid);
            if( !IsValidObject(objectid) ) {
                return 1;
            }

            new materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX];
            strunpack(g_ObjectTextString, g_ObjectText[objectid-1][materialindex], MAX_OBJECT_TEXT+1);
            format(g_DialogInfo, sizeof g_DialogInfo, "Current Text: %s", g_ObjectTextString);
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Object Text", g_DialogInfo, "Enter", "Cancel");
        }
        case DIALOGID_OBJECT_FONTSIZE: {
            new objectid = GetPlayerEditObject(playerid);
            if( !IsValidObject(objectid) ) {
                return 1;
            }

            new
                materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX],
                fontsize = g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_FONTSIZE][materialindex]
            ;

            format(g_DialogInfo, sizeof g_DialogInfo, "Current Value: %i/%i", fontsize, MAX_OBJECT_FONTSIZE);
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Object Font Size", g_DialogInfo, "Enter", "Cancel");
        }
        case DIALOGID_COLORALPHA_TEXTURE, DIALOGID_COLORALPHA_FONTFACE: {
            new objectid = GetPlayerEditObject(playerid);
            if( !IsValidObject(objectid) ) {
                return 1;
            }

            new materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX];

            switch( dialogid ) {
                case DIALOGID_COLORALPHA_TEXTURE: {
                    g_DialogCaption = "Object Material Alpha";

                    if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] == MATERIALINDEX_TYPE_TEXTURE ) {
                        new argb = g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex];
                        format(g_DialogInfo, sizeof g_DialogInfo, "Current Value: %i/%i", ARGBtoA( argb ), 0xFF);
                    } else {
                        g_DialogInfo = "Current Value: none";
                    }
                }
                case DIALOGID_COLORALPHA_FONTFACE: {
                    g_DialogCaption = "Object Text Alpha";

                    if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] == MATERIALINDEX_TYPE_TEXT ) {
                        new argb = g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_FONTCOLOR][materialindex];
                        format(g_DialogInfo, sizeof g_DialogInfo, "Current Value: %i/%i", ARGBtoA( argb ), 0xFF);
                    } else {
                        g_DialogInfo = "Current Value: none";
                    }
                }
                default: {
                    return 0;
                }
            }
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, g_DialogCaption, g_DialogInfo, "Enter", "Cancel");
        }
        default: {
            return 0;
        }
    }
    return 1;
}

FindObjects(result[], result_size, search[], offset, &max_offset) {
    new
        rows_found,
        rows_added,
        search_int = -1,
        packed_search[MAX_SEARCH_LEN+1 char]
    ;

    sscanf(search, "i", search_int);

    strpack(packed_search, search);

    for(new objectid = 1, modelid, cache_index; objectid <= MAX_OBJECTS; objectid ++) {
        if( !IsValidObject(objectid) ) {
            continue;
        }

        modelid = GetObjectModel(objectid);
        cache_index = GetModelCacheIndex(modelid);

        if(
            isempty(search) ||
            search_int == objectid ||
            search_int == modelid ||
            strfind(g_ObjectData[objectid-1][OBJECT_DATA_COMMENT], packed_search, true) != -1 ||
            ( cache_index != INVALID_ARRAY_INDEX && strfind(g_ModelCache[cache_index][MODEL_CACHE_NAME], packed_search, true) != -1 )
        ) {
            if( rows_found ++ < offset ) {
                continue;
            }

            if( rows_added < result_size ) {
                result[rows_added ++] = objectid;
            }
        }
    }

    max_offset = rows_found - 1;
    if( max_offset < 0 ) {
        max_offset = 0;
    }

    return rows_added;
}
