DefaultFontListData(playerid) {
    g_FontListData[playerid][FONTLIST_DATA_PAGE] = MIN_FONTLIST_PAGE;

    g_FontListData[playerid][FONTLIST_DATA_MAXPAGE] = MIN_FONTLIST_PAGE;

    g_FontListData[playerid][FONTLIST_DATA_APPLIED_ROW] = INVALID_ROW;

    strpack(g_FontListData[playerid][FONTLIST_DATA_SEARCH], "", MAX_SEARCH_LEN+1);

    for(new row; row < MAX_FONTLIST_ROWS; row ++) {
        g_FontListData[playerid][FONTLIST_DATA_ROW_FONTID][row] = INVALID_FONT_ID;
    }
}

CreateGenericFontList() {
    g_FontListGTD[FONTLIST_GTD_BG] =
    TextDrawCreate          (94.0, 151.0, "_");
    TextDrawAlignment       (g_FontListGTD[FONTLIST_GTD_BG], 2);
    TextDrawLetterSize      (g_FontListGTD[FONTLIST_GTD_BG], 0.0, 32.8);
    TextDrawUseBox          (g_FontListGTD[FONTLIST_GTD_BG], 1);
    TextDrawBoxColor        (g_FontListGTD[FONTLIST_GTD_BG], 100);
    TextDrawTextSize        (g_FontListGTD[FONTLIST_GTD_BG], 0.0, 190.0);

    g_FontListGTD[FONTLIST_GTD_CLOSE] =
    TextDrawCreate          (179.0, 151.0, "X");
    TextDrawAlignment       (g_FontListGTD[FONTLIST_GTD_CLOSE], 2);
    TextDrawBackgroundColor (g_FontListGTD[FONTLIST_GTD_CLOSE], 255);
    TextDrawFont            (g_FontListGTD[FONTLIST_GTD_CLOSE], 1);
    TextDrawLetterSize      (g_FontListGTD[FONTLIST_GTD_CLOSE], 0.3, 1.0);
    TextDrawColor           (g_FontListGTD[FONTLIST_GTD_CLOSE], RGBA_WHITE);
    TextDrawSetOutline      (g_FontListGTD[FONTLIST_GTD_CLOSE], 1);
    TextDrawSetProportional (g_FontListGTD[FONTLIST_GTD_CLOSE], 1);
    TextDrawUseBox          (g_FontListGTD[FONTLIST_GTD_CLOSE], 1);
    TextDrawBoxColor        (g_FontListGTD[FONTLIST_GTD_CLOSE], 0xFF000064);
    TextDrawTextSize        (g_FontListGTD[FONTLIST_GTD_CLOSE], 10.0, 20.0);
    TextDrawSetSelectable   (g_FontListGTD[FONTLIST_GTD_CLOSE], 1);

    g_FontListGTD[FONTLIST_GTD_PAGE_F] =
    TextDrawCreate          (11.0, 164.0, "<<");
    TextDrawAlignment       (g_FontListGTD[FONTLIST_GTD_PAGE_F], 2);
    TextDrawBackgroundColor (g_FontListGTD[FONTLIST_GTD_PAGE_F], 255);
    TextDrawFont            (g_FontListGTD[FONTLIST_GTD_PAGE_F], 1);
    TextDrawLetterSize      (g_FontListGTD[FONTLIST_GTD_PAGE_F], 0.2, 1.0);
    TextDrawColor           (g_FontListGTD[FONTLIST_GTD_PAGE_F], RGBA_WHITE);
    TextDrawSetOutline      (g_FontListGTD[FONTLIST_GTD_PAGE_F], 1);
    TextDrawSetProportional (g_FontListGTD[FONTLIST_GTD_PAGE_F], 1);
    TextDrawTextSize        (g_FontListGTD[FONTLIST_GTD_PAGE_F], 10.0, 20.0);
    TextDrawSetSelectable   (g_FontListGTD[FONTLIST_GTD_PAGE_F], 1);

    g_FontListGTD[FONTLIST_GTD_PAGE_P] =
    TextDrawCreate          (34.0, 164.0, "<");
    TextDrawAlignment       (g_FontListGTD[FONTLIST_GTD_PAGE_P], 2);
    TextDrawBackgroundColor (g_FontListGTD[FONTLIST_GTD_PAGE_P], 255);
    TextDrawFont            (g_FontListGTD[FONTLIST_GTD_PAGE_P], 1);
    TextDrawLetterSize      (g_FontListGTD[FONTLIST_GTD_PAGE_P], 0.2, 1.0);
    TextDrawColor           (g_FontListGTD[FONTLIST_GTD_PAGE_P], RGBA_WHITE);
    TextDrawSetOutline      (g_FontListGTD[FONTLIST_GTD_PAGE_P], 1);
    TextDrawSetProportional (g_FontListGTD[FONTLIST_GTD_PAGE_P], 1);
    TextDrawTextSize        (g_FontListGTD[FONTLIST_GTD_PAGE_P], 10.0, 20.0);
    TextDrawSetSelectable   (g_FontListGTD[FONTLIST_GTD_PAGE_P], 1);

    g_FontListGTD[FONTLIST_GTD_PAGE_N] =
    TextDrawCreate          (156.0, 164.0, ">");
    TextDrawAlignment       (g_FontListGTD[FONTLIST_GTD_PAGE_N], 2);
    TextDrawBackgroundColor (g_FontListGTD[FONTLIST_GTD_PAGE_N], 255);
    TextDrawFont            (g_FontListGTD[FONTLIST_GTD_PAGE_N], 1);
    TextDrawLetterSize      (g_FontListGTD[FONTLIST_GTD_PAGE_N], 0.2, 1.0);
    TextDrawColor           (g_FontListGTD[FONTLIST_GTD_PAGE_N], RGBA_WHITE);
    TextDrawSetOutline      (g_FontListGTD[FONTLIST_GTD_PAGE_N], 1);
    TextDrawSetProportional (g_FontListGTD[FONTLIST_GTD_PAGE_N], 1);
    TextDrawTextSize        (g_FontListGTD[FONTLIST_GTD_PAGE_N], 10.0, 20.0);
    TextDrawSetSelectable   (g_FontListGTD[FONTLIST_GTD_PAGE_N], 1);

    g_FontListGTD[FONTLIST_GTD_PAGE_L] =
    TextDrawCreate          (179.0, 164.0, ">>");
    TextDrawAlignment       (g_FontListGTD[FONTLIST_GTD_PAGE_L], 2);
    TextDrawBackgroundColor (g_FontListGTD[FONTLIST_GTD_PAGE_L], 255);
    TextDrawFont            (g_FontListGTD[FONTLIST_GTD_PAGE_L], 1);
    TextDrawLetterSize      (g_FontListGTD[FONTLIST_GTD_PAGE_L], 0.2, 1.0);
    TextDrawColor           (g_FontListGTD[FONTLIST_GTD_PAGE_L], RGBA_WHITE);
    TextDrawSetOutline      (g_FontListGTD[FONTLIST_GTD_PAGE_L], 1);
    TextDrawSetProportional (g_FontListGTD[FONTLIST_GTD_PAGE_L], 1);
    TextDrawTextSize        (g_FontListGTD[FONTLIST_GTD_PAGE_L], 10.0, 20.0);
    TextDrawSetSelectable   (g_FontListGTD[FONTLIST_GTD_PAGE_L], 1);
}

