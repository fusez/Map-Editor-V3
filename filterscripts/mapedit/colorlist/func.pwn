DefaultColorListData(playerid) {
    g_VehColorListData  [playerid][COLORLIST_DATA_PAGE] = MIN_COLORLIST_PAGE;
    g_ModelColorListData[playerid][COLORLIST_DATA_PAGE] = MIN_COLORLIST_PAGE;

    g_VehColorListData  [playerid][COLORLIST_DATA_MAXPAGE] = MIN_COLORLIST_PAGE;
    g_ModelColorListData[playerid][COLORLIST_DATA_MAXPAGE] = MIN_COLORLIST_PAGE;

    strpack(g_VehColorListData  [playerid][COLORLIST_DATA_SEARCH], "", MAX_SEARCH_LEN+1);
    strpack(g_ModelColorListData[playerid][COLORLIST_DATA_SEARCH], "", MAX_SEARCH_LEN+1);

    g_VehColorListData  [playerid][COLORLIST_DATA_APPLIED_ROW] = INVALID_ROW;
    g_ModelColorListData[playerid][COLORLIST_DATA_APPLIED_ROW] = INVALID_ROW;

    for(new row; row < MAX_COLORLIST_ROWS; row ++) {
        g_VehColorListData  [playerid][COLORLIST_DATA_ROW_ID][row] = INVALID_COLOR_ID;
        g_ModelColorListData[playerid][COLORLIST_DATA_ROW_ID][row] = INVALID_COLOR_ID;
    }
}

