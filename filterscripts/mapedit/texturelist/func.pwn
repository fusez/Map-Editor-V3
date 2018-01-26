DefaultTextureListData(playerid) {
    g_TextureListData[playerid][TEXTURELIST_DATA_PAGE] = MIN_TEXTURELIST_PAGE;

    g_TextureListData[playerid][TEXTURELIST_DATA_MAXPAGE] = MIN_TEXTURELIST_PAGE;

    g_TextureListData[playerid][TEXTURELIST_DATA_CATEGORY] = INVALID_CATEGORY_ID;

    strpack(g_TextureListData[playerid][TEXTURELIST_DATA_SEARCH], "", MAX_SEARCH_LEN+1);

    g_TextureListData[playerid][TEXTURELIST_DATA_COLORED_ROW] = INVALID_ROW;

    for(new row; row < MAX_TEXTURELIST_ROWS; row ++) {
        g_TextureListData[playerid][TEXTURELIST_DATA_ROW_TID][row] = INVALID_MODEL_ID;
    }
}

CreateGenericTextureList() {
    g_TextureListGTD[TEXTURELIST_GTD_BG] =
    TextDrawCreate          (116.0, 112.0, "_");
    TextDrawAlignment       (g_TextureListGTD[TEXTURELIST_GTD_BG], 2);
    TextDrawLetterSize      (g_TextureListGTD[TEXTURELIST_GTD_BG], 0.0, 37.2);
    TextDrawUseBox          (g_TextureListGTD[TEXTURELIST_GTD_BG], 1);
    TextDrawBoxColor        (g_TextureListGTD[TEXTURELIST_GTD_BG], 100);
    TextDrawTextSize        (g_TextureListGTD[TEXTURELIST_GTD_BG], 0.0, 230.0);

    g_TextureListGTD[TEXTURELIST_GTD_CLOSE] =
    TextDrawCreate          (221.0, 112.0, "X");
    TextDrawAlignment       (g_TextureListGTD[TEXTURELIST_GTD_CLOSE], 2);
    TextDrawBackgroundColor (g_TextureListGTD[TEXTURELIST_GTD_CLOSE], 255);
    TextDrawFont            (g_TextureListGTD[TEXTURELIST_GTD_CLOSE], 1);
    TextDrawLetterSize      (g_TextureListGTD[TEXTURELIST_GTD_CLOSE], 0.3, 1.0);
    TextDrawColor           (g_TextureListGTD[TEXTURELIST_GTD_CLOSE], RGBA_WHITE);
    TextDrawSetProportional (g_TextureListGTD[TEXTURELIST_GTD_CLOSE], 1);
    TextDrawSetOutline      (g_TextureListGTD[TEXTURELIST_GTD_CLOSE], 1);
    TextDrawUseBox          (g_TextureListGTD[TEXTURELIST_GTD_CLOSE], 1);
    TextDrawBoxColor        (g_TextureListGTD[TEXTURELIST_GTD_CLOSE], 0xFF000064);
    TextDrawTextSize        (g_TextureListGTD[TEXTURELIST_GTD_CLOSE], 10.0, 20.0);
    TextDrawSetSelectable   (g_TextureListGTD[TEXTURELIST_GTD_CLOSE], 1);

    g_TextureListGTD[TEXTURELIST_GTD_PAGE_F] =
    TextDrawCreate          (11.0, 125.0, "<<");
    TextDrawAlignment       (g_TextureListGTD[TEXTURELIST_GTD_PAGE_F], 2);
    TextDrawBackgroundColor (g_TextureListGTD[TEXTURELIST_GTD_PAGE_F], 255);
    TextDrawFont            (g_TextureListGTD[TEXTURELIST_GTD_PAGE_F], 1);
    TextDrawLetterSize      (g_TextureListGTD[TEXTURELIST_GTD_PAGE_F], 0.2, 1.0);
    TextDrawColor           (g_TextureListGTD[TEXTURELIST_GTD_PAGE_F], RGBA_WHITE);
    TextDrawSetProportional (g_TextureListGTD[TEXTURELIST_GTD_PAGE_F], 1);
    TextDrawSetOutline      (g_TextureListGTD[TEXTURELIST_GTD_PAGE_F], 1);
    TextDrawTextSize        (g_TextureListGTD[TEXTURELIST_GTD_PAGE_F], 10.0, 20.0);
    TextDrawSetSelectable   (g_TextureListGTD[TEXTURELIST_GTD_PAGE_F], 1);

    g_TextureListGTD[TEXTURELIST_GTD_PAGE_P] =
    TextDrawCreate          (34.0, 125.0, "<");
    TextDrawAlignment       (g_TextureListGTD[TEXTURELIST_GTD_PAGE_P], 2);
    TextDrawBackgroundColor (g_TextureListGTD[TEXTURELIST_GTD_PAGE_P], 255);
    TextDrawFont            (g_TextureListGTD[TEXTURELIST_GTD_PAGE_P], 1);
    TextDrawLetterSize      (g_TextureListGTD[TEXTURELIST_GTD_PAGE_P], 0.2, 1.0);
    TextDrawColor           (g_TextureListGTD[TEXTURELIST_GTD_PAGE_P], RGBA_WHITE);
    TextDrawSetProportional (g_TextureListGTD[TEXTURELIST_GTD_PAGE_P], 1);
    TextDrawSetOutline      (g_TextureListGTD[TEXTURELIST_GTD_PAGE_P], 1);
    TextDrawTextSize        (g_TextureListGTD[TEXTURELIST_GTD_PAGE_P], 10.0, 20.0);
    TextDrawSetSelectable   (g_TextureListGTD[TEXTURELIST_GTD_PAGE_P], 1);

    g_TextureListGTD[TEXTURELIST_GTD_PAGE_N] =
    TextDrawCreate          (198.0, 125.0, ">");
    TextDrawAlignment       (g_TextureListGTD[TEXTURELIST_GTD_PAGE_N], 2);
    TextDrawBackgroundColor (g_TextureListGTD[TEXTURELIST_GTD_PAGE_N], 255);
    TextDrawFont            (g_TextureListGTD[TEXTURELIST_GTD_PAGE_N], 1);
    TextDrawLetterSize      (g_TextureListGTD[TEXTURELIST_GTD_PAGE_N], 0.2, 1.0);
    TextDrawColor           (g_TextureListGTD[TEXTURELIST_GTD_PAGE_N], RGBA_WHITE);
    TextDrawSetProportional (g_TextureListGTD[TEXTURELIST_GTD_PAGE_N], 1);
    TextDrawSetOutline      (g_TextureListGTD[TEXTURELIST_GTD_PAGE_N], 1);
    TextDrawTextSize        (g_TextureListGTD[TEXTURELIST_GTD_PAGE_N], 10.0, 20.0);
    TextDrawSetSelectable   (g_TextureListGTD[TEXTURELIST_GTD_PAGE_N], 1);

    g_TextureListGTD[TEXTURELIST_GTD_PAGE_L] =
    TextDrawCreate          (221.0, 125.0, ">>");
    TextDrawAlignment       (g_TextureListGTD[TEXTURELIST_GTD_PAGE_L], 2);
    TextDrawBackgroundColor (g_TextureListGTD[TEXTURELIST_GTD_PAGE_L], 255);
    TextDrawFont            (g_TextureListGTD[TEXTURELIST_GTD_PAGE_L], 1);
    TextDrawLetterSize      (g_TextureListGTD[TEXTURELIST_GTD_PAGE_L], 0.2, 1.0);
    TextDrawColor           (g_TextureListGTD[TEXTURELIST_GTD_PAGE_L], RGBA_WHITE);
    TextDrawSetProportional (g_TextureListGTD[TEXTURELIST_GTD_PAGE_L], 1);
    TextDrawSetOutline      (g_TextureListGTD[TEXTURELIST_GTD_PAGE_L], 1);
    TextDrawTextSize        (g_TextureListGTD[TEXTURELIST_GTD_PAGE_L], 10.0, 20.0);
    TextDrawSetSelectable   (g_TextureListGTD[TEXTURELIST_GTD_PAGE_L], 1);

    g_TextureListGTD[TEXTURELIST_GTD_CATEGORY_R] =
    TextDrawCreate          (116.0, 138.0, "Reset Category");
    TextDrawAlignment       (g_TextureListGTD[TEXTURELIST_GTD_CATEGORY_R], 2);
    TextDrawBackgroundColor (g_TextureListGTD[TEXTURELIST_GTD_CATEGORY_R], 255);
    TextDrawFont            (g_TextureListGTD[TEXTURELIST_GTD_CATEGORY_R], 1);
    TextDrawLetterSize      (g_TextureListGTD[TEXTURELIST_GTD_CATEGORY_R], 0.2, 1.0);
    TextDrawColor           (g_TextureListGTD[TEXTURELIST_GTD_CATEGORY_R], RGBA_WHITE);
    TextDrawSetProportional (g_TextureListGTD[TEXTURELIST_GTD_CATEGORY_R], 1);
    TextDrawSetOutline      (g_TextureListGTD[TEXTURELIST_GTD_CATEGORY_R], 1);
    TextDrawTextSize        (g_TextureListGTD[TEXTURELIST_GTD_CATEGORY_R], 10.0, 230.0);
    TextDrawSetSelectable   (g_TextureListGTD[TEXTURELIST_GTD_CATEGORY_R], 1);

    g_TextureListGTD[TEXTURELIST_GTD_COL_MID] =
    TextDrawCreate          (1.0, 177.0, "Model ID");
    TextDrawBackgroundColor (g_TextureListGTD[TEXTURELIST_GTD_COL_MID], 255);
    TextDrawFont            (g_TextureListGTD[TEXTURELIST_GTD_COL_MID], 1);
    TextDrawLetterSize      (g_TextureListGTD[TEXTURELIST_GTD_COL_MID], 0.2, 1.0);
    TextDrawColor           (g_TextureListGTD[TEXTURELIST_GTD_COL_MID], RGBA_WHITE);
    TextDrawSetOutline      (g_TextureListGTD[TEXTURELIST_GTD_COL_MID], 1);
    TextDrawSetProportional (g_TextureListGTD[TEXTURELIST_GTD_COL_MID], 1);

    g_TextureListGTD[TEXTURELIST_GTD_COL_TXD] =
    TextDrawCreate          (43.0, 177.0, "TXD");
    TextDrawBackgroundColor (g_TextureListGTD[TEXTURELIST_GTD_COL_TXD], 255);
    TextDrawFont            (g_TextureListGTD[TEXTURELIST_GTD_COL_TXD], 1);
    TextDrawLetterSize      (g_TextureListGTD[TEXTURELIST_GTD_COL_TXD], 0.2, 1.0);
    TextDrawColor           (g_TextureListGTD[TEXTURELIST_GTD_COL_TXD], RGBA_WHITE);
    TextDrawSetOutline      (g_TextureListGTD[TEXTURELIST_GTD_COL_TXD], 1);
    TextDrawSetProportional (g_TextureListGTD[TEXTURELIST_GTD_COL_TXD], 1);

    g_TextureListGTD[TEXTURELIST_GTD_COL_NAME] =
    TextDrawCreate          (113.0, 177.0, "Name");
    TextDrawBackgroundColor (g_TextureListGTD[TEXTURELIST_GTD_COL_NAME], 255);
    TextDrawFont            (g_TextureListGTD[TEXTURELIST_GTD_COL_NAME], 1);
    TextDrawLetterSize      (g_TextureListGTD[TEXTURELIST_GTD_COL_NAME], 0.2, 1.0);
    TextDrawColor           (g_TextureListGTD[TEXTURELIST_GTD_COL_NAME], RGBA_WHITE);
    TextDrawSetOutline      (g_TextureListGTD[TEXTURELIST_GTD_COL_NAME], 1);
    TextDrawSetProportional (g_TextureListGTD[TEXTURELIST_GTD_COL_NAME], 1);
}

