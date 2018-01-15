DefaultCreateListData(playerid) {
    g_CreateObjListData    [playerid][CREATELIST_DATA_PAGE] = MIN_CREATELIST_PAGE;
    g_CreateVehListData    [playerid][CREATELIST_DATA_PAGE] = MIN_CREATELIST_PAGE;
    g_CreatePickListData   [playerid][CREATELIST_DATA_PAGE] = MIN_CREATELIST_PAGE;
    g_CreateActListData    [playerid][CREATELIST_DATA_PAGE] = MIN_CREATELIST_PAGE;
    g_CreateAttachListData [playerid][CREATELIST_DATA_PAGE] = MIN_CREATELIST_PAGE;

    g_CreateObjListData    [playerid][CREATELIST_DATA_MAX_PAGE] = MIN_CREATELIST_PAGE;
    g_CreateVehListData    [playerid][CREATELIST_DATA_MAX_PAGE] = MIN_CREATELIST_PAGE;
    g_CreatePickListData   [playerid][CREATELIST_DATA_MAX_PAGE] = MIN_CREATELIST_PAGE;
    g_CreateActListData    [playerid][CREATELIST_DATA_MAX_PAGE] = MIN_CREATELIST_PAGE;
    g_CreateAttachListData [playerid][CREATELIST_DATA_MAX_PAGE] = MIN_CREATELIST_PAGE;

    g_CreateObjListData    [playerid][CREATELIST_DATA_CATEGORY] = INVALID_CATEGORY_ID;
    g_CreateVehListData    [playerid][CREATELIST_DATA_CATEGORY] = INVALID_CATEGORY_ID;
    g_CreatePickListData   [playerid][CREATELIST_DATA_CATEGORY] = INVALID_CATEGORY_ID;
    g_CreateActListData    [playerid][CREATELIST_DATA_CATEGORY] = INVALID_CATEGORY_ID;
    g_CreateAttachListData [playerid][CREATELIST_DATA_CATEGORY] = INVALID_CATEGORY_ID;

    strpack(g_CreateObjListData    [playerid][CREATELIST_DATA_SEARCH], "", MAX_SEARCH_LEN+1);
    strpack(g_CreateVehListData    [playerid][CREATELIST_DATA_SEARCH], "", MAX_SEARCH_LEN+1);
    strpack(g_CreatePickListData   [playerid][CREATELIST_DATA_SEARCH], "", MAX_SEARCH_LEN+1);
    strpack(g_CreateActListData    [playerid][CREATELIST_DATA_SEARCH], "", MAX_SEARCH_LEN+1);
    strpack(g_CreateAttachListData [playerid][CREATELIST_DATA_SEARCH], "", MAX_SEARCH_LEN+1);

    g_CreateObjListData    [playerid][CREATELIST_DATA_SELECT_ID] = INVALID_MODEL_ID;
    g_CreateVehListData    [playerid][CREATELIST_DATA_SELECT_ID] = INVALID_MODEL_ID;
    g_CreatePickListData   [playerid][CREATELIST_DATA_SELECT_ID] = INVALID_MODEL_ID;
    g_CreateActListData    [playerid][CREATELIST_DATA_SELECT_ID] = INVALID_MODEL_ID;
    g_CreateAttachListData [playerid][CREATELIST_DATA_SELECT_ID] = INVALID_MODEL_ID;

    g_CreateObjListData    [playerid][CREATELIST_DATA_SELECT_ROW] = INVALID_ROW;
    g_CreateVehListData    [playerid][CREATELIST_DATA_SELECT_ROW] = INVALID_ROW;
    g_CreatePickListData   [playerid][CREATELIST_DATA_SELECT_ROW] = INVALID_ROW;
    g_CreateActListData    [playerid][CREATELIST_DATA_SELECT_ROW] = INVALID_ROW;
    g_CreateAttachListData [playerid][CREATELIST_DATA_SELECT_ROW] = INVALID_ROW;

    for(new row; row < MAX_CREATELIST_ROWS; row ++) {
        g_CreateObjListData    [playerid][CREATELIST_DATA_ROW_ID][row] = INVALID_MODEL_ID;
        g_CreateVehListData    [playerid][CREATELIST_DATA_ROW_ID][row] = INVALID_MODEL_ID;
        g_CreatePickListData   [playerid][CREATELIST_DATA_ROW_ID][row] = INVALID_MODEL_ID;
        g_CreateActListData    [playerid][CREATELIST_DATA_ROW_ID][row] = INVALID_MODEL_ID;
        g_CreateAttachListData [playerid][CREATELIST_DATA_ROW_ID][row] = INVALID_MODEL_ID;
    }
}