CreateGenericColorList() {
    g_ColorListGTD[COLORLIST_GTD_BG] =
    TextDrawCreate          (116.0, 138.0, "_");
    TextDrawAlignment       (g_ColorListGTD[COLORLIST_GTD_BG], 2);
    TextDrawLetterSize      (g_ColorListGTD[COLORLIST_GTD_BG], 0.0, 34.3);
    TextDrawUseBox          (g_ColorListGTD[COLORLIST_GTD_BG], 1);
    TextDrawBoxColor        (g_ColorListGTD[COLORLIST_GTD_BG], 100);
    TextDrawTextSize        (g_ColorListGTD[COLORLIST_GTD_BG], 0.0, 230.0);

    g_ColorListGTD[COLORLIST_GTD_CLOSE] =
    TextDrawCreate          (221.0, 138.0, "X");
    TextDrawAlignment       (g_ColorListGTD[COLORLIST_GTD_CLOSE], 2);
    TextDrawBackgroundColor (g_ColorListGTD[COLORLIST_GTD_CLOSE], 255);
    TextDrawFont            (g_ColorListGTD[COLORLIST_GTD_CLOSE], 1);
    TextDrawLetterSize      (g_ColorListGTD[COLORLIST_GTD_CLOSE], 0.3, 1.0);
    TextDrawColor           (g_ColorListGTD[COLORLIST_GTD_CLOSE], RGBA_WHITE);
    TextDrawSetOutline      (g_ColorListGTD[COLORLIST_GTD_CLOSE], 1);
    TextDrawSetProportional (g_ColorListGTD[COLORLIST_GTD_CLOSE], 1);
    TextDrawUseBox          (g_ColorListGTD[COLORLIST_GTD_CLOSE], 1);
    TextDrawBoxColor        (g_ColorListGTD[COLORLIST_GTD_CLOSE], 0xFF000064);
    TextDrawTextSize        (g_ColorListGTD[COLORLIST_GTD_CLOSE], 10.0, 20.0);
    TextDrawSetSelectable   (g_ColorListGTD[COLORLIST_GTD_CLOSE], 1);

    g_ColorListGTD[COLORLIST_GTD_PAGE_F] =
    TextDrawCreate          (11.0, 151.0, "<<");
    TextDrawAlignment       (g_ColorListGTD[COLORLIST_GTD_PAGE_F], 2);
    TextDrawBackgroundColor (g_ColorListGTD[COLORLIST_GTD_PAGE_F], 255);
    TextDrawFont            (g_ColorListGTD[COLORLIST_GTD_PAGE_F], 1);
    TextDrawLetterSize      (g_ColorListGTD[COLORLIST_GTD_PAGE_F], 0.2, 1.0);
    TextDrawColor           (g_ColorListGTD[COLORLIST_GTD_PAGE_F], RGBA_WHITE);
    TextDrawSetOutline      (g_ColorListGTD[COLORLIST_GTD_PAGE_F], 1);
    TextDrawSetProportional (g_ColorListGTD[COLORLIST_GTD_PAGE_F], 1);
    TextDrawTextSize        (g_ColorListGTD[COLORLIST_GTD_PAGE_F], 10.0, 20.0);
    TextDrawSetSelectable   (g_ColorListGTD[COLORLIST_GTD_PAGE_F], 1);

    g_ColorListGTD[COLORLIST_GTD_PAGE_P] =
    TextDrawCreate          (34.0, 151.0, "<");
    TextDrawAlignment       (g_ColorListGTD[COLORLIST_GTD_PAGE_P], 2);
    TextDrawBackgroundColor (g_ColorListGTD[COLORLIST_GTD_PAGE_P], 255);
    TextDrawFont            (g_ColorListGTD[COLORLIST_GTD_PAGE_P], 1);
    TextDrawLetterSize      (g_ColorListGTD[COLORLIST_GTD_PAGE_P], 0.2, 1.0);
    TextDrawColor           (g_ColorListGTD[COLORLIST_GTD_PAGE_P], RGBA_WHITE);
    TextDrawSetOutline      (g_ColorListGTD[COLORLIST_GTD_PAGE_P], 1);
    TextDrawSetProportional (g_ColorListGTD[COLORLIST_GTD_PAGE_P], 1);
    TextDrawTextSize        (g_ColorListGTD[COLORLIST_GTD_PAGE_P], 10.0, 20.0);
    TextDrawSetSelectable   (g_ColorListGTD[COLORLIST_GTD_PAGE_P], 1);

    g_ColorListGTD[COLORLIST_GTD_PAGE_N] =
    TextDrawCreate          (198.0, 151.0, ">");
    TextDrawAlignment       (g_ColorListGTD[COLORLIST_GTD_PAGE_N], 2);
    TextDrawBackgroundColor (g_ColorListGTD[COLORLIST_GTD_PAGE_N], 255);
    TextDrawFont            (g_ColorListGTD[COLORLIST_GTD_PAGE_N], 1);
    TextDrawLetterSize      (g_ColorListGTD[COLORLIST_GTD_PAGE_N], 0.2, 1.0);
    TextDrawColor           (g_ColorListGTD[COLORLIST_GTD_PAGE_N], RGBA_WHITE);
    TextDrawSetOutline      (g_ColorListGTD[COLORLIST_GTD_PAGE_N], 1);
    TextDrawSetProportional (g_ColorListGTD[COLORLIST_GTD_PAGE_N], 1);
    TextDrawTextSize        (g_ColorListGTD[COLORLIST_GTD_PAGE_N], 10.0, 20.0);
    TextDrawSetSelectable   (g_ColorListGTD[COLORLIST_GTD_PAGE_N], 1);

    g_ColorListGTD[COLORLIST_GTD_PAGE_L] =
    TextDrawCreate          (221.0, 151.0, ">>");
    TextDrawAlignment       (g_ColorListGTD[COLORLIST_GTD_PAGE_L], 2);
    TextDrawBackgroundColor (g_ColorListGTD[COLORLIST_GTD_PAGE_L], 255);
    TextDrawFont            (g_ColorListGTD[COLORLIST_GTD_PAGE_L], 1);
    TextDrawLetterSize      (g_ColorListGTD[COLORLIST_GTD_PAGE_L], 0.2, 1.0);
    TextDrawColor           (g_ColorListGTD[COLORLIST_GTD_PAGE_L], RGBA_WHITE);
    TextDrawSetOutline      (g_ColorListGTD[COLORLIST_GTD_PAGE_L], 1);
    TextDrawSetProportional (g_ColorListGTD[COLORLIST_GTD_PAGE_L], 1);
    TextDrawTextSize        (g_ColorListGTD[COLORLIST_GTD_PAGE_L], 10.0, 20.0);
    TextDrawSetSelectable   (g_ColorListGTD[COLORLIST_GTD_PAGE_L], 1);
}

DestroyGenericColorList() {
    for(new gtd; gtd < MAX_COLORLIST_GTDS; gtd ++) {
        TextDrawDestroy( g_ColorListGTD[gtd] );

        g_ColorListGTD[gtd] = Text: INVALID_TEXT_DRAW;
    }
}

