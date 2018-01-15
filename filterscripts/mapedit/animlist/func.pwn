DefaultAnimationListData(playerid) {
    g_AnimListData[playerid][ANIMLIST_DATA_PAGE] = MIN_ANIMLIST_PAGE;

    g_AnimListData[playerid][ANIMLIST_DATA_MAXPAGE] = MIN_ANIMLIST_PAGE;

    strpack(g_AnimListData[playerid][ANIMLIST_DATA_SEARCH], "", MAX_SEARCH_LEN+1);

    for(new row; row < MAX_ANIMLIST_ROWS; row ++) {
        g_AnimListData[playerid][ANIMLIST_DATA_ROW_INDEX][row] = INVALID_ANIM_INDEX;
    }

    g_AnimListData[playerid][ANIMLIST_DATA_COLORED_ROW] = INVALID_ROW;
}

CreateGenericAnimationList() {
    g_AnimListGTD[ANIMLIST_GTD_BG] =
    TextDrawCreate          (96.0, 138.0, "_");
    TextDrawAlignment       (g_AnimListGTD[ANIMLIST_GTD_BG], 2);
    TextDrawLetterSize      (g_AnimListGTD[ANIMLIST_GTD_BG], 0.5, 34.3);
    TextDrawUseBox          (g_AnimListGTD[ANIMLIST_GTD_BG], 1);
    TextDrawBoxColor        (g_AnimListGTD[ANIMLIST_GTD_BG], 100);
    TextDrawTextSize        (g_AnimListGTD[ANIMLIST_GTD_BG], 0.0, 190.0);

    g_AnimListGTD[ANIMLIST_GTD_CAPTION] =
    TextDrawCreate          (2.0, 125.0, "Animations");
    TextDrawBackgroundColor (g_AnimListGTD[ANIMLIST_GTD_CAPTION], 255);
    TextDrawFont            (g_AnimListGTD[ANIMLIST_GTD_CAPTION], 0);
    TextDrawLetterSize      (g_AnimListGTD[ANIMLIST_GTD_CAPTION], 0.5, 2.0);
    TextDrawColor           (g_AnimListGTD[ANIMLIST_GTD_CAPTION], RGBA_WHITE);
    TextDrawSetOutline      (g_AnimListGTD[ANIMLIST_GTD_CAPTION], 1);
    TextDrawSetProportional (g_AnimListGTD[ANIMLIST_GTD_CAPTION], 1);

    g_AnimListGTD[ANIMLIST_GTD_CLOSE] =
    TextDrawCreate          (181.0, 138.0, "X");
    TextDrawAlignment       (g_AnimListGTD[ANIMLIST_GTD_CLOSE], 2);
    TextDrawBackgroundColor (g_AnimListGTD[ANIMLIST_GTD_CLOSE], 255);
    TextDrawFont            (g_AnimListGTD[ANIMLIST_GTD_CLOSE], 1);
    TextDrawLetterSize      (g_AnimListGTD[ANIMLIST_GTD_CLOSE], 0.3, 1.0);
    TextDrawColor           (g_AnimListGTD[ANIMLIST_GTD_CLOSE], RGBA_WHITE);
    TextDrawSetOutline      (g_AnimListGTD[ANIMLIST_GTD_CLOSE], 1);
    TextDrawSetProportional (g_AnimListGTD[ANIMLIST_GTD_CLOSE], 1);
    TextDrawUseBox          (g_AnimListGTD[ANIMLIST_GTD_CLOSE], 1);
    TextDrawBoxColor        (g_AnimListGTD[ANIMLIST_GTD_CLOSE], 0xFF000064);
    TextDrawTextSize        (g_AnimListGTD[ANIMLIST_GTD_CLOSE], 10.0, 20.0);
    TextDrawSetSelectable   (g_AnimListGTD[ANIMLIST_GTD_CLOSE], 1);

    g_AnimListGTD[ANIMLIST_GTD_PAGE_F] =
    TextDrawCreate          (11.0, 151.0, "<<");
    TextDrawAlignment       (g_AnimListGTD[ANIMLIST_GTD_PAGE_F], 2);
    TextDrawBackgroundColor (g_AnimListGTD[ANIMLIST_GTD_PAGE_F], 255);
    TextDrawFont            (g_AnimListGTD[ANIMLIST_GTD_PAGE_F], 1);
    TextDrawLetterSize      (g_AnimListGTD[ANIMLIST_GTD_PAGE_F], 0.2, 1.0);
    TextDrawColor           (g_AnimListGTD[ANIMLIST_GTD_PAGE_F], RGBA_WHITE);
    TextDrawSetOutline      (g_AnimListGTD[ANIMLIST_GTD_PAGE_F], 1);
    TextDrawSetProportional (g_AnimListGTD[ANIMLIST_GTD_PAGE_F], 1);
    TextDrawTextSize        (g_AnimListGTD[ANIMLIST_GTD_PAGE_F], 10.0, 20.0);
    TextDrawSetSelectable   (g_AnimListGTD[ANIMLIST_GTD_PAGE_F], 1);

    g_AnimListGTD[ANIMLIST_GTD_PAGE_P] =
    TextDrawCreate          (34.0, 151.0, "<");
    TextDrawAlignment       (g_AnimListGTD[ANIMLIST_GTD_PAGE_P], 2);
    TextDrawBackgroundColor (g_AnimListGTD[ANIMLIST_GTD_PAGE_P], 255);
    TextDrawFont            (g_AnimListGTD[ANIMLIST_GTD_PAGE_P], 1);
    TextDrawLetterSize      (g_AnimListGTD[ANIMLIST_GTD_PAGE_P], 0.2, 1.0);
    TextDrawColor           (g_AnimListGTD[ANIMLIST_GTD_PAGE_P], RGBA_WHITE);
    TextDrawSetOutline      (g_AnimListGTD[ANIMLIST_GTD_PAGE_P], 1);
    TextDrawSetProportional (g_AnimListGTD[ANIMLIST_GTD_PAGE_P], 1);
    TextDrawTextSize        (g_AnimListGTD[ANIMLIST_GTD_PAGE_P], 10.0, 20.0);
    TextDrawSetSelectable   (g_AnimListGTD[ANIMLIST_GTD_PAGE_P], 1);

    g_AnimListGTD[ANIMLIST_GTD_PAGE_N] =
    TextDrawCreate          (158.0, 151.0, ">");
    TextDrawAlignment       (g_AnimListGTD[ANIMLIST_GTD_PAGE_N], 2);
    TextDrawBackgroundColor (g_AnimListGTD[ANIMLIST_GTD_PAGE_N], 255);
    TextDrawFont            (g_AnimListGTD[ANIMLIST_GTD_PAGE_N], 1);
    TextDrawLetterSize      (g_AnimListGTD[ANIMLIST_GTD_PAGE_N], 0.2, 1.0);
    TextDrawColor           (g_AnimListGTD[ANIMLIST_GTD_PAGE_N], RGBA_WHITE);
    TextDrawSetOutline      (g_AnimListGTD[ANIMLIST_GTD_PAGE_N], 1);
    TextDrawSetProportional (g_AnimListGTD[ANIMLIST_GTD_PAGE_N], 1);
    TextDrawTextSize        (g_AnimListGTD[ANIMLIST_GTD_PAGE_N], 10.0, 20.0);
    TextDrawSetSelectable   (g_AnimListGTD[ANIMLIST_GTD_PAGE_N], 1);

    g_AnimListGTD[ANIMLIST_GTD_PAGE_L] =
    TextDrawCreate          (181.0, 151.0, ">>");
    TextDrawAlignment       (g_AnimListGTD[ANIMLIST_GTD_PAGE_L], 2);
    TextDrawBackgroundColor (g_AnimListGTD[ANIMLIST_GTD_PAGE_L], 255);
    TextDrawFont            (g_AnimListGTD[ANIMLIST_GTD_PAGE_L], 1);
    TextDrawLetterSize      (g_AnimListGTD[ANIMLIST_GTD_PAGE_L], 0.2, 1.0);
    TextDrawColor           (g_AnimListGTD[ANIMLIST_GTD_PAGE_L], RGBA_WHITE);
    TextDrawSetOutline      (g_AnimListGTD[ANIMLIST_GTD_PAGE_L], 1);
    TextDrawSetProportional (g_AnimListGTD[ANIMLIST_GTD_PAGE_L], 1);
    TextDrawTextSize        (g_AnimListGTD[ANIMLIST_GTD_PAGE_L], 10.0, 20.0);
    TextDrawSetSelectable   (g_AnimListGTD[ANIMLIST_GTD_PAGE_L], 1);

    g_AnimListGTD[ANIMLIST_GTD_COLUMN_INDEX] =
    TextDrawCreate          (1.0, 177.0, "Index");
    TextDrawBackgroundColor (g_AnimListGTD[ANIMLIST_GTD_COLUMN_INDEX], 255);
    TextDrawFont            (g_AnimListGTD[ANIMLIST_GTD_COLUMN_INDEX], 1);
    TextDrawLetterSize      (g_AnimListGTD[ANIMLIST_GTD_COLUMN_INDEX], 0.2, 1.0);
    TextDrawColor           (g_AnimListGTD[ANIMLIST_GTD_COLUMN_INDEX], RGBA_WHITE);
    TextDrawSetOutline      (g_AnimListGTD[ANIMLIST_GTD_COLUMN_INDEX], 1);
    TextDrawSetProportional (g_AnimListGTD[ANIMLIST_GTD_COLUMN_INDEX], 1);
    TextDrawTextSize        (g_AnimListGTD[ANIMLIST_GTD_COLUMN_INDEX], 30.0, 10.0);

    g_AnimListGTD[ANIMLIST_GTD_COLUMN_LIBRARY] =
    TextDrawCreate          (33.0, 177.0, "Library");
    TextDrawBackgroundColor (g_AnimListGTD[ANIMLIST_GTD_COLUMN_LIBRARY], 255);
    TextDrawFont            (g_AnimListGTD[ANIMLIST_GTD_COLUMN_LIBRARY], 1);
    TextDrawLetterSize      (g_AnimListGTD[ANIMLIST_GTD_COLUMN_LIBRARY], 0.2, 1.0);
    TextDrawColor           (g_AnimListGTD[ANIMLIST_GTD_COLUMN_LIBRARY], RGBA_WHITE);
    TextDrawSetOutline      (g_AnimListGTD[ANIMLIST_GTD_COLUMN_LIBRARY], 1);
    TextDrawSetProportional (g_AnimListGTD[ANIMLIST_GTD_COLUMN_LIBRARY], 1);
    TextDrawTextSize        (g_AnimListGTD[ANIMLIST_GTD_COLUMN_LIBRARY], 90.0, 10.0);

    g_AnimListGTD[ANIMLIST_GTD_COLUMN_NAME] =
    TextDrawCreate          (93.0, 177.0, "Name");
    TextDrawBackgroundColor (g_AnimListGTD[ANIMLIST_GTD_COLUMN_NAME], 255);
    TextDrawFont            (g_AnimListGTD[ANIMLIST_GTD_COLUMN_NAME], 1);
    TextDrawLetterSize      (g_AnimListGTD[ANIMLIST_GTD_COLUMN_NAME], 0.2, 1.0);
    TextDrawColor           (g_AnimListGTD[ANIMLIST_GTD_COLUMN_NAME], RGBA_WHITE);
    TextDrawSetOutline      (g_AnimListGTD[ANIMLIST_GTD_COLUMN_NAME], 1);
    TextDrawSetProportional (g_AnimListGTD[ANIMLIST_GTD_COLUMN_NAME], 1);
    TextDrawTextSize        (g_AnimListGTD[ANIMLIST_GTD_COLUMN_NAME], 191.0, 10.0);
}

