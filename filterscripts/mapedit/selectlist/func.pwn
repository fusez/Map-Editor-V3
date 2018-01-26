DefaultSelectListData(playerid) {
    g_SelectObjListData  [playerid][SELECTLIST_DATA_PAGE] = MIN_SELECTLIST_PAGE;
    g_SelectVehListData  [playerid][SELECTLIST_DATA_PAGE] = MIN_SELECTLIST_PAGE;
    g_SelectPickListData [playerid][SELECTLIST_DATA_PAGE] = MIN_SELECTLIST_PAGE;
    g_SelectActListData  [playerid][SELECTLIST_DATA_PAGE] = MIN_SELECTLIST_PAGE;

    g_SelectObjListData  [playerid][SELECTLIST_DATA_MAX_PAGE] = MIN_SELECTLIST_PAGE;
    g_SelectVehListData  [playerid][SELECTLIST_DATA_MAX_PAGE] = MIN_SELECTLIST_PAGE;
    g_SelectPickListData [playerid][SELECTLIST_DATA_MAX_PAGE] = MIN_SELECTLIST_PAGE;
    g_SelectActListData  [playerid][SELECTLIST_DATA_MAX_PAGE] = MIN_SELECTLIST_PAGE;

    strpack(g_SelectObjListData  [playerid][SELECTLIST_DATA_SEARCH], "", MAX_SEARCH_LEN+1);
    strpack(g_SelectVehListData  [playerid][SELECTLIST_DATA_SEARCH], "", MAX_SEARCH_LEN+1);
    strpack(g_SelectPickListData [playerid][SELECTLIST_DATA_SEARCH], "", MAX_SEARCH_LEN+1);
    strpack(g_SelectActListData  [playerid][SELECTLIST_DATA_SEARCH], "", MAX_SEARCH_LEN+1);

    for(new r; r < MAX_SELECTLIST_ROWS; r ++) {
        g_SelectObjListData  [playerid][SELECTLIST_DATA_ROW_ID][r] = INVALID_OBJECT_ID;
        g_SelectVehListData  [playerid][SELECTLIST_DATA_ROW_ID][r] = INVALID_VEHICLE_ID;
        g_SelectPickListData [playerid][SELECTLIST_DATA_ROW_ID][r] = INVALID_PICKUP_ID;
        g_SelectActListData  [playerid][SELECTLIST_DATA_ROW_ID][r] = INVALID_ACTOR_ID;
    }

    g_SelectObjListData [playerid][SELECTLIST_DATA_EDIT_ROW] = INVALID_ROW;
    g_SelectVehListData [playerid][SELECTLIST_DATA_EDIT_ROW] = INVALID_ROW;
    g_SelectPickListData[playerid][SELECTLIST_DATA_EDIT_ROW] = INVALID_ROW;
    g_SelectActListData [playerid][SELECTLIST_DATA_EDIT_ROW] = INVALID_ROW;

    g_SelectObjListData [playerid][SELECTLIST_DATA_EDIT_VIEWED] = false;
    g_SelectVehListData [playerid][SELECTLIST_DATA_EDIT_VIEWED] = false;
    g_SelectPickListData[playerid][SELECTLIST_DATA_EDIT_VIEWED] = false;
    g_SelectActListData [playerid][SELECTLIST_DATA_EDIT_VIEWED] = false;
}

