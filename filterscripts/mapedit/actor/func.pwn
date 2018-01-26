ShowActorDialog(playerid, dialogid) {
    switch( dialogid ) {
        case DIALOGID_ACTOR_MAIN: {
            new actorid = GetPlayerEditActor(playerid);
            if( !IsValidActor(actorid) ) {
                return 1;
            }

            g_DialogInfo = "";

            for(new listitem; listitem < MAX_LISTITEMS_ACTOR; listitem ++) {
                switch(listitem) {
                    case LISTITEM_ACTOR_GOTO: {
                        strcat(g_DialogInfo, "Goto\t \n");
                    }
                    case LISTITEM_ACTOR_GET: {
                        strcat(g_DialogInfo, "Get\t \n");
                    }
                    case LISTITEM_ACTOR_COORD: {
                        strcat(g_DialogInfo, "Coordinates\t \n");
                    }
                    case LISTITEM_ACTOR_MOVE: {
                        strcat(g_DialogInfo, "Click & Drag Move\t \n");
                    }
                    case LISTITEM_ACTOR_REMOVE: {
                        strcat(g_DialogInfo, "Remove\t \n");
                    }
                    case LISTITEM_ACTOR_DUPLICATE: {
                        strcat(g_DialogInfo, "Duplicate\t \n");
                    }
                    case LISTITEM_ACTOR_COMMENT: {
                        strunpack(g_CommentString, g_ActorData[actorid][ACTOR_DATA_COMMENT], MAX_COMMENT_LEN+1);
                        format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Comment\t%s\n", g_CommentString);
                        strcat(g_DialogInfo, g_DialogInfoRow);
                    }
                    case LISTITEM_ACTOR_COMMENT_RESET: {
                        GetSkinName(g_ActorData[actorid][ACTOR_DATA_SKIN], g_SkinString, sizeof g_SkinString);
                        format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Reset Comment To\t%s\n", g_SkinString);
                        strcat(g_DialogInfo, g_DialogInfoRow);
                    }
                    case LISTITEM_ACTOR_ANIM_INDEX: {
                        new anim_index = g_ActorData[actorid][ACTOR_DATA_ANIM_INDEX];
                        if( anim_index == INVALID_ANIM_INDEX ) {
                            strcat(g_DialogInfo, "Animation\tnone\n");
                        } else {
                            new lib[MAX_ANIM_LIB+1], name[MAX_ANIM_NAME+1];
                            GetAnimationName(anim_index, lib, sizeof lib, name, sizeof name);
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Animation\t%i %s %s\n", anim_index, lib, name);
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        }
                    }
                    case LISTITEM_ACTOR_ANIM_DELTA: {
                        if( g_ActorData[actorid][ACTOR_DATA_ANIM_INDEX] == INVALID_ANIM_INDEX ) {
                            strcat(g_DialogInfo, "Animation Delta\tnone\n");
                        } else {
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Animation Delta\t%f\n", g_ActorData[actorid][ACTOR_DATA_ANIM_DELTA]);
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        }
                    }
                    case LISTITEM_ACTOR_ANIM_LOOP: {
                        if( g_ActorData[actorid][ACTOR_DATA_ANIM_INDEX] == INVALID_ANIM_INDEX ) {
                            strcat(g_DialogInfo, "Animation Loop\tnone\n");
                        } else if( g_ActorData[actorid][ACTOR_DATA_ANIM_LOOP] ) {
                            strcat(g_DialogInfo, "Animation Loop\ttrue\n");
                        } else {
                            strcat(g_DialogInfo, "Animation Loop\tfalse\n");
                        }
                    }
                    case LISTITEM_ACTOR_ANIM_LOCKX: {
                        if( g_ActorData[actorid][ACTOR_DATA_ANIM_INDEX] == INVALID_ANIM_INDEX ) {
                            strcat(g_DialogInfo, "Animation Lock X\tnone\n");
                        } else if( g_ActorData[actorid][ACTOR_DATA_ANIM_LOCKX] ) {
                            strcat(g_DialogInfo, "Animation Lock X\ttrue\n");
                        } else {
                            strcat(g_DialogInfo, "Animation Lock X\tfalse\n");
                        }
                    }
                    case LISTITEM_ACTOR_ANIM_LOCKY: {
                        if( g_ActorData[actorid][ACTOR_DATA_ANIM_INDEX] == INVALID_ANIM_INDEX ) {
                            strcat(g_DialogInfo, "Animation Lock Y\tnone\n");
                        } else if( g_ActorData[actorid][ACTOR_DATA_ANIM_LOCKY] ) {
                            strcat(g_DialogInfo, "Animation Lock Y\ttrue\n");
                        } else {
                            strcat(g_DialogInfo, "Animation Lock Y\tfalse\n");
                        }
                    }
                    case LISTITEM_ACTOR_ANIM_FREEZE: {
                        if( g_ActorData[actorid][ACTOR_DATA_ANIM_INDEX] == INVALID_ANIM_INDEX ) {
                            strcat(g_DialogInfo, "Animation Freeze\tnone\n");
                        } else if( g_ActorData[actorid][ACTOR_DATA_ANIM_FREEZE] ) {
                            strcat(g_DialogInfo, "Animation Freeze\ttrue\n");
                        } else {
                            strcat(g_DialogInfo, "Animation Freeze\tfalse\n");
                        }
                    }
                    case LISTITEM_ACTOR_ANIM_TIME: {
                        if( g_ActorData[actorid][ACTOR_DATA_ANIM_INDEX] == INVALID_ANIM_INDEX ) {
                            strcat(g_DialogInfo, "Animation Time\tnone\n");
                        } else {
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Animation Time\t%i\n", g_ActorData[actorid][ACTOR_DATA_ANIM_TIME]);
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        }
                    }
                    case LISTITEM_ACTOR_ANIM_UPDATE: {
                        strcat(g_DialogInfo, "Update Animation\t \n");
                    }
                    case LISTITEM_ACTOR_ANIM_REMOVE: {
                        strcat(g_DialogInfo, "Remove Animation\t \n");
                    }
                    default: {
                        strcat(g_DialogInfo, " \t \n");
                    }
                }
            }
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, "Actor", g_DialogInfo, "Select", "Cancel");
        }
        case DIALOGID_ACTOR_COORD: {
            new actorid = GetPlayerEditActor(playerid);
            if( !IsValidActor(actorid) ) {
                return 1;
            }

            new Float:x, Float:y, Float:z, Float:a;
            GetActorPos(actorid, x, y, z);
            GetActorFacingAngle(actorid, a);

            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "x\t%f\n", x), strcat(g_DialogInfo, g_DialogInfoRow);
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "y\t%f\n", y), strcat(g_DialogInfo, g_DialogInfoRow);
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "z\t%f\n", z), strcat(g_DialogInfo, g_DialogInfoRow);
            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "a\t%f\n", a), strcat(g_DialogInfo, g_DialogInfoRow);

            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Actor Coordinates", g_DialogInfo, "Enter", "Cancel");
        }
        case DIALOGID_ACTOR_COMMENT: {
            new actorid = GetPlayerEditActor(playerid);
            strunpack(g_CommentString, g_ActorData[actorid][ACTOR_DATA_COMMENT], MAX_COMMENT_LEN+1);
            format(g_DialogInfo, sizeof g_DialogInfo, "Current Comment: %s", g_CommentString);
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Actor Comment", g_DialogInfo, "Enter", "Cancel");
        }
        case DIALOGID_ACTOR_ANIM_DELTA: {
            new actorid = GetPlayerEditActor(playerid);
            format(g_DialogInfo, sizeof g_DialogInfo, "Current Value: %f", g_ActorData[actorid][ACTOR_DATA_ANIM_DELTA] );
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Actor Animation Delta", g_DialogInfo, "Enter", "Cancel");
        }
        case DIALOGID_ACTOR_ANIM_TIME: {
            new actorid = GetPlayerEditActor(playerid);
            format(g_DialogInfo, sizeof g_DialogInfo, "Current Value: %i", g_ActorData[actorid][ACTOR_DATA_ANIM_TIME] );
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Actor Animation Time", g_DialogInfo, "Enter", "Cancel");
        }
        default: {
            return 0;
        }
    }
    return 1;
}
DefaultActorAnimationData(actorid) {
    g_ActorData[actorid][ACTOR_DATA_ANIM_INDEX] = INVALID_ANIM_INDEX;
    g_ActorData[actorid][ACTOR_DATA_ANIM_DELTA] = 4.1;
    g_ActorData[actorid][ACTOR_DATA_ANIM_LOOP] = true;
    g_ActorData[actorid][ACTOR_DATA_ANIM_LOCKX] = false;
    g_ActorData[actorid][ACTOR_DATA_ANIM_LOCKY] = false;
    g_ActorData[actorid][ACTOR_DATA_ANIM_FREEZE] = false;
    g_ActorData[actorid][ACTOR_DATA_ANIM_TIME] = 0;
}