CreateGenericCreateList() {
    g_CreateListGTD[CREATELIST_GTD_BG] =
    TextDrawCreate          (116.0, 112.0, "_");
    TextDrawAlignment       (g_CreateListGTD[CREATELIST_GTD_BG], 2);
    TextDrawLetterSize      (g_CreateListGTD[CREATELIST_GTD_BG], 0.0, 37.1);
    TextDrawUseBox          (g_CreateListGTD[CREATELIST_GTD_BG], 1);
    TextDrawBoxColor        (g_CreateListGTD[CREATELIST_GTD_BG], 100);
    TextDrawTextSize        (g_CreateListGTD[CREATELIST_GTD_BG], 0.0, 230.0);

    g_CreateListGTD[CREATELIST_GTD_CLOSE] =
    TextDrawCreate          (221.0, 112.0, "X");
    TextDrawAlignment       (g_CreateListGTD[CREATELIST_GTD_CLOSE], 2);
    TextDrawBackgroundColor (g_CreateListGTD[CREATELIST_GTD_CLOSE], 255);
    TextDrawFont            (g_CreateListGTD[CREATELIST_GTD_CLOSE], 1);
    TextDrawLetterSize      (g_CreateListGTD[CREATELIST_GTD_CLOSE], 0.3, 1.0);
    TextDrawColor           (g_CreateListGTD[CREATELIST_GTD_CLOSE], RGBA_WHITE);
    TextDrawSetOutline      (g_CreateListGTD[CREATELIST_GTD_CLOSE], 1);
    TextDrawSetProportional (g_CreateListGTD[CREATELIST_GTD_CLOSE], 1);
    TextDrawUseBox          (g_CreateListGTD[CREATELIST_GTD_CLOSE], 1);
    TextDrawBoxColor        (g_CreateListGTD[CREATELIST_GTD_CLOSE], 0xFF000064);
    TextDrawTextSize        (g_CreateListGTD[CREATELIST_GTD_CLOSE], 10.0, 20.0);
    TextDrawSetSelectable   (g_CreateListGTD[CREATELIST_GTD_CLOSE], 1);

    g_CreateListGTD[CREATELIST_GTD_PAGE_F] =
    TextDrawCreate          (11.0, 125.0, "<<");
    TextDrawAlignment       (g_CreateListGTD[CREATELIST_GTD_PAGE_F], 2);
    TextDrawBackgroundColor (g_CreateListGTD[CREATELIST_GTD_PAGE_F], 255);
    TextDrawFont            (g_CreateListGTD[CREATELIST_GTD_PAGE_F], 1);
    TextDrawLetterSize      (g_CreateListGTD[CREATELIST_GTD_PAGE_F], 0.2, 1.0);
    TextDrawColor           (g_CreateListGTD[CREATELIST_GTD_PAGE_F], RGBA_WHITE);
    TextDrawSetOutline      (g_CreateListGTD[CREATELIST_GTD_PAGE_F], 1);
    TextDrawSetProportional (g_CreateListGTD[CREATELIST_GTD_PAGE_F], 1);
    TextDrawTextSize        (g_CreateListGTD[CREATELIST_GTD_PAGE_F], 10.0, 20.0);
    TextDrawSetSelectable   (g_CreateListGTD[CREATELIST_GTD_PAGE_F], 1);

    g_CreateListGTD[CREATELIST_GTD_PAGE_P] =
    TextDrawCreate          (34.0, 125.0, "<");
    TextDrawAlignment       (g_CreateListGTD[CREATELIST_GTD_PAGE_P], 2);
    TextDrawBackgroundColor (g_CreateListGTD[CREATELIST_GTD_PAGE_P], 255);
    TextDrawFont            (g_CreateListGTD[CREATELIST_GTD_PAGE_P], 1);
    TextDrawLetterSize      (g_CreateListGTD[CREATELIST_GTD_PAGE_P], 0.2, 1.0);
    TextDrawColor           (g_CreateListGTD[CREATELIST_GTD_PAGE_P], RGBA_WHITE);
    TextDrawSetOutline      (g_CreateListGTD[CREATELIST_GTD_PAGE_P], 1);
    TextDrawSetProportional (g_CreateListGTD[CREATELIST_GTD_PAGE_P], 1);
    TextDrawTextSize        (g_CreateListGTD[CREATELIST_GTD_PAGE_P], 10.0, 20.0);
    TextDrawSetSelectable   (g_CreateListGTD[CREATELIST_GTD_PAGE_P], 1);

    g_CreateListGTD[CREATELIST_GTD_PAGE_N] =
    TextDrawCreate          (198.0, 125.0, ">");
    TextDrawAlignment       (g_CreateListGTD[CREATELIST_GTD_PAGE_N], 2);
    TextDrawBackgroundColor (g_CreateListGTD[CREATELIST_GTD_PAGE_N], 255);
    TextDrawFont            (g_CreateListGTD[CREATELIST_GTD_PAGE_N], 1);
    TextDrawLetterSize      (g_CreateListGTD[CREATELIST_GTD_PAGE_N], 0.2, 1.0);
    TextDrawColor           (g_CreateListGTD[CREATELIST_GTD_PAGE_N], RGBA_WHITE);
    TextDrawSetOutline      (g_CreateListGTD[CREATELIST_GTD_PAGE_N], 1);
    TextDrawSetProportional (g_CreateListGTD[CREATELIST_GTD_PAGE_N], 1);
    TextDrawTextSize        (g_CreateListGTD[CREATELIST_GTD_PAGE_N], 10.0, 20.0);
    TextDrawSetSelectable   (g_CreateListGTD[CREATELIST_GTD_PAGE_N], 1);

    g_CreateListGTD[CREATELIST_GTD_PAGE_L] =
    TextDrawCreate          (221.0, 125.0, ">>");
    TextDrawAlignment       (g_CreateListGTD[CREATELIST_GTD_PAGE_L], 2);
    TextDrawBackgroundColor (g_CreateListGTD[CREATELIST_GTD_PAGE_L], 255);
    TextDrawFont            (g_CreateListGTD[CREATELIST_GTD_PAGE_L], 1);
    TextDrawLetterSize      (g_CreateListGTD[CREATELIST_GTD_PAGE_L], 0.2, 1.0);
    TextDrawColor           (g_CreateListGTD[CREATELIST_GTD_PAGE_L], RGBA_WHITE);
    TextDrawSetOutline      (g_CreateListGTD[CREATELIST_GTD_PAGE_L], 1);
    TextDrawSetProportional (g_CreateListGTD[CREATELIST_GTD_PAGE_L], 1);
    TextDrawTextSize        (g_CreateListGTD[CREATELIST_GTD_PAGE_L], 10.0, 20.0);
    TextDrawSetSelectable   (g_CreateListGTD[CREATELIST_GTD_PAGE_L], 1);

    g_CreateListGTD[CREATELIST_GTD_CATEGORY_R] =
    TextDrawCreate          (116.0, 138.0, "Reset Category");
    TextDrawAlignment       (g_CreateListGTD[CREATELIST_GTD_CATEGORY_R], 2);
    TextDrawBackgroundColor (g_CreateListGTD[CREATELIST_GTD_CATEGORY_R], 255);
    TextDrawFont            (g_CreateListGTD[CREATELIST_GTD_CATEGORY_R], 1);
    TextDrawLetterSize      (g_CreateListGTD[CREATELIST_GTD_CATEGORY_R], 0.2, 1.0);
    TextDrawColor           (g_CreateListGTD[CREATELIST_GTD_CATEGORY_R], RGBA_WHITE);
    TextDrawSetOutline      (g_CreateListGTD[CREATELIST_GTD_CATEGORY_R], 1);
    TextDrawSetProportional (g_CreateListGTD[CREATELIST_GTD_CATEGORY_R], 1);
    TextDrawTextSize        (g_CreateListGTD[CREATELIST_GTD_CATEGORY_R], 10.0, 230.0);
    TextDrawSetSelectable   (g_CreateListGTD[CREATELIST_GTD_CATEGORY_R], 1);

    g_CreateListGTD[CREATELIST_GTD_ID_COL] =
    TextDrawCreate          (1.0, 177.0, "Model ID");
    TextDrawBackgroundColor (g_CreateListGTD[CREATELIST_GTD_ID_COL], 255);
    TextDrawFont            (g_CreateListGTD[CREATELIST_GTD_ID_COL], 1);
    TextDrawLetterSize      (g_CreateListGTD[CREATELIST_GTD_ID_COL], 0.2, 1.0);
    TextDrawColor           (g_CreateListGTD[CREATELIST_GTD_ID_COL], RGBA_WHITE);
    TextDrawSetOutline      (g_CreateListGTD[CREATELIST_GTD_ID_COL], 1);
    TextDrawSetProportional (g_CreateListGTD[CREATELIST_GTD_ID_COL], 1);
    TextDrawTextSize        (g_CreateListGTD[CREATELIST_GTD_ID_COL], 40.0, 10.0);

    g_CreateListGTD[CREATELIST_GTD_NAME_COL] =
    TextDrawCreate          (43.0, 177.0, "Name");
    TextDrawBackgroundColor (g_CreateListGTD[CREATELIST_GTD_NAME_COL], 255);
    TextDrawFont            (g_CreateListGTD[CREATELIST_GTD_NAME_COL], 1);
    TextDrawLetterSize      (g_CreateListGTD[CREATELIST_GTD_NAME_COL], 0.2, 1.0);
    TextDrawColor           (g_CreateListGTD[CREATELIST_GTD_NAME_COL], RGBA_WHITE);
    TextDrawSetOutline      (g_CreateListGTD[CREATELIST_GTD_NAME_COL], 1);
    TextDrawSetProportional (g_CreateListGTD[CREATELIST_GTD_NAME_COL], 1);
    TextDrawTextSize        (g_CreateListGTD[CREATELIST_GTD_NAME_COL], 231.0, 10.0);
}

