DefaultCategoryManagerData(playerid) {
    g_CatManagerData[playerid][CATMANAGER_DATA_CATEGORY] = INVALID_CATEGORY_ID;

    g_CatManagerData[playerid][CATMANAGER_DATA_SELECT_ID] = INVALID_MODEL_ID;

    g_CatManagerData[playerid][CATMANAGER_DATA_SELECT_ROW] = INVALID_ROW;

    g_CatManagerData[playerid][CATMANAGER_DATA_SELECT_WINDOW] = CATMANAGER_WINDOW_ALL;

    g_CatManagerData[playerid][CATMANAGER_DATA_PAGE_ALL] = MIN_CATMANAGER_PAGE;
    g_CatManagerData[playerid][CATMANAGER_DATA_PAGE_CAT] = MIN_CATMANAGER_PAGE;

    g_CatManagerData[playerid][CATMANAGER_DATA_MAXPAGE_ALL] = MIN_CATMANAGER_PAGE;
    g_CatManagerData[playerid][CATMANAGER_DATA_MAXPAGE_CAT] = MIN_CATMANAGER_PAGE;

    strpack(g_CatManagerData[playerid][CATMANAGER_DATA_SEARCH_ALL], "", MAX_SEARCH_LEN+1);
    strpack(g_CatManagerData[playerid][CATMANAGER_DATA_SEARCH_CAT], "", MAX_SEARCH_LEN+1);

    for(new row; row < MAX_CATMANAGER_ROWS; row ++) {
        g_CatManagerData[playerid][CATMANAGER_DATA_ROW_ID_ALL][row] = INVALID_MODEL_ID;
        g_CatManagerData[playerid][CATMANAGER_DATA_ROW_ID_CAT][row] = INVALID_MODEL_ID;
    }
}

