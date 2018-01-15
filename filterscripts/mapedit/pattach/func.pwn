ShowAttachedDialog(playerid, dialogid) {
    switch( dialogid ) {
        case DIALOGID_ATTACH_INDEXLIST: {
            g_DialogInfo = "Index\tModel ID\tModel Name\tBone\n";

            for(new index; index < MAX_PLAYERATTACH_INDEX; index ++) {
                if( g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_TOGGLE] ) {
                    new
                        modelid = g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_MODEL],
                        boneid = g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_BONE]
                    ;

                    GetBoneName(boneid, g_BoneString, sizeof g_BoneString);

                    GetModelName(modelid, g_ModelString, sizeof g_ModelString);
                    format(g_DialogInfoRow, sizeof g_DialogInfoRow, "%i\t%i\t%s\t%s\n", index, modelid, g_ModelString, g_BoneString);
                } else {
                    format(g_DialogInfoRow, sizeof g_DialogInfoRow, "%i\t \t \t \n", index);
                }
                strcat(g_DialogInfo, g_DialogInfoRow);
            }

            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, "Attached Objects", g_DialogInfo, "Select", "Cancel");
        }
        case DIALOGID_ATTACH_MAIN: {
            new index = GetPlayerEditAttached(playerid);
            if( index == INVALID_PLAYERATTACH_INDEX || !g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_TOGGLE] ) {
                return 1;
            }

            format(g_DialogCaption, sizeof g_DialogCaption, "Attachment Index %i", index);
            g_DialogInfo = "";

            for(new listitem; listitem < MAX_LISTITEMS_ATTACH; listitem ++) {
                switch(listitem) {
                    case LISTITEM_ATTACH_MODEL: {
                        if( g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_TOGGLE] ) {
                            new modelid = g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_MODEL];

                            if( GetModelName(modelid, g_ModelString, sizeof g_ModelString) ) {
                                format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Model\t%i %s\n", modelid, g_ModelString);
                            } else {
                                format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Model\tNOT FOUND\n", modelid);
                            }
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        } else {
                            strcat(g_DialogInfo, "Model\t \n");
                        }
                    }
                    case LISTITEM_ATTACH_BONE: {
                        if( g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_TOGGLE] ) {
                            new boneid = g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_BONE];
                            GetBoneName(boneid, g_BoneString, sizeof g_BoneString);
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Bone\t%i %s\n", boneid, g_BoneString);
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        } else {
                            strcat(g_DialogInfo, "Bone\t \n");
                        }
                    }
                    case LISTITEM_ATTACH_COORD: {
                        strcat(g_DialogInfo, "Offset, Rotation, Scale\t \n");
                    }
                    case LISTITEM_ATTACH_MOVE: {
                        strcat(g_DialogInfo, "Click & Drag Move\t \n");
                    }
                    case LISTITEM_ATTACH_COLOR1: {
                        if( g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_TOGGLE] ) {
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Color 1\t{%06x}Color\n", ARGBtoRGB( g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_COLOR1] ) );
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        } else {
                            strcat(g_DialogInfo, "Color 1\t \n");
                        }
                    }
                    case LISTITEM_ATTACH_ALPHA1: {
                        if( g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_TOGGLE] ) {
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Color Alpha 1\t%i/%i\n", ARGBtoA( g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_COLOR1] ), 0xFF );
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        } else {
                            strcat(g_DialogInfo, "Color Alpha 1\t \n");
                        }
                    }
                    case LISTITEM_ATTACH_COLOR2: {
                        if( g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_TOGGLE] ) {
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Color 2\t{%06x}Color\n", ARGBtoRGB( g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_COLOR2] ) );
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        } else {
                            strcat(g_DialogInfo, "Color 2\t \n");
                        }
                    }
                    case LISTITEM_ATTACH_ALPHA2: {
                        if( g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_TOGGLE] ) {
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Color Alpha 2\t%i/%i\n", ARGBtoA( g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_COLOR2] ), 0xFF );
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        } else {
                            strcat(g_DialogInfo, "Color Alpha 2\t \n");
                        }
                    }
                    case LISTITEM_ATTACH_REMOVE: {
                        strcat(g_DialogInfo, "Remove\t \n");
                    }
                    default: {
                        strcat(g_DialogInfo, " \t \n");
                    }
                }
            }
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, g_DialogCaption, g_DialogInfo, "Select", "Cancel");
        }
        case DIALOGID_ATTACH_BONE: {
            g_DialogInfo = "";

            for(new boneid = 1; boneid <= MAX_BONE_ID; boneid ++) {
                GetBoneName(boneid, g_BoneString, sizeof g_BoneString);
                format(g_DialogInfoRow, sizeof g_DialogInfoRow, "%i\t%s\n", boneid, g_BoneString);
                strcat(g_DialogInfo, g_DialogInfoRow);
            }

            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, "Attached Bones", g_DialogInfo, "Select", "Cancel");
        }
        case DIALOGID_ATTACH_COORD: {
            new index = GetPlayerEditAttached(playerid);
            if( index == INVALID_PLAYERATTACH_INDEX || !g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_TOGGLE] ) {
                return 1;
            }

            g_DialogInfo = "";
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "x \t%f\n", g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_X ]);
            strcat(g_DialogInfo, g_DialogInfoRow);
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "y \t%f\n", g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_Y ]);
            strcat(g_DialogInfo, g_DialogInfoRow);
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "z \t%f\n", g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_Z ]);
            strcat(g_DialogInfo, g_DialogInfoRow);
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "rx\t%f\n", g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_RX]);
            strcat(g_DialogInfo, g_DialogInfoRow);
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "ry\t%f\n", g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_RY]);
            strcat(g_DialogInfo, g_DialogInfoRow);
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "rz\t%f\n", g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_RZ]);
            strcat(g_DialogInfo, g_DialogInfoRow);
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "sx\t%f\n", g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_SX]);
            strcat(g_DialogInfo, g_DialogInfoRow);
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "sy\t%f\n", g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_SY]);
            strcat(g_DialogInfo, g_DialogInfoRow);
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "sz\t%f\n", g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_SZ]);
            strcat(g_DialogInfo, g_DialogInfoRow);

            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Attached Offsets", g_DialogInfo, "Enter", "Cancel");
        }
        case DIALOGID_COLORALPHA_ATTACH_1, DIALOGID_COLORALPHA_ATTACH_2: {
            new attach_idx = GetPlayerEditAttached(playerid);
            if( attach_idx == INVALID_PLAYERATTACH_INDEX || !g_PlayerAttachData[playerid][attach_idx][PLAYERATTACH_DATA_TOGGLE] ) {
                return 1;
            }

            new attach_color_argb;

            switch( dialogid ) {
                case DIALOGID_COLORALPHA_ATTACH_1: {
                    g_DialogCaption = "Attach Color 1 Alpha";
                    attach_color_argb = g_PlayerAttachData[playerid][attach_idx][PLAYERATTACH_DATA_COLOR1];
                }
                case DIALOGID_COLORALPHA_ATTACH_2: {
                    g_DialogCaption = "Attach Color 2 Alpha";
                    attach_color_argb = g_PlayerAttachData[playerid][attach_idx][PLAYERATTACH_DATA_COLOR2];
                }
                default: {
                    return 1;
                }
            }
            format(g_DialogInfo, sizeof g_DialogInfo, "Current Value: %i/%i", ARGBtoA(attach_color_argb), 0xFF);
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, g_DialogCaption, g_DialogInfo, "Enter", "Cancel");
        }
        default: {
            return 0;
        }
    }
    return 1;
}