CreatePlayerColorList(playerid) {
    g_ColorListPTD[playerid][COLORLIST_PTD_COLOR_APPLIED] = PlayerText: INVALID_TEXT_DRAW; // Create later

    g_ColorListPTD[playerid][COLORLIST_PTD_CAPTION] =
    CreatePlayerTextDraw          (playerid, 2.0, 127.0, "Caption");
    PlayerTextDrawBackgroundColor (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_CAPTION], 255);
    PlayerTextDrawFont            (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_CAPTION], 0);
    PlayerTextDrawLetterSize      (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_CAPTION], 0.5, 2.0);
    PlayerTextDrawColor           (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_CAPTION], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_CAPTION], 1);
    PlayerTextDrawSetProportional (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_CAPTION], 1);

    g_ColorListPTD[playerid][COLORLIST_PTD_PAGE] =
    CreatePlayerTextDraw          (playerid, 116.0, 151.0, "Page");
    PlayerTextDrawAlignment       (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_PAGE], 2);
    PlayerTextDrawBackgroundColor (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_PAGE], 255);
    PlayerTextDrawFont            (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_PAGE], 1);
    PlayerTextDrawLetterSize      (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_PAGE], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_PAGE], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_PAGE], 1);
    PlayerTextDrawSetProportional (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_PAGE], 1);
    PlayerTextDrawTextSize        (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_PAGE], 10.0, 138.0);
    PlayerTextDrawSetSelectable   (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_PAGE], 1);

    g_ColorListPTD[playerid][COLORLIST_PTD_SEARCH] =
    CreatePlayerTextDraw          (playerid, 116.0, 164.0, "Search");
    PlayerTextDrawAlignment       (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_SEARCH], 2);
    PlayerTextDrawBackgroundColor (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_SEARCH], 255);
    PlayerTextDrawFont            (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_SEARCH], 1);
    PlayerTextDrawLetterSize      (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_SEARCH], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_SEARCH], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_SEARCH], 1);
    PlayerTextDrawSetProportional (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_SEARCH], 1);
    PlayerTextDrawTextSize        (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_SEARCH], 10.0, 230.0);
    PlayerTextDrawSetSelectable   (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_SEARCH], 1);

    g_ColorListPTD[playerid][COLORLIST_PTD_COL_1] =
    CreatePlayerTextDraw          (playerid, 1.0, 177.0, "COL 1");
    PlayerTextDrawBackgroundColor (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COL_1], 255);
    PlayerTextDrawFont            (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COL_1], 1);
    PlayerTextDrawLetterSize      (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COL_1], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COL_1], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COL_1], 1);
    PlayerTextDrawSetProportional (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COL_1], 1);
    PlayerTextDrawTextSize        (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COL_1], 50.0, 10.0);

    g_ColorListPTD[playerid][COLORLIST_PTD_COL_2] =
    CreatePlayerTextDraw          (playerid, 53.0, 177.0, "COL 2");
    PlayerTextDrawBackgroundColor (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COL_2], 255);
    PlayerTextDrawFont            (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COL_2], 1);
    PlayerTextDrawLetterSize      (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COL_2], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COL_2], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COL_2], 1);
    PlayerTextDrawSetProportional (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COL_2], 1);
    PlayerTextDrawTextSize        (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COL_2], 231.0, 10.0);

    for(new row, Float:y = 190.0; row < MAX_COLORLIST_ROWS; row ++, y += 13.0) {
        g_ColorListPTD[playerid][COLORLIST_PTD_ROW_1][row] =
        CreatePlayerTextDraw          (playerid, 1.0, y, "ROW 1");
        PlayerTextDrawBackgroundColor (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_1][row], 255);
        PlayerTextDrawFont            (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_1][row], 1);
        PlayerTextDrawLetterSize      (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_1][row], 0.2, 1.0);
        PlayerTextDrawColor           (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_1][row], RGBA_WHITE);
        PlayerTextDrawSetOutline      (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_1][row], 1);
        PlayerTextDrawSetProportional (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_1][row], 1);
        PlayerTextDrawUseBox          (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_1][row], 1);
        PlayerTextDrawBoxColor        (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_1][row], 100);
        PlayerTextDrawTextSize        (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_1][row], 50.0, 10.0);
        PlayerTextDrawSetSelectable   (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_1][row], 1);

        g_ColorListPTD[playerid][COLORLIST_PTD_ROW_2][row] =
        CreatePlayerTextDraw          (playerid, 53.0, y, "ROW 2");
        PlayerTextDrawBackgroundColor (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_2][row], 255);
        PlayerTextDrawFont            (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_2][row], 1);
        PlayerTextDrawLetterSize      (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_2][row], 0.2, 1.0);
        PlayerTextDrawColor           (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_2][row], RGBA_WHITE);
        PlayerTextDrawSetOutline      (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_2][row], 1);
        PlayerTextDrawSetProportional (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_2][row], 1);
        PlayerTextDrawUseBox          (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_2][row], 1);
        PlayerTextDrawBoxColor        (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_2][row], 100);
        PlayerTextDrawTextSize        (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_2][row], 231.0, 10.0);
        PlayerTextDrawSetSelectable   (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_2][row], 1);
    }
}