CreateGenericSelectList() {
    g_SelectListGTD[SELECTLIST_GTD_BG] =
    TextDrawCreate      (116.0, 138.0, "_");
    TextDrawAlignment   (g_SelectListGTD[SELECTLIST_GTD_BG], 2);
    TextDrawLetterSize  (g_SelectListGTD[SELECTLIST_GTD_BG], 0.0, 34.3);
    TextDrawUseBox      (g_SelectListGTD[SELECTLIST_GTD_BG], 1);
    TextDrawBoxColor    (g_SelectListGTD[SELECTLIST_GTD_BG], 100);
    TextDrawTextSize    (g_SelectListGTD[SELECTLIST_GTD_BG], 0.0, 230.0);

    g_SelectListGTD[SELECTLIST_GTD_CLOSE] =
    TextDrawCreate          (221.0, 138.0, "X");
    TextDrawAlignment       (g_SelectListGTD[SELECTLIST_GTD_CLOSE], 2);
    TextDrawBackgroundColor (g_SelectListGTD[SELECTLIST_GTD_CLOSE], 255);
    TextDrawFont            (g_SelectListGTD[SELECTLIST_GTD_CLOSE], 1);
    TextDrawLetterSize      (g_SelectListGTD[SELECTLIST_GTD_CLOSE], 0.3, 1.0);
    TextDrawColor           (g_SelectListGTD[SELECTLIST_GTD_CLOSE], RGBA_WHITE);
    TextDrawSetOutline      (g_SelectListGTD[SELECTLIST_GTD_CLOSE], 1);
    TextDrawSetProportional (g_SelectListGTD[SELECTLIST_GTD_CLOSE], 1);
    TextDrawUseBox          (g_SelectListGTD[SELECTLIST_GTD_CLOSE], 1);
    TextDrawBoxColor        (g_SelectListGTD[SELECTLIST_GTD_CLOSE], 0xFF000064);
    TextDrawTextSize        (g_SelectListGTD[SELECTLIST_GTD_CLOSE], 10.0, 20.0);
    TextDrawSetSelectable   (g_SelectListGTD[SELECTLIST_GTD_CLOSE], 1);

    g_SelectListGTD[SELECTLIST_GTD_PAGE_F] =
    TextDrawCreate          (11.0, 151.0, "<<");
    TextDrawAlignment       (g_SelectListGTD[SELECTLIST_GTD_PAGE_F], 2);
    TextDrawBackgroundColor (g_SelectListGTD[SELECTLIST_GTD_PAGE_F], 255);
    TextDrawFont            (g_SelectListGTD[SELECTLIST_GTD_PAGE_F], 1);
    TextDrawLetterSize      (g_SelectListGTD[SELECTLIST_GTD_PAGE_F], 0.2, 1.0);
    TextDrawColor           (g_SelectListGTD[SELECTLIST_GTD_PAGE_F], RGBA_WHITE);
    TextDrawSetOutline      (g_SelectListGTD[SELECTLIST_GTD_PAGE_F], 1);
    TextDrawSetProportional (g_SelectListGTD[SELECTLIST_GTD_PAGE_F], 1);
    TextDrawTextSize        (g_SelectListGTD[SELECTLIST_GTD_PAGE_F], 10.0, 20.0);
    TextDrawSetSelectable   (g_SelectListGTD[SELECTLIST_GTD_PAGE_F], 1);

    g_SelectListGTD[SELECTLIST_GTD_PAGE_P] =
    TextDrawCreate          (34.0, 151.0, "<");
    TextDrawAlignment       (g_SelectListGTD[SELECTLIST_GTD_PAGE_P], 2);
    TextDrawBackgroundColor (g_SelectListGTD[SELECTLIST_GTD_PAGE_P], 255);
    TextDrawFont            (g_SelectListGTD[SELECTLIST_GTD_PAGE_P], 1);
    TextDrawLetterSize      (g_SelectListGTD[SELECTLIST_GTD_PAGE_P], 0.2, 1.0);
    TextDrawColor           (g_SelectListGTD[SELECTLIST_GTD_PAGE_P], RGBA_WHITE);
    TextDrawSetOutline      (g_SelectListGTD[SELECTLIST_GTD_PAGE_P], 1);
    TextDrawSetProportional (g_SelectListGTD[SELECTLIST_GTD_PAGE_P], 1);
    TextDrawTextSize        (g_SelectListGTD[SELECTLIST_GTD_PAGE_P], 10.0, 20.0);
    TextDrawSetSelectable   (g_SelectListGTD[SELECTLIST_GTD_PAGE_P], 1);

    g_SelectListGTD[SELECTLIST_GTD_PAGE_N] =
    TextDrawCreate          (198.0, 151.0, ">");
    TextDrawAlignment       (g_SelectListGTD[SELECTLIST_GTD_PAGE_N], 2);
    TextDrawBackgroundColor (g_SelectListGTD[SELECTLIST_GTD_PAGE_N], 255);
    TextDrawFont            (g_SelectListGTD[SELECTLIST_GTD_PAGE_N], 1);
    TextDrawLetterSize      (g_SelectListGTD[SELECTLIST_GTD_PAGE_N], 0.2, 1.0);
    TextDrawColor           (g_SelectListGTD[SELECTLIST_GTD_PAGE_N], RGBA_WHITE);
    TextDrawSetOutline      (g_SelectListGTD[SELECTLIST_GTD_PAGE_N], 1);
    TextDrawSetProportional (g_SelectListGTD[SELECTLIST_GTD_PAGE_N], 1);
    TextDrawTextSize        (g_SelectListGTD[SELECTLIST_GTD_PAGE_N], 10.0, 20.0);
    TextDrawSetSelectable   (g_SelectListGTD[SELECTLIST_GTD_PAGE_N], 1);

    g_SelectListGTD[SELECTLIST_GTD_PAGE_L] =
    TextDrawCreate          (221.0, 151.0, ">>");
    TextDrawAlignment       (g_SelectListGTD[SELECTLIST_GTD_PAGE_L], 2);
    TextDrawBackgroundColor (g_SelectListGTD[SELECTLIST_GTD_PAGE_L], 255);
    TextDrawFont            (g_SelectListGTD[SELECTLIST_GTD_PAGE_L], 1);
    TextDrawLetterSize      (g_SelectListGTD[SELECTLIST_GTD_PAGE_L], 0.2, 1.0);
    TextDrawColor           (g_SelectListGTD[SELECTLIST_GTD_PAGE_L], RGBA_WHITE);
    TextDrawSetOutline      (g_SelectListGTD[SELECTLIST_GTD_PAGE_L], 1);
    TextDrawSetProportional (g_SelectListGTD[SELECTLIST_GTD_PAGE_L], 1);
    TextDrawTextSize        (g_SelectListGTD[SELECTLIST_GTD_PAGE_L], 10.0, 20.0);
    TextDrawSetSelectable   (g_SelectListGTD[SELECTLIST_GTD_PAGE_L], 1);
}