DestroyGenericCreateList() {
    for(new gtd; gtd < MAX_CREATELIST_GTDS; gtd ++) {
        TextDrawDestroy( g_CreateListGTD[gtd] );

        g_CreateListGTD[gtd] = Text: INVALID_TEXT_DRAW;
    }
}

CreatePlayerCreateList(playerid) {
    g_CreateListPTD[playerid][CREATELIST_PTD_CAPTION] =
    CreatePlayerTextDraw          (playerid, 3.0, 99.0, "Caption");
    PlayerTextDrawBackgroundColor (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_CAPTION], 255);
    PlayerTextDrawFont            (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_CAPTION], 0);
    PlayerTextDrawLetterSize      (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_CAPTION], 0.5, 2.0);
    PlayerTextDrawColor           (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_CAPTION], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_CAPTION], 1);
    PlayerTextDrawSetProportional (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_CAPTION], 1);

    g_CreateListPTD[playerid][CREATELIST_PTD_PAGE] =
    CreatePlayerTextDraw          (playerid, 116.0, 125.0, "Page");
    PlayerTextDrawAlignment       (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_PAGE], 2);
    PlayerTextDrawBackgroundColor (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_PAGE], 255);
    PlayerTextDrawFont            (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_PAGE], 1);
    PlayerTextDrawLetterSize      (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_PAGE], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_PAGE], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_PAGE], 1);
    PlayerTextDrawSetProportional (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_PAGE], 1);
    PlayerTextDrawTextSize        (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_PAGE], 10.0, 138.0);
    PlayerTextDrawSetSelectable   (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_PAGE], 1);

    g_CreateListPTD[playerid][CREATELIST_PTD_CATEGORY] =
    CreatePlayerTextDraw          (playerid, 116.0, 151.0, "Category");
    PlayerTextDrawAlignment       (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_CATEGORY], 2);
    PlayerTextDrawBackgroundColor (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_CATEGORY], 255);
    PlayerTextDrawFont            (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_CATEGORY], 1);
    PlayerTextDrawLetterSize      (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_CATEGORY], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_CATEGORY], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_CATEGORY], 1);
    PlayerTextDrawSetProportional (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_CATEGORY], 1);
    PlayerTextDrawTextSize        (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_CATEGORY], 10.0, 230.0);
    PlayerTextDrawSetSelectable   (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_CATEGORY], 1);

    g_CreateListPTD[playerid][CREATELIST_PTD_SEARCH] =
    CreatePlayerTextDraw          (playerid, 116.0, 164.0, "Search");
    PlayerTextDrawAlignment       (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_SEARCH], 2);
    PlayerTextDrawBackgroundColor (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_SEARCH], 255);
    PlayerTextDrawFont            (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_SEARCH], 1);
    PlayerTextDrawLetterSize      (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_SEARCH], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_SEARCH], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_SEARCH], 1);
    PlayerTextDrawSetProportional (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_SEARCH], 1);
    PlayerTextDrawTextSize        (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_SEARCH], 10.0, 230.0);
    PlayerTextDrawSetSelectable   (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_SEARCH], 1);

    for(new row, Float:y = 190.0; row < MAX_CREATELIST_ROWS; row ++, y += 13.0) {
        g_CreateListPTD[playerid][CREATELIST_PTD_ID_ROW][row] =
        CreatePlayerTextDraw          (playerid, 1.0, y, "ID");
        PlayerTextDrawBackgroundColor (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_ID_ROW][row], 255);
        PlayerTextDrawFont            (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_ID_ROW][row], 1);
        PlayerTextDrawLetterSize      (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_ID_ROW][row], 0.2, 1.0);
        PlayerTextDrawColor           (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_ID_ROW][row], RGBA_WHITE);
        PlayerTextDrawSetOutline      (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_ID_ROW][row], 1);
        PlayerTextDrawSetProportional (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_ID_ROW][row], 1);
        PlayerTextDrawUseBox          (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_ID_ROW][row], 1);
        PlayerTextDrawBoxColor        (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_ID_ROW][row], 100);
        PlayerTextDrawTextSize        (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_ID_ROW][row], 40.0, 10.0);
        PlayerTextDrawSetSelectable   (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_ID_ROW][row], 1);

        g_CreateListPTD[playerid][CREATELIST_PTD_NAME_ROW][row] =
        CreatePlayerTextDraw          (playerid, 43.0, y, "Name");
        PlayerTextDrawBackgroundColor (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_NAME_ROW][row], 255);
        PlayerTextDrawFont            (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_NAME_ROW][row], 1);
        PlayerTextDrawLetterSize      (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_NAME_ROW][row], 0.2, 1.0);
        PlayerTextDrawColor           (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_NAME_ROW][row], RGBA_WHITE);
        PlayerTextDrawSetOutline      (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_NAME_ROW][row], 1);
        PlayerTextDrawSetProportional (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_NAME_ROW][row], 1);
        PlayerTextDrawUseBox          (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_NAME_ROW][row], 1);
        PlayerTextDrawBoxColor        (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_NAME_ROW][row], 100);
        PlayerTextDrawTextSize        (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_NAME_ROW][row], 231.0, 10.0);
        PlayerTextDrawSetSelectable   (playerid, g_CreateListPTD[playerid][CREATELIST_PTD_NAME_ROW][row], 1);
    }
}