CreateGenericCategoryManager() {
    g_CatManagerGTD[CATMANAGER_GTD_BG] =
    TextDrawCreate            (116.0, 47.0, "_");
    TextDrawAlignment        (g_CatManagerGTD[CATMANAGER_GTD_BG], 2);
    TextDrawLetterSize        (g_CatManagerGTD[CATMANAGER_GTD_BG], 0.0, 44.4);
    TextDrawUseBox            (g_CatManagerGTD[CATMANAGER_GTD_BG], 1);
    TextDrawBoxColor        (g_CatManagerGTD[CATMANAGER_GTD_BG], 100);
    TextDrawTextSize        (g_CatManagerGTD[CATMANAGER_GTD_BG], 0.0, 230.0);

    // Caption
    g_CatManagerGTD[CATMANAGER_GTD_CAPTION] =
    TextDrawCreate            (2.0, 35.0, "Category Manager");
    TextDrawBackgroundColor    (g_CatManagerGTD[CATMANAGER_GTD_CAPTION], 255);
    TextDrawFont            (g_CatManagerGTD[CATMANAGER_GTD_CAPTION], 0);
    TextDrawLetterSize        (g_CatManagerGTD[CATMANAGER_GTD_CAPTION], 0.5, 2.0);
    TextDrawColor            (g_CatManagerGTD[CATMANAGER_GTD_CAPTION], RGBA_WHITE);
    TextDrawSetOutline        (g_CatManagerGTD[CATMANAGER_GTD_CAPTION], 1);
    TextDrawSetProportional    (g_CatManagerGTD[CATMANAGER_GTD_CAPTION], 1);
    TextDrawSetSelectable    (g_CatManagerGTD[CATMANAGER_GTD_CAPTION], 0);

    g_CatManagerGTD[CATMANAGER_GTD_CLOSE] =
    TextDrawCreate            (221.0, 47.0, "X");
    TextDrawAlignment        (g_CatManagerGTD[CATMANAGER_GTD_CLOSE], 2);
    TextDrawBackgroundColor    (g_CatManagerGTD[CATMANAGER_GTD_CLOSE], 255);
    TextDrawFont            (g_CatManagerGTD[CATMANAGER_GTD_CLOSE], 1);
    TextDrawLetterSize        (g_CatManagerGTD[CATMANAGER_GTD_CLOSE], 0.3, 1.0);
    TextDrawColor            (g_CatManagerGTD[CATMANAGER_GTD_CLOSE], RGBA_WHITE);
    TextDrawSetOutline        (g_CatManagerGTD[CATMANAGER_GTD_CLOSE], 1);
    TextDrawSetProportional    (g_CatManagerGTD[CATMANAGER_GTD_CLOSE], 1);
    TextDrawUseBox            (g_CatManagerGTD[CATMANAGER_GTD_CLOSE], 1);
    TextDrawBoxColor        (g_CatManagerGTD[CATMANAGER_GTD_CLOSE], 0xFF000064);
    TextDrawTextSize        (g_CatManagerGTD[CATMANAGER_GTD_CLOSE], 10.0, 20.0);
    TextDrawSetSelectable    (g_CatManagerGTD[CATMANAGER_GTD_CLOSE], 1);

    g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_CREATE] =
    TextDrawCreate            (38.0, 60.0, "Create Category");
    TextDrawAlignment        (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_CREATE], 2);
    TextDrawBackgroundColor    (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_CREATE], 255);
    TextDrawFont            (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_CREATE], 1);
    TextDrawLetterSize        (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_CREATE], 0.2, 1.0);
    TextDrawColor            (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_CREATE], RGBA_WHITE);
    TextDrawSetOutline        (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_CREATE], 1);
    TextDrawSetProportional    (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_CREATE], 1);
    TextDrawTextSize        (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_CREATE], 10.0, 74.0);
    TextDrawSetSelectable    (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_CREATE], 1);

    g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_DESTROY] =
    TextDrawCreate            (116.0, 60.0, "Destroy Category");
    TextDrawAlignment        (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_DESTROY], 2);
    TextDrawBackgroundColor    (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_DESTROY], 255);
    TextDrawFont            (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_DESTROY], 1);
    TextDrawLetterSize        (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_DESTROY], 0.2, 1.0);
    TextDrawColor            (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_DESTROY], RGBA_WHITE);
    TextDrawSetOutline        (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_DESTROY], 1);
    TextDrawSetProportional    (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_DESTROY], 1);
    TextDrawTextSize        (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_DESTROY], 10.0, 74.0);
    TextDrawSetSelectable    (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_DESTROY], 1);

    g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_RENAME] =
    TextDrawCreate            (194.0, 60.0, "Rename Category");
    TextDrawAlignment        (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_RENAME], 2);
    TextDrawBackgroundColor    (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_RENAME], 255);
    TextDrawFont            (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_RENAME], 1);
    TextDrawLetterSize        (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_RENAME], 0.2, 1.0);
    TextDrawColor            (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_RENAME], RGBA_WHITE);
    TextDrawSetOutline        (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_RENAME], 1);
    TextDrawSetProportional    (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_RENAME], 1);
    TextDrawTextSize        (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_RENAME], 10.0, 74.0);
    TextDrawSetSelectable    (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_RENAME], 1);

    g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_ALL] =
    TextDrawCreate            (11.0, 99.0, "<<");
    TextDrawAlignment        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_ALL], 2);
    TextDrawBackgroundColor    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_ALL], 255);
    TextDrawFont            (g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_ALL], 1);
    TextDrawLetterSize        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_ALL], 0.2, 1.0);
    TextDrawColor            (g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_ALL], RGBA_WHITE);
    TextDrawSetOutline        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_ALL], 1);
    TextDrawSetProportional    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_ALL], 1);
    TextDrawTextSize        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_ALL], 10.0, 20.0);
    TextDrawSetSelectable    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_ALL], 1);

    g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_CAT] =
    TextDrawCreate            (11.0, 281.0, "<<");
    TextDrawAlignment        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_CAT], 2);
    TextDrawBackgroundColor    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_CAT], 255);
    TextDrawFont            (g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_CAT], 1);
    TextDrawLetterSize        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_CAT], 0.2, 1.0);
    TextDrawColor            (g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_CAT], RGBA_WHITE);
    TextDrawSetOutline        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_CAT], 1);
    TextDrawSetProportional    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_CAT], 1);
    TextDrawTextSize        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_CAT], 10.0, 20.0);
    TextDrawSetSelectable    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_CAT], 1);

    g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_ALL] =
    TextDrawCreate            (34.0, 99.0, "<");
    TextDrawAlignment        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_ALL], 2);
    TextDrawBackgroundColor    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_ALL], 255);
    TextDrawFont            (g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_ALL], 1);
    TextDrawLetterSize        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_ALL], 0.2, 1.0);
    TextDrawColor            (g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_ALL], RGBA_WHITE);
    TextDrawSetOutline        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_ALL], 1);
    TextDrawSetProportional    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_ALL], 1);
    TextDrawTextSize        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_ALL], 10.0, 20.0);
    TextDrawSetSelectable    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_ALL], 1);

    g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_CAT] =
    TextDrawCreate            (34.0, 281.0, "<");
    TextDrawAlignment        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_CAT], 2);
    TextDrawBackgroundColor    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_CAT], 255);
    TextDrawFont            (g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_CAT], 1);
    TextDrawLetterSize        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_CAT], 0.2, 1.0);
    TextDrawColor            (g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_CAT], RGBA_WHITE);
    TextDrawSetOutline        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_CAT], 1);
    TextDrawSetProportional    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_CAT], 1);
    TextDrawTextSize        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_CAT], 10.0, 20.0);
    TextDrawSetSelectable    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_CAT], 1);

    g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_ALL] =
    TextDrawCreate            (198.0, 99.0, ">");
    TextDrawAlignment        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_ALL], 2);
    TextDrawBackgroundColor    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_ALL], 255);
    TextDrawFont            (g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_ALL], 1);
    TextDrawLetterSize        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_ALL], 0.2, 1.0);
    TextDrawColor            (g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_ALL], RGBA_WHITE);
    TextDrawSetOutline        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_ALL], 1);
    TextDrawSetProportional    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_ALL], 1);
    TextDrawTextSize        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_ALL], 10.0, 20.0);
    TextDrawSetSelectable    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_ALL], 1);

    g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_CAT] =
    TextDrawCreate            (198.0, 281.0, ">");
    TextDrawAlignment        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_CAT], 2);
    TextDrawBackgroundColor    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_CAT], 255);
    TextDrawFont            (g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_CAT], 1);
    TextDrawLetterSize        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_CAT], 0.2, 1.0);
    TextDrawColor            (g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_CAT], RGBA_WHITE);
    TextDrawSetOutline        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_CAT], 1);
    TextDrawSetProportional    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_CAT], 1);
    TextDrawTextSize        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_CAT], 10.0, 20.0);
    TextDrawSetSelectable    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_CAT], 1);

    g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_ALL] =
    TextDrawCreate            (221.0, 99.0, ">>");
    TextDrawAlignment        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_ALL], 2);
    TextDrawBackgroundColor    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_ALL], 255);
    TextDrawFont            (g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_ALL], 1);
    TextDrawLetterSize        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_ALL], 0.2, 1.0);
    TextDrawColor            (g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_ALL], RGBA_WHITE);
    TextDrawSetOutline        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_ALL], 1);
    TextDrawSetProportional    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_ALL], 1);
    TextDrawTextSize        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_ALL], 10.0, 20.0);
    TextDrawSetSelectable    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_ALL], 1);

    g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_CAT] =
    TextDrawCreate            (221.0, 281.0, ">>");
    TextDrawAlignment        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_CAT], 2);
    TextDrawBackgroundColor    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_CAT], 255);
    TextDrawFont            (g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_CAT], 1);
    TextDrawLetterSize        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_CAT], 0.2, 1.0);
    TextDrawColor            (g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_CAT], RGBA_WHITE);
    TextDrawSetOutline        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_CAT], 1);
    TextDrawSetProportional    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_CAT], 1);
    TextDrawTextSize        (g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_CAT], 10.0, 20.0);
    TextDrawSetSelectable    (g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_CAT], 1);

    g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_BELOW] =
    TextDrawCreate            (116.0, 268.0, "Category Models Below");
    TextDrawAlignment        (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_BELOW], 2);
    TextDrawBackgroundColor    (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_BELOW], 255);
    TextDrawFont            (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_BELOW], 1);
    TextDrawLetterSize        (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_BELOW], 0.2, 1.0);
    TextDrawColor            (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_BELOW], RGBA_WHITE);
    TextDrawSetOutline        (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_BELOW], 1);
    TextDrawSetProportional    (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_BELOW], 1);
    TextDrawUseBox            (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_BELOW], 1);
    TextDrawBoxColor        (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_BELOW], 0xFFFFFF64);
    TextDrawTextSize        (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_BELOW], 0.0, 230.0);
    TextDrawSetSelectable    (g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_BELOW], 0);
}

DestroyGenericCategoryManager() {
    for(new gtd; gtd < CATMANAGER_GTDS; gtd ++) {
        TextDrawDestroy( g_CatManagerGTD[gtd] );
        g_CatManagerGTD[gtd] = Text: INVALID_TEXT_DRAW;
    }
}