DestroyGenericSelectList() {
    for(new gtd; gtd < MAX_SELECTLIST_GTDS; gtd ++) {
        TextDrawDestroy( g_SelectListGTD[gtd] );

        g_SelectListGTD[gtd] = Text: INVALID_TEXT_DRAW;
    }
}

CreatePlayerSelectList(playerid) {
    g_SelectListPTD[playerid][SELECTLIST_PTD_CAPTION] =
    CreatePlayerTextDraw          (playerid, 4.0, 127.0, "Caption");
    PlayerTextDrawBackgroundColor (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_CAPTION], 255);
    PlayerTextDrawFont            (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_CAPTION], 0);
    PlayerTextDrawLetterSize      (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_CAPTION], 0.5, 2.0);
    PlayerTextDrawColor           (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_CAPTION], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_CAPTION], 1);
    PlayerTextDrawSetProportional (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_CAPTION], 1);

    g_SelectListPTD[playerid][SELECTLIST_PTD_PAGE] =
    CreatePlayerTextDraw          (playerid, 116.0, 151.0, "Page");
    PlayerTextDrawAlignment       (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_PAGE], 2);
    PlayerTextDrawBackgroundColor (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_PAGE], 255);
    PlayerTextDrawFont            (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_PAGE], 1);
    PlayerTextDrawLetterSize      (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_PAGE], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_PAGE], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_PAGE], 1);
    PlayerTextDrawSetProportional (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_PAGE], 1);
    PlayerTextDrawTextSize        (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_PAGE], 10.0, 138.0);
    PlayerTextDrawSetSelectable   (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_PAGE], 1);

    g_SelectListPTD[playerid][SELECTLIST_PTD_SEARCH] =
    CreatePlayerTextDraw          (playerid, 116.0, 164.0, "Search");
    PlayerTextDrawAlignment       (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_SEARCH], 2);
    PlayerTextDrawBackgroundColor (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_SEARCH], 255);
    PlayerTextDrawFont            (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_SEARCH], 1);
    PlayerTextDrawLetterSize      (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_SEARCH], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_SEARCH], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_SEARCH], 1);
    PlayerTextDrawSetProportional (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_SEARCH], 1);
    PlayerTextDrawTextSize        (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_SEARCH], 10.0, 230.0);
    PlayerTextDrawSetSelectable   (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_SEARCH], 1);

    g_SelectListPTD[playerid][SELECTLIST_PTD_ID_COL] =
    CreatePlayerTextDraw          (playerid, 1.0, 177.0, "ID");
    PlayerTextDrawBackgroundColor (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_COL], 255);
    PlayerTextDrawFont            (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_COL], 1);
    PlayerTextDrawLetterSize      (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_COL], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_COL], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_COL], 1);
    PlayerTextDrawSetProportional (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_COL], 1);
    PlayerTextDrawTextSize        (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_COL], 40.0, 10.0);

    g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_COL] =
    CreatePlayerTextDraw          (playerid, 43.0, 177.0, "Model ID");
    PlayerTextDrawBackgroundColor (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_COL], 255);
    PlayerTextDrawFont            (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_COL], 1);
    PlayerTextDrawLetterSize      (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_COL], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_COL], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_COL], 1);
    PlayerTextDrawSetProportional (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_COL], 1);
    PlayerTextDrawTextSize        (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_COL], 82.0, 10.0);

    g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_COL] =
    CreatePlayerTextDraw          (playerid, 85.0, 177.0, "Comment");
    PlayerTextDrawBackgroundColor (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_COL], 255);
    PlayerTextDrawFont            (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_COL], 1);
    PlayerTextDrawLetterSize      (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_COL], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_COL], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_COL], 1);
    PlayerTextDrawSetProportional (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_COL], 1);
    PlayerTextDrawTextSize        (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_COL], 231.0, 10.0);

    for(new row, Float:y = 190.0; row < MAX_SELECTLIST_ROWS; row ++, y += 13.0) {
        g_SelectListPTD[playerid][SELECTLIST_PTD_ID_ROW][row] =
        CreatePlayerTextDraw          (playerid, 1.0, y, "ID");
        PlayerTextDrawBackgroundColor (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_ROW][row], 255);
        PlayerTextDrawFont            (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_ROW][row], 1);
        PlayerTextDrawLetterSize      (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_ROW][row], 0.2, 1.0);
        PlayerTextDrawColor           (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_ROW][row], RGBA_WHITE);
        PlayerTextDrawSetOutline      (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_ROW][row], 1);
        PlayerTextDrawSetProportional (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_ROW][row], 1);
        PlayerTextDrawUseBox          (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_ROW][row], 1);
        PlayerTextDrawBoxColor        (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_ROW][row], 100);
        PlayerTextDrawTextSize        (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_ROW][row], 40.0, 10.0);
        PlayerTextDrawSetSelectable   (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_ROW][row], 1);

        g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_ROW][row] =
        CreatePlayerTextDraw          (playerid, 43.0, y, "Model ID");
        PlayerTextDrawBackgroundColor (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_ROW][row], 255);
        PlayerTextDrawFont            (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_ROW][row], 1);
        PlayerTextDrawLetterSize      (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_ROW][row], 0.2, 1.0);
        PlayerTextDrawColor           (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_ROW][row], RGBA_WHITE);
        PlayerTextDrawSetOutline      (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_ROW][row], 1);
        PlayerTextDrawSetProportional (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_ROW][row], 1);
        PlayerTextDrawUseBox          (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_ROW][row], 1);
        PlayerTextDrawBoxColor        (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_ROW][row], 100);
        PlayerTextDrawTextSize        (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_ROW][row], 82.0, 10.0);
        PlayerTextDrawSetSelectable   (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_ROW][row], 1);

        g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_ROW][row] =
        CreatePlayerTextDraw          (playerid, 85.0, y, "Comment");
        PlayerTextDrawBackgroundColor (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_ROW][row], 255);
        PlayerTextDrawFont            (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_ROW][row], 1);
        PlayerTextDrawLetterSize      (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_ROW][row], 0.2, 1.0);
        PlayerTextDrawColor           (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_ROW][row], RGBA_WHITE);
        PlayerTextDrawSetOutline      (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_ROW][row], 1);
        PlayerTextDrawSetProportional (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_ROW][row], 1);
        PlayerTextDrawUseBox          (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_ROW][row], 1);
        PlayerTextDrawBoxColor        (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_ROW][row], 100);
        PlayerTextDrawTextSize        (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_ROW][row], 231.0, 10.0);
        PlayerTextDrawSetSelectable   (playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_ROW][row], 1);
    }
}