DestroyGenericAnimationList() {
    for(new gtd; gtd < MAX_ANIMLIST_GTDS; gtd ++) {
        TextDrawDestroy( g_AnimListGTD[gtd] );
        g_AnimListGTD[gtd] = Text: INVALID_TEXT_DRAW;
    }
}

CreatePlayerAnimationList(playerid) {
    g_AnimListPTD[playerid][ANIMLIST_PTD_PAGE] =
    CreatePlayerTextDraw          (playerid, 96.0, 151.0, "Page");
    PlayerTextDrawAlignment       (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_PAGE], 2);
    PlayerTextDrawBackgroundColor (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_PAGE], 255);
    PlayerTextDrawFont            (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_PAGE], 1);
    PlayerTextDrawLetterSize      (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_PAGE], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_PAGE], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_PAGE], 1);
    PlayerTextDrawSetProportional (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_PAGE], 1);
    PlayerTextDrawTextSize        (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_PAGE], 10.0, 97.0);
    PlayerTextDrawSetSelectable   (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_PAGE], 1);

    g_AnimListPTD[playerid][ANIMLIST_PTD_SEARCH] =
    CreatePlayerTextDraw          (playerid, 96.0, 164.0, "Search");
    PlayerTextDrawAlignment       (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_SEARCH], 2);
    PlayerTextDrawBackgroundColor (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_SEARCH], 255);
    PlayerTextDrawFont            (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_SEARCH], 1);
    PlayerTextDrawLetterSize      (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_SEARCH], 0.2, 1.0);
    PlayerTextDrawColor           (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_SEARCH], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_SEARCH], 1);
    PlayerTextDrawSetProportional (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_SEARCH], 1);
    PlayerTextDrawTextSize        (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_SEARCH], 10.0, 190.0);
    PlayerTextDrawSetSelectable   (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_SEARCH], 1);

    for(new row, Float:y = 190.0; row < MAX_ANIMLIST_ROWS; row ++, y += 13.0) {
        g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_INDEX][row] =
        CreatePlayerTextDraw          (playerid, 1.0, y, "INDEX");
        PlayerTextDrawBackgroundColor (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_INDEX][row], 255);
        PlayerTextDrawFont            (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_INDEX][row], 1);
        PlayerTextDrawLetterSize      (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_INDEX][row], 0.2, 1.0);
        PlayerTextDrawColor           (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_INDEX][row], RGBA_WHITE);
        PlayerTextDrawSetOutline      (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_INDEX][row], 1);
        PlayerTextDrawSetProportional (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_INDEX][row], 1);
        PlayerTextDrawUseBox          (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_INDEX][row], 1);
        PlayerTextDrawBoxColor        (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_INDEX][row], 0);
        PlayerTextDrawTextSize        (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_INDEX][row], 30.0, 10.0);
        PlayerTextDrawSetSelectable   (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_INDEX][row], 1);

        g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_LIBRARY][row] =
        CreatePlayerTextDraw          (playerid, 33.0, y, "LIB");
        PlayerTextDrawBackgroundColor (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_LIBRARY][row], 255);
        PlayerTextDrawFont            (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_LIBRARY][row], 1);
        PlayerTextDrawLetterSize      (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_LIBRARY][row], 0.2, 1.0);
        PlayerTextDrawColor           (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_LIBRARY][row], RGBA_WHITE);
        PlayerTextDrawSetOutline      (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_LIBRARY][row], 1);
        PlayerTextDrawSetProportional (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_LIBRARY][row], 1);
        PlayerTextDrawUseBox          (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_LIBRARY][row], 1);
        PlayerTextDrawBoxColor        (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_LIBRARY][row], 0);
        PlayerTextDrawTextSize        (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_LIBRARY][row], 90.0, 10.0);
        PlayerTextDrawSetSelectable   (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_LIBRARY][row], 1);

        g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_NAME][row] =
        CreatePlayerTextDraw          (playerid, 93.0, y, "NAME");
        PlayerTextDrawBackgroundColor (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_NAME][row], 255);
        PlayerTextDrawFont            (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_NAME][row], 1);
        PlayerTextDrawLetterSize      (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_NAME][row], 0.2, 1.0);
        PlayerTextDrawColor           (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_NAME][row], RGBA_WHITE);
        PlayerTextDrawSetOutline      (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_NAME][row], 1);
        PlayerTextDrawSetProportional (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_NAME][row], 1);
        PlayerTextDrawUseBox          (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_NAME][row], 1);
        PlayerTextDrawBoxColor        (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_NAME][row], 0);
        PlayerTextDrawTextSize        (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_NAME][row], 191.0, 10.0);
        PlayerTextDrawSetSelectable   (playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_NAME][row], 1);
    }
}