DestroyPlayerCreateList(playerid) {
    for(new ptd; ptd < MAX_CREATELIST_PTDS; ptd ++) {
        PlayerTextDrawDestroy(playerid, g_CreateListPTD[playerid][ptd]);

        g_CreateListPTD[playerid][ptd] = PlayerText: INVALID_TEXT_DRAW;
    }
}

ShowCreateList(playerid) {
    CreatePlayerCreateList(playerid);

    for(new gtd; gtd < MAX_CREATELIST_GTDS; gtd ++) {
        TextDrawShowForPlayer(playerid, g_CreateListGTD[gtd]);
    }

    LoadCreateListRowData(playerid);

    ApplyCreateListCaption(playerid);
    PlayerTextDrawShow(playerid, g_CreateListPTD[playerid][CREATELIST_PTD_CAPTION]);

    ApplyCreateListPage(playerid);
    PlayerTextDrawShow(playerid, g_CreateListPTD[playerid][CREATELIST_PTD_PAGE]);

    ApplyCreateListCategory(playerid);
    PlayerTextDrawShow(playerid, g_CreateListPTD[playerid][CREATELIST_PTD_CATEGORY]);

    ApplyCreateListSearch(playerid);
    PlayerTextDrawShow(playerid, g_CreateListPTD[playerid][CREATELIST_PTD_SEARCH]);

    ApplyCreateListRowData(playerid);

    g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] = GetCreateListSelectModelID(playerid);

    if( !g_ModelViewData[playerid][MODELVIEW_DATA_TOGGLE] && g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] != INVALID_MODEL_ID ) {
        ShowModelView(playerid);
    }
}

HideCreateList(playerid) {
    HideModelView(playerid);

    for(new gtd; gtd < MAX_CREATELIST_GTDS; gtd ++) {
        TextDrawHideForPlayer(playerid, g_CreateListGTD[gtd]);
    }

    DestroyPlayerCreateList(playerid);
}

GetCreateListPage(playerid) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CREATELIST_OBJECT: {
            return g_CreateObjListData [playerid][CREATELIST_DATA_PAGE];
        }
        case TDMODE_CREATELIST_VEHICLE: {
            return g_CreateVehListData [playerid][CREATELIST_DATA_PAGE];
        }
        case TDMODE_CREATELIST_PICKUP: {
            return g_CreatePickListData[playerid][CREATELIST_DATA_PAGE];
        }
        case TDMODE_CREATELIST_ACTOR: {
            return g_CreateActListData [playerid][CREATELIST_DATA_PAGE];
        }
        case TDMODE_CREATELIST_ATTACH: {
            return g_CreateAttachListData [playerid][CREATELIST_DATA_PAGE];
        }
    }
    return MIN_CREATELIST_PAGE;
}

