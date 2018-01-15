forward OnModelViewUpdate();

DefaultModelViewData(playerid) {
    g_ModelViewData[playerid][MODELVIEW_DATA_TOGGLE] = false;
    g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] = INVALID_MODEL_ID;
    g_ModelViewData[playerid][MODELVIEW_DATA_RX]  = 0.0;
    g_ModelViewData[playerid][MODELVIEW_DATA_RY]  = 0.0;
    g_ModelViewData[playerid][MODELVIEW_DATA_RZ]  = 0.0;
    g_ModelViewData[playerid][MODELVIEW_DATA_ZM]  = 1.0;
    g_ModelViewData[playerid][MODELVIEW_DATA_RXS] = 0.0;
    g_ModelViewData[playerid][MODELVIEW_DATA_RYS] = 0.0;
    g_ModelViewData[playerid][MODELVIEW_DATA_RZS] = 0.0;
    g_ModelViewData[playerid][MODELVIEW_DATA_VC1] = 0;
    g_ModelViewData[playerid][MODELVIEW_DATA_VC2] = 0;
}

CreateGenericModelView() {
    g_ModelViewGTD[MODELVIEW_GTD_BG] =
    TextDrawCreate            (236.0, 21.0, "_");
    TextDrawLetterSize        (g_ModelViewGTD[MODELVIEW_GTD_BG], 0.0, 20.9);
    TextDrawUseBox            (g_ModelViewGTD[MODELVIEW_GTD_BG], 1);
    TextDrawBoxColor        (g_ModelViewGTD[MODELVIEW_GTD_BG], 100);
    TextDrawTextSize        (g_ModelViewGTD[MODELVIEW_GTD_BG], 639.0, 0.0);

    g_ModelViewGTD[MODELVIEW_GTD_CLOSE] =
    TextDrawCreate            (629.0, 21.0, "X");
    TextDrawAlignment        (g_ModelViewGTD[MODELVIEW_GTD_CLOSE], 2);
    TextDrawBackgroundColor    (g_ModelViewGTD[MODELVIEW_GTD_CLOSE], 255);
    TextDrawFont            (g_ModelViewGTD[MODELVIEW_GTD_CLOSE], 1);
    TextDrawLetterSize        (g_ModelViewGTD[MODELVIEW_GTD_CLOSE], 0.3, 1.0);
    TextDrawColor            (g_ModelViewGTD[MODELVIEW_GTD_CLOSE], RGBA_WHITE);
    TextDrawSetOutline        (g_ModelViewGTD[MODELVIEW_GTD_CLOSE], 1);
    TextDrawSetProportional    (g_ModelViewGTD[MODELVIEW_GTD_CLOSE], 1);
    TextDrawUseBox            (g_ModelViewGTD[MODELVIEW_GTD_CLOSE], 1);
    TextDrawBoxColor        (g_ModelViewGTD[MODELVIEW_GTD_CLOSE], 0xFF000064);
    TextDrawTextSize        (g_ModelViewGTD[MODELVIEW_GTD_CLOSE], 10.0, 20.0);
    TextDrawSetSelectable    (g_ModelViewGTD[MODELVIEW_GTD_CLOSE], 1);

    g_ModelViewGTD[MODELVIEW_GTD_CAPTION] =
    TextDrawCreate            (240.0, 9.0, "Model View");
    TextDrawBackgroundColor    (g_ModelViewGTD[MODELVIEW_GTD_CAPTION], 255);
    TextDrawFont            (g_ModelViewGTD[MODELVIEW_GTD_CAPTION], 0);
    TextDrawLetterSize        (g_ModelViewGTD[MODELVIEW_GTD_CAPTION], 0.5, 2.0);
    TextDrawColor            (g_ModelViewGTD[MODELVIEW_GTD_CAPTION], RGBA_WHITE);
    TextDrawSetOutline        (g_ModelViewGTD[MODELVIEW_GTD_CAPTION], 1);
    TextDrawSetProportional    (g_ModelViewGTD[MODELVIEW_GTD_CAPTION], 1);

    for(new mod, Float:x, str[2+1]; mod < MAX_MODELVIEW_MODS; mod ++) {
        switch( mod ) {
            case MODELVIEW_MOD_S2: {
                x = 319.0, str = "<<";
            }
            case MODELVIEW_MOD_S1: {
                x = 342.0, str = "<";
            }
            case MODELVIEW_MOD_R: {
                x = 365.0, str = "R";
            }
            case MODELVIEW_MOD_A1: {
                x = 388.0, str = ">";
            }
            case MODELVIEW_MOD_A2: {
                x = 411.0, str = ">>";
            }
            default: {
                continue;
            }
        }

        // RX
        g_ModelViewGTD[MODELVIEW_GTD_RX_MOD][mod] =
        TextDrawCreate            (x, 40.0, str);
        TextDrawAlignment        (g_ModelViewGTD[MODELVIEW_GTD_RX_MOD][mod], 2);
        TextDrawBackgroundColor    (g_ModelViewGTD[MODELVIEW_GTD_RX_MOD][mod], 255);
        TextDrawFont            (g_ModelViewGTD[MODELVIEW_GTD_RX_MOD][mod], 1);
        TextDrawLetterSize        (g_ModelViewGTD[MODELVIEW_GTD_RX_MOD][mod], 0.2, 1.0);
        TextDrawColor            (g_ModelViewGTD[MODELVIEW_GTD_RX_MOD][mod], RGBA_WHITE);
        TextDrawSetOutline        (g_ModelViewGTD[MODELVIEW_GTD_RX_MOD][mod], 1);
        TextDrawSetProportional    (g_ModelViewGTD[MODELVIEW_GTD_RX_MOD][mod], 1);
        TextDrawTextSize        (g_ModelViewGTD[MODELVIEW_GTD_RX_MOD][mod], 10.0, 20.0);
        TextDrawSetSelectable    (g_ModelViewGTD[MODELVIEW_GTD_RX_MOD][mod], 1);

        // RY
        g_ModelViewGTD[MODELVIEW_GTD_RY_MOD][mod] =
        TextDrawCreate            (x, 60.0, str);
        TextDrawAlignment        (g_ModelViewGTD[MODELVIEW_GTD_RY_MOD][mod], 2);
        TextDrawBackgroundColor    (g_ModelViewGTD[MODELVIEW_GTD_RY_MOD][mod], 255);
        TextDrawFont            (g_ModelViewGTD[MODELVIEW_GTD_RY_MOD][mod], 1);
        TextDrawLetterSize        (g_ModelViewGTD[MODELVIEW_GTD_RY_MOD][mod], 0.2, 1.0);
        TextDrawColor            (g_ModelViewGTD[MODELVIEW_GTD_RY_MOD][mod], RGBA_WHITE);
        TextDrawSetOutline        (g_ModelViewGTD[MODELVIEW_GTD_RY_MOD][mod], 1);
        TextDrawSetProportional    (g_ModelViewGTD[MODELVIEW_GTD_RY_MOD][mod], 1);
        TextDrawTextSize        (g_ModelViewGTD[MODELVIEW_GTD_RY_MOD][mod], 10.0, 20.0);
        TextDrawSetSelectable    (g_ModelViewGTD[MODELVIEW_GTD_RY_MOD][mod], 1);

        // RZ
        g_ModelViewGTD[MODELVIEW_GTD_RZ_MOD][mod] =
        TextDrawCreate            (x, 80.0, str);
        TextDrawAlignment        (g_ModelViewGTD[MODELVIEW_GTD_RZ_MOD][mod], 2);
        TextDrawBackgroundColor    (g_ModelViewGTD[MODELVIEW_GTD_RZ_MOD][mod], 255);
        TextDrawFont            (g_ModelViewGTD[MODELVIEW_GTD_RZ_MOD][mod], 1);
        TextDrawLetterSize        (g_ModelViewGTD[MODELVIEW_GTD_RZ_MOD][mod], 0.2, 1.0);
        TextDrawColor            (g_ModelViewGTD[MODELVIEW_GTD_RZ_MOD][mod], RGBA_WHITE);
        TextDrawSetOutline        (g_ModelViewGTD[MODELVIEW_GTD_RZ_MOD][mod], 1);
        TextDrawSetProportional    (g_ModelViewGTD[MODELVIEW_GTD_RZ_MOD][mod], 1);
        TextDrawTextSize        (g_ModelViewGTD[MODELVIEW_GTD_RZ_MOD][mod], 10.0, 20.0);
        TextDrawSetSelectable    (g_ModelViewGTD[MODELVIEW_GTD_RZ_MOD][mod], 1);

        // Zoom
        g_ModelViewGTD[MODELVIEW_GTD_ZM_MOD][mod] =
        TextDrawCreate            (x, 100.0, str);
        TextDrawAlignment        (g_ModelViewGTD[MODELVIEW_GTD_ZM_MOD][mod], 2);
        TextDrawBackgroundColor    (g_ModelViewGTD[MODELVIEW_GTD_ZM_MOD][mod], 255);
        TextDrawFont            (g_ModelViewGTD[MODELVIEW_GTD_ZM_MOD][mod], 1);
        TextDrawLetterSize        (g_ModelViewGTD[MODELVIEW_GTD_ZM_MOD][mod], 0.2, 1.0);
        TextDrawColor            (g_ModelViewGTD[MODELVIEW_GTD_ZM_MOD][mod], RGBA_WHITE);
        TextDrawSetOutline        (g_ModelViewGTD[MODELVIEW_GTD_ZM_MOD][mod], 1);
        TextDrawSetProportional    (g_ModelViewGTD[MODELVIEW_GTD_ZM_MOD][mod], 1);
        TextDrawTextSize        (g_ModelViewGTD[MODELVIEW_GTD_ZM_MOD][mod], 10.0, 20.0);
        TextDrawSetSelectable    (g_ModelViewGTD[MODELVIEW_GTD_ZM_MOD][mod], 1);

        // RX Speed
        g_ModelViewGTD[MODELVIEW_GTD_RXS_MOD][mod] =
        TextDrawCreate            (x, 120.0, str);
        TextDrawAlignment        (g_ModelViewGTD[MODELVIEW_GTD_RXS_MOD][mod], 2);
        TextDrawBackgroundColor    (g_ModelViewGTD[MODELVIEW_GTD_RXS_MOD][mod], 255);
        TextDrawFont            (g_ModelViewGTD[MODELVIEW_GTD_RXS_MOD][mod], 1);
        TextDrawLetterSize        (g_ModelViewGTD[MODELVIEW_GTD_RXS_MOD][mod], 0.2, 1.0);
        TextDrawColor            (g_ModelViewGTD[MODELVIEW_GTD_RXS_MOD][mod], RGBA_WHITE);
        TextDrawSetOutline        (g_ModelViewGTD[MODELVIEW_GTD_RXS_MOD][mod], 1);
        TextDrawSetProportional    (g_ModelViewGTD[MODELVIEW_GTD_RXS_MOD][mod], 1);
        TextDrawTextSize        (g_ModelViewGTD[MODELVIEW_GTD_RXS_MOD][mod], 10.0, 20.0);
        TextDrawSetSelectable    (g_ModelViewGTD[MODELVIEW_GTD_RXS_MOD][mod], 1);

        // RY Speed
        g_ModelViewGTD[MODELVIEW_GTD_RYS_MOD][mod] =
        TextDrawCreate            (x, 140.0, str);
        TextDrawAlignment        (g_ModelViewGTD[MODELVIEW_GTD_RYS_MOD][mod], 2);
        TextDrawBackgroundColor    (g_ModelViewGTD[MODELVIEW_GTD_RYS_MOD][mod], 255);
        TextDrawFont            (g_ModelViewGTD[MODELVIEW_GTD_RYS_MOD][mod], 1);
        TextDrawLetterSize        (g_ModelViewGTD[MODELVIEW_GTD_RYS_MOD][mod], 0.2, 1.0);
        TextDrawColor            (g_ModelViewGTD[MODELVIEW_GTD_RYS_MOD][mod], RGBA_WHITE);
        TextDrawSetOutline        (g_ModelViewGTD[MODELVIEW_GTD_RYS_MOD][mod], 1);
        TextDrawSetProportional    (g_ModelViewGTD[MODELVIEW_GTD_RYS_MOD][mod], 1);
        TextDrawTextSize        (g_ModelViewGTD[MODELVIEW_GTD_RYS_MOD][mod], 10.0, 20.0);
        TextDrawSetSelectable    (g_ModelViewGTD[MODELVIEW_GTD_RYS_MOD][mod], 1);

        // RZ Speed
        g_ModelViewGTD[MODELVIEW_GTD_RZS_MOD][mod] =
        TextDrawCreate            (x, 160.0, str);
        TextDrawAlignment        (g_ModelViewGTD[MODELVIEW_GTD_RZS_MOD][mod], 2);
        TextDrawBackgroundColor    (g_ModelViewGTD[MODELVIEW_GTD_RZS_MOD][mod], 255);
        TextDrawFont            (g_ModelViewGTD[MODELVIEW_GTD_RZS_MOD][mod], 1);
        TextDrawLetterSize        (g_ModelViewGTD[MODELVIEW_GTD_RZS_MOD][mod], 0.2, 1.0);
        TextDrawColor            (g_ModelViewGTD[MODELVIEW_GTD_RZS_MOD][mod], RGBA_WHITE);
        TextDrawSetOutline        (g_ModelViewGTD[MODELVIEW_GTD_RZS_MOD][mod], 1);
        TextDrawSetProportional    (g_ModelViewGTD[MODELVIEW_GTD_RZS_MOD][mod], 1);
        TextDrawTextSize        (g_ModelViewGTD[MODELVIEW_GTD_RZS_MOD][mod], 10.0, 20.0);
        TextDrawSetSelectable    (g_ModelViewGTD[MODELVIEW_GTD_RZS_MOD][mod], 1);

        // Vehicle Color 1
        g_ModelViewGTD[MODELVIEW_GTD_VC1_MOD][mod] =
        TextDrawCreate            (x, 180.0, str);
        TextDrawAlignment        (g_ModelViewGTD[MODELVIEW_GTD_VC1_MOD][mod], 2);
        TextDrawBackgroundColor    (g_ModelViewGTD[MODELVIEW_GTD_VC1_MOD][mod], 255);
        TextDrawFont            (g_ModelViewGTD[MODELVIEW_GTD_VC1_MOD][mod], 1);
        TextDrawLetterSize        (g_ModelViewGTD[MODELVIEW_GTD_VC1_MOD][mod], 0.2, 1.0);
        TextDrawColor            (g_ModelViewGTD[MODELVIEW_GTD_VC1_MOD][mod], RGBA_WHITE);
        TextDrawSetOutline        (g_ModelViewGTD[MODELVIEW_GTD_VC1_MOD][mod], 1);
        TextDrawSetProportional    (g_ModelViewGTD[MODELVIEW_GTD_VC1_MOD][mod], 1);
        TextDrawTextSize        (g_ModelViewGTD[MODELVIEW_GTD_VC1_MOD][mod], 10.0, 20.0);
        TextDrawSetSelectable    (g_ModelViewGTD[MODELVIEW_GTD_VC1_MOD][mod], 1);

        // Vehicle Color 2
        g_ModelViewGTD[MODELVIEW_GTD_VC2_MOD][mod] =
        TextDrawCreate            (x, 200.0, str);
        TextDrawAlignment        (g_ModelViewGTD[MODELVIEW_GTD_VC2_MOD][mod], 2);
        TextDrawBackgroundColor    (g_ModelViewGTD[MODELVIEW_GTD_VC2_MOD][mod], 255);
        TextDrawFont            (g_ModelViewGTD[MODELVIEW_GTD_VC2_MOD][mod], 1);
        TextDrawLetterSize        (g_ModelViewGTD[MODELVIEW_GTD_VC2_MOD][mod], 0.2, 1.0);
        TextDrawColor            (g_ModelViewGTD[MODELVIEW_GTD_VC2_MOD][mod], RGBA_WHITE);
        TextDrawSetOutline        (g_ModelViewGTD[MODELVIEW_GTD_VC2_MOD][mod], 1);
        TextDrawSetProportional    (g_ModelViewGTD[MODELVIEW_GTD_VC2_MOD][mod], 1);
        TextDrawTextSize        (g_ModelViewGTD[MODELVIEW_GTD_VC2_MOD][mod], 10.0, 20.0);
        TextDrawSetSelectable    (g_ModelViewGTD[MODELVIEW_GTD_VC2_MOD][mod], 1);
    }
}