DestroyPlayerAnimationList(playerid) {
    for(new ptd; ptd < MAX_ANIMLIST_PTDS; ptd ++) {
        PlayerTextDrawDestroy(playerid, g_AnimListPTD[playerid][ptd]);
        g_AnimListPTD[playerid][ptd] = PlayerText: INVALID_TEXT_DRAW;
    }
}

ShowAnimationList(playerid) {
    CreatePlayerAnimationList(playerid);

    for(new gtd; gtd < MAX_ANIMLIST_GTDS; gtd ++) {
        TextDrawShowForPlayer(playerid, g_AnimListGTD[gtd]);
    }

    LoadAnimationListRowData(playerid);

    ApplyAnimationListPage(playerid);
    PlayerTextDrawShow(playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_PAGE]);

    ApplyAnimationListSearch(playerid);
    PlayerTextDrawShow(playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_SEARCH]);

    ApplyAnimationListRowData(playerid);
}

HideAnimationList(playerid) {
    DestroyPlayerAnimationList(playerid);
    
    for(new gtd; gtd < MAX_ANIMLIST_GTDS; gtd ++) {
        TextDrawHideForPlayer(playerid, g_AnimListGTD[gtd]);
    }
}

GetAnimationListNewColoredRow(playerid) {
    new actorid = GetPlayerEditActor(playerid);
    if( !IsValidActor(actorid) ) {
        return INVALID_ROW;
    }

    new actor_anim_idx = g_ActorData[actorid][ACTOR_DATA_ANIM_INDEX];
    if( actor_anim_idx == INVALID_ANIM_INDEX ) {
        return INVALID_ROW;
    }

    for(new row, row_anim_idx; row < MAX_ANIMLIST_ROWS; row ++) {
        row_anim_idx = g_AnimListData[playerid][ANIMLIST_DATA_ROW_INDEX][row];

        if( actor_anim_idx == row_anim_idx ) {
            return row;
        }
    }
    return INVALID_ROW;
}

