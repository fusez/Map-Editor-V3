DefaultBuildListData(playerid) {
    g_BuildListData     [playerid][BUILDLIST_DATA_PAGE] = MIN_BUILDLIST_PAGE;
    for(new r; r < MAX_BUILDLIST_ROWS; r ++) {
        g_BuildListData [playerid][BUILDLIST_DATA_ROW_ID][r] = INVALID_BUILDING_ID;
    }
    g_BuildListData     [playerid][BUILDLIST_DATA_EDIT_ROW] = INVALID_ROW;
    g_BuildListData     [playerid][BUILDLIST_DATA_EDIT_VIEWED] = false;
}

CreateGenericBuildList() {
    g_BuildListGTD[BUILDLIST_GTD_BG] =
    TextDrawCreate      (116.0, 138.0, "_");
    TextDrawAlignment   (g_BuildListGTD[BUILDLIST_GTD_BG], 2);
    TextDrawLetterSize  (g_BuildListGTD[BUILDLIST_GTD_BG], 0.0, 34.3);
    TextDrawUseBox      (g_BuildListGTD[BUILDLIST_GTD_BG], 1);
    TextDrawBoxColor    (g_BuildListGTD[BUILDLIST_GTD_BG], 100);
    TextDrawTextSize    (g_BuildListGTD[BUILDLIST_GTD_BG], 0.0, 230.0);

    g_BuildListGTD[BUILDLIST_GTD_CLOSE] =
    TextDrawCreate          (221.0, 138.0, "X");
    TextDrawAlignment       (g_BuildListGTD[BUILDLIST_GTD_CLOSE], 2);
    TextDrawBackgroundColor (g_BuildListGTD[BUILDLIST_GTD_CLOSE], 255);
    TextDrawFont            (g_BuildListGTD[BUILDLIST_GTD_CLOSE], 1);
    TextDrawLetterSize      (g_BuildListGTD[BUILDLIST_GTD_CLOSE], 0.3, 1.0);
    TextDrawColor           (g_BuildListGTD[BUILDLIST_GTD_CLOSE], RGBA_WHITE);
    TextDrawSetOutline      (g_BuildListGTD[BUILDLIST_GTD_CLOSE], 1);
    TextDrawSetProportional (g_BuildListGTD[BUILDLIST_GTD_CLOSE], 1);
    TextDrawUseBox          (g_BuildListGTD[BUILDLIST_GTD_CLOSE], 1);
    TextDrawBoxColor        (g_BuildListGTD[BUILDLIST_GTD_CLOSE], 0xFF000064);
    TextDrawTextSize        (g_BuildListGTD[BUILDLIST_GTD_CLOSE], 10.0, 20.0);
    TextDrawSetSelectable   (g_BuildListGTD[BUILDLIST_GTD_CLOSE], 1);

    g_BuildListGTD[BUILDLIST_GTD_PAGE_F] =
    TextDrawCreate          (11.0, 151.0, "<<");
    TextDrawAlignment       (g_BuildListGTD[BUILDLIST_GTD_PAGE_F], 2);
    TextDrawBackgroundColor (g_BuildListGTD[BUILDLIST_GTD_PAGE_F], 255);
    TextDrawFont            (g_BuildListGTD[BUILDLIST_GTD_PAGE_F], 1);
    TextDrawLetterSize      (g_BuildListGTD[BUILDLIST_GTD_PAGE_F], 0.2, 1.0);
    TextDrawColor           (g_BuildListGTD[BUILDLIST_GTD_PAGE_F], RGBA_WHITE);
    TextDrawSetOutline      (g_BuildListGTD[BUILDLIST_GTD_PAGE_F], 1);
    TextDrawSetProportional (g_BuildListGTD[BUILDLIST_GTD_PAGE_F], 1);
    TextDrawTextSize        (g_BuildListGTD[BUILDLIST_GTD_PAGE_F], 10.0, 20.0);
    TextDrawSetSelectable   (g_BuildListGTD[BUILDLIST_GTD_PAGE_F], 1);

    g_BuildListGTD[BUILDLIST_GTD_PAGE_P] =
    TextDrawCreate          (34.0, 151.0, "<");
    TextDrawAlignment       (g_BuildListGTD[BUILDLIST_GTD_PAGE_P], 2);
    TextDrawBackgroundColor (g_BuildListGTD[BUILDLIST_GTD_PAGE_P], 255);
    TextDrawFont            (g_BuildListGTD[BUILDLIST_GTD_PAGE_P], 1);
    TextDrawLetterSize      (g_BuildListGTD[BUILDLIST_GTD_PAGE_P], 0.2, 1.0);
    TextDrawColor           (g_BuildListGTD[BUILDLIST_GTD_PAGE_P], RGBA_WHITE);
    TextDrawSetOutline      (g_BuildListGTD[BUILDLIST_GTD_PAGE_P], 1);
    TextDrawSetProportional (g_BuildListGTD[BUILDLIST_GTD_PAGE_P], 1);
    TextDrawTextSize        (g_BuildListGTD[BUILDLIST_GTD_PAGE_P], 10.0, 20.0);
    TextDrawSetSelectable   (g_BuildListGTD[BUILDLIST_GTD_PAGE_P], 1);

    g_BuildListGTD[BUILDLIST_GTD_PAGE_N] =
    TextDrawCreate          (198.0, 151.0, ">");
    TextDrawAlignment       (g_BuildListGTD[BUILDLIST_GTD_PAGE_N], 2);
    TextDrawBackgroundColor (g_BuildListGTD[BUILDLIST_GTD_PAGE_N], 255);
    TextDrawFont            (g_BuildListGTD[BUILDLIST_GTD_PAGE_N], 1);
    TextDrawLetterSize      (g_BuildListGTD[BUILDLIST_GTD_PAGE_N], 0.2, 1.0);
    TextDrawColor           (g_BuildListGTD[BUILDLIST_GTD_PAGE_N], RGBA_WHITE);
    TextDrawSetOutline      (g_BuildListGTD[BUILDLIST_GTD_PAGE_N], 1);
    TextDrawSetProportional (g_BuildListGTD[BUILDLIST_GTD_PAGE_N], 1);
    TextDrawTextSize        (g_BuildListGTD[BUILDLIST_GTD_PAGE_N], 10.0, 20.0);
    TextDrawSetSelectable   (g_BuildListGTD[BUILDLIST_GTD_PAGE_N], 1);

    g_BuildListGTD[BUILDLIST_GTD_PAGE_L] =
    TextDrawCreate          (221.0, 151.0, ">>");
    TextDrawAlignment       (g_BuildListGTD[BUILDLIST_GTD_PAGE_L], 2);
    TextDrawBackgroundColor (g_BuildListGTD[BUILDLIST_GTD_PAGE_L], 255);
    TextDrawFont            (g_BuildListGTD[BUILDLIST_GTD_PAGE_L], 1);
    TextDrawLetterSize      (g_BuildListGTD[BUILDLIST_GTD_PAGE_L], 0.2, 1.0);
    TextDrawColor           (g_BuildListGTD[BUILDLIST_GTD_PAGE_L], RGBA_WHITE);
    TextDrawSetOutline      (g_BuildListGTD[BUILDLIST_GTD_PAGE_L], 1);
    TextDrawSetProportional (g_BuildListGTD[BUILDLIST_GTD_PAGE_L], 1);
    TextDrawTextSize        (g_BuildListGTD[BUILDLIST_GTD_PAGE_L], 10.0, 20.0);
    TextDrawSetSelectable   (g_BuildListGTD[BUILDLIST_GTD_PAGE_L], 1);
}