DestroyGenericModelView() {
    for(new gtd; gtd < MAX_MODELVIEW_GTDS; gtd ++) {
        TextDrawDestroy( g_ModelViewGTD[gtd] );

        g_ModelViewGTD[gtd] = Text: INVALID_TEXT_DRAW;
    }
}

CreatePlayerModelView(playerid) {
    g_ModelViewPTD[playerid][MODELVIEW_PTD_MODEL] =
    CreatePlayerTextDraw            (playerid, 424.0, 20.0, "model");
    PlayerTextDrawBackgroundColor    (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_MODEL], 0);
    PlayerTextDrawFont                (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_MODEL], 5);
    PlayerTextDrawLetterSize        (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_MODEL], 0.5, 1.0);
    PlayerTextDrawColor                (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_MODEL], -1);
    PlayerTextDrawSetOutline        (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_MODEL], 0);
    PlayerTextDrawSetProportional    (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_MODEL], 1);
    PlayerTextDrawUseBox            (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_MODEL], 1);
    PlayerTextDrawBoxColor            (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_MODEL], 0);
    PlayerTextDrawTextSize            (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_MODEL], 190.0, 190.0);

    g_ModelViewPTD[playerid][MODELVIEW_PTD_RX] =
    CreatePlayerTextDraw            (playerid, 271.0, 40.0, "RX");
    PlayerTextDrawAlignment            (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RX], 2);
    PlayerTextDrawBackgroundColor    (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RX], 255);
    PlayerTextDrawFont                (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RX], 1);
    PlayerTextDrawLetterSize        (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RX], 0.2, 1.0);
    PlayerTextDrawColor                (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RX], RGBA_WHITE);
    PlayerTextDrawSetOutline        (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RX], 1);
    PlayerTextDrawSetProportional    (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RX], 1);
    PlayerTextDrawTextSize            (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RX], 10.0, 70.0);

    g_ModelViewPTD[playerid][MODELVIEW_PTD_RY] =
    CreatePlayerTextDraw            (playerid, 271.0, 60.0, "RY");
    PlayerTextDrawAlignment            (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RY], 2);
    PlayerTextDrawBackgroundColor    (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RY], 255);
    PlayerTextDrawFont                (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RY], 1);
    PlayerTextDrawLetterSize        (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RY], 0.2, 1.0);
    PlayerTextDrawColor                (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RY], RGBA_WHITE);
    PlayerTextDrawSetOutline        (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RY], 1);
    PlayerTextDrawSetProportional    (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RY], 1);
    PlayerTextDrawTextSize            (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RY], 10.0, 70.0);

    g_ModelViewPTD[playerid][MODELVIEW_PTD_RZ] =
    CreatePlayerTextDraw            (playerid, 271.0, 80.0, "RZ");
    PlayerTextDrawAlignment            (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RZ], 2);
    PlayerTextDrawBackgroundColor    (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RZ], 255);
    PlayerTextDrawFont                (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RZ], 1);
    PlayerTextDrawLetterSize        (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RZ], 0.2, 1.0);
    PlayerTextDrawColor                (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RZ], RGBA_WHITE);
    PlayerTextDrawSetOutline        (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RZ], 1);
    PlayerTextDrawSetProportional    (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RZ], 1);
    PlayerTextDrawTextSize            (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RZ], 10.0, 70.0);

    g_ModelViewPTD[playerid][MODELVIEW_PTD_ZM] =
    CreatePlayerTextDraw            (playerid, 271.0, 100.0, "Zoom");
    PlayerTextDrawAlignment            (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_ZM], 2);
    PlayerTextDrawBackgroundColor    (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_ZM], 255);
    PlayerTextDrawFont                (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_ZM], 1);
    PlayerTextDrawLetterSize        (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_ZM], 0.2, 1.0);
    PlayerTextDrawColor                (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_ZM], RGBA_WHITE);
    PlayerTextDrawSetOutline        (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_ZM], 1);
    PlayerTextDrawSetProportional    (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_ZM], 1);
    PlayerTextDrawTextSize            (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_ZM], 10.0, 70.0);

    g_ModelViewPTD[playerid][MODELVIEW_PTD_RXS] =
    CreatePlayerTextDraw            (playerid, 271.0, 120.0, "RX S");
    PlayerTextDrawAlignment            (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RXS], 2);
    PlayerTextDrawBackgroundColor    (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RXS], 255);
    PlayerTextDrawFont                (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RXS], 1);
    PlayerTextDrawLetterSize        (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RXS], 0.2, 1.0);
    PlayerTextDrawColor                (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RXS], RGBA_WHITE);
    PlayerTextDrawSetOutline        (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RXS], 1);
    PlayerTextDrawSetProportional    (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RXS], 1);
    PlayerTextDrawTextSize            (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RXS], 10.0, 70.0);

    g_ModelViewPTD[playerid][MODELVIEW_PTD_RYS] =
    CreatePlayerTextDraw            (playerid, 271.0, 140.0, "RY S");
    PlayerTextDrawAlignment            (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RYS], 2);
    PlayerTextDrawBackgroundColor    (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RYS], 255);
    PlayerTextDrawFont                (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RYS], 1);
    PlayerTextDrawLetterSize        (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RYS], 0.2, 1.0);
    PlayerTextDrawColor                (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RYS], RGBA_WHITE);
    PlayerTextDrawSetOutline        (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RYS], 1);
    PlayerTextDrawSetProportional    (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RYS], 1);
    PlayerTextDrawTextSize            (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RYS], 10.0, 70.0);

    g_ModelViewPTD[playerid][MODELVIEW_PTD_RZS] =
    CreatePlayerTextDraw            (playerid, 271.0, 160.0, "RZ S");
    PlayerTextDrawAlignment            (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RZS], 2);
    PlayerTextDrawBackgroundColor    (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RZS], 255);
    PlayerTextDrawFont                (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RZS], 1);
    PlayerTextDrawLetterSize        (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RZS], 0.2, 1.0);
    PlayerTextDrawColor                (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RZS], RGBA_WHITE);
    PlayerTextDrawSetOutline        (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RZS], 1);
    PlayerTextDrawSetProportional    (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RZS], 1);
    PlayerTextDrawTextSize            (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RZS], 10.0, 70.0);

    g_ModelViewPTD[playerid][MODELVIEW_PTD_VC1] =
    CreatePlayerTextDraw            (playerid, 271.0, 180.0, "VC1");
    PlayerTextDrawAlignment            (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_VC1], 2);
    PlayerTextDrawBackgroundColor    (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_VC1], 255);
    PlayerTextDrawFont                (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_VC1], 1);
    PlayerTextDrawLetterSize        (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_VC1], 0.2, 1.0);
    PlayerTextDrawColor                (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_VC1], RGBA_WHITE);
    PlayerTextDrawSetOutline        (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_VC1], 1);
    PlayerTextDrawSetProportional    (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_VC1], 1);
    PlayerTextDrawTextSize            (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_VC1], 10.0, 70.0);

    g_ModelViewPTD[playerid][MODELVIEW_PTD_VC2] =
    CreatePlayerTextDraw            (playerid, 271.0, 200.0, "VC2");
    PlayerTextDrawAlignment            (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_VC2], 2);
    PlayerTextDrawBackgroundColor    (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_VC2], 255);
    PlayerTextDrawFont                (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_VC2], 1);
    PlayerTextDrawLetterSize        (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_VC2], 0.2, 1.0);
    PlayerTextDrawColor                (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_VC2], RGBA_WHITE);
    PlayerTextDrawSetOutline        (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_VC2], 1);
    PlayerTextDrawSetProportional    (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_VC2], 1);
    PlayerTextDrawTextSize            (playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_VC2], 10.0, 70.0);
}