ApplyAnimationListRowColor(playerid, row) {
    new
        colored_row = g_AnimListData[playerid][ANIMLIST_DATA_COLORED_ROW],
        rgba_boxcolor = ( row == colored_row ) ? 0xFFFFFF64 : 0x00000000
    ;

    PlayerTextDrawBoxColor(playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_INDEX][row],   rgba_boxcolor);
    PlayerTextDrawBoxColor(playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_LIBRARY][row], rgba_boxcolor);
    PlayerTextDrawBoxColor(playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_NAME][row],    rgba_boxcolor);

    PlayerTextDrawShow(playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_INDEX][row]);
    PlayerTextDrawShow(playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_LIBRARY][row]);
    PlayerTextDrawShow(playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_NAME][row]);
}

ApplyAnimationListRowData(playerid) {
    for(new row, row_anim_idx; row < MAX_ANIMLIST_ROWS; row ++) {
        row_anim_idx = g_AnimListData[playerid][ANIMLIST_DATA_ROW_INDEX][row];

        if( row_anim_idx == INVALID_ANIM_INDEX ) {
            PlayerTextDrawHide(playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_INDEX][row]);
            PlayerTextDrawHide(playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_LIBRARY][row]);
            PlayerTextDrawHide(playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_NAME][row]);
            continue;
        }

        GetAnimationName(row_anim_idx, g_AnimLibString, sizeof g_AnimLibString, g_AnimNameString, sizeof g_AnimNameString);

        format(g_IntegerString, sizeof g_IntegerString, "%i", row_anim_idx);

        PlayerTextDrawSetString(playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_INDEX][row],   g_IntegerString);
        PlayerTextDrawSetString(playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_LIBRARY][row], g_AnimLibString);
        PlayerTextDrawSetString(playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_NAME][row],    g_AnimNameString);

        ApplyAnimationListRowColor(playerid, row);
    }
}