DestroyGenericTextureList() {
    for(new gtd; gtd < MAX_TEXTURELIST_GTDS; gtd ++) {
        TextDrawDestroy( g_TextureListGTD[gtd] );

        g_TextureListGTD[gtd] = Text: INVALID_TEXT_DRAW;
    }
}

CreatePlayerTextureList(playerid) {
    g_TextureListPTD[playerid][TEXTURELIST_PTD_CAPTION] =
    CreatePlayerTextDraw          (playerid, 2.0, 99.0, "Caption");
    PlayerTextDrawBackgroundColor (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_CAPTION], 255);
    PlayerTextDrawFont            (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_CAPTION], 0);
    PlayerTextDrawLetterSize      (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_CAPTION], 0.5, 2.0);
    PlayerTextDrawColor           (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_CAPTION], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_CAPTION], 1);
    PlayerTextDrawSetProportional (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_CAPTION], 1);

    g_TextureListPTD[playerid][TEXTURELIST_PTD_PAGE] =
    CreatePlayerTextDraw          (playerid, 116.0, 125.0, "Page");
    PlayerTextDrawAlignment       (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_PAGE], 2);
    PlayerTextDrawBackgroundColor (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_PAGE], 255);
    PlayerTextDrawFont            (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_PAGE], 1);
    PlayerTextDrawLetterSize      (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_PAGE], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_PAGE], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_PAGE], 1);
    PlayerTextDrawSetProportional (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_PAGE], 1);
    PlayerTextDrawTextSize        (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_PAGE], 10.0, 138.0);
    PlayerTextDrawSetSelectable   (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_PAGE], 1);

    g_TextureListPTD[playerid][TEXTURELIST_PTD_CATEGORY] =
    CreatePlayerTextDraw          (playerid, 116.0, 151.0, "Category");
    PlayerTextDrawAlignment       (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_CATEGORY], 2);
    PlayerTextDrawBackgroundColor (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_CATEGORY], 255);
    PlayerTextDrawFont            (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_CATEGORY], 1);
    PlayerTextDrawLetterSize      (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_CATEGORY], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_CATEGORY], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_CATEGORY], 1);
    PlayerTextDrawSetProportional (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_CATEGORY], 1);
    PlayerTextDrawTextSize        (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_CATEGORY], 10.0, 230.0);
    PlayerTextDrawSetSelectable   (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_CATEGORY], 1);

    g_TextureListPTD[playerid][TEXTURELIST_PTD_SEARCH] =
    CreatePlayerTextDraw          (playerid, 116.0, 164.0, "Search:");
    PlayerTextDrawAlignment       (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_SEARCH], 2);
    PlayerTextDrawBackgroundColor (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_SEARCH], 255);
    PlayerTextDrawFont            (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_SEARCH], 1);
    PlayerTextDrawLetterSize      (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_SEARCH], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_SEARCH], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_SEARCH], 1);
    PlayerTextDrawSetProportional (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_SEARCH], 1);
    PlayerTextDrawTextSize        (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_SEARCH], 10.0, 230.0);
    PlayerTextDrawSetSelectable   (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_SEARCH], 1);

    for(new row, Float:y = 190.0; row < MAX_TEXTURELIST_ROWS; row ++, y += 13.0) {
        g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_MID][row] =
        CreatePlayerTextDraw          (playerid, 1.0, y, "ROW");
        PlayerTextDrawBackgroundColor (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_MID][row], 255);
        PlayerTextDrawFont            (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_MID][row], 1);
        PlayerTextDrawLetterSize      (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_MID][row], 0.2, 1.0);
        PlayerTextDrawColor           (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_MID][row], RGBA_WHITE);
        PlayerTextDrawSetOutline      (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_MID][row], 1);
        PlayerTextDrawSetProportional (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_MID][row], 1);
        PlayerTextDrawUseBox          (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_MID][row], 1);
        PlayerTextDrawBoxColor        (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_MID][row], 0);
        PlayerTextDrawTextSize        (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_MID][row], 40.0, 10.0);
        PlayerTextDrawSetSelectable   (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_MID][row], 1);

        g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_TXD][row] =
        CreatePlayerTextDraw          (playerid, 43.0, y, "ROW");
        PlayerTextDrawBackgroundColor (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_TXD][row], 255);
        PlayerTextDrawFont            (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_TXD][row], 1);
        PlayerTextDrawLetterSize      (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_TXD][row], 0.2, 1.0);
        PlayerTextDrawColor           (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_TXD][row], RGBA_WHITE);
        PlayerTextDrawSetOutline      (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_TXD][row], 1);
        PlayerTextDrawSetProportional (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_TXD][row], 1);
        PlayerTextDrawUseBox          (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_TXD][row], 1);
        PlayerTextDrawBoxColor        (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_TXD][row], 0);
        PlayerTextDrawTextSize        (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_TXD][row], 110.0, 10.0);
        PlayerTextDrawSetSelectable   (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_TXD][row], 1);

        g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_NAME][row] =
        CreatePlayerTextDraw          (playerid, 113.0, y, "ROW");
        PlayerTextDrawBackgroundColor (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_NAME][row], 255);
        PlayerTextDrawFont            (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_NAME][row], 1);
        PlayerTextDrawLetterSize      (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_NAME][row], 0.2, 1.0);
        PlayerTextDrawColor           (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_NAME][row], RGBA_WHITE);
        PlayerTextDrawSetOutline      (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_NAME][row], 1);
        PlayerTextDrawSetProportional (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_NAME][row], 1);
        PlayerTextDrawUseBox          (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_NAME][row], 1);
        PlayerTextDrawBoxColor        (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_NAME][row], 0);
        PlayerTextDrawTextSize        (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_NAME][row], 231.0, 10.0);
        PlayerTextDrawSetSelectable   (playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_NAME][row], 1);
    }
}