DestroyPlayerModelView(playerid) {
    for(new ptd; ptd < MAX_MODELVIEW_PTDS; ptd ++) {
        PlayerTextDrawDestroy(playerid, g_ModelViewPTD[playerid][ptd]);

        g_ModelViewPTD[playerid][ptd] = PlayerText: INVALID_TEXT_DRAW;
    }
}

ShowModelView(playerid) {
    if( g_ModelViewData[playerid][MODELVIEW_DATA_TOGGLE] ) {
        return 0;
    }

    CreatePlayerModelView(playerid);

    for(new gtd; gtd < MAX_MODELVIEW_GTDS; gtd ++) {
        TextDrawShowForPlayer(playerid, g_ModelViewGTD[gtd]);
    }

    new view_modelid = g_ModelViewData[playerid][MODELVIEW_DATA_MODELID];

    if( view_modelid != INVALID_MODEL_ID ) {
        ApplyModelViewModel(playerid, .showtd = false);
        ApplyModelViewRot(playerid, .showtd = true);
    }

    ApplyModelViewRX(playerid);
    PlayerTextDrawShow(playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RX]);

    ApplyModelViewRY(playerid);
    PlayerTextDrawShow(playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RY]);

    ApplyModelViewRZ(playerid);
    PlayerTextDrawShow(playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RZ]);

    ApplyModelViewZoom(playerid);
    PlayerTextDrawShow(playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_ZM]);

    ApplyModelViewRXSpeed(playerid);
    PlayerTextDrawShow(playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RXS]);

    ApplyModelViewRYSpeed(playerid);
    PlayerTextDrawShow(playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RYS]);

    ApplyModelViewRZSpeed(playerid);
    PlayerTextDrawShow(playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RZS]);

    ApplyModelViewVehCol1(playerid);
    PlayerTextDrawShow(playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_VC1]);

    ApplyModelViewVehCol2(playerid);
    PlayerTextDrawShow(playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_VC2]);

    g_ModelViewData[playerid][MODELVIEW_DATA_TOGGLE] = true;

    return 1;
}