DestroyGenericFontList() {
    for(new gtd; gtd < MAX_FONTLIST_GTDS; gtd ++) {
        TextDrawDestroy( g_FontListGTD[gtd] );
        g_FontListGTD[gtd] = Text: INVALID_TEXT_DRAW;
    }
}

CreatePlayerFontList(playerid) {
    g_FontListPTD[playerid][FONTLIST_PTD_CAPTION] =
    CreatePlayerTextDraw          (playerid, 2.0, 139.0, "Caption");
    PlayerTextDrawBackgroundColor (playerid, g_FontListPTD[playerid][FONTLIST_PTD_CAPTION], 255);
    PlayerTextDrawFont            (playerid, g_FontListPTD[playerid][FONTLIST_PTD_CAPTION], 0);
    PlayerTextDrawLetterSize      (playerid, g_FontListPTD[playerid][FONTLIST_PTD_CAPTION], 0.5, 2.0);
    PlayerTextDrawColor           (playerid, g_FontListPTD[playerid][FONTLIST_PTD_CAPTION], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_FontListPTD[playerid][FONTLIST_PTD_CAPTION], 1);
    PlayerTextDrawSetProportional (playerid, g_FontListPTD[playerid][FONTLIST_PTD_CAPTION], 1);

    g_FontListPTD[playerid][FONTLIST_PTD_PAGE] =
    CreatePlayerTextDraw          (playerid, 95.0, 164.0, "Page");
    PlayerTextDrawAlignment       (playerid, g_FontListPTD[playerid][FONTLIST_PTD_PAGE], 2);
    PlayerTextDrawBackgroundColor (playerid, g_FontListPTD[playerid][FONTLIST_PTD_PAGE], 255);
    PlayerTextDrawFont            (playerid, g_FontListPTD[playerid][FONTLIST_PTD_PAGE], 1);
    PlayerTextDrawLetterSize      (playerid, g_FontListPTD[playerid][FONTLIST_PTD_PAGE], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_FontListPTD[playerid][FONTLIST_PTD_PAGE], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_FontListPTD[playerid][FONTLIST_PTD_PAGE], 1);
    PlayerTextDrawSetProportional (playerid, g_FontListPTD[playerid][FONTLIST_PTD_PAGE], 1);
    PlayerTextDrawTextSize        (playerid, g_FontListPTD[playerid][FONTLIST_PTD_PAGE], 10.0, 96.0);
    PlayerTextDrawSetSelectable   (playerid, g_FontListPTD[playerid][FONTLIST_PTD_PAGE], 1);

    g_FontListPTD[playerid][FONTLIST_PTD_SEARCH] =
    CreatePlayerTextDraw          (playerid, 95.0, 177.0, "Search");
    PlayerTextDrawAlignment       (playerid, g_FontListPTD[playerid][FONTLIST_PTD_SEARCH], 2);
    PlayerTextDrawBackgroundColor (playerid, g_FontListPTD[playerid][FONTLIST_PTD_SEARCH], 255);
    PlayerTextDrawFont            (playerid, g_FontListPTD[playerid][FONTLIST_PTD_SEARCH], 1);
    PlayerTextDrawLetterSize      (playerid, g_FontListPTD[playerid][FONTLIST_PTD_SEARCH], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_FontListPTD[playerid][FONTLIST_PTD_SEARCH], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_FontListPTD[playerid][FONTLIST_PTD_SEARCH], 1);
    PlayerTextDrawSetProportional (playerid, g_FontListPTD[playerid][FONTLIST_PTD_SEARCH], 1);
    PlayerTextDrawTextSize        (playerid, g_FontListPTD[playerid][FONTLIST_PTD_SEARCH], 10.0, 188.0);
    PlayerTextDrawSetSelectable   (playerid, g_FontListPTD[playerid][FONTLIST_PTD_SEARCH], 1);

    for(new row, Float:y = 190.0; row < MAX_FONTLIST_ROWS; row ++, y += 13.0) {
        g_FontListPTD[playerid][FONTLIST_PTD_ROW][row] =
        CreatePlayerTextDraw          (playerid, 1.0, y, "Row");
        PlayerTextDrawBackgroundColor (playerid, g_FontListPTD[playerid][FONTLIST_PTD_ROW][row], 255);
        PlayerTextDrawFont            (playerid, g_FontListPTD[playerid][FONTLIST_PTD_ROW][row], 1);
        PlayerTextDrawLetterSize      (playerid, g_FontListPTD[playerid][FONTLIST_PTD_ROW][row], 0.2, 1.0);
        PlayerTextDrawColor           (playerid, g_FontListPTD[playerid][FONTLIST_PTD_ROW][row], RGBA_WHITE);
        PlayerTextDrawSetOutline      (playerid, g_FontListPTD[playerid][FONTLIST_PTD_ROW][row], 1);
        PlayerTextDrawSetProportional (playerid, g_FontListPTD[playerid][FONTLIST_PTD_ROW][row], 1);
        PlayerTextDrawUseBox          (playerid, g_FontListPTD[playerid][FONTLIST_PTD_ROW][row], 1);
        PlayerTextDrawBoxColor        (playerid, g_FontListPTD[playerid][FONTLIST_PTD_ROW][row], 0);
        PlayerTextDrawTextSize        (playerid, g_FontListPTD[playerid][FONTLIST_PTD_ROW][row], 189.0, 10.0);
        PlayerTextDrawSetSelectable   (playerid, g_FontListPTD[playerid][FONTLIST_PTD_ROW][row], 1);
    }
}