DestroyPlayerColorList(playerid) {
    for(new ptd; ptd < MAX_COLORLIST_PTDS; ptd ++) {
        PlayerTextDrawDestroy(playerid, g_ColorListPTD[playerid][ptd]);

        g_ColorListPTD[playerid][ptd] = PlayerText: INVALID_TEXT_DRAW;
    }
}

ShowColorList(playerid) {
    CreatePlayerColorList(playerid);

    for(new gtd; gtd < MAX_COLORLIST_GTDS; gtd ++) {
        TextDrawShowForPlayer(playerid, g_ColorListGTD[gtd]);
    }

    LoadColorListRowData(playerid);

    ApplyColorListCaption(playerid);
    PlayerTextDrawShow(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_CAPTION]);

    ApplyColorListPage(playerid);
    PlayerTextDrawShow(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_PAGE]);

    ApplyColorListSearch(playerid);
    PlayerTextDrawShow(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_SEARCH]);

    ApplyColorListColumns(playerid);
    PlayerTextDrawShow(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COL_1]);
    PlayerTextDrawShow(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COL_2]);

    ApplyColorListRowData(playerid);
}

HideColorList(playerid) {
    DestroyPlayerColorList(playerid);

    for(new gtd; gtd < MAX_COLORLIST_GTDS; gtd ++) {
        TextDrawHideForPlayer(playerid, g_ColorListGTD[gtd]);
    }
}

GetColorListPage(playerid) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_COLORLIST_TEXTURE, TDMODE_COLORLIST_FONTFACE, TDMODE_COLORLIST_FONTBACK, TDMODE_COLORLIST_ATTACH_1, TDMODE_COLORLIST_ATTACH_2: {
            return g_ModelColorListData[playerid][COLORLIST_DATA_PAGE];
        }
        case TDMODE_COLORLIST_VEHICLE_1, TDMODE_COLORLIST_VEHICLE_2: {
            return g_VehColorListData[playerid][COLORLIST_DATA_PAGE];
        }
    }
    return 0;
}

SetColorListPage(playerid, page) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_COLORLIST_TEXTURE, TDMODE_COLORLIST_FONTFACE, TDMODE_COLORLIST_FONTBACK, TDMODE_COLORLIST_ATTACH_1, TDMODE_COLORLIST_ATTACH_2: {
            g_ModelColorListData[playerid][COLORLIST_DATA_PAGE] = page;
        }
        case TDMODE_COLORLIST_VEHICLE_1, TDMODE_COLORLIST_VEHICLE_2: {
            g_VehColorListData[playerid][COLORLIST_DATA_PAGE] = page;
        }
        default: {
            return 0;
        }
    }
    return 1;
}

GetColorListMaxPage(playerid) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_COLORLIST_TEXTURE, TDMODE_COLORLIST_FONTFACE, TDMODE_COLORLIST_FONTBACK, TDMODE_COLORLIST_ATTACH_1, TDMODE_COLORLIST_ATTACH_2: {
            return g_ModelColorListData[playerid][COLORLIST_DATA_MAXPAGE];
        }
        case TDMODE_COLORLIST_VEHICLE_1, TDMODE_COLORLIST_VEHICLE_2: {
            return g_VehColorListData  [playerid][COLORLIST_DATA_MAXPAGE];
        }
    }
    return 0;
}

GetColorListSearch(playerid, search[], search_size) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_COLORLIST_TEXTURE, TDMODE_COLORLIST_FONTFACE, TDMODE_COLORLIST_FONTBACK, TDMODE_COLORLIST_ATTACH_1, TDMODE_COLORLIST_ATTACH_2: {
            strunpack(search, g_ModelColorListData[playerid][COLORLIST_DATA_SEARCH], search_size);
        }
        case TDMODE_COLORLIST_VEHICLE_1, TDMODE_COLORLIST_VEHICLE_2: {
            strunpack(search, g_VehColorListData  [playerid][COLORLIST_DATA_SEARCH], search_size);
        }
        default: {
            return format(search, search_size, ""), 0;
        }
    }
    return 1;
}