HideModelView(playerid) {
    if( !g_ModelViewData[playerid][MODELVIEW_DATA_TOGGLE] ) {
        return 0;
    }

    DestroyPlayerModelView(playerid);

    for(new gtd; gtd < MAX_MODELVIEW_GTDS; gtd ++) {
        TextDrawHideForPlayer(playerid, g_ModelViewGTD[gtd]);
    }

    g_ModelViewData[playerid][MODELVIEW_DATA_TOGGLE] = false;

    return 1;
}

ApplyModelViewModel(playerid, bool:showtd) {
    PlayerTextDrawSetPreviewModel(playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_MODEL], g_ModelViewData[playerid][MODELVIEW_DATA_MODELID]);

    if( IsValidVehicleModel(g_ModelViewData[playerid][MODELVIEW_DATA_MODELID]) ) {
        ApplyModelViewVehCol(playerid, .showtd = false);
    }

    if( showtd ) {
        PlayerTextDrawShow(playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_MODEL]);
    }
}

ApplyModelViewRot(playerid, bool:showtd) {
    PlayerTextDrawSetPreviewRot(playerid,
        g_ModelViewPTD[playerid][MODELVIEW_PTD_MODEL],
        g_ModelViewData[playerid][MODELVIEW_DATA_RX],
        g_ModelViewData[playerid][MODELVIEW_DATA_RY],
        g_ModelViewData[playerid][MODELVIEW_DATA_RZ],
        g_ModelViewData[playerid][MODELVIEW_DATA_ZM]
    );

    if( showtd ) {
        PlayerTextDrawShow(playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_MODEL]);
    }
}