DestroyPlayerFontList(playerid) {
    for(new ptd; ptd < MAX_FONTLIST_PTDS; ptd ++) {
        PlayerTextDrawDestroy(playerid, g_FontListPTD[playerid][ptd]);
        g_FontListPTD[playerid][ptd] = PlayerText: INVALID_TEXT_DRAW;
    }
}

ShowFontList(playerid) {
    CreatePlayerFontList(playerid);

    for(new gtd; gtd < MAX_FONTLIST_GTDS; gtd ++) {
        TextDrawShowForPlayer(playerid, g_FontListGTD[gtd]);
    }

    LoadFontListRowData(playerid);

    ApplyFontListCaption(playerid);
    PlayerTextDrawShow(playerid, g_FontListPTD[playerid][FONTLIST_PTD_CAPTION]);

    ApplyFontListPage(playerid);
    PlayerTextDrawShow(playerid, g_FontListPTD[playerid][FONTLIST_PTD_PAGE]);

    ApplyFontListSearch(playerid);
    PlayerTextDrawShow(playerid, g_FontListPTD[playerid][FONTLIST_PTD_SEARCH]);

    ApplyFontListRowData(playerid);
}

HideFontList(playerid) {
    DestroyPlayerFontList(playerid);

    for(new gtd; gtd < MAX_FONTLIST_GTDS; gtd ++) {
        TextDrawHideForPlayer(playerid, g_FontListGTD[gtd]);
    }
}