DestroyPlayerSelectList(playerid) {
    for(new ptd; ptd < MAX_SELECTLIST_PTDS; ptd ++) {
        PlayerTextDrawDestroy(playerid, g_SelectListPTD[playerid][ptd]);

        g_SelectListPTD[playerid][ptd] = PlayerText: INVALID_TEXT_DRAW;
    }
}

ShowSelectList(playerid) {
    CreatePlayerSelectList(playerid);

    for(new gtd; gtd < MAX_SELECTLIST_GTDS; gtd ++) {
        TextDrawShowForPlayer(playerid, g_SelectListGTD[gtd]);
    }

    LoadSelectListRowData(playerid);

    ApplySelectListColumns(playerid);
    PlayerTextDrawShow(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_COL]);
    PlayerTextDrawShow(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_COL]);
    PlayerTextDrawShow(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_COL]);

    ApplySelectListCaption(playerid);
    PlayerTextDrawShow(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_CAPTION]);

    ApplySelectListPage(playerid);
    PlayerTextDrawShow(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_PAGE]);

    ApplySelectListSearch(playerid);
    PlayerTextDrawShow(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_SEARCH]);

    for(new row; row < MAX_SELECTLIST_ROWS; row ++) {
        ApplySelectListRowData(playerid, row);
    }
}

HideSelectList(playerid) {
    for(new gtd; gtd < MAX_SELECTLIST_GTDS; gtd ++) {
        TextDrawHideForPlayer(playerid, g_SelectListGTD[gtd]);
    }

    DestroyPlayerSelectList(playerid);
}

GetSelectListPage(playerid) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_SELECTLIST_OBJECT: {
            return g_SelectObjListData[playerid][SELECTLIST_DATA_PAGE];
        }
        case TDMODE_SELECTLIST_VEHICLE: {
            return g_SelectVehListData[playerid][SELECTLIST_DATA_PAGE];
        }
        case TDMODE_SELECTLIST_ACTOR: {
            return g_SelectActListData[playerid][SELECTLIST_DATA_PAGE];
        }
        case TDMODE_SELECTLIST_PICKUP: {
            return g_SelectPickListData[playerid][SELECTLIST_DATA_PAGE];
        }
    }
    return 0;
}

SetSelectListPage(playerid, page) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_SELECTLIST_OBJECT: {
            g_SelectObjListData[playerid][SELECTLIST_DATA_PAGE] = page;
        }
        case TDMODE_SELECTLIST_VEHICLE: {
            g_SelectVehListData[playerid][SELECTLIST_DATA_PAGE] = page;
        }
        case TDMODE_SELECTLIST_ACTOR: {
            g_SelectActListData[playerid][SELECTLIST_DATA_PAGE] = page;
        }
        case TDMODE_SELECTLIST_PICKUP: {
            g_SelectPickListData[playerid][SELECTLIST_DATA_PAGE] = page;
        }
        default: {
            return 0;
        }
    }
    return 1;
}