ApplyModelViewVehCol(playerid, bool:showtd) {
    PlayerTextDrawSetPreviewVehCol(playerid,
        g_ModelViewPTD[playerid][MODELVIEW_PTD_MODEL],
        g_ModelViewData[playerid][MODELVIEW_DATA_VC1],
        g_ModelViewData[playerid][MODELVIEW_DATA_VC2]
    );

    if( showtd ) {
        PlayerTextDrawShow(playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_MODEL]);
    }
}

ApplyModelViewRX(playerid) {
    format(g_TextdrawString, sizeof g_TextdrawString, "RX: %.2f", g_ModelViewData[playerid][MODELVIEW_DATA_RX]);
    PlayerTextDrawSetString(playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RX], g_TextdrawString);
}

ApplyModelViewRY(playerid) {
    format(g_TextdrawString, sizeof g_TextdrawString, "RY: %.2f", g_ModelViewData[playerid][MODELVIEW_DATA_RY]);
    PlayerTextDrawSetString(playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RY], g_TextdrawString);
}

ApplyModelViewRZ(playerid) {
    format(g_TextdrawString, sizeof g_TextdrawString, "RZ: %.2f", g_ModelViewData[playerid][MODELVIEW_DATA_RZ]);
    PlayerTextDrawSetString(playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RZ], g_TextdrawString);
}