DestroyGenericBuildList() {
    for(new gtd; gtd < MAX_BUILDLIST_GTDS; gtd ++) {
        TextDrawDestroy( g_BuildListGTD[gtd] );

        g_BuildListGTD[gtd] = Text: INVALID_TEXT_DRAW;
    }
}

CreatePlayerBuildList(playerid) {
    g_BuildListPTD[playerid][BUILDLIST_PTD_CAPTION] =
    CreatePlayerTextDraw          (playerid, 4.0, 127.0, "Buildings");
    PlayerTextDrawBackgroundColor (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_CAPTION], 255);
    PlayerTextDrawFont            (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_CAPTION], 0);
    PlayerTextDrawLetterSize      (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_CAPTION], 0.5, 2.0);
    PlayerTextDrawColor           (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_CAPTION], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_CAPTION], 1);
    PlayerTextDrawSetProportional (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_CAPTION], 1);

    g_BuildListPTD[playerid][BUILDLIST_PTD_PAGE] =
    CreatePlayerTextDraw          (playerid, 116.0, 151.0, "Page");
    PlayerTextDrawAlignment       (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_PAGE], 2);
    PlayerTextDrawBackgroundColor (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_PAGE], 255);
    PlayerTextDrawFont            (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_PAGE], 1);
    PlayerTextDrawLetterSize      (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_PAGE], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_PAGE], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_PAGE], 1);
    PlayerTextDrawSetProportional (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_PAGE], 1);
    PlayerTextDrawTextSize        (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_PAGE], 10.0, 138.0);
    PlayerTextDrawSetSelectable   (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_PAGE], 1);

    g_BuildListPTD[playerid][BUILDLIST_PTD_INCMODE] =
    CreatePlayerTextDraw          (playerid, 116.0, 164.0, "Including Buildings:");
    PlayerTextDrawAlignment       (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_INCMODE], 2);
    PlayerTextDrawBackgroundColor (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_INCMODE], 255);
    PlayerTextDrawFont            (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_INCMODE], 1);
    PlayerTextDrawLetterSize      (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_INCMODE], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_INCMODE], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_INCMODE], 1);
    PlayerTextDrawSetProportional (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_INCMODE], 1);
    PlayerTextDrawTextSize        (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_INCMODE], 10.0, 230.0);
    PlayerTextDrawSetSelectable   (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_INCMODE], 1);

    g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_COL] =
    CreatePlayerTextDraw          (playerid, 1.0, 177.0, "Building ID");
    PlayerTextDrawBackgroundColor (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_COL], 255);
    PlayerTextDrawFont            (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_COL], 1);
    PlayerTextDrawLetterSize      (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_COL], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_COL], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_COL], 1);
    PlayerTextDrawSetProportional (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_COL], 1);
    PlayerTextDrawTextSize        (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_COL], 40.0, 10.0);

    g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_COL] =
    CreatePlayerTextDraw          (playerid, 43.0, 177.0, "Model ID");
    PlayerTextDrawBackgroundColor (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_COL], 255);
    PlayerTextDrawFont            (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_COL], 1);
    PlayerTextDrawLetterSize      (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_COL], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_COL], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_COL], 1);
    PlayerTextDrawSetProportional (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_COL], 1);
    PlayerTextDrawTextSize        (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_COL], 82.0, 10.0);

    g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_COL] =
    CreatePlayerTextDraw          (playerid, 85.0, 177.0, "Model Name");
    PlayerTextDrawBackgroundColor (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_COL], 255);
    PlayerTextDrawFont            (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_COL], 1);
    PlayerTextDrawLetterSize      (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_COL], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_COL], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_COL], 1);
    PlayerTextDrawSetProportional (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_COL], 1);
    PlayerTextDrawTextSize        (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_COL], 231.0, 10.0);

    for(new row, Float:y = 190.0; row < MAX_BUILDLIST_ROWS; row ++, y += 13.0) {
        g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_ROW][row] =
        CreatePlayerTextDraw          (playerid, 1.0, y, "Building ID");
        PlayerTextDrawBackgroundColor (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_ROW][row], 255);
        PlayerTextDrawFont            (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_ROW][row], 1);
        PlayerTextDrawLetterSize      (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_ROW][row], 0.2, 1.0);
        PlayerTextDrawColor           (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_ROW][row], RGBA_WHITE);
        PlayerTextDrawSetOutline      (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_ROW][row], 1);
        PlayerTextDrawSetProportional (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_ROW][row], 1);
        PlayerTextDrawUseBox          (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_ROW][row], 1);
        PlayerTextDrawBoxColor        (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_ROW][row], 100);
        PlayerTextDrawTextSize        (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_ROW][row], 40.0, 10.0);
        PlayerTextDrawSetSelectable   (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_ROW][row], 1);

        g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_ROW][row] =
        CreatePlayerTextDraw          (playerid, 43.0, y, "Model ID");
        PlayerTextDrawBackgroundColor (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_ROW][row], 255);
        PlayerTextDrawFont            (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_ROW][row], 1);
        PlayerTextDrawLetterSize      (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_ROW][row], 0.2, 1.0);
        PlayerTextDrawColor           (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_ROW][row], RGBA_WHITE);
        PlayerTextDrawSetOutline      (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_ROW][row], 1);
        PlayerTextDrawSetProportional (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_ROW][row], 1);
        PlayerTextDrawUseBox          (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_ROW][row], 1);
        PlayerTextDrawBoxColor        (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_ROW][row], 100);
        PlayerTextDrawTextSize        (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_ROW][row], 82.0, 10.0);
        PlayerTextDrawSetSelectable   (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_ROW][row], 1);

        g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_ROW][row] =
        CreatePlayerTextDraw          (playerid, 85.0, y, "Model Name");
        PlayerTextDrawBackgroundColor (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_ROW][row], 255);
        PlayerTextDrawFont            (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_ROW][row], 1);
        PlayerTextDrawLetterSize      (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_ROW][row], 0.2, 1.0);
        PlayerTextDrawColor           (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_ROW][row], RGBA_WHITE);
        PlayerTextDrawSetOutline      (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_ROW][row], 1);
        PlayerTextDrawSetProportional (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_ROW][row], 1);
        PlayerTextDrawUseBox          (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_ROW][row], 1);
        PlayerTextDrawBoxColor        (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_ROW][row], 100);
        PlayerTextDrawTextSize        (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_ROW][row], 231.0, 10.0);
        PlayerTextDrawSetSelectable   (playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_ROW][row], 1);
    }
}