SetCreateListPage(playerid, page) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CREATELIST_OBJECT: {
            g_CreateObjListData    [playerid][CREATELIST_DATA_PAGE] = page;
        }
        case TDMODE_CREATELIST_VEHICLE: {
            g_CreateVehListData    [playerid][CREATELIST_DATA_PAGE] = page;
        }
        case TDMODE_CREATELIST_PICKUP: {
            g_CreatePickListData   [playerid][CREATELIST_DATA_PAGE] = page;
        }
        case TDMODE_CREATELIST_ACTOR: {
            g_CreateActListData    [playerid][CREATELIST_DATA_PAGE] = page;
        }
        case TDMODE_CREATELIST_ATTACH: {
            g_CreateAttachListData [playerid][CREATELIST_DATA_PAGE] = page;
        }
        default: {
            return 0;
        }
    }
    return 1;
}

GetCreateListMaxPage(playerid) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CREATELIST_OBJECT: {
            return g_CreateObjListData[playerid][CREATELIST_DATA_MAX_PAGE];
        }
        case TDMODE_CREATELIST_VEHICLE: {
            return g_CreateVehListData[playerid][CREATELIST_DATA_MAX_PAGE];
        }
        case TDMODE_CREATELIST_PICKUP: {
            return g_CreatePickListData[playerid][CREATELIST_DATA_MAX_PAGE];
        }
        case TDMODE_CREATELIST_ACTOR: {
            return g_CreateActListData[playerid][CREATELIST_DATA_MAX_PAGE];
        }
        case TDMODE_CREATELIST_ATTACH: {
            return g_CreateAttachListData[playerid][CREATELIST_DATA_MAX_PAGE];
        }
    }
    return 0;
}

GetCreateListSearch(playerid, search[], search_size) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CREATELIST_OBJECT: {
            strunpack(search, g_CreateObjListData    [playerid][CREATELIST_DATA_SEARCH], search_size);
        }
        case TDMODE_CREATELIST_VEHICLE: {
            strunpack(search, g_CreateVehListData    [playerid][CREATELIST_DATA_SEARCH], search_size);
        }
        case TDMODE_CREATELIST_PICKUP: {
            strunpack(search, g_CreatePickListData   [playerid][CREATELIST_DATA_SEARCH], search_size);
        }
        case TDMODE_CREATELIST_ACTOR: {
            strunpack(search, g_CreateActListData    [playerid][CREATELIST_DATA_SEARCH], search_size);
        }
        case TDMODE_CREATELIST_ATTACH: {
            strunpack(search, g_CreateAttachListData [playerid][CREATELIST_DATA_SEARCH], search_size);
        }
        default: {
            return 0;
        }
    }
    return 1;
}

SetCreateListSearch(playerid, search[]) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CREATELIST_OBJECT: {
            strpack(g_CreateObjListData    [playerid][CREATELIST_DATA_SEARCH], search, MAX_SEARCH_LEN+1);
        }
        case TDMODE_CREATELIST_VEHICLE: {
            strpack(g_CreateVehListData    [playerid][CREATELIST_DATA_SEARCH], search, MAX_SEARCH_LEN+1);
        }
        case TDMODE_CREATELIST_PICKUP: {
            strpack(g_CreatePickListData   [playerid][CREATELIST_DATA_SEARCH], search, MAX_SEARCH_LEN+1);
        }
        case TDMODE_CREATELIST_ACTOR: {
            strpack(g_CreateActListData    [playerid][CREATELIST_DATA_SEARCH], search, MAX_SEARCH_LEN+1);
        }
        case TDMODE_CREATELIST_ATTACH: {
            strpack(g_CreateAttachListData [playerid][CREATELIST_DATA_SEARCH], search, MAX_SEARCH_LEN+1);
        }
        default: {
            return 0;
        }
    }
    return 1;
}

GetCreateListCategory(playerid) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CREATELIST_OBJECT: {
            return g_CreateObjListData    [playerid][CREATELIST_DATA_CATEGORY];
        }
        case TDMODE_CREATELIST_VEHICLE: {
            return g_CreateVehListData    [playerid][CREATELIST_DATA_CATEGORY];
        }
        case TDMODE_CREATELIST_PICKUP: {
            return g_CreatePickListData   [playerid][CREATELIST_DATA_CATEGORY];
        }
        case TDMODE_CREATELIST_ACTOR: {
            return g_CreateActListData    [playerid][CREATELIST_DATA_CATEGORY];
        }
        case TDMODE_CREATELIST_ATTACH: {
            return g_CreateAttachListData [playerid][CREATELIST_DATA_CATEGORY];
        }
    }
    return INVALID_CATEGORY_ID;
}

SetCreateListCategory(playerid, categoryid) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CREATELIST_OBJECT: {
            g_CreateObjListData    [playerid][CREATELIST_DATA_CATEGORY] = categoryid;
        }
        case TDMODE_CREATELIST_VEHICLE: {
            g_CreateVehListData    [playerid][CREATELIST_DATA_CATEGORY] = categoryid;
        }
        case TDMODE_CREATELIST_PICKUP: {
            g_CreatePickListData   [playerid][CREATELIST_DATA_CATEGORY] = categoryid;
        }
        case TDMODE_CREATELIST_ACTOR: {
            g_CreateActListData    [playerid][CREATELIST_DATA_CATEGORY] = categoryid;
        }
        case TDMODE_CREATELIST_ATTACH: {
            g_CreateAttachListData [playerid][CREATELIST_DATA_CATEGORY] = categoryid;
        }
        default: {
            return 0;
        }
    }
    return 1;
}