CreatePlayerCategoryManager(playerid) {
    // Category Type: Models
    g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_MODELS] =
    CreatePlayerTextDraw            (playerid, 29.0, 73.0, "Models");
    PlayerTextDrawAlignment            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_MODELS], 2);
    PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_MODELS], 255);
    PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_MODELS], 1);
    PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_MODELS], 0.2, 1.0);
    PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_MODELS], RGBA_WHITE);
    PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_MODELS], 1);
    PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_MODELS], 1);
    PlayerTextDrawUseBox            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_MODELS], 1);
    PlayerTextDrawBoxColor          (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_MODELS], 0x0);
    PlayerTextDrawTextSize            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_MODELS], 10.0, 55.0);
    PlayerTextDrawSetSelectable        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_MODELS], 1);

    // Category Type: Vehicles
    g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_VEHICLES] =
    CreatePlayerTextDraw            (playerid, 87.0, 73.0, "Vehicles");
    PlayerTextDrawAlignment            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_VEHICLES], 2);
    PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_VEHICLES], 255);
    PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_VEHICLES], 1);
    PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_VEHICLES], 0.2, 1.0);
    PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_VEHICLES], RGBA_WHITE);
    PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_VEHICLES], 1);
    PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_VEHICLES], 1);
    PlayerTextDrawUseBox            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_VEHICLES], 1);
    PlayerTextDrawBoxColor          (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_VEHICLES], 0x0);
    PlayerTextDrawTextSize            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_VEHICLES], 10.0, 55.0);
    PlayerTextDrawSetSelectable        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_VEHICLES], 1);

    // Category Type: Skins
    g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_SKINS] =
    CreatePlayerTextDraw            (playerid, 145.0, 73.0, "Skins");
    PlayerTextDrawAlignment            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_SKINS], 2);
    PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_SKINS], 255);
    PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_SKINS], 1);
    PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_SKINS], 0.2, 1.0);
    PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_SKINS], RGBA_WHITE);
    PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_SKINS], 1);
    PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_SKINS], 1);
    PlayerTextDrawUseBox            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_SKINS], 1);
    PlayerTextDrawBoxColor          (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_SKINS], 0x0);
    PlayerTextDrawTextSize            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_SKINS], 10.0, 55.0);
    PlayerTextDrawSetSelectable        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_SKINS], 1);

    // Category Type: Textures
    g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_TEXTURES] =
    CreatePlayerTextDraw            (playerid, 203.0, 73.0, "Textures");
    PlayerTextDrawAlignment            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_TEXTURES], 2);
    PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_TEXTURES], 255);
    PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_TEXTURES], 1);
    PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_TEXTURES], 0.2, 1.0);
    PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_TEXTURES], RGBA_WHITE);
    PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_TEXTURES], 1);
    PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_TEXTURES], 1);
    PlayerTextDrawUseBox            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_TEXTURES], 1);
    PlayerTextDrawBoxColor          (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_TEXTURES], 0x0);
    PlayerTextDrawTextSize            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_TEXTURES], 10.0, 55.0);
    PlayerTextDrawSetSelectable        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_TEXTURES], 1);

    // Category ID / Name
    g_CatManagerPTD[playerid][CATMANAGER_PTD_CATEGORY_NAME] =
    CreatePlayerTextDraw            (playerid, 116.0, 86.0, "Category");
    PlayerTextDrawAlignment            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_CATEGORY_NAME], 2);
    PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_CATEGORY_NAME], 255);
    PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_CATEGORY_NAME], 1);
    PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_CATEGORY_NAME], 0.2, 1.0);
    PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_CATEGORY_NAME], RGBA_WHITE);
    PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_CATEGORY_NAME], 1);
    PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_CATEGORY_NAME], 1);
    PlayerTextDrawTextSize            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_CATEGORY_NAME], 10.0, 230.0);
    PlayerTextDrawSetSelectable        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_CATEGORY_NAME], 1);

    // Page (All)
    g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_ALL] =
    CreatePlayerTextDraw            (playerid, 116.0, 99.0, "Page");
    PlayerTextDrawAlignment            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_ALL], 2);
    PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_ALL], 255);
    PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_ALL], 1);
    PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_ALL], 0.2, 1.0);
    PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_ALL], RGBA_WHITE);
    PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_ALL], 1);
    PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_ALL], 1);
    PlayerTextDrawTextSize            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_ALL], 10.0, 138.0);
    PlayerTextDrawSetSelectable        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_ALL], 1);

    // Page (Category)
    g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_CAT] =
    CreatePlayerTextDraw            (playerid, 116.0, 281.0, "Page");
    PlayerTextDrawAlignment            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_CAT], 2);
    PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_CAT], 255);
    PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_CAT], 1);
    PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_CAT], 0.2, 1.0);
    PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_CAT], RGBA_WHITE);
    PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_CAT], 1);
    PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_CAT], 1);
    PlayerTextDrawTextSize            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_CAT], 10.0, 138.0);
    PlayerTextDrawSetSelectable        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_CAT], 1);

    // Search (All)
    g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_ALL] =
    CreatePlayerTextDraw            (playerid, 116.0, 112.0, "Search");
    PlayerTextDrawAlignment            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_ALL], 2);
    PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_ALL], 255);
    PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_ALL], 1);
    PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_ALL], 0.2, 1.0);
    PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_ALL], RGBA_WHITE);
    PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_ALL], 1);
    PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_ALL], 1);
    PlayerTextDrawTextSize            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_ALL], 10.0, 230.0);
    PlayerTextDrawSetSelectable        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_ALL], 1);

    // Search (Category)
    g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_CAT] =
    CreatePlayerTextDraw            (playerid, 116.0, 294.0, "Search");
    PlayerTextDrawAlignment            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_CAT], 2);
    PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_CAT], 255);
    PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_CAT], 1);
    PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_CAT], 0.2, 1.0);
    PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_CAT], RGBA_WHITE);
    PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_CAT], 1);
    PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_CAT], 1);
    PlayerTextDrawTextSize            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_CAT], 10.0, 230.0);
    PlayerTextDrawSetSelectable        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_CAT], 1);

    if( g_PlayerData[playerid][PLAYER_DATA_TDMODE] == TDMODE_CATMANAGER_TEXTURES ) {

        // Column: Texture Model ID (All)
        g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_ALL] =
        CreatePlayerTextDraw            (playerid, 1.0, 125.0, "Model ID");
        PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_ALL], 255);
        PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_ALL], 1);
        PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_ALL], 0.2, 1.0);
        PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_ALL], RGBA_WHITE);
        PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_ALL], 1);
        PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_ALL], 1);

        // Column: Texture Model ID (Category)
        g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_CAT] =
        CreatePlayerTextDraw            (playerid, 1.0, 307.0, "Model ID");
        PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_CAT], 255);
        PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_CAT], 1);
        PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_CAT], 0.2, 1.0);
        PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_CAT], RGBA_WHITE);
        PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_CAT], 1);
        PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_CAT], 1);

        // Column: Texture TXD (All)
        g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_ALL] =
        CreatePlayerTextDraw            (playerid, 43.0, 125.0, "Txd");
        PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_ALL], 255);
        PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_ALL], 1);
        PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_ALL], 0.2, 1.0);
        PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_ALL], RGBA_WHITE);
        PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_ALL], 1);
        PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_ALL], 1);

        // Column: Texture TXD (Category)
        g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_CAT] =
        CreatePlayerTextDraw            (playerid, 43.0, 307.0, "Txd");
        PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_CAT], 255);
        PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_CAT], 1);
        PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_CAT], 0.2, 1.0);
        PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_CAT], RGBA_WHITE);
        PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_CAT], 1);
        PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_CAT], 1);

        // Column: Texture Name (All)
        g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_3_ALL] =
        CreatePlayerTextDraw            (playerid, 114.0, 125.0, "Name");
        PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_3_ALL], 255);
        PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_3_ALL], 1);
        PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_3_ALL], 0.2, 1.0);
        PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_3_ALL], RGBA_WHITE);
        PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_3_ALL], 1);
        PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_3_ALL], 1);

        // Column: Texture Name (Category)
        g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_3_CAT] =
        CreatePlayerTextDraw            (playerid, 114.0, 307.0, "Name");
        PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_3_CAT], 255);
        PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_3_CAT], 1);
        PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_3_CAT], 0.2, 1.0);
        PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_3_CAT], RGBA_WHITE);
        PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_3_CAT], 1);
        PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_3_CAT], 1);

        for(new row; row < MAX_CATMANAGER_ROWS; row ++) {
            // Row: Texture Model ID (All)
            g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row] =
            CreatePlayerTextDraw            (playerid, 1.0, 138.0 + (row * 13.0), "Model ID");
            PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], 255);
            PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], 1);
            PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], 0.2, 1.0);
            PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], RGBA_WHITE);
            PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], 1);
            PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], 1);
            PlayerTextDrawUseBox            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], 1);
            PlayerTextDrawBoxColor            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], 0x00000000);
            PlayerTextDrawTextSize            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], 40.0, 10.0);
            PlayerTextDrawSetSelectable        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], 1);

            // Row: Texture Model ID (Category)
            g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row] =
            CreatePlayerTextDraw            (playerid, 1.0, 320.0 + (row * 13.0), "Model ID");
            PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], 255);
            PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], 1);
            PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], 0.2, 1.0);
            PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], RGBA_WHITE);
            PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], 1);
            PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], 1);
            PlayerTextDrawUseBox            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], 1);
            PlayerTextDrawBoxColor            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], 0x00000000);
            PlayerTextDrawTextSize            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], 40.0, 10.0);
            PlayerTextDrawSetSelectable        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], 1);

            // Row: Texture TXD (All)
            g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row] =
            CreatePlayerTextDraw            (playerid, 43.0, 138.0 + (row * 13.0), "Txd");
            PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], 255);
            PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], 1);
            PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], 0.2, 1.0);
            PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], RGBA_WHITE);
            PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], 1);
            PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], 1);
            PlayerTextDrawUseBox            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], 1);
            PlayerTextDrawBoxColor            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], 0x00000000);
            PlayerTextDrawTextSize            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], 111.0, 10.0);
            PlayerTextDrawSetSelectable        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], 1);

            // Row: Texture TXD (Category)
            g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row] =
            CreatePlayerTextDraw            (playerid, 43.0, 320.0 + (row * 13.0), "Txd");
            PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], 255);
            PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], 1);
            PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], 0.2, 1.0);
            PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], RGBA_WHITE);
            PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], 1);
            PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], 1);
            PlayerTextDrawUseBox            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], 1);
            PlayerTextDrawBoxColor            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], 0x00000000);
            PlayerTextDrawTextSize            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], 111.0, 10.0);
            PlayerTextDrawSetSelectable        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], 1);

            // Row: Texture Name (All)
            g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_ALL][row] =
            CreatePlayerTextDraw            (playerid, 114.0, 138.0 + (row * 13.0), "Name");
            PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_ALL][row], 255);
            PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_ALL][row], 1);
            PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_ALL][row], 0.2, 1.0);
            PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_ALL][row], RGBA_WHITE);
            PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_ALL][row], 1);
            PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_ALL][row], 1);
            PlayerTextDrawUseBox            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_ALL][row], 1);
            PlayerTextDrawBoxColor            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_ALL][row], 0x00000000);
            PlayerTextDrawTextSize            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_ALL][row], 231.0, 10.0);
            PlayerTextDrawSetSelectable        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_ALL][row], 1);

            // Row: Texture Name (Category)
            g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_CAT][row] =
            CreatePlayerTextDraw            (playerid, 114.0, 320.0 + (row * 13.0), "Name");
            PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_CAT][row], 255);
            PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_CAT][row], 1);
            PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_CAT][row], 0.2, 1.0);
            PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_CAT][row], RGBA_WHITE);
            PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_CAT][row], 1);
            PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_CAT][row], 1);
            PlayerTextDrawUseBox            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_CAT][row], 1);
            PlayerTextDrawBoxColor            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_CAT][row], 0x00000000);
            PlayerTextDrawTextSize            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_CAT][row], 231.0, 10.0);
            PlayerTextDrawSetSelectable        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_CAT][row], 1);
        }
    } else {
        // Column: Model ID (All)
        g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_ALL] =
        CreatePlayerTextDraw            (playerid, 1.0, 125.0, "ID");
        PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_ALL], 255);
        PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_ALL], 1);
        PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_ALL], 0.2, 1.0);
        PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_ALL], RGBA_WHITE);
        PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_ALL], 1);
        PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_ALL], 1);

        // Column: Model ID (Category)
        g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_CAT] =
        CreatePlayerTextDraw            (playerid, 1.0, 307.0, "ID");
        PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_CAT], 255);
        PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_CAT], 1);
        PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_CAT], 0.2, 1.0);
        PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_CAT], RGBA_WHITE);
        PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_CAT], 1);
        PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_CAT], 1);

        // Column: Model Name (All)
        g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_ALL] =
        CreatePlayerTextDraw            (playerid, 33.0, 125.0, "Name");
        PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_ALL], 255);
        PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_ALL], 1);
        PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_ALL], 0.2, 1.0);
        PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_ALL], RGBA_WHITE);
        PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_ALL], 1);
        PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_ALL], 1);

        // Column: Model Name (Category)
        g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_CAT] =
        CreatePlayerTextDraw            (playerid, 33.0, 307.0, "Name");
        PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_CAT], 255);
        PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_CAT], 1);
        PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_CAT], 0.2, 1.0);
        PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_CAT], RGBA_WHITE);
        PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_CAT], 1);
        PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_CAT], 1);

        // Column: Unused (All)
        g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_3_ALL] = PlayerText: INVALID_TEXT_DRAW;

        // Column: Unused (Category)
        g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_3_CAT] = PlayerText: INVALID_TEXT_DRAW;

        for(new row; row < MAX_CATMANAGER_ROWS; row ++) {
            // Row: Model ID (All)
            g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row] =
            CreatePlayerTextDraw            (playerid, 1.0, 138.0 + (row * 13.0), "ID");
            PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], 255);
            PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], 1);
            PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], 0.2, 1.0);
            PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], RGBA_WHITE);
            PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], 1);
            PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], 1);
            PlayerTextDrawUseBox            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], 1);
            PlayerTextDrawBoxColor            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], 0x00000000);
            PlayerTextDrawTextSize            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], 30.0, 10.0);
            PlayerTextDrawSetSelectable        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], 1);

            // Row: Model ID (Category)
            g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row] =
            CreatePlayerTextDraw            (playerid, 1.0, 320.0 + (row * 13.0), "ID");
            PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], 255);
            PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], 1);
            PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], 0.2, 1.0);
            PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], RGBA_WHITE);
            PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], 1);
            PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], 1);
            PlayerTextDrawUseBox            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], 1);
            PlayerTextDrawBoxColor            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], 0x00000000);
            PlayerTextDrawTextSize            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], 30.0, 10.0);
            PlayerTextDrawSetSelectable        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], 1);

            // Row: Model Name (All)
            g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row] =
            CreatePlayerTextDraw            (playerid, 33.0, 138.0 + (row * 13.0), "Name");
            PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], 255);
            PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], 1);
            PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], 0.2, 1.0);
            PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], RGBA_WHITE);
            PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], 1);
            PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], 1);
            PlayerTextDrawUseBox            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], 1);
            PlayerTextDrawBoxColor            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], 0x00000000);
            PlayerTextDrawTextSize            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], 231.0, 10.0);
            PlayerTextDrawSetSelectable        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], 1);

            // Row: Model Name (Category)
            g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row] =
            CreatePlayerTextDraw            (playerid, 33.0, 320.0 + (row * 13.0), "Name");
            PlayerTextDrawBackgroundColor    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], 255);
            PlayerTextDrawFont                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], 1);
            PlayerTextDrawLetterSize        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], 0.2, 1.0);
            PlayerTextDrawColor                (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], RGBA_WHITE);
            PlayerTextDrawSetOutline        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], 1);
            PlayerTextDrawSetProportional    (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], 1);
            PlayerTextDrawUseBox            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], 1);
            PlayerTextDrawBoxColor            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], 0x00000000);
            PlayerTextDrawTextSize            (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], 231.0, 10.0);
            PlayerTextDrawSetSelectable        (playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], 1);

            // Row: Unused (All)
            g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_ALL][row] = PlayerText: INVALID_TEXT_DRAW;

            // Row: Unused (Category)
            g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_CAT][row] = PlayerText: INVALID_TEXT_DRAW;
        }
    }
}