SetColorListSearch(playerid, search[]) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_COLORLIST_TEXTURE, TDMODE_COLORLIST_FONTFACE, TDMODE_COLORLIST_FONTBACK, TDMODE_COLORLIST_ATTACH_1, TDMODE_COLORLIST_ATTACH_2: {
            strpack(g_ModelColorListData[playerid][COLORLIST_DATA_SEARCH], search, MAX_SEARCH_LEN+1);
        }
        case TDMODE_COLORLIST_VEHICLE_1, TDMODE_COLORLIST_VEHICLE_2: {
            strpack(g_VehColorListData  [playerid][COLORLIST_DATA_SEARCH], search, MAX_SEARCH_LEN+1);
        }
        default: {
            return 0;
        }
    }
    return 1;
}

GetColorListNewAppliedRow(playerid) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_COLORLIST_TEXTURE: {
            new objectid = GetPlayerEditObject(playerid);

            if( !IsValidObject(objectid) ) {
                return INVALID_ROW;
            }

            new materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX];
            if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] != MATERIALINDEX_TYPE_TEXTURE ) {
                return INVALID_ROW;
            }

            new
                obj_color_argb = g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex],
                obj_color_rgb = ARGBtoRGB(obj_color_argb)
            ;

            for(new row, row_color_id; row < MAX_COLORLIST_ROWS; row ++) {
                row_color_id = g_ModelColorListData[playerid][COLORLIST_DATA_ROW_ID][row];

                if( row_color_id == INVALID_COLOR_ID ) {
                    continue;
                }

                if( obj_color_rgb == GetModelColorRGB(row_color_id) ) {
                    return row;
                }
            }
        }
        case TDMODE_COLORLIST_FONTFACE: {
            new objectid = GetPlayerEditObject(playerid);

            if( !IsValidObject(objectid) ) {
                return INVALID_ROW;
            }

            new materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX];
            if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] != MATERIALINDEX_TYPE_TEXT ) {
                return INVALID_ROW;
            }

            new
                obj_color_argb = g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_FONTCOLOR][materialindex],
                obj_color_rgb = ARGBtoRGB(obj_color_argb)
            ;

            for(new row, row_color_id; row < MAX_COLORLIST_ROWS; row ++) {
                row_color_id = g_ModelColorListData[playerid][COLORLIST_DATA_ROW_ID][row];

                if( row_color_id == INVALID_COLOR_ID ) {
                    continue;
                }

                if( obj_color_rgb == GetModelColorRGB(row_color_id) ) {
                    return row;
                }
            }
        }
        case TDMODE_COLORLIST_FONTBACK: {
            new objectid = GetPlayerEditObject(playerid);

            if( !IsValidObject(objectid) ) {
                return INVALID_ROW;
            }

            new materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX];
            if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] != MATERIALINDEX_TYPE_TEXT ) {
                return INVALID_ROW;
            }

            new
                obj_color_argb = g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex],
                obj_color_rgb = ARGBtoRGB(obj_color_argb)
            ;

            for(new row, row_color_id; row < MAX_COLORLIST_ROWS; row ++) {
                row_color_id = g_ModelColorListData[playerid][COLORLIST_DATA_ROW_ID][row];

                if( row_color_id == INVALID_COLOR_ID ) {
                    continue;
                }

                if( obj_color_rgb == GetModelColorRGB(row_color_id) ) {
                    return row;
                }
            }
        }
        case TDMODE_COLORLIST_ATTACH_1: {
            new attach_index = GetPlayerEditAttached(playerid);
            if( attach_index == INVALID_PLAYERATTACH_INDEX || !g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_TOGGLE]) {
                return INVALID_ROW;
            }

            new
                attach_color_argb = g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_COLOR1],
                attach_color_rgb = ARGBtoRGB(attach_color_argb)
            ;

            for(new row, row_color_id; row < MAX_COLORLIST_ROWS; row ++) {
                row_color_id = g_ModelColorListData[playerid][COLORLIST_DATA_ROW_ID][row];
                
                if( row_color_id == INVALID_COLOR_ID ) {
                    continue;
                }

                if( attach_color_rgb == GetModelColorRGB(row_color_id) ) {
                    return row;
                }
            }
        }
        case TDMODE_COLORLIST_ATTACH_2: {
            new attach_index = GetPlayerEditAttached(playerid);
            if( attach_index == INVALID_PLAYERATTACH_INDEX || !g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_TOGGLE] ) {
                return INVALID_ROW;
            }

            new
                attach_color_argb = g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_COLOR2],
                attach_color_rgb = ARGBtoRGB(attach_color_argb)
            ;

            for(new row, row_color_id; row < MAX_COLORLIST_ROWS; row ++) {
                row_color_id = g_ModelColorListData[playerid][COLORLIST_DATA_ROW_ID][row];

                if( row_color_id == INVALID_COLOR_ID ) {
                    continue;
                }

                if( attach_color_rgb == GetModelColorRGB(row_color_id) ) {
                    return row;
                }
            }
        }
        case TDMODE_COLORLIST_VEHICLE_1: {
            new vehicleid = GetPlayerEditVehicle(playerid);

            if( !IsValidVehicle(vehicleid) ) {
                return INVALID_ROW;
            }

            new vehicle_color_id = g_VehicleData[vehicleid-1][VEHICLE_DATA_COLOR_1];
            if( vehicle_color_id == INVALID_COLOR_ID ) {
                return INVALID_ROW;
            }

            for(new row, row_color_id; row < MAX_COLORLIST_ROWS; row ++) {
                row_color_id = g_VehColorListData[playerid][COLORLIST_DATA_ROW_ID][row];

                if( vehicle_color_id == row_color_id ) {
                    return row;
                }
            }
        }
        case TDMODE_COLORLIST_VEHICLE_2: {
            new vehicleid = GetPlayerEditVehicle(playerid);

            if( !IsValidVehicle(vehicleid) ) {
                return INVALID_ROW;
            }

            new vehicle_color_id = g_VehicleData[vehicleid-1][VEHICLE_DATA_COLOR_2];
            if( vehicle_color_id == INVALID_COLOR_ID ) {
                return INVALID_ROW;
            }

            for(new row, row_color_id; row < MAX_COLORLIST_ROWS; row ++) {
                row_color_id = g_VehColorListData[playerid][COLORLIST_DATA_ROW_ID][row];

                if( vehicle_color_id == row_color_id ) {
                    return row;
                }
            }
        }
        default: {
            return 0;
        }
    }
    return INVALID_ROW;
}