ApplyAnimationListPage(playerid) {
    format(g_TextdrawString, sizeof g_TextdrawString, "Page: %i / %i", g_AnimListData[playerid][ANIMLIST_DATA_PAGE] + 1, g_AnimListData[playerid][ANIMLIST_DATA_MAXPAGE] + 1);
    PlayerTextDrawSetString(playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_PAGE], g_TextdrawString);
}

ApplyAnimationListSearch(playerid) {
    strunpack(g_SearchString, g_AnimListData[playerid][ANIMLIST_DATA_SEARCH], sizeof g_SearchString);
    if( isempty(g_SearchString) ) {
        PlayerTextDrawSetString(playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_SEARCH], "Search");
    } else {
        format(g_TextdrawString, sizeof g_TextdrawString, "Search: %s", g_SearchString);
        PlayerTextDrawSetString(playerid, g_AnimListPTD[playerid][ANIMLIST_PTD_SEARCH], g_TextdrawString);
    }
}

LoadAnimationListRowData(playerid) {
    new rows_added, max_offset;

    strunpack(g_SearchString, g_AnimListData[playerid][ANIMLIST_DATA_SEARCH]);

    rows_added = FindAnimations(
        .result = g_AnimListData[playerid][ANIMLIST_DATA_ROW_INDEX],
        .result_size = MAX_ANIMLIST_ROWS,
        .search = g_SearchString,
        .offset = g_AnimListData[playerid][ANIMLIST_DATA_PAGE] * MAX_ANIMLIST_ROWS,
        .max_offset = max_offset
    );

    for(new row = rows_added; row < MAX_ANIMLIST_ROWS; row ++) {
        g_AnimListData[playerid][ANIMLIST_DATA_ROW_INDEX][row] = INVALID_ANIM_INDEX;
    }

    g_AnimListData[playerid][ANIMLIST_DATA_MAXPAGE] = max_offset / MAX_ANIMLIST_ROWS;

    g_AnimListData[playerid][ANIMLIST_DATA_COLORED_ROW] = GetAnimationListNewColoredRow(playerid);
}

ShowAnimationListDialog(playerid, dialogid) {
    switch(dialogid) {
        case DIALOGID_ANIMLIST_PAGE: {
            format(g_DialogInfo, sizeof g_DialogInfo, "Page: %i / %i", g_AnimListData[playerid][ANIMLIST_DATA_PAGE] + 1, g_AnimListData[playerid][ANIMLIST_DATA_MAXPAGE] + 1);
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Animation List: Page", g_DialogInfo, "Enter", "Cancel");
        }
        case DIALOGID_ANIMLIST_SEARCH: {
            strunpack(g_SearchString, g_AnimListData[playerid][ANIMLIST_DATA_SEARCH]);
            if( isempty(g_SearchString) ) {
                g_DialogInfo = "You are not searching for anything.";
            } else {
                format(g_DialogInfo, sizeof g_DialogInfo, "Searching for: %s", g_SearchString);
            }
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Animation List: Search", g_DialogInfo, "Enter", "Cancel");
        }
        default: {
            return 0;
        }
    }
    return 1;
}