ApplyActorAnimationData(actorid) {
    new anim_idx = g_ActorData[actorid][ACTOR_DATA_ANIM_INDEX];
    if( anim_idx == INVALID_ANIM_INDEX ) {
        return ClearActorAnimations(actorid), 1;
    }

    GetAnimationName(anim_idx, g_AnimLibString, sizeof g_AnimLibString, g_AnimNameString, sizeof g_AnimNameString);

    ApplyActorAnimation(actorid, g_AnimLibString, g_AnimNameString,
        g_ActorData[actorid][ACTOR_DATA_ANIM_DELTA],
        g_ActorData[actorid][ACTOR_DATA_ANIM_LOOP],
        g_ActorData[actorid][ACTOR_DATA_ANIM_LOCKX],
        g_ActorData[actorid][ACTOR_DATA_ANIM_LOCKY],
        g_ActorData[actorid][ACTOR_DATA_ANIM_FREEZE],
        g_ActorData[actorid][ACTOR_DATA_ANIM_TIME]
    );
    return 1;
}

CopyActor(copy_actorid, Float:a) {
    new Float:x, Float:y, Float:z;
    GetActorPos(copy_actorid, x, y, z);

    new paste_actorid = CreateActor(g_ActorData[copy_actorid][ACTOR_DATA_SKIN], x, y, z, a);
    if( paste_actorid == INVALID_ACTOR_ID ) {
        return INVALID_ACTOR_ID;
    }

    strunpack(g_CommentString, g_ActorData[copy_actorid][ACTOR_DATA_COMMENT], MAX_COMMENT_LEN+1); // Get Comment
    strpack(g_ActorData[paste_actorid][ACTOR_DATA_COMMENT], g_CommentString, MAX_COMMENT_LEN+1); // Set Comment

    new anim_index = g_ActorData[copy_actorid][ACTOR_DATA_ANIM_INDEX];
    if( anim_index != INVALID_ANIM_INDEX ) {
        g_ActorData[paste_actorid][ACTOR_DATA_ANIM_INDEX]  = anim_index;
        g_ActorData[paste_actorid][ACTOR_DATA_ANIM_DELTA]  = g_ActorData[copy_actorid][ACTOR_DATA_ANIM_DELTA];
        g_ActorData[paste_actorid][ACTOR_DATA_ANIM_LOOP]   = g_ActorData[copy_actorid][ACTOR_DATA_ANIM_LOOP];
        g_ActorData[paste_actorid][ACTOR_DATA_ANIM_LOCKX]  = g_ActorData[copy_actorid][ACTOR_DATA_ANIM_LOCKX];
        g_ActorData[paste_actorid][ACTOR_DATA_ANIM_LOCKY]  = g_ActorData[copy_actorid][ACTOR_DATA_ANIM_LOCKY];
        g_ActorData[paste_actorid][ACTOR_DATA_ANIM_FREEZE] = g_ActorData[copy_actorid][ACTOR_DATA_ANIM_FREEZE];
        g_ActorData[paste_actorid][ACTOR_DATA_ANIM_TIME]   = g_ActorData[copy_actorid][ACTOR_DATA_ANIM_TIME];
    }

    g_ActorData[paste_actorid][ACTOR_DATA_MEMORY_X] = g_ActorData[copy_actorid][ACTOR_DATA_MEMORY_X];
    g_ActorData[paste_actorid][ACTOR_DATA_MEMORY_Y] = g_ActorData[copy_actorid][ACTOR_DATA_MEMORY_Y];
    g_ActorData[paste_actorid][ACTOR_DATA_MEMORY_Z] = g_ActorData[copy_actorid][ACTOR_DATA_MEMORY_Z];
    g_ActorData[paste_actorid][ACTOR_DATA_MEMORY_A] = g_ActorData[copy_actorid][ACTOR_DATA_MEMORY_A];

    return paste_actorid;
}