DestroyPlayerBuildList(playerid) {
    for(new ptd; ptd < MAX_BUILDLIST_PTDS; ptd ++) {
        PlayerTextDrawDestroy(playerid, g_BuildListPTD[playerid][ptd]);

        g_BuildListPTD[playerid][ptd] = PlayerText: INVALID_TEXT_DRAW;
    }
}

ShowBuildList(playerid) {
    CreatePlayerBuildList(playerid);

    for(new gtd; gtd < MAX_BUILDLIST_GTDS; gtd ++) {
        TextDrawShowForPlayer(playerid, g_BuildListGTD[gtd]);
    }

    g_BuildListData[playerid][BUILDLIST_DATA_PAGE] = MIN_BUILDLIST_PAGE;
    LoadBuildListRowData(playerid);

    PlayerTextDrawShow(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_COL]);
    PlayerTextDrawShow(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_COL]);
    PlayerTextDrawShow(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_COL]);
    PlayerTextDrawShow(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_CAPTION]);

    ApplyBuildListPage(playerid);
    PlayerTextDrawShow(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_PAGE]);

    ApplyBuildListIncludeMode(playerid);
    PlayerTextDrawShow(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_INCMODE]);

    for(new row; row < MAX_BUILDLIST_ROWS; row ++) {
        ApplyBuildListRowData(playerid, row);
    }

    new buildingid = GetPlayerEditBuilding(playerid);
    g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] = ( buildingid == INVALID_BUILDING_ID ) ? INVALID_MODEL_ID : g_BuildingData[buildingid][BUILDING_DATA_MODEL];

    if( g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] != INVALID_MODEL_ID ) {
        if( g_ModelViewData[playerid][MODELVIEW_DATA_TOGGLE] ) {
            ApplyModelViewModel(playerid, .showtd = true);
        } else {
            ShowModelView(playerid);
        }
    }
}