DestroyPlayerTextureList(playerid) {
    for(new ptd; ptd < MAX_TEXTURELIST_PTDS; ptd ++) {
        PlayerTextDrawDestroy(playerid, g_TextureListPTD[playerid][ptd]);

        g_TextureListPTD[playerid][ptd] = PlayerText: INVALID_TEXT_DRAW;
    }
}

ShowTextureList(playerid) {
    CreatePlayerTextureList(playerid);

    for(new gtd; gtd < MAX_TEXTURELIST_GTDS; gtd ++) {
        TextDrawShowForPlayer(playerid, g_TextureListGTD[gtd]);
    }

    LoadTextureListRowData(playerid);

    ApplyTextureListCaption(playerid);
    PlayerTextDrawShow(playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_CAPTION]);

    ApplyTextureListPage(playerid);
    PlayerTextDrawShow(playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_PAGE]);

    ApplyTextureListCategory(playerid);
    PlayerTextDrawShow(playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_CATEGORY]);

    ApplyTextureListSearch(playerid);
    PlayerTextDrawShow(playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_SEARCH]);

    ApplyTextureListRowData(playerid);
}

HideTextureList(playerid) {
    DestroyPlayerTextureList(playerid);

    for(new gtd; gtd < MAX_TEXTURELIST_GTDS; gtd ++) {
        TextDrawHideForPlayer(playerid, g_TextureListGTD[gtd]);
    }
}