GetSelectListMaxPage(playerid) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_SELECTLIST_OBJECT: {
            return g_SelectObjListData [playerid][SELECTLIST_DATA_MAX_PAGE];
        }
        case TDMODE_SELECTLIST_VEHICLE: {
            return g_SelectVehListData [playerid][SELECTLIST_DATA_MAX_PAGE];
        }
        case TDMODE_SELECTLIST_ACTOR: {
            return g_SelectActListData [playerid][SELECTLIST_DATA_MAX_PAGE];
        }
        case TDMODE_SELECTLIST_PICKUP: {
            return g_SelectPickListData[playerid][SELECTLIST_DATA_MAX_PAGE];
        }
    }
    return 0;
}

GetSelectListSearch(playerid, search[], search_size) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_SELECTLIST_OBJECT: {
            strunpack(search, g_SelectObjListData[playerid][SELECTLIST_DATA_SEARCH], search_size);
        }
        case TDMODE_SELECTLIST_VEHICLE: {
            strunpack(search, g_SelectVehListData[playerid][SELECTLIST_DATA_SEARCH], search_size);
        }
        case TDMODE_SELECTLIST_ACTOR: {
            strunpack(search, g_SelectActListData[playerid][SELECTLIST_DATA_SEARCH], search_size);
        }
        case TDMODE_SELECTLIST_PICKUP: {
            strunpack(search, g_SelectPickListData[playerid][SELECTLIST_DATA_SEARCH], search_size);
        }
        default: {
            return format(search, search_size, ""), 0;
        }
    }
    return 1;
}

SetSelectListSearch(playerid, search[]) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_SELECTLIST_OBJECT: {
            strpack(g_SelectObjListData[playerid][SELECTLIST_DATA_SEARCH], search, MAX_SEARCH_LEN+1);
        }
        case TDMODE_SELECTLIST_VEHICLE: {
            strpack(g_SelectVehListData[playerid][SELECTLIST_DATA_SEARCH], search, MAX_SEARCH_LEN+1);
        }
        case TDMODE_SELECTLIST_ACTOR: {
            strpack(g_SelectActListData[playerid][SELECTLIST_DATA_SEARCH], search, MAX_SEARCH_LEN+1);
        }
        case TDMODE_SELECTLIST_PICKUP: {
            strpack(g_SelectPickListData[playerid][SELECTLIST_DATA_SEARCH], search, MAX_SEARCH_LEN+1);
        }
        default: {
            return 0;
        }
    }
    return 1;
}

GetSelectListNewEditRow(playerid) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_SELECTLIST_OBJECT: {
            new edit_objectid = GetPlayerEditObject(playerid);
            if( !IsValidObject(edit_objectid) ) {
                return INVALID_ROW;
            }

            for(new row, row_objectid; row < MAX_SELECTLIST_ROWS; row ++) {
                row_objectid = g_SelectObjListData[playerid][SELECTLIST_DATA_ROW_ID][row];
                if( edit_objectid == row_objectid ) {
                    return row;
                }
            }
        }
        case TDMODE_SELECTLIST_VEHICLE: {
            new edit_vehicleid = GetPlayerEditVehicle(playerid);
            if( !IsValidVehicle(edit_vehicleid) ) {
                return INVALID_ROW;
            }

            for(new row, row_vehicleid; row < MAX_SELECTLIST_ROWS; row ++) {
                row_vehicleid = g_SelectVehListData[playerid][SELECTLIST_DATA_ROW_ID][row];
                if( edit_vehicleid == row_vehicleid ) {
                    return row;
                }
            }
        }
        case TDMODE_SELECTLIST_ACTOR: {
            new edit_actorid = GetPlayerEditActor(playerid);
            if( !IsValidActor(edit_actorid) ) {
                return INVALID_ROW;
            }

            for(new row, row_actorid; row < MAX_SELECTLIST_ROWS; row ++) {
                row_actorid = g_SelectActListData[playerid][SELECTLIST_DATA_ROW_ID][row];
                if( edit_actorid == row_actorid ) {
                    return row;
                }
            }
        }
        case TDMODE_SELECTLIST_PICKUP: {
            new edit_pickupid = GetPlayerEditPickup(playerid);
            if( !IsValidPickup(edit_pickupid) ) {
                return INVALID_ROW;
            }

            for(new row, row_pickupid; row < MAX_SELECTLIST_ROWS; row ++) {
                row_pickupid = g_SelectPickListData[playerid][SELECTLIST_DATA_ROW_ID][row];
                if( edit_pickupid == row_pickupid ) {
                    return row;
                }
            }
        }
    }
    return INVALID_ROW;
}