HideBuildList(playerid) {
    HideModelView(playerid);

    for(new gtd; gtd < MAX_BUILDLIST_GTDS; gtd ++) {
        TextDrawHideForPlayer(playerid, g_BuildListGTD[gtd]);
    }

    DestroyPlayerBuildList(playerid);
}

GetBuildListNewEditRow(playerid) {
    new edit_buildingid = GetPlayerEditBuilding(playerid);
    if( edit_buildingid == INVALID_BUILDING_ID ) {
        return INVALID_ROW;
    }

    for(new row, row_buildingid; row < MAX_BUILDLIST_ROWS; row ++) {
        row_buildingid = g_BuildListData[playerid][BUILDLIST_DATA_ROW_ID][row];
        if( edit_buildingid == row_buildingid ) {
            return row;
        }
    }

    return INVALID_ROW;
}

ApplyBuildListIncludeMode(playerid) {
    switch( g_BuildListData[playerid][BUILDLIST_DATA_INCMODE] ) {
        case BUILDING_INCMODE_ALL: {
            PlayerTextDrawSetString(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_INCMODE], "Including Buildings: All");
        }
        case BUILDING_INCMODE_REMOVED: {
            PlayerTextDrawSetString(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_INCMODE], "Including Buildings: Removed Only");
        }
        case BUILDING_INCMODE_EXISTING: {
            PlayerTextDrawSetString(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_INCMODE], "Including Buildings: Existing Only");
        }
        default: {
            PlayerTextDrawSetString(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_INCMODE], "Including Buildings: Unknown Mode");
            return 0;
        }
    }
    return 1;
}