GetColorListAppliedRow(playerid) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_COLORLIST_TEXTURE, TDMODE_COLORLIST_FONTFACE, TDMODE_COLORLIST_FONTBACK, TDMODE_COLORLIST_ATTACH_1, TDMODE_COLORLIST_ATTACH_2: {
            return g_ModelColorListData[playerid][COLORLIST_DATA_APPLIED_ROW];
        }
        case TDMODE_COLORLIST_VEHICLE_1, TDMODE_COLORLIST_VEHICLE_2: {
            return g_VehColorListData[playerid][COLORLIST_DATA_APPLIED_ROW];
        }
    }
    return INVALID_ROW;
}

SetColorListAppliedRow(playerid, row) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_COLORLIST_TEXTURE, TDMODE_COLORLIST_FONTFACE, TDMODE_COLORLIST_FONTBACK, TDMODE_COLORLIST_ATTACH_1, TDMODE_COLORLIST_ATTACH_2: {
            g_ModelColorListData[playerid][COLORLIST_DATA_APPLIED_ROW] = row;
        }
        case TDMODE_COLORLIST_VEHICLE_1, TDMODE_COLORLIST_VEHICLE_2: {
            g_VehColorListData[playerid][COLORLIST_DATA_APPLIED_ROW] = row;
        }
        default: {
            return 0;
        }
    }
    return 1;
}

GetColorListRowColorID(playerid, row) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_COLORLIST_TEXTURE, TDMODE_COLORLIST_FONTFACE, TDMODE_COLORLIST_FONTBACK, TDMODE_COLORLIST_ATTACH_1, TDMODE_COLORLIST_ATTACH_2: {
            return g_ModelColorListData[playerid][COLORLIST_DATA_ROW_ID][row];
        }
        case TDMODE_COLORLIST_VEHICLE_1, TDMODE_COLORLIST_VEHICLE_2: {
            return g_VehColorListData[playerid][COLORLIST_DATA_ROW_ID][row];
        }
    }
    return INVALID_COLOR_ID;
}