GetTextureListNewColoredRow(playerid) {
    new objectid = GetPlayerEditObject(playerid);
    if( !IsValidObject(objectid) ) {
        return INVALID_ROW;
    }

    new materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX];
    if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] != MATERIALINDEX_TYPE_TEXTURE ) {
        return INVALID_ROW;
    }

    new obj_texture_id = g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TEXTURE][materialindex];
    if( obj_texture_id == INVALID_TEXTURE_ID ) {
        return INVALID_ROW;
    }

    for(new row, row_texture_id; row < MAX_TEXTURELIST_ROWS; row ++) {
        row_texture_id = g_TextureListData[playerid][TEXTURELIST_DATA_ROW_TID][row];

        if( row_texture_id == obj_texture_id ) {
            return row;
        }
    }
    return INVALID_ROW;
}

ApplyTextureListCaption(playerid) {
    format(g_TextdrawString, sizeof g_TextdrawString, "Texture Index %i", g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX]);
    PlayerTextDrawSetString(playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_CAPTION], g_TextdrawString);
}

ApplyTextureListPage(playerid) {
    format(g_TextdrawString, sizeof g_TextdrawString, "Page %i / %i", g_TextureListData[playerid][TEXTURELIST_DATA_PAGE] + 1, g_TextureListData[playerid][TEXTURELIST_DATA_MAXPAGE] + 1);
    PlayerTextDrawSetString(playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_PAGE], g_TextdrawString);
}