GetSelectListEditRow(playerid) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_SELECTLIST_OBJECT: {
            return g_SelectObjListData [playerid][SELECTLIST_DATA_EDIT_ROW];
        }
        case TDMODE_SELECTLIST_VEHICLE: {
            return g_SelectVehListData [playerid][SELECTLIST_DATA_EDIT_ROW];
        }
        case TDMODE_SELECTLIST_ACTOR: {
            return g_SelectActListData [playerid][SELECTLIST_DATA_EDIT_ROW];
        }
        case TDMODE_SELECTLIST_PICKUP: {
            return g_SelectPickListData[playerid][SELECTLIST_DATA_EDIT_ROW];
        }
    }
    return INVALID_ROW;
}

SetSelectListEditRow(playerid, row) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_SELECTLIST_OBJECT: {
            g_SelectObjListData [playerid][SELECTLIST_DATA_EDIT_ROW] = row;
        }
        case TDMODE_SELECTLIST_VEHICLE: {
            g_SelectVehListData [playerid][SELECTLIST_DATA_EDIT_ROW] = row;
        }
        case TDMODE_SELECTLIST_ACTOR: {
            g_SelectActListData [playerid][SELECTLIST_DATA_EDIT_ROW] = row;
        }
        case TDMODE_SELECTLIST_PICKUP: {
            g_SelectPickListData[playerid][SELECTLIST_DATA_EDIT_ROW] = row;
        }
        default: {
            return 0;
        }
    }
    return 1;
}

bool:IsSelectListEditViewed(playerid) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_SELECTLIST_OBJECT: {
            return g_SelectObjListData[playerid][SELECTLIST_DATA_EDIT_VIEWED];
        }
        case TDMODE_SELECTLIST_VEHICLE: {
            return g_SelectVehListData[playerid][SELECTLIST_DATA_EDIT_VIEWED];
        }
        case TDMODE_SELECTLIST_ACTOR: {
            return g_SelectActListData[playerid][SELECTLIST_DATA_EDIT_VIEWED];
        }
        case TDMODE_SELECTLIST_PICKUP: {
            return g_SelectPickListData[playerid][SELECTLIST_DATA_EDIT_VIEWED];
        }
    }
    return false;
}

SetSelectListEditViewed(playerid, bool:selected) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_SELECTLIST_OBJECT: {
            g_SelectObjListData[playerid][SELECTLIST_DATA_EDIT_VIEWED] = selected;
        }
        case TDMODE_SELECTLIST_VEHICLE: {
            g_SelectVehListData[playerid][SELECTLIST_DATA_EDIT_VIEWED] = selected;
        }
        case TDMODE_SELECTLIST_ACTOR: {
            g_SelectActListData[playerid][SELECTLIST_DATA_EDIT_VIEWED] = selected;
        }
        case TDMODE_SELECTLIST_PICKUP: {
            g_SelectPickListData[playerid][SELECTLIST_DATA_EDIT_VIEWED] = selected;
        }
        default: {
            return 0;
        }
    }
    return 1;
}

GetSelectListCaption(playerid, caption[], caption_size) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_SELECTLIST_OBJECT: {
            format(caption, caption_size, "Select Object");
        }
        case TDMODE_SELECTLIST_VEHICLE: {
            format(caption, caption_size, "Select Vehicle");
        }
        case TDMODE_SELECTLIST_ACTOR: {
            format(caption, caption_size, "Select Actor");
        }
        case TDMODE_SELECTLIST_PICKUP: {
            format(caption, caption_size, "Select Pickup");
        }
        default: {
            return format(caption, caption_size, "Select"), 0;
        }
    }
    return 1;

}

ApplySelectListColumns(playerid) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_SELECTLIST_OBJECT: {
            PlayerTextDrawSetString(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_COL], "Object ID");
            PlayerTextDrawSetString(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_COL], "Model ID");
            PlayerTextDrawSetString(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_COL], "Object Comment");
        }
        case TDMODE_SELECTLIST_VEHICLE: {
            PlayerTextDrawSetString(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_COL], "Vehicle ID");
            PlayerTextDrawSetString(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_COL], "Model ID");
            PlayerTextDrawSetString(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_COL], "Vehicle Comment");
        }
        case TDMODE_SELECTLIST_ACTOR: {
            PlayerTextDrawSetString(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_COL], "Actor ID");
            PlayerTextDrawSetString(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_COL], "Skin ID");
            PlayerTextDrawSetString(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_COL], "Actor Comment");
        }
        case TDMODE_SELECTLIST_PICKUP: {
            PlayerTextDrawSetString(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_COL], "Pickup ID");
            PlayerTextDrawSetString(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_COL], "Model ID");
            PlayerTextDrawSetString(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_COL], "Pickup Comment");
        }
        default: {
            PlayerTextDrawSetString(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_COL], "ID");
            PlayerTextDrawSetString(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_COL], "Model ID");
            PlayerTextDrawSetString(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_COL], "Comment");
            return 0;
        }
    }
    return 1;
}

ApplySelectListCaption(playerid) {
    GetSelectListCaption(playerid, g_TextdrawString, sizeof g_TextdrawString);
    PlayerTextDrawSetString(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_CAPTION], g_TextdrawString);
}