DefaultPlayerAttachData(playerid, index) {
    g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_TOGGLE] = false;
    g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_MODEL] = 0;
    g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_BONE] = 1;
    g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_X ] = 0.0;
    g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_Y ] = 0.0;
    g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_Z ] = 0.0;
    g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_RX] = 0.0;
    g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_RY] = 0.0;
    g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_RZ] = 0.0;
    g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_SX] = 1.0;
    g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_SY] = 1.0;
    g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_SZ] = 1.0;
    g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_COLOR1] = 0xFFFFFFFF;
    g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_COLOR2] = 0xFFFFFFFF;
}

ApplyPlayerAttachData(playerid, index) {
    if( !IsValidPlayerAttachIndex(index) ) {
        return 0;
    }

    if( !g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_TOGGLE] ) {
        return RemovePlayerAttachedObject(playerid, index), 1;
    }

    SetPlayerAttachedObject(playerid, index,
        g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_MODEL],
        g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_BONE],
        g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_X ],
        g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_Y ],
        g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_Z ],
        g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_RX],
        g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_RY],
        g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_RZ],
        g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_SX],
        g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_SY],
        g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_SZ],
        g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_COLOR1],
        g_PlayerAttachData[playerid][index][PLAYERATTACH_DATA_COLOR2]
    );
    return 1;
}