DestroyPlayerCategoryManager(playerid) {
    for(new ptd; ptd < CATMANAGER_PTDS; ptd ++) {
        PlayerTextDrawDestroy(playerid, g_CatManagerPTD[playerid][ptd]);
        g_CatManagerPTD[playerid][ptd] = PlayerText: INVALID_TEXT_DRAW;
    }
}

ShowCategoryManager(playerid) {
    CreatePlayerCategoryManager(playerid);

    for(new gtd; gtd < CATMANAGER_GTDS; gtd ++) {
        TextDrawShowForPlayer(playerid, g_CatManagerGTD[gtd]);
    }

    DefaultCategoryManagerData(playerid);
    LoadCategoryManagerRowData(playerid, CATMANAGER_WINDOW_ALL);
    LoadCategoryManagerRowData(playerid, CATMANAGER_WINDOW_CAT);

    ApplyCategoryManagerCatName(playerid);
    PlayerTextDrawShow(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_CATEGORY_NAME]);

    ApplyCategoryManagerCatType(playerid);
    PlayerTextDrawShow(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_MODELS]);
    PlayerTextDrawShow(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_VEHICLES]);
    PlayerTextDrawShow(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_SKINS]);
    PlayerTextDrawShow(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_TEXTURES]);

    ApplyCategoryManagerPage(playerid, CATMANAGER_WINDOW_ALL);
    ApplyCategoryManagerPage(playerid, CATMANAGER_WINDOW_CAT);
    PlayerTextDrawShow(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_ALL]);
    PlayerTextDrawShow(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_CAT]);

    ApplyCategoryManagerSearch(playerid, CATMANAGER_WINDOW_ALL);
    ApplyCategoryManagerSearch(playerid, CATMANAGER_WINDOW_CAT);
    PlayerTextDrawShow(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_ALL]);
    PlayerTextDrawShow(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_CAT]);

    PlayerTextDrawShow(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_ALL]);
    PlayerTextDrawShow(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_1_CAT]);

    PlayerTextDrawShow(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_ALL]);
    PlayerTextDrawShow(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_2_CAT]);

    if( g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_3_ALL] != PlayerText: INVALID_TEXT_DRAW ) {
        PlayerTextDrawShow(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_3_ALL]);
    }

    if( g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_3_CAT] != PlayerText: INVALID_TEXT_DRAW) {
        PlayerTextDrawShow(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_COL_3_CAT]);
    }

    ApplyCategoryManagerRowData(playerid, CATMANAGER_WINDOW_ALL);
    ApplyCategoryManagerRowData(playerid, CATMANAGER_WINDOW_CAT);
}