ApplyBuildListPage(playerid) {
    format(g_TextdrawString, sizeof g_TextdrawString, "Page %i / %i", g_BuildListData[playerid][BUILDLIST_DATA_PAGE] + 1, MAX_BUILDLIST_PAGE + 1);
    PlayerTextDrawSetString(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_PAGE], g_TextdrawString);
}

ApplyBuildListRowColor(playerid, row) {
    new rgba_boxcolor;

    if( row == g_BuildListData[playerid][BUILDLIST_DATA_EDIT_ROW] ) {
        rgba_boxcolor = g_BuildListData[playerid][BUILDLIST_DATA_EDIT_VIEWED] ? 0xFFFF0064 : 0xFFFF0032;
    } else {
        rgba_boxcolor = 0x00000000;
    }

    PlayerTextDrawBoxColor(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_ROW][row],        rgba_boxcolor);
    PlayerTextDrawBoxColor(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_ROW][row],   rgba_boxcolor);
    PlayerTextDrawBoxColor(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_ROW][row], rgba_boxcolor);

    PlayerTextDrawShow(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_ROW][row]);
    PlayerTextDrawShow(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_ROW][row]);
    PlayerTextDrawShow(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_ROW][row]);

    return 1;
}

ApplyBuildListRowData(playerid, row) {
    new buildingid = g_BuildListData[playerid][BUILDLIST_DATA_ROW_ID][row];

    if( buildingid == INVALID_BUILDING_ID ) {
        PlayerTextDrawHide(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_ROW][row]);
        PlayerTextDrawHide(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_ROW][row]);
        PlayerTextDrawHide(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_ROW][row]);
        return 0;
    }

    new
        modelid = g_BuildingData[buildingid][BUILDING_DATA_MODEL],
        buildingid_str[5+1],
        modelid_str[6+1]
    ;

    format(buildingid_str, sizeof buildingid_str, "%i", buildingid);
    format(modelid_str, sizeof modelid_str, "%i", modelid);
    GetModelName(modelid, g_ModelString, sizeof g_ModelString);

    PlayerTextDrawSetString(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_BUILDID_ROW][row], buildingid_str);
    PlayerTextDrawSetString(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELID_ROW][row], modelid_str);
    PlayerTextDrawSetString(playerid, g_BuildListPTD[playerid][BUILDLIST_PTD_MODELNAME_ROW][row], g_ModelString);

    ApplyBuildListRowColor(playerid, row);
    return 1;
}