LoadColorListRowData(playerid) {
    new rows_added, max_offset;

    GetColorListSearch(playerid, g_SearchString, sizeof g_SearchString);

    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_COLORLIST_TEXTURE, TDMODE_COLORLIST_FONTFACE, TDMODE_COLORLIST_FONTBACK, TDMODE_COLORLIST_ATTACH_1, TDMODE_COLORLIST_ATTACH_2: {
            rows_added = FindModelColors(
                .result = g_ModelColorListData[playerid][COLORLIST_DATA_ROW_ID],
                .result_size = MAX_COLORLIST_ROWS,
                .search = g_SearchString,
                .offset = g_ModelColorListData[playerid][COLORLIST_DATA_PAGE] * MAX_COLORLIST_ROWS,
                .max_offset = max_offset
            );

            for(new row = rows_added; row < MAX_COLORLIST_ROWS; row ++) {
                g_ModelColorListData[playerid][COLORLIST_DATA_ROW_ID][row] = INVALID_COLOR_ID;
            }

            g_ModelColorListData[playerid][COLORLIST_DATA_MAXPAGE] = max_offset / MAX_COLORLIST_ROWS;

            g_ModelColorListData[playerid][COLORLIST_DATA_APPLIED_ROW] = GetColorListNewAppliedRow(playerid);
        }
        case TDMODE_COLORLIST_VEHICLE_1, TDMODE_COLORLIST_VEHICLE_2: {
            rows_added = FindVehicleColors(
                .result = g_VehColorListData[playerid][COLORLIST_DATA_ROW_ID],
                .result_size = MAX_COLORLIST_ROWS,
                .search = g_SearchString,
                .offset = g_VehColorListData[playerid][COLORLIST_DATA_PAGE] * MAX_COLORLIST_ROWS,
                .max_offset = max_offset
            );

            for(new row = rows_added; row < MAX_COLORLIST_ROWS; row ++) {
                g_VehColorListData[playerid][COLORLIST_DATA_ROW_ID][row] = INVALID_COLOR_ID;
            }

            g_VehColorListData[playerid][COLORLIST_DATA_MAXPAGE] = max_offset / MAX_COLORLIST_ROWS;

            g_VehColorListData[playerid][COLORLIST_DATA_APPLIED_ROW] = GetColorListNewAppliedRow(playerid);
        }
        default: {
            return 0;
        }
    }
    return 1;
}

ApplyColorListCaption(playerid) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_COLORLIST_TEXTURE: {
            new materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX];
            format(g_TextdrawString, sizeof g_TextdrawString, "Texture Color %i", materialindex);
            PlayerTextDrawSetString(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_CAPTION], g_TextdrawString);
        }
        case TDMODE_COLORLIST_FONTFACE: {
            new materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX];
            format(g_TextdrawString, sizeof g_TextdrawString, "Text Color %i", materialindex);
            PlayerTextDrawSetString(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_CAPTION], g_TextdrawString);
        }
        case TDMODE_COLORLIST_FONTBACK: {
            new materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX];
            format(g_TextdrawString, sizeof g_TextdrawString, "Back Color %i", materialindex);
            PlayerTextDrawSetString(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_CAPTION], g_TextdrawString);
        }
        case TDMODE_COLORLIST_ATTACH_1: {
            PlayerTextDrawSetString(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_CAPTION], "Attachment Color 1");
        }
        case TDMODE_COLORLIST_ATTACH_2: {
            PlayerTextDrawSetString(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_CAPTION], "Attachment Color 2");
        }
        case TDMODE_COLORLIST_VEHICLE_1: {
            PlayerTextDrawSetString(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_CAPTION], "Vehicle Color 1");
        }
        case TDMODE_COLORLIST_VEHICLE_2: {
            PlayerTextDrawSetString(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_CAPTION], "Vehicle Color 2");
        }
        default: {
            return 0;
        }
    }
    return 1;
}

ApplyColorListPage(playerid) {
    format(g_TextdrawString, sizeof g_TextdrawString, "Page: %i / %i", GetColorListPage(playerid) + 1, GetColorListMaxPage(playerid) + 1);
    PlayerTextDrawSetString(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_PAGE], g_TextdrawString);
}

ApplyColorListSearch(playerid) {
    GetColorListSearch(playerid, g_SearchString, sizeof g_SearchString);
    if( isempty(g_SearchString) ) {
        PlayerTextDrawSetString(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_SEARCH], "Search");
    } else {
        format(g_TextdrawString, sizeof g_TextdrawString, "Search: %s", g_SearchString);
        PlayerTextDrawSetString(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_SEARCH], g_TextdrawString);
    }
}

ApplyColorListAppliedRow(playerid) {
    new row = GetColorListAppliedRow(playerid);

    if( g_ColorListPTD[playerid][COLORLIST_PTD_COLOR_APPLIED] != PlayerText: INVALID_TEXT_DRAW ) {
        PlayerTextDrawDestroy(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COLOR_APPLIED]);

        g_ColorListPTD[playerid][COLORLIST_PTD_COLOR_APPLIED] = PlayerText: INVALID_TEXT_DRAW;
    }

    if( row == INVALID_ROW ) {
        return 0;
    }

    new Float:y = 190.0 + (row * 13.0);

    g_ColorListPTD[playerid][COLORLIST_PTD_COLOR_APPLIED] =
    CreatePlayerTextDraw          (playerid, 184.0, y, "Color Applied");
    PlayerTextDrawBackgroundColor (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COLOR_APPLIED], 255);
    PlayerTextDrawFont            (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COLOR_APPLIED], 1);
    PlayerTextDrawLetterSize      (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COLOR_APPLIED], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COLOR_APPLIED], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COLOR_APPLIED], 1);
    PlayerTextDrawSetProportional (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COLOR_APPLIED], 1);
    PlayerTextDrawShow            (playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COLOR_APPLIED]);
    return 1;
}