ApplyTextureListCategory(playerid) {
    new categoryid = g_TextureListData[playerid][TEXTURELIST_DATA_CATEGORY];
    if( categoryid == INVALID_CATEGORY_ID ) {
        PlayerTextDrawSetString(playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_CATEGORY], "Category");
    } else {
        GetTextureCategoryName(categoryid, g_CategoryNameString, sizeof g_CategoryNameString);
        format(g_TextdrawString, sizeof g_TextdrawString, "Category: %s", g_CategoryNameString);
        PlayerTextDrawSetString(playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_CATEGORY], g_TextdrawString);
    }
    return 1;
}

ApplyTextureListSearch(playerid) {
    strunpack(g_SearchString, g_TextureListData[playerid][TEXTURELIST_DATA_SEARCH], sizeof g_SearchString);
    if( isempty(g_SearchString) ) {
        PlayerTextDrawSetString(playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_SEARCH], "Search");
    } else {
        format(g_TextdrawString, sizeof g_TextdrawString, "Search: %s", g_SearchString);
        PlayerTextDrawSetString(playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_SEARCH], g_TextdrawString);
    }
}

ApplyTextureListRowColor(playerid, row) {
    new
        colored_row = g_TextureListData[playerid][TEXTURELIST_DATA_COLORED_ROW],
        rgba_boxcolor = ( row == colored_row ) ? 0xFFFFFF64 : 0x00000000
    ;

    PlayerTextDrawBoxColor(playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_MID][row],  rgba_boxcolor);
    PlayerTextDrawBoxColor(playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_TXD][row],  rgba_boxcolor);
    PlayerTextDrawBoxColor(playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_NAME][row], rgba_boxcolor);

    PlayerTextDrawShow(playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_MID][row]);
    PlayerTextDrawShow(playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_TXD][row]);
    PlayerTextDrawShow(playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_NAME][row]);
    return 1;
}