ApplyModelViewZoom(playerid) {
    format(g_TextdrawString, sizeof g_TextdrawString, "Zoom: %.2f", g_ModelViewData[playerid][MODELVIEW_DATA_ZM]);
    PlayerTextDrawSetString(playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_ZM], g_TextdrawString);
}

ApplyModelViewRXSpeed(playerid) {
    format(g_TextdrawString, sizeof g_TextdrawString, "RX Speed: %.2f", g_ModelViewData[playerid][MODELVIEW_DATA_RXS]);
    PlayerTextDrawSetString(playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RXS], g_TextdrawString);
}

ApplyModelViewRYSpeed(playerid) {
    format(g_TextdrawString, sizeof g_TextdrawString, "RY Speed: %.2f", g_ModelViewData[playerid][MODELVIEW_DATA_RYS]);
    PlayerTextDrawSetString(playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RYS], g_TextdrawString);
}

ApplyModelViewRZSpeed(playerid) {
    format(g_TextdrawString, sizeof g_TextdrawString, "RZ Speed: %.2f", g_ModelViewData[playerid][MODELVIEW_DATA_RZS]);
    PlayerTextDrawSetString(playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_RZS], g_TextdrawString);
}

ApplyModelViewVehCol1(playerid) {
    format(g_TextdrawString, sizeof g_TextdrawString, "Veh Col 1: %i", g_ModelViewData[playerid][MODELVIEW_DATA_VC1]);
    PlayerTextDrawSetString(playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_VC1], g_TextdrawString);
}

ApplyModelViewVehCol2(playerid) {
    format(g_TextdrawString, sizeof g_TextdrawString, "Veh Col 2: %i", g_ModelViewData[playerid][MODELVIEW_DATA_VC2]);
    PlayerTextDrawSetString(playerid, g_ModelViewPTD[playerid][MODELVIEW_PTD_VC2], g_TextdrawString);
}