LoadBuildListRowData(playerid) {
    new
               rows_added,
        Float: player_x,
        Float: player_y,
        Float: player_z
    ;

    GetPlayerPos(playerid, player_x, player_y, player_z);

    rows_added = FindBuildings(
        .result = g_BuildListData[playerid][BUILDLIST_DATA_ROW_ID],
        .result_size = MAX_BUILDLIST_ROWS,
        .offset = g_BuildListData[playerid][BUILDLIST_DATA_PAGE] * MAX_BUILDLIST_ROWS,
        .incmode = g_BuildListData[playerid][BUILDLIST_DATA_INCMODE],
        .x = player_x,
        .y = player_y,
        .z = player_z
    );

    for(new row = rows_added; row < MAX_BUILDLIST_ROWS; row ++) {
        g_BuildListData[playerid][BUILDLIST_DATA_ROW_ID][row] = INVALID_BUILDING_ID;
    }

    g_BuildListData[playerid][BUILDLIST_DATA_EDIT_ROW] = GetBuildListNewEditRow(playerid);
    return 1;
}

ShowBuildListDialog(playerid, dialogid) {
    switch( dialogid ) {
        case DIALOGID_BUILDLIST_PAGE: {
            g_DialogCaption = "Buildings: Page";
            format(g_DialogInfo, sizeof g_DialogInfo, "Page: %i / %i", g_BuildListData[playerid][BUILDLIST_DATA_PAGE] + 1, MAX_BUILDLIST_PAGE + 1);
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, g_DialogCaption, g_DialogInfo, "Enter", "Cancel");
        }
        case DIALOGID_BUILDLIST_REMOVE: {
            new buildingid = GetPlayerEditBuilding(playerid);
            if( buildingid == INVALID_BUILDING_ID ) {
                return 1;
            }

            new modelid = g_BuildingData[buildingid][BUILDING_DATA_MODEL];
            GetModelName(modelid, g_ModelString, sizeof g_ModelString);

            g_DialogCaption = "Buildings: Remove Building";
            format(g_DialogInfo, sizeof g_DialogInfo, "\
                Building ID:\t%i\n\
                Model ID:   \t%i\n\
                Model Name: \t%s",
                buildingid,
                modelid,
                g_ModelString
            );

            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, g_DialogCaption, g_DialogInfo, "Remove", "Cancel");
        }
        case DIALOGID_BUILDLIST_RECREATE: {
            new buildingid = GetPlayerEditBuilding(playerid);
            if( buildingid == INVALID_BUILDING_ID ) {
                return 1;
            }

            new modelid = g_BuildingData[buildingid][BUILDING_DATA_MODEL];
            GetModelName(modelid, g_ModelString, sizeof g_ModelString);

            g_DialogCaption = "Buildings: Recreate Building";
            format(g_DialogInfo, sizeof g_DialogInfo, "\
                Building ID:\t%i\n\
                Model ID:   \t%i\n\
                Model Name: \t%s",
                buildingid,
                modelid,
                g_ModelString
            );

            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, g_DialogCaption, g_DialogInfo, "Recreate", "Cancel");
	    }
        default: {
            return 0;
        }
    }
    return 1;
}