ApplySelectListPage(playerid) {
    format(g_TextdrawString, sizeof g_TextdrawString, "Page %i / %i", GetSelectListPage(playerid) + 1, GetSelectListMaxPage(playerid) + 1);
    PlayerTextDrawSetString(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_PAGE], g_TextdrawString);
}

ApplySelectListSearch(playerid) {
    GetSelectListSearch(playerid, g_SearchString, sizeof g_SearchString);

    if( isempty(g_SearchString) ) {
        PlayerTextDrawSetString(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_SEARCH], "Search");
    } else {
        format(g_TextdrawString, sizeof g_TextdrawString, "Search: %s", g_SearchString);
        PlayerTextDrawSetString(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_SEARCH], g_TextdrawString);
    }
}

ApplySelectListRowColor(playerid, row) {
    new rgba_boxcolor;

    if( row == GetSelectListEditRow(playerid) ) {
        rgba_boxcolor = IsSelectListEditViewed(playerid) ? 0xFFFF0064 : 0xFFFF0032;
    } else {
        rgba_boxcolor = 0x00000000;
    }

    PlayerTextDrawBoxColor(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_ROW][row],      rgba_boxcolor);
    PlayerTextDrawBoxColor(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_ROW][row], rgba_boxcolor);
    PlayerTextDrawBoxColor(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_ROW][row], rgba_boxcolor);

    PlayerTextDrawShow(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_ROW][row]);
    PlayerTextDrawShow(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_ROW][row]);
    PlayerTextDrawShow(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_ROW][row]);

    return 1;
}

ApplySelectListRowData(playerid, row) {
    new
              objectid = INVALID_OBJECT_ID,
              vehicleid = INVALID_VEHICLE_ID,
              actorid = INVALID_ACTOR_ID,
              pickupid = INVALID_PICKUP_ID,
        bool: isvalid
    ;

    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_SELECTLIST_OBJECT: {
            objectid = g_SelectObjListData[playerid][SELECTLIST_DATA_ROW_ID][row];
            isvalid = IsValidObject(objectid) ? true : false;
        }
        case TDMODE_SELECTLIST_VEHICLE: {
            vehicleid = g_SelectVehListData[playerid][SELECTLIST_DATA_ROW_ID][row];
            isvalid = IsValidVehicle(vehicleid) ? true : false;
        }
        case TDMODE_SELECTLIST_ACTOR: {
            actorid = g_SelectActListData[playerid][SELECTLIST_DATA_ROW_ID][row];
            isvalid = IsValidActor(actorid) ? true : false;
        }
        case TDMODE_SELECTLIST_PICKUP: {
            pickupid = g_SelectPickListData[playerid][SELECTLIST_DATA_ROW_ID][row];
            isvalid = IsValidPickup(pickupid) ? true : false;
        }
        default: {
            return 0;
        }
    }

    if( !isvalid ) {
        PlayerTextDrawHide(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_ROW][row]);
        PlayerTextDrawHide(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_ROW][row]);
        PlayerTextDrawHide(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_ROW][row]);
        return 0;
    }

    new
        id_str[4+1],
        modelid_str[6+1]
    ;

    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_SELECTLIST_OBJECT: {
            format(id_str, sizeof id_str, "%i", objectid);
            format(modelid_str, sizeof modelid_str, "%i", GetObjectModel(objectid));
            strunpack(g_CommentString, g_ObjectData[objectid-1][OBJECT_DATA_COMMENT], sizeof g_CommentString);
        }
        case TDMODE_SELECTLIST_VEHICLE: {
            format(id_str, sizeof id_str, "%i", vehicleid);
            format(modelid_str, sizeof modelid_str, "%i", GetVehicleModel(vehicleid));
            strunpack(g_CommentString, g_VehicleData[vehicleid-1][VEHICLE_DATA_COMMENT], sizeof g_CommentString);
        }
        case TDMODE_SELECTLIST_ACTOR: {
            format(id_str, sizeof id_str, "%i", actorid);
            format(modelid_str, sizeof modelid_str, "%i", g_ActorData[actorid][ACTOR_DATA_SKIN]);
            strunpack(g_CommentString, g_ActorData[actorid][ACTOR_DATA_COMMENT], sizeof g_CommentString);
        }
        case TDMODE_SELECTLIST_PICKUP: {
            format(id_str, sizeof id_str, "%i", pickupid);
            format(modelid_str, sizeof modelid_str, "%i", g_PickupData[pickupid][PICKUP_DATA_MODEL]);
            strunpack(g_CommentString, g_PickupData[pickupid][PICKUP_DATA_COMMENT], sizeof g_CommentString);
        }
    }

    PlayerTextDrawSetString(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_ID_ROW][row], id_str);
    PlayerTextDrawSetString(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_MODELID_ROW][row], modelid_str);
    PlayerTextDrawSetString(playerid, g_SelectListPTD[playerid][SELECTLIST_PTD_COMMENT_ROW][row], g_CommentString);

    ApplySelectListRowColor(playerid, row);
    return 1;
}