ApplyColorListColumns(playerid) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_COLORLIST_TEXTURE, TDMODE_COLORLIST_FONTFACE, TDMODE_COLORLIST_FONTBACK, TDMODE_COLORLIST_ATTACH_1, TDMODE_COLORLIST_ATTACH_2: {
            PlayerTextDrawSetString(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COL_1], "RGB");
            PlayerTextDrawSetString(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COL_2], "Name");
        }
        case TDMODE_COLORLIST_VEHICLE_1, TDMODE_COLORLIST_VEHICLE_2: {
            PlayerTextDrawSetString(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COL_1], "ID");
            PlayerTextDrawSetString(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_COL_2], "Name");
        }
        default: {
            return 0;
        }
    }
    return 1;
}

ApplyColorListRowData(playerid) {
    for(new row, row_color_id, row_color_rgb, row_color_rgba; row < MAX_COLORLIST_ROWS; row ++) {
        row_color_id = GetColorListRowColorID(playerid, row);

        if( row_color_id == INVALID_COLOR_ID ) {
            PlayerTextDrawHide(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_1][row]);
            PlayerTextDrawHide(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_2][row]);
            continue;
        }

        switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
            case TDMODE_COLORLIST_TEXTURE, TDMODE_COLORLIST_FONTFACE, TDMODE_COLORLIST_FONTBACK, TDMODE_COLORLIST_ATTACH_1, TDMODE_COLORLIST_ATTACH_2: {
                row_color_rgb = GetModelColorRGB(row_color_id);
                row_color_rgba = RGBtoRGBA(row_color_rgb, 0xFF);

                PlayerTextDrawBoxColor(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_1][row], row_color_rgba);
                PlayerTextDrawBoxColor(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_2][row], row_color_rgba);

                format(g_TextdrawString, sizeof g_TextdrawString, "0x%06x", row_color_rgb);
                PlayerTextDrawSetString(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_1][row], g_TextdrawString);

                GetModelColorName(row_color_id, g_ModelColorString, sizeof g_ModelColorString);
                PlayerTextDrawSetString(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_2][row], g_ModelColorString);
            }
            case TDMODE_COLORLIST_VEHICLE_1, TDMODE_COLORLIST_VEHICLE_2: {
                row_color_rgb = GetVehicleColorRGB(row_color_id);
                row_color_rgba = RGBtoRGBA(row_color_rgb, 0xFF);

                PlayerTextDrawBoxColor(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_1][row], row_color_rgba);
                PlayerTextDrawBoxColor(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_2][row], row_color_rgba);

                format(g_TextdrawString, sizeof g_TextdrawString, "%03i", row_color_id);
                PlayerTextDrawSetString(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_1][row], g_TextdrawString);

                GetVehicleColorName(row_color_id, g_VehColorString, sizeof g_VehColorString);
                PlayerTextDrawSetString(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_2][row], g_VehColorString);
            }
            default: {
                continue;
            }
        }

        PlayerTextDrawShow(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_1][row]);
        PlayerTextDrawShow(playerid, g_ColorListPTD[playerid][COLORLIST_PTD_ROW_2][row]);
    }

    ApplyColorListAppliedRow(playerid);
}

ShowColorListDialog(playerid, dialogid) {
	switch( dialogid ) {
        case DIALOGID_COLORLIST_PAGE: {
            format(g_DialogInfo, sizeof g_DialogInfo, "Page: %i / %i", GetColorListPage(playerid) + 1, GetColorListMaxPage(playerid) + 1);
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Color List: Page", g_DialogInfo, "Enter", "Back");
        }
        case DIALOGID_COLORLIST_SEARCH: {
            GetColorListSearch(playerid, g_SearchString, sizeof g_SearchString);
            if( isempty(g_SearchString) ) {
                g_DialogInfo = "You are not searching for anything.";
            } else {
                format(g_DialogInfo, sizeof g_DialogInfo, "Searching for: %s", g_SearchString);
            }
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Color List: Search", g_DialogInfo, "Enter", "Back");
        }
        default: {
            return 0;
        }
    }
    return 1;
}