HideCategoryManager(playerid) {
    DestroyPlayerCategoryManager(playerid);

    for(new gtd; gtd < CATMANAGER_GTDS; gtd ++) {
        TextDrawHideForPlayer(playerid, g_CatManagerGTD[gtd]);
    }

    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CATMANAGER_TEXTURES: {
            DestroyTextureView(playerid);
        }
        case TDMODE_CATMANAGER_MODELS, TDMODE_CATMANAGER_VEHICLES, TDMODE_CATMANAGER_SKINS: {
            HideModelView(playerid);
        }
    }
}

ApplyCategoryManagerCatType(playerid) {
    PlayerTextDrawBoxColor(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_MODELS], 0x00000000); // Invisible Box
    PlayerTextDrawBoxColor(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_VEHICLES], 0x00000000); // Invisible Box
    PlayerTextDrawBoxColor(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_SKINS], 0x00000000); // Invisible Box
    PlayerTextDrawBoxColor(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_TEXTURES], 0x00000000); // Invisible Box

    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CATMANAGER_MODELS: {
            PlayerTextDrawBoxColor(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_MODELS], 0xFFFFFF64); // White Box
        }
        case TDMODE_CATMANAGER_VEHICLES: {
            PlayerTextDrawBoxColor(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_VEHICLES], 0xFFFFFF64); // White Box
        }
        case TDMODE_CATMANAGER_SKINS: {
            PlayerTextDrawBoxColor(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_SKINS], 0xFFFFFF64); // White Box
        }
        case TDMODE_CATMANAGER_TEXTURES: {
            PlayerTextDrawBoxColor(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_TEXTURES], 0xFFFFFF64); // White Box
        }
        default: {
            return 0;
        }
    }
    return 1;
}