RecreateActor(copy_actorid, Float:a) {
    new paste_actorid = CopyActor(copy_actorid, a);

    if( paste_actorid != INVALID_ACTOR_ID ) {
        for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
            if( !IsPlayerConnected(playerid) ) {
                continue;
            }

            if( GetPlayerEditActor(playerid) == copy_actorid ) {
                g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = paste_actorid;
            }

            for(new row; row < MAX_SELECTLIST_ROWS; row ++) {
                if( copy_actorid != g_SelectActListData[playerid][SELECTLIST_DATA_ROW_ID][row] ) {
                    continue;
                }

                g_SelectActListData[playerid][SELECTLIST_DATA_ROW_ID][row] = paste_actorid;

                if( g_PlayerData[playerid][PLAYER_DATA_TDMODE] == TDMODE_SELECTLIST_ACTOR ) {
                    ApplySelectListRowData(playerid, row);
                }
            }
        }
        DestroyActor(copy_actorid);
    }

    return paste_actorid;
}

FindActors(result[], result_size, search[], offset, &max_offset) {
    new
        rows_found,
        rows_added,
        search_int = -1,
        packed_search[MAX_SEARCH_LEN+1 char]
    ;

    sscanf(search, "i", search_int);

    strpack(packed_search, search);

    for(new actorid, max_actorid = GetActorPoolSize(), skinid; actorid <= max_actorid; actorid ++) {
        if( !IsValidActor(actorid) ) {
            continue;
        }

        skinid = g_ActorData[actorid][ACTOR_DATA_SKIN];

        if(
            isempty(search) ||
            search_int == actorid ||
            search_int == g_ActorData[actorid][ACTOR_DATA_SKIN] ||
            strfind(g_ActorData[actorid][ACTOR_DATA_COMMENT], packed_search, true) != -1 ||
            ( IsValidSkin(skinid) && strfind(g_SkinNameCache[skinid], packed_search, true) != -1 )
        ){
            if( rows_found ++ < offset ) {
                continue;
            }

            if( rows_added < result_size ) {
                result[rows_added ++] = actorid;
            }
        }
    }

    max_offset = rows_found - 1;
    if( max_offset < 0 ) {
        max_offset = 0;
    }

    return rows_added;
}