LoadFontListRowData(playerid) {
    new rows_added, max_offset;

    strunpack(g_SearchString, g_FontListData[playerid][FONTLIST_DATA_SEARCH]);

    rows_added = FindFonts(
        .result = g_FontListData[playerid][FONTLIST_DATA_ROW_FONTID],
        .result_size = MAX_FONTLIST_ROWS,
        .search = g_SearchString,
        .offset = g_FontListData[playerid][FONTLIST_DATA_PAGE] * MAX_FONTLIST_ROWS,
        .max_offset = max_offset
    );

    for(new row = rows_added; row < MAX_FONTLIST_ROWS; row ++) {
        g_FontListData[playerid][FONTLIST_DATA_ROW_FONTID][row] = INVALID_FONT_ID;
    }

    g_FontListData[playerid][FONTLIST_DATA_MAXPAGE] = max_offset / MAX_FONTLIST_ROWS;

    g_FontListData[playerid][FONTLIST_DATA_APPLIED_ROW] = GetFontListNewColoredRow(playerid);
}

GetFontListNewColoredRow(playerid) {
    new objectid = GetPlayerEditObject(playerid);
    if( !IsValidObject(objectid) ) {
        return INVALID_ROW;
    }

    new materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX];
    if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] != MATERIALINDEX_TYPE_TEXT ) {
        return INVALID_ROW;
    }

    for(new row, row_font_id; row < MAX_FONTLIST_ROWS; row ++) {
        row_font_id = g_FontListData[playerid][FONTLIST_DATA_ROW_FONTID][row];

        if( row_font_id == INVALID_FONT_ID ) {
            continue;
        }

        if( !strcmp(g_FontCache[row_font_id], g_ObjectFont[objectid-1][materialindex], true) ) {
            return row;
        }
    }
    return INVALID_ROW;
}