LoadSelectListRowData(playerid) {
    new rows_added, max_offset;

    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_SELECTLIST_OBJECT: {
            strunpack(g_SearchString, g_SelectObjListData[playerid][SELECTLIST_DATA_SEARCH]);

            rows_added = FindObjects(
                .result = g_SelectObjListData[playerid][SELECTLIST_DATA_ROW_ID],
                .result_size = MAX_SELECTLIST_ROWS,
                .search = g_SearchString,
                .offset = g_SelectObjListData[playerid][SELECTLIST_DATA_PAGE] * MAX_SELECTLIST_ROWS,
                .max_offset = max_offset
            );

            g_SelectObjListData[playerid][SELECTLIST_DATA_MAX_PAGE] = max_offset / MAX_SELECTLIST_ROWS;

            for(new row = rows_added; row < MAX_SELECTLIST_ROWS; row ++) {
                g_SelectObjListData[playerid][SELECTLIST_DATA_ROW_ID][row] = INVALID_OBJECT_ID;
            }
        }
        case TDMODE_SELECTLIST_VEHICLE: {
            strunpack(g_SearchString, g_SelectVehListData[playerid][SELECTLIST_DATA_SEARCH]);

            rows_added = FindVehicles(
                .result = g_SelectVehListData[playerid][SELECTLIST_DATA_ROW_ID],
                .result_size = MAX_SELECTLIST_ROWS,
                .search = g_SearchString,
                .offset = g_SelectVehListData[playerid][SELECTLIST_DATA_PAGE] * MAX_SELECTLIST_ROWS,
                .max_offset = max_offset
            );

            g_SelectVehListData[playerid][SELECTLIST_DATA_MAX_PAGE] = max_offset / MAX_SELECTLIST_ROWS;

            for(new row = rows_added; row < MAX_SELECTLIST_ROWS; row ++) {
                g_SelectVehListData[playerid][SELECTLIST_DATA_ROW_ID][row] = INVALID_VEHICLE_ID;
            }
        }
        case TDMODE_SELECTLIST_ACTOR: {
            strunpack(g_SearchString, g_SelectActListData[playerid][SELECTLIST_DATA_SEARCH]);

            rows_added = FindActors(
                .result = g_SelectActListData[playerid][SELECTLIST_DATA_ROW_ID],
                .result_size = MAX_SELECTLIST_ROWS,
                .search = g_SearchString,
                .offset = g_SelectActListData[playerid][SELECTLIST_DATA_PAGE] * MAX_SELECTLIST_ROWS,
                .max_offset = max_offset
            );

            g_SelectActListData[playerid][SELECTLIST_DATA_MAX_PAGE] = max_offset / MAX_SELECTLIST_ROWS;

            for(new row = rows_added; row < MAX_SELECTLIST_ROWS; row ++) {
                g_SelectActListData[playerid][SELECTLIST_DATA_ROW_ID][row] = INVALID_ACTOR_ID;
            }
        }
        case TDMODE_SELECTLIST_PICKUP: {
            strunpack(g_SearchString, g_SelectPickListData[playerid][SELECTLIST_DATA_SEARCH]);

            rows_added = FindPickups(
                .result = g_SelectPickListData[playerid][SELECTLIST_DATA_ROW_ID],
                .result_size = MAX_SELECTLIST_ROWS,
                .search = g_SearchString,
                .offset = g_SelectPickListData[playerid][SELECTLIST_DATA_PAGE] * MAX_SELECTLIST_ROWS,
                .max_offset = max_offset
            );

            g_SelectPickListData[playerid][SELECTLIST_DATA_MAX_PAGE] = max_offset / MAX_SELECTLIST_ROWS;

            for(new row = rows_added; row < MAX_SELECTLIST_ROWS; row ++) {
                g_SelectPickListData[playerid][SELECTLIST_DATA_ROW_ID][row] = INVALID_PICKUP_ID;
            }
        }
        default: {
            return 0;
        }
    }

    SetSelectListEditRow(playerid, GetSelectListNewEditRow(playerid));
    return 1;
}

ShowSelectListDialog(playerid, dialogid) {
    switch( dialogid ) {
        case DIALOGID_SELECTLIST_PAGE: {
            GetSelectListCaption(playerid, g_DialogCaption, sizeof g_DialogCaption);
            strcat(g_DialogCaption, ": Page", sizeof g_DialogCaption);

            format(g_DialogInfo, sizeof g_DialogInfo, "Page: %i / %i", GetSelectListPage(playerid) + 1, GetSelectListMaxPage(playerid) + 1);
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, g_DialogCaption, g_DialogInfo, "Enter", "Cancel");
        }
        case DIALOGID_SELECTLIST_SEARCH: {
            GetSelectListCaption(playerid, g_DialogCaption, sizeof g_DialogCaption);
            strcat(g_DialogCaption, ": Search", sizeof g_DialogCaption);

            GetSelectListSearch(playerid, g_SearchString, sizeof g_SearchString);
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