ApplyTextureListRowData(playerid) {
    for(new row, row_texture_id, modelid; row < MAX_TEXTURELIST_ROWS; row ++) {
        row_texture_id = g_TextureListData[playerid][TEXTURELIST_DATA_ROW_TID][row];

        if( row_texture_id == INVALID_TEXTURE_ID ) {
            PlayerTextDrawHide(playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_MID][row]);
            PlayerTextDrawHide(playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_TXD][row]);
            PlayerTextDrawHide(playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_NAME][row]);
            continue;
        }

        GetTextureData(row_texture_id, modelid, g_TextureTXDString, sizeof g_TextureTXDString, g_TextureNameString, sizeof g_TextureNameString);

        format(g_IntegerString, sizeof g_IntegerString, "%i", modelid);

        PlayerTextDrawSetString(playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_MID][row],  g_IntegerString);
        PlayerTextDrawSetString(playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_TXD][row],  g_TextureTXDString);
        PlayerTextDrawSetString(playerid, g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_NAME][row], g_TextureNameString);

        ApplyTextureListRowColor(playerid, row);
    }
}

LoadTextureListRowData(playerid) {
    new rows_added, max_offset;

    strunpack(g_SearchString, g_TextureListData[playerid][TEXTURELIST_DATA_SEARCH]);

    rows_added = FindTextures(
        .result = g_TextureListData[playerid][TEXTURELIST_DATA_ROW_TID],
        .result_size = MAX_TEXTURELIST_ROWS,
        .search = g_SearchString,
        .categoryid = g_TextureListData[playerid][TEXTURELIST_DATA_CATEGORY],
        .offset = g_TextureListData[playerid][TEXTURELIST_DATA_PAGE] * MAX_TEXTURELIST_ROWS,
        .max_offset = max_offset
    );

    for(new row = rows_added; row < MAX_TEXTURELIST_ROWS; row ++) {
        g_TextureListData[playerid][TEXTURELIST_DATA_ROW_TID][row] = INVALID_TEXTURE_ID;
    }

    g_TextureListData[playerid][TEXTURELIST_DATA_MAXPAGE] = max_offset / MAX_TEXTURELIST_ROWS;

    g_TextureListData[playerid][TEXTURELIST_DATA_COLORED_ROW] = GetTextureListNewColoredRow(playerid);
}

ShowTextureListDialog(playerid, dialogid) {
    switch( dialogid ) {
        case DIALOGID_TEXTURELIST_PAGE: {
            format(g_DialogInfo, sizeof g_DialogInfo, "Page: %i / %i", g_TextureListData[playerid][TEXTURELIST_DATA_PAGE] + 1, g_TextureListData[playerid][TEXTURELIST_DATA_MAXPAGE] + 1);
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Texture List: Page", g_DialogInfo, "Enter", "Back");
        }
        case DIALOGID_TEXTURELIST_SEARCH: {
            strunpack(g_SearchString, g_TextureListData[playerid][TEXTURELIST_DATA_SEARCH], sizeof g_SearchString);
            if( isempty(g_SearchString) ) {
                g_DialogInfo = "You are not searching for anything.";
            } else {
                format(g_DialogInfo, sizeof g_DialogInfo, "Searching for: %s", g_SearchString);
            }

            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Texture List: Search", g_DialogInfo, "Enter", "Back");
        }
        default: {
            return 0;
        }
    }
    return 1;
}