ApplyCategoryManagerCatName(playerid) {
    new categoryid = g_CatManagerData[playerid][CATMANAGER_DATA_CATEGORY];
    if( categoryid == INVALID_CATEGORY_ID ) {
        return PlayerTextDrawSetString(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_CATEGORY_NAME], "Category"), 0;
    }

    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CATMANAGER_MODELS: {
            GetModelCategoryName(categoryid, g_CategoryNameString, sizeof g_CategoryNameString);
        }
        case TDMODE_CATMANAGER_VEHICLES: {
            GetVehicleCategoryName(categoryid, g_CategoryNameString, sizeof g_CategoryNameString);
        }
        case TDMODE_CATMANAGER_SKINS: {
            GetSkinCategoryName(categoryid, g_CategoryNameString, sizeof g_CategoryNameString);
        }
        case TDMODE_CATMANAGER_TEXTURES: {
            GetTextureCategoryName(categoryid, g_CategoryNameString, sizeof g_CategoryNameString);
        }
        default: {
            return 0;
        }
    }

    format(g_TextdrawString, sizeof g_TextdrawString, "Category: %s", g_CategoryNameString);

    PlayerTextDrawSetString(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_CATEGORY_NAME], g_TextdrawString);
    return 1;
}

ApplyCategoryManagerPage(playerid, bool:window) {
    format(g_TextdrawString, sizeof g_TextdrawString, "Page: %i / %i", GetCategoryManagerPage(playerid, window) + 1, GetCategoryManagerMaxPage(playerid, window) + 1);
    PlayerTextDrawSetString(playerid, (window == CATMANAGER_WINDOW_ALL) ? g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_ALL] : g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_CAT], g_TextdrawString);
}

ApplyCategoryManagerSearch(playerid, bool:window) {
    GetCategoryManagerSearch(playerid, window, g_SearchString, sizeof g_SearchString);
    if( isempty(g_SearchString) ) {
        PlayerTextDrawSetString(playerid, (window == CATMANAGER_WINDOW_ALL) ? g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_ALL] : g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_CAT], "Search");
    } else {
        format(g_TextdrawString, sizeof g_TextdrawString, "Search: %s", g_SearchString);
        PlayerTextDrawSetString(playerid, (window == CATMANAGER_WINDOW_ALL) ? g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_ALL] : g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_CAT], g_TextdrawString);
    }
}

ApplyCategoryManagerRowColor(playerid, bool:window, row) {
    new
        bool: select_window = g_CatManagerData[playerid][CATMANAGER_DATA_SELECT_WINDOW],
        select_row = g_CatManagerData[playerid][CATMANAGER_DATA_SELECT_ROW],
        rgba_boxcolor = ( select_window == window && row == select_row ) ? 0xFFFFFF64 : 0x00000000
    ;

    if( window == CATMANAGER_WINDOW_ALL ) {
        PlayerTextDrawBoxColor(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], rgba_boxcolor);
        PlayerTextDrawShow(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row]);

        PlayerTextDrawBoxColor(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], rgba_boxcolor);
        PlayerTextDrawShow(playerid,  g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row]);

        if( g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_ALL][row] != PlayerText: INVALID_TEXT_DRAW ) {
            PlayerTextDrawBoxColor(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_ALL][row], rgba_boxcolor);
            PlayerTextDrawShow(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_ALL][row]);
        }
    } else if( window == CATMANAGER_WINDOW_CAT) {
        PlayerTextDrawBoxColor(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], rgba_boxcolor);
        PlayerTextDrawShow(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row]);

        PlayerTextDrawBoxColor(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], rgba_boxcolor);
        PlayerTextDrawShow(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row]);

        if( g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_CAT][row] != PlayerText: INVALID_TEXT_DRAW ) {
            PlayerTextDrawBoxColor(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_CAT][row], rgba_boxcolor);
            PlayerTextDrawShow(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_CAT][row]);
        }
    }
}