GetCreateListRowModelID(playerid, row) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CREATELIST_OBJECT: {
            return g_CreateObjListData    [playerid][CREATELIST_DATA_ROW_ID][row];
        }
        case TDMODE_CREATELIST_VEHICLE: {
            return g_CreateVehListData    [playerid][CREATELIST_DATA_ROW_ID][row];
        }
        case TDMODE_CREATELIST_PICKUP: {
            return g_CreatePickListData   [playerid][CREATELIST_DATA_ROW_ID][row];
        }
        case TDMODE_CREATELIST_ACTOR: {
            return g_CreateActListData    [playerid][CREATELIST_DATA_ROW_ID][row];
        }
        case TDMODE_CREATELIST_ATTACH: {
            return g_CreateAttachListData [playerid][CREATELIST_DATA_ROW_ID][row];
        }
    }
    return INVALID_MODEL_ID;
}

GetCreateListSelectModelID(playerid) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CREATELIST_OBJECT: {
            return g_CreateObjListData    [playerid][CREATELIST_DATA_SELECT_ID];
        }
        case TDMODE_CREATELIST_VEHICLE: {
            return g_CreateVehListData    [playerid][CREATELIST_DATA_SELECT_ID];
        }
        case TDMODE_CREATELIST_PICKUP: {
            return g_CreatePickListData   [playerid][CREATELIST_DATA_SELECT_ID];
        }
        case TDMODE_CREATELIST_ACTOR: {
            return g_CreateActListData    [playerid][CREATELIST_DATA_SELECT_ID];
        }
        case TDMODE_CREATELIST_ATTACH: {
            return g_CreateAttachListData [playerid][CREATELIST_DATA_SELECT_ID];
        }
    }
    return INVALID_MODEL_ID;
}

SetCreateListSelectModelID(playerid, modelid) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CREATELIST_OBJECT: {
            g_CreateObjListData    [playerid][CREATELIST_DATA_SELECT_ID] = modelid;
        }
        case TDMODE_CREATELIST_VEHICLE: {
            g_CreateVehListData    [playerid][CREATELIST_DATA_SELECT_ID] = modelid;
        }
        case TDMODE_CREATELIST_PICKUP: {
            g_CreatePickListData   [playerid][CREATELIST_DATA_SELECT_ID] = modelid;
        }
        case TDMODE_CREATELIST_ACTOR: {
            g_CreateActListData    [playerid][CREATELIST_DATA_SELECT_ID] = modelid;
        }
        case TDMODE_CREATELIST_ATTACH: {
            g_CreateAttachListData [playerid][CREATELIST_DATA_SELECT_ID] = modelid;
        }
        default: {
            return 0;
        }
    }
    return 1;
}

GetCreateListNewSelectRow(playerid) {
    new select_modelid = GetCreateListSelectModelID(playerid);
    if( select_modelid == INVALID_MODEL_ID ) {
        return INVALID_ROW;
    }

    for(new row, row_modelid; row < MAX_CREATELIST_ROWS; row ++) {
        row_modelid = GetCreateListRowModelID(playerid, row);
        if( select_modelid == row_modelid ) {
            return row;
        }
    }
    return INVALID_ROW;
}

GetCreateListSelectRow(playerid) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CREATELIST_OBJECT: {
            return g_CreateObjListData    [playerid][CREATELIST_DATA_SELECT_ROW];
        }
        case TDMODE_CREATELIST_VEHICLE: {
            return g_CreateVehListData    [playerid][CREATELIST_DATA_SELECT_ROW];
        }
        case TDMODE_CREATELIST_PICKUP: {
            return g_CreatePickListData   [playerid][CREATELIST_DATA_SELECT_ROW];
        }
        case TDMODE_CREATELIST_ACTOR: {
            return g_CreateActListData    [playerid][CREATELIST_DATA_SELECT_ROW];
        }
        case TDMODE_CREATELIST_ATTACH: {
            return g_CreateAttachListData [playerid][CREATELIST_DATA_SELECT_ROW];
        }
    }
    return INVALID_ROW;
}

SetCreateListSelectRow(playerid, row) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CREATELIST_OBJECT: {
            g_CreateObjListData    [playerid][CREATELIST_DATA_SELECT_ROW] = row;
        }
        case TDMODE_CREATELIST_VEHICLE: {
            g_CreateVehListData    [playerid][CREATELIST_DATA_SELECT_ROW] = row;
        }
        case TDMODE_CREATELIST_PICKUP: {
            g_CreatePickListData   [playerid][CREATELIST_DATA_SELECT_ROW] = row;
        }
        case TDMODE_CREATELIST_ACTOR: {
            g_CreateActListData    [playerid][CREATELIST_DATA_SELECT_ROW] = row;
        }
        case TDMODE_CREATELIST_ATTACH: {
            g_CreateAttachListData [playerid][CREATELIST_DATA_SELECT_ROW] = row;
        }
        default: {
            return 0;
        }
    }
    return 1;
}

GetCreateListCaption(playerid, caption[], caption_size) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CREATELIST_OBJECT: {
            format(caption, caption_size, "Create Object");
        }
        case TDMODE_CREATELIST_VEHICLE: {
            format(caption, caption_size, "Create Vehicle");
        }
        case TDMODE_CREATELIST_PICKUP: {
            format(caption, caption_size, "Create Pickup");
        }
        case TDMODE_CREATELIST_ACTOR: {
            format(caption, caption_size, "Create Actor");
        }
        case TDMODE_CREATELIST_ATTACH: {
            format(caption, caption_size, "Create Attachment");
        }
        default: {
            return format(caption, caption_size, "Create"), 0;
        }
    }
    return 1;
}

ApplyCreateListCaption(playerid) {
    GetCreateListCaption(playerid, g_TextdrawString, sizeof g_TextdrawString);
    PlayerTextDrawSetString(playerid, g_CreateListPTD[playerid][CREATELIST_PTD_CAPTION], g_TextdrawString);
}