ApplyFontListCaption(playerid) {
    new materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX];
    format(g_TextdrawString, sizeof g_TextdrawString, "Font Index %i", materialindex);
    PlayerTextDrawSetString(playerid, g_FontListPTD[playerid][FONTLIST_PTD_CAPTION], g_TextdrawString);
}

ApplyFontListPage(playerid) {
    format(g_TextdrawString, sizeof g_TextdrawString, "Page: %i / %i", g_FontListData[playerid][FONTLIST_DATA_PAGE] + 1, g_FontListData[playerid][FONTLIST_DATA_MAXPAGE] + 1);
    PlayerTextDrawSetString(playerid, g_FontListPTD[playerid][FONTLIST_PTD_PAGE], g_TextdrawString);
}

ApplyFontListSearch(playerid) {
    strunpack(g_SearchString, g_FontListData[playerid][FONTLIST_DATA_SEARCH]);
    if( isempty(g_SearchString) ) {
        PlayerTextDrawSetString(playerid, g_FontListPTD[playerid][FONTLIST_PTD_SEARCH], "Search");
    } else {
        format(g_TextdrawString, sizeof g_TextdrawString, "Search: %s", g_SearchString);
        PlayerTextDrawSetString(playerid, g_FontListPTD[playerid][FONTLIST_PTD_SEARCH], g_TextdrawString);
    }
}

ApplyFontListRowApplied(playerid, row) {
    new
        applied_row = g_FontListData[playerid][FONTLIST_DATA_APPLIED_ROW],
        boxcolor_rgba = ( row == applied_row ) ? 0xFFFFFF64 : 0x00000000
    ;

    PlayerTextDrawBoxColor(playerid, g_FontListPTD[playerid][FONTLIST_PTD_ROW][row], boxcolor_rgba);

    PlayerTextDrawShow(playerid, g_FontListPTD[playerid][FONTLIST_PTD_ROW][row]);
}

ApplyFontListRowData(playerid) {
    for(new row, row_font_id; row < MAX_FONTLIST_ROWS; row ++) {
        row_font_id = g_FontListData[playerid][FONTLIST_DATA_ROW_FONTID][row];

        if( row_font_id == INVALID_FONT_ID ) {
            PlayerTextDrawHide(playerid, g_FontListPTD[playerid][FONTLIST_PTD_ROW][row]);
            continue;
        }

        GetFontName(row_font_id, g_FontString, sizeof g_FontString);

        PlayerTextDrawSetString(playerid, g_FontListPTD[playerid][FONTLIST_PTD_ROW][row], g_FontString);

        ApplyFontListRowApplied(playerid, row);
    }
}

ShowFontListDialog(playerid, dialogid) {
    switch( dialogid ) {
        case DIALOGID_FONTLIST_PAGE: {
            format(g_DialogInfo, sizeof g_DialogInfo, "Page: %i / %i", g_FontListData[playerid][FONTLIST_DATA_PAGE] + 1, g_FontListData[playerid][FONTLIST_DATA_MAXPAGE] + 1);
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Font List: Page", g_DialogInfo, "Enter", "Back");
        }
        case DIALOGID_FONTLIST_SEARCH: {
            strunpack(g_SearchString, g_FontListData[playerid][FONTLIST_DATA_SEARCH]);
            if( isempty(g_SearchString) ) {
                g_DialogInfo = "You are not searching for anything.";
            } else {
                format(g_DialogInfo, sizeof g_DialogInfo, "Searching for: %s", g_SearchString);
            }
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Font List: Search", g_DialogInfo, "Enter", "Back");
        }
        default: {
            return 0;
        }
    }
    return 1;
}