ApplyCategoryManagerRowData(playerid, bool:window) {
    new invalid_id;
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CATMANAGER_MODELS, TDMODE_CATMANAGER_VEHICLES, TDMODE_CATMANAGER_SKINS: {
            invalid_id = INVALID_MODEL_ID;
        }
        default: {
            invalid_id = INVALID_TEXTURE_ID;
        }
    }

    for(new row, row_id; row < MAX_CATMANAGER_ROWS; row ++) {
        row_id = GetCategoryManagerRowID(playerid, window, row);

        if( row_id == invalid_id ) {
            if( window == CATMANAGER_WINDOW_ALL ) {
                PlayerTextDrawHide(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row]);
                PlayerTextDrawHide(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row]);
                if( g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_ALL][row] != PlayerText: INVALID_TEXT_DRAW ) {
                    PlayerTextDrawHide(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_ALL][row]);
                }
            } else {
                PlayerTextDrawHide(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row]);
                PlayerTextDrawHide(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row]);
                if( g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_CAT][row] != PlayerText: INVALID_TEXT_DRAW ) {
                    PlayerTextDrawHide(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_CAT][row]);
                }
            }
            continue;
        }

        switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
            case TDMODE_CATMANAGER_MODELS: {
                format(g_IntegerString, sizeof g_IntegerString, "%i", row_id);
                GetModelName(row_id, g_ModelString, sizeof g_ModelString);

                if( window == CATMANAGER_WINDOW_ALL ) {
                    PlayerTextDrawSetString(playerid,  g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], g_IntegerString); // Model ID
                    PlayerTextDrawSetString(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], g_ModelString); // Model Name
                } else {
                    PlayerTextDrawSetString(playerid,  g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], g_IntegerString); // Model ID
                    PlayerTextDrawSetString(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], g_ModelString); // Model Name
                }
            }
            case TDMODE_CATMANAGER_VEHICLES: {
                format(g_IntegerString, sizeof g_IntegerString, "%i", row_id);
                GetVehicleModelName(row_id, g_VehModelString, sizeof g_VehModelString);

                if( window == CATMANAGER_WINDOW_ALL ) {
                    PlayerTextDrawSetString(playerid,  g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], g_IntegerString); // Vehicle Model ID
                    PlayerTextDrawSetString(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], g_VehModelString); // Vehicle Model Name
                } else {
                    PlayerTextDrawSetString(playerid,  g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], g_IntegerString); // Vehicle Model ID
                    PlayerTextDrawSetString(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], g_VehModelString); // Vehicle Model Name
                }
            }
            case TDMODE_CATMANAGER_SKINS: {
                format(g_IntegerString, sizeof g_IntegerString, "%i", row_id);
                GetSkinName(row_id, g_SkinString, sizeof g_SkinString);

                if( window == CATMANAGER_WINDOW_ALL ) {
                    PlayerTextDrawSetString(playerid,  g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], g_IntegerString); // Skin Model ID
                    PlayerTextDrawSetString(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], g_SkinString); // Skin Model Name
                } else {
                    PlayerTextDrawSetString(playerid,  g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], g_IntegerString); // Skin Model ID
                    PlayerTextDrawSetString(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], g_SkinString); // Skin Model Name
                }
            }
            case TDMODE_CATMANAGER_TEXTURES: {
                new texture_modelid;
                GetTextureData(row_id, texture_modelid, g_TextureTXDString, sizeof g_TextureTXDString, g_TextureNameString, sizeof g_TextureNameString);
                format(g_IntegerString, sizeof g_IntegerString, "%i", texture_modelid);

                if( window == CATMANAGER_WINDOW_ALL ) {
                    PlayerTextDrawSetString(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row], g_IntegerString); // Model ID
                    PlayerTextDrawSetString(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row], g_TextureTXDString); // Texture TXD
                    PlayerTextDrawSetString(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_ALL][row], g_TextureNameString); // Texture Name
                } else {
                    PlayerTextDrawSetString(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row], g_IntegerString); // Model ID
                    PlayerTextDrawSetString(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row], g_TextureTXDString); // Texture TXD
                    PlayerTextDrawSetString(playerid, g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_CAT][row], g_TextureNameString); // Texture Name
                }
            }
        }
        ApplyCategoryManagerRowColor(playerid, window, row);
    }
    return 1;
}

LoadCategoryManagerRowData(playerid, bool:window) {
    new invalid_id;
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CATMANAGER_MODELS, TDMODE_CATMANAGER_VEHICLES, TDMODE_CATMANAGER_SKINS: {
            invalid_id = INVALID_MODEL_ID;
        }
        case TDMODE_CATMANAGER_TEXTURES: {
            invalid_id = INVALID_TEXTURE_ID;
        }
    }

    new categoryid = INVALID_CATEGORY_ID;

    if( window == CATMANAGER_WINDOW_CAT ) {
        categoryid = g_CatManagerData[playerid][CATMANAGER_DATA_CATEGORY];

        if( categoryid == INVALID_CATEGORY_ID ) {
            for(new row; row < MAX_CATMANAGER_ROWS; row ++) {
                SetCategoryManagerRowID(playerid, window, row, invalid_id);
            }

            g_CatManagerData[playerid][CATMANAGER_DATA_SELECT_ID] = invalid_id;
            g_CatManagerData[playerid][CATMANAGER_DATA_SELECT_ROW] = INVALID_ROW;

            return 1; // Invalid category for category window; reset!
        }
    }

    new
        page = GetCategoryManagerPage(playerid, window),
        result[MAX_CATMANAGER_ROWS],
        rows_added,
        max_offset
    ;

    GetCategoryManagerSearch(playerid, window, g_SearchString, sizeof g_SearchString);

    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CATMANAGER_MODELS: {
            rows_added = FindModels(
                .result = result,
                .result_size = MAX_CATMANAGER_ROWS,
                .search = g_SearchString,
                .categoryid = categoryid,
                .offset = page * MAX_CATMANAGER_ROWS,
                .max_offset = max_offset
            );
        }
        case TDMODE_CATMANAGER_VEHICLES: {
            rows_added = FindVehicleModels(
                .result = result,
                .result_size = MAX_CATMANAGER_ROWS,
                .search = g_SearchString,
                .categoryid = categoryid,
                .offset = page * MAX_CATMANAGER_ROWS,
                .max_offset = max_offset
            );
        }
        case TDMODE_CATMANAGER_SKINS: {
            rows_added = FindSkins(
                .result = result,
                .result_size = MAX_CATMANAGER_ROWS,
                .search = g_SearchString,
                .categoryid = categoryid,
                .offset = page * MAX_CATMANAGER_ROWS,
                .max_offset = max_offset
            );
        }
        case TDMODE_CATMANAGER_TEXTURES: {
            rows_added = FindTextures(
                .result = result,
                .result_size = MAX_CATMANAGER_ROWS,
                .search = g_SearchString,
                .categoryid = categoryid,
                .offset = page * MAX_CATMANAGER_ROWS,
                .max_offset = max_offset
            );
        }
        default: {
            return 0;
        }
    }

    for(new row; row < rows_added; row ++) {
        SetCategoryManagerRowID(playerid, window, row, result[row]);
    }

    for(new row = rows_added; row < MAX_CATMANAGER_ROWS; row ++) {
        SetCategoryManagerRowID(playerid, window, row, invalid_id);
    }

    if( window == CATMANAGER_WINDOW_ALL ) {
        g_CatManagerData[playerid][CATMANAGER_DATA_MAXPAGE_ALL] = max_offset / MAX_CATMANAGER_ROWS;
    } else {
        g_CatManagerData[playerid][CATMANAGER_DATA_MAXPAGE_CAT] = max_offset / MAX_CATMANAGER_ROWS;
    }

    g_CatManagerData[playerid][CATMANAGER_DATA_SELECT_ROW] = GetCategoryManagerNewSelectRow(playerid);
    return 1;
}

GetCategoryManagerNewSelectRow(playerid) {
    new
        bool: select_window = g_CatManagerData[playerid][CATMANAGER_DATA_SELECT_WINDOW],
        select_id = g_CatManagerData[playerid][CATMANAGER_DATA_SELECT_ID]
    ;

    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CATMANAGER_MODELS, TDMODE_CATMANAGER_VEHICLES, TDMODE_CATMANAGER_SKINS: {
            if( select_id == INVALID_MODEL_ID ) {
                return INVALID_ROW;
            }
        }
        case TDMODE_CATMANAGER_TEXTURES: {
            if( select_id == INVALID_TEXTURE_ID ) {
                return INVALID_ROW;
            }
        }
    }

    for(new row, row_id; row < MAX_CATMANAGER_ROWS; row ++) {
        row_id = (select_window == CATMANAGER_WINDOW_CAT) ? g_CatManagerData[playerid][CATMANAGER_DATA_ROW_ID_CAT][row] : g_CatManagerData[playerid][CATMANAGER_DATA_ROW_ID_ALL][row];

        if( select_id == row_id ) {
            return row;
        }
    }

    return INVALID_ROW;
}