ApplyCreateListPage(playerid) {
    format(g_TextdrawString, sizeof g_TextdrawString, "Page: %i / %i", GetCreateListPage(playerid) + 1, GetCreateListMaxPage(playerid) + 1);
    PlayerTextDrawSetString(playerid, g_CreateListPTD[playerid][CREATELIST_PTD_PAGE], g_TextdrawString);
}

ApplyCreateListCategory(playerid) {
    new categoryid = GetCreateListCategory(playerid);
    if( categoryid == INVALID_CATEGORY_ID ) {
        PlayerTextDrawSetString(playerid, g_CreateListPTD[playerid][CREATELIST_PTD_CATEGORY], "Category");
        return 1;
    }

    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CREATELIST_OBJECT, TDMODE_CREATELIST_PICKUP, TDMODE_CREATELIST_ATTACH: {
            GetModelCategoryName(categoryid, g_CategoryNameString, sizeof g_CategoryNameString);
        }
        case TDMODE_CREATELIST_VEHICLE: {
            GetVehicleCategoryName(categoryid, g_CategoryNameString, sizeof g_CategoryNameString);
        }
        case TDMODE_CREATELIST_ACTOR: {
            GetSkinCategoryName(categoryid, g_CategoryNameString, sizeof g_CategoryNameString);
        }
        default: {
            return 0;
        }
    }

    format(g_TextdrawString, sizeof g_TextdrawString, "Category: %s", g_CategoryNameString);
    PlayerTextDrawSetString(playerid, g_CreateListPTD[playerid][CREATELIST_PTD_CATEGORY], g_TextdrawString);
    return 1;
}

ApplyCreateListSearch(playerid) {
    GetCreateListSearch(playerid, g_SearchString, sizeof g_SearchString);
    if( isempty(g_SearchString) ) {
        PlayerTextDrawSetString(playerid, g_CreateListPTD[playerid][CREATELIST_PTD_SEARCH], "Search");
    } else {
        format(g_TextdrawString, sizeof g_TextdrawString, "Search: %s", g_SearchString);
        PlayerTextDrawSetString(playerid, g_CreateListPTD[playerid][CREATELIST_PTD_SEARCH], g_TextdrawString);
    }
}

ApplyCreateListRowColor(playerid, row) {
    new
        select_row = GetCreateListSelectRow(playerid),
        rgba_boxcolor = ( row == select_row ) ? 0xFFFFFF64 : 0x00000000
    ;
    PlayerTextDrawBoxColor(playerid, g_CreateListPTD[playerid][CREATELIST_PTD_ID_ROW][row],   rgba_boxcolor);
    PlayerTextDrawBoxColor(playerid, g_CreateListPTD[playerid][CREATELIST_PTD_NAME_ROW][row], rgba_boxcolor);

    PlayerTextDrawShow(playerid, g_CreateListPTD[playerid][CREATELIST_PTD_ID_ROW][row]);
    PlayerTextDrawShow(playerid, g_CreateListPTD[playerid][CREATELIST_PTD_NAME_ROW][row]);
}

ApplyCreateListRowData(playerid) {
    for(new row, row_modelid; row < MAX_CREATELIST_ROWS; row ++) {
        row_modelid = GetCreateListRowModelID(playerid, row);

        if( row_modelid == INVALID_MODEL_ID ) {
            PlayerTextDrawHide(playerid, g_CreateListPTD[playerid][CREATELIST_PTD_ID_ROW][row]);
            PlayerTextDrawHide(playerid, g_CreateListPTD[playerid][CREATELIST_PTD_NAME_ROW][row]);
            continue;
        }

        format(g_IntegerString, sizeof g_IntegerString, "%i", row_modelid);
        PlayerTextDrawSetString(playerid, g_CreateListPTD[playerid][CREATELIST_PTD_ID_ROW][row], g_IntegerString);

        if( IsValidVehicleModel(row_modelid) ) {
            GetVehicleModelName(row_modelid, g_VehModelString, sizeof g_VehModelString);
            PlayerTextDrawSetString(playerid, g_CreateListPTD[playerid][CREATELIST_PTD_NAME_ROW][row], g_VehModelString);
        } else if( IsValidSkin(row_modelid) ) {
            GetSkinName(row_modelid, g_SkinString, sizeof g_SkinString);
            PlayerTextDrawSetString(playerid, g_CreateListPTD[playerid][CREATELIST_PTD_NAME_ROW][row], g_SkinString);
        } else {
            GetModelName(row_modelid, g_ModelString, sizeof g_ModelString);
            PlayerTextDrawSetString(playerid, g_CreateListPTD[playerid][CREATELIST_PTD_NAME_ROW][row], g_ModelString);
        }


        ApplyCreateListRowColor(playerid, row);
    }
    return 1;
}

LoadCreateListRowData(playerid) {
    new max_offset;

    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CREATELIST_OBJECT: {
            strunpack(g_SearchString, g_CreateObjListData[playerid][CREATELIST_DATA_SEARCH]);

            new rows_added = FindModels(
                .result = g_CreateObjListData[playerid][CREATELIST_DATA_ROW_ID],
                .result_size = MAX_CREATELIST_ROWS,
                .search = g_SearchString,
                .categoryid = g_CreateObjListData[playerid][CREATELIST_DATA_CATEGORY],
                .offset = g_CreateObjListData[playerid][CREATELIST_DATA_PAGE] * MAX_CREATELIST_ROWS,
                .max_offset = max_offset
            );

            g_CreateObjListData[playerid][CREATELIST_DATA_MAX_PAGE] = max_offset / MAX_CREATELIST_ROWS;

            for(new row = rows_added; row < MAX_CREATELIST_ROWS; row ++) {
                g_CreateObjListData[playerid][CREATELIST_DATA_ROW_ID][row] = INVALID_MODEL_ID;
            }
        }
        case TDMODE_CREATELIST_VEHICLE: {
            strunpack(g_SearchString, g_CreateVehListData[playerid][CREATELIST_DATA_SEARCH]);

            new rows_added = FindVehicleModels(
                .result = g_CreateVehListData[playerid][CREATELIST_DATA_ROW_ID],
                .result_size = MAX_CREATELIST_ROWS,
                .search = g_SearchString,
                .categoryid = g_CreateVehListData[playerid][CREATELIST_DATA_CATEGORY],
                .offset = g_CreateVehListData[playerid][CREATELIST_DATA_PAGE] * MAX_CREATELIST_ROWS,
                .max_offset = max_offset
            );

            g_CreateVehListData[playerid][CREATELIST_DATA_MAX_PAGE] = max_offset / MAX_CREATELIST_ROWS;

            for(new row = rows_added; row < MAX_CREATELIST_ROWS; row ++) {
                g_CreateVehListData[playerid][CREATELIST_DATA_ROW_ID][row] = INVALID_MODEL_ID;
            }
        }
        case TDMODE_CREATELIST_PICKUP: {
            strunpack(g_SearchString, g_CreatePickListData[playerid][CREATELIST_DATA_SEARCH]);

            new rows_added = FindModels(
                .result = g_CreatePickListData[playerid][CREATELIST_DATA_ROW_ID],
                .result_size = MAX_CREATELIST_ROWS,
                .search = g_SearchString,
                .categoryid = g_CreatePickListData[playerid][CREATELIST_DATA_CATEGORY],
                .offset = g_CreatePickListData[playerid][CREATELIST_DATA_PAGE] * MAX_CREATELIST_ROWS,
                .max_offset = max_offset
            );

            g_CreatePickListData[playerid][CREATELIST_DATA_MAX_PAGE] = max_offset / MAX_CREATELIST_ROWS;

            for(new row = rows_added; row < MAX_CREATELIST_ROWS; row ++) {
                g_CreatePickListData[playerid][CREATELIST_DATA_ROW_ID][row] = INVALID_MODEL_ID;
            }
        }
        case TDMODE_CREATELIST_ACTOR: {
            strunpack(g_SearchString, g_CreateActListData[playerid][CREATELIST_DATA_SEARCH]);

            new rows_added = FindSkins(
                .result = g_CreateActListData[playerid][CREATELIST_DATA_ROW_ID],
                .result_size = MAX_CREATELIST_ROWS,
                .search = g_SearchString,
                .categoryid = g_CreateActListData[playerid][CREATELIST_DATA_CATEGORY],
                .offset = g_CreateActListData[playerid][CREATELIST_DATA_PAGE] * MAX_CREATELIST_ROWS,
                .max_offset = max_offset
            );

            g_CreateActListData[playerid][CREATELIST_DATA_MAX_PAGE] = max_offset / MAX_CREATELIST_ROWS;

            for(new row = rows_added; row < MAX_CREATELIST_ROWS; row ++) {
                g_CreateActListData[playerid][CREATELIST_DATA_ROW_ID][row] = INVALID_MODEL_ID;
            }
        }
        case TDMODE_CREATELIST_ATTACH: {
            strunpack(g_SearchString, g_CreateAttachListData[playerid][CREATELIST_DATA_SEARCH]);

            new rows_added = FindModels(
                .result = g_CreateAttachListData[playerid][CREATELIST_DATA_ROW_ID],
                .result_size = MAX_CREATELIST_ROWS,
                .search = g_SearchString,
                .categoryid = g_CreateAttachListData[playerid][CREATELIST_DATA_CATEGORY],
                .offset = g_CreateAttachListData[playerid][CREATELIST_DATA_PAGE] * MAX_CREATELIST_ROWS,
                .max_offset = max_offset
            );

            g_CreateAttachListData[playerid][CREATELIST_DATA_MAX_PAGE] = max_offset / MAX_CREATELIST_ROWS;

            for(new row = rows_added; row < MAX_CREATELIST_ROWS; row ++) {
                g_CreateAttachListData[playerid][CREATELIST_DATA_ROW_ID][row] = INVALID_MODEL_ID;
            }
        }
        default: {
            return 0;
        }
    }

    SetCreateListSelectRow(playerid, GetCreateListNewSelectRow(playerid));
    return 1;
}

ShowCreateListDialog(playerid, dialogid) {
    switch( dialogid ) {
        case DIALOGID_CREATELIST_PAGE: {
            GetCreateListCaption(playerid, g_DialogCaption, sizeof g_DialogCaption);
            strcat(g_DialogCaption, ": Page", sizeof g_DialogCaption);

            format(g_DialogInfo, sizeof g_DialogInfo, "Page: %i / %i", GetCreateListPage(playerid) + 1, GetCreateListMaxPage(playerid) + 1);
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, g_DialogCaption, g_DialogInfo, "Enter", "Cancel");
        }
        case DIALOGID_CREATELIST_SEARCH: {
            GetCreateListCaption(playerid, g_DialogCaption, sizeof g_DialogCaption);
            strcat(g_DialogCaption, ": Search", sizeof g_DialogCaption);

            GetCreateListSearch(playerid, g_SearchString, sizeof g_SearchString);
            if( isempty(g_SearchString) ) {
                g_DialogInfo = "You are not searching for anything.";
            } else {
                format(g_DialogInfo, sizeof g_DialogInfo, "Searching for: %s", g_SearchString);
            }
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, g_DialogCaption, g_DialogInfo, "Enter", "Cancel");
        }
        default: {
            return 0;
        }
    }
    return 1;
}