GetCategoryManagerMaxPage(playerid, bool:window) {
    if( window == CATMANAGER_WINDOW_ALL ) {
        return g_CatManagerData[playerid][CATMANAGER_DATA_MAXPAGE_ALL];
    } else {
        return g_CatManagerData[playerid][CATMANAGER_DATA_MAXPAGE_CAT];
    }
}

ShowCategoryManagerDialog(playerid, dialogid) {
    switch( dialogid ) {
        case DIALOGID_CATMANAGER_CAT_CREATE: {
            g_DialogCaption = "Category Manager: Create Category";
            g_DialogInfo = "Enter the name for the new category.";
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, g_DialogCaption, g_DialogInfo, "Create", "Cancel");
        }
        case DIALOGID_CATMANAGER_CAT_DESTROY: {
            new categoryid = g_CatManagerData[playerid][CATMANAGER_DATA_CATEGORY];
            if( categoryid == INVALID_CATEGORY_ID ) {
                return 1;
            }

            g_DialogCaption = "Category Manager: Destroy Category";
            format(g_DialogInfo, sizeof g_DialogInfo, "Type & enter '%s' to delete this category.", CATMANAGER_DELETE_CODE);
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, g_DialogCaption, g_DialogInfo, "Destroy", "Cancel");
        }
        case DIALOGID_CATMANAGER_CAT_RENAME: {
            new categoryid = g_CatManagerData[playerid][CATMANAGER_DATA_CATEGORY];
            if( categoryid == INVALID_CATEGORY_ID ) {
                return 1;
            }

            g_DialogCaption = "Category Manager: Rename Category";
            g_DialogInfo = "Please enter a new name for the category.";
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, g_DialogCaption, g_DialogInfo, "Rename", "Cancel");
        }
        case DIALOGID_CATMANAGER_PAGE_ALL, DIALOGID_CATMANAGER_PAGE_CAT: {
            new bool:window = (dialogid == DIALOGID_CATMANAGER_PAGE_ALL) ? CATMANAGER_WINDOW_ALL : CATMANAGER_WINDOW_CAT;
            format(g_DialogInfo, sizeof g_DialogInfo, "Page: %i / %i", GetCategoryManagerPage(playerid, window) + 1, GetCategoryManagerMaxPage(playerid, window) + 1);
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Category Manager: Page", g_DialogInfo, "Enter", "Cancel");
        }
        case DIALOGID_CATMANAGER_SEARCH_ALL, DIALOGID_CATMANAGER_SEARCH_CAT: {
            new bool:window = (dialogid == DIALOGID_CATMANAGER_SEARCH_ALL) ? CATMANAGER_WINDOW_ALL : CATMANAGER_WINDOW_CAT;

            GetCategoryManagerSearch(playerid, window, g_SearchString, sizeof g_SearchString);
            if( isempty(g_SearchString) ) {
                g_DialogInfo = "You are not searching for anything.";
            } else {
                format(g_DialogInfo, sizeof g_DialogInfo, "Searching for: %s", g_SearchString);
            }
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Category Manager: Search", g_DialogInfo, "Enter", "Cancel");
        }
        default: {
            return 0;
        }
    }
    return 1;
}

GetCategoryManagerPage(playerid, bool:window) {
    new page;
    switch( window ) {
        case CATMANAGER_WINDOW_ALL: {
            page = g_CatManagerData[playerid][CATMANAGER_DATA_PAGE_ALL];
        }
        case CATMANAGER_WINDOW_CAT: {
            page = g_CatManagerData[playerid][CATMANAGER_DATA_PAGE_CAT];
        }
    }
    return page;
}

SetCategoryManagerPage(playerid, bool:window, page) {
    switch( window ) {
        case CATMANAGER_WINDOW_ALL: {
            g_CatManagerData[playerid][CATMANAGER_DATA_PAGE_ALL] = page;
        }
        case CATMANAGER_WINDOW_CAT: {
            g_CatManagerData[playerid][CATMANAGER_DATA_PAGE_CAT] = page;
        }
        default: {
            return 0;
        }
    }
    return 1;
}

GetCategoryManagerSearch(playerid, bool:window, search[], search_size) {
    switch( window ) {
        case CATMANAGER_WINDOW_ALL: {
            strunpack(search, g_CatManagerData[playerid][CATMANAGER_DATA_SEARCH_ALL], search_size);
        }
        case CATMANAGER_WINDOW_CAT: {
            strunpack(search, g_CatManagerData[playerid][CATMANAGER_DATA_SEARCH_CAT], search_size);
        }
        default: {
            return 0;
        }
    }
    return 1;
}

SetCategoryManagerSearch(playerid, bool:window, search[]) {
    switch( window ) {
        case CATMANAGER_WINDOW_ALL: {
            strpack(g_CatManagerData[playerid][CATMANAGER_DATA_SEARCH_ALL], search, MAX_SEARCH_LEN+1);
        }
        case CATMANAGER_WINDOW_CAT: {
            strpack(g_CatManagerData[playerid][CATMANAGER_DATA_SEARCH_CAT], search, MAX_SEARCH_LEN+1);
        }
        default: {
            return 0;
        }
    }
    return 1;
}

GetCategoryManagerRowID(playerid, bool:window, row) {
    new id;
    switch( window ) {
        case CATMANAGER_WINDOW_ALL: {
            id = g_CatManagerData[playerid][CATMANAGER_DATA_ROW_ID_ALL][row];
        }
        case CATMANAGER_WINDOW_CAT: {
            id = g_CatManagerData[playerid][CATMANAGER_DATA_ROW_ID_CAT][row];
        }
    }
    return id;
}

SetCategoryManagerRowID(playerid, bool:window, row, id) {
    switch( window ) {
        case CATMANAGER_WINDOW_ALL: {
            g_CatManagerData[playerid][CATMANAGER_DATA_ROW_ID_ALL][row] = id;
        }
        case CATMANAGER_WINDOW_CAT: {
            g_CatManagerData[playerid][CATMANAGER_DATA_ROW_ID_CAT][row] = id;
        }
        default: {
            return 0;
        }
    }
    return 1;
}
