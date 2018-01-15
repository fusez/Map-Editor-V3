CreateMapLoadedTextdraw() {
    if( g_MapLoadedTD == Text: INVALID_TEXT_DRAW ) {
        g_MapLoadedTD =
        TextDrawCreate            (633.0, 5.0, "Map Loaded");
        TextDrawAlignment        (g_MapLoadedTD, 3);
        TextDrawBackgroundColor    (g_MapLoadedTD, 255);
        TextDrawFont            (g_MapLoadedTD, 1);
        TextDrawLetterSize        (g_MapLoadedTD, 0.3, 1.3);
        TextDrawColor            (g_MapLoadedTD, -1);
        TextDrawSetOutline        (g_MapLoadedTD, 1);
        TextDrawSetProportional    (g_MapLoadedTD, 1);
    }
    return g_MapLoadedTD != Text: INVALID_TEXT_DRAW;
}

DestroyMapLoadedTextdraw() {
    if( g_MapLoadedTD != Text: INVALID_TEXT_DRAW) {
        TextDrawDestroy(g_MapLoadedTD);
        g_MapLoadedTD = Text: INVALID_TEXT_DRAW;
    }
    return g_MapLoadedTD == Text: INVALID_TEXT_DRAW;
}

RefreshMapLoadedTextdraw() {
    if( g_MapLoadedID == INVALID_MAP_ID ) {
        DestroyMapLoadedTextdraw();
    } else {
        CreateMapLoadedTextdraw();
        GetMapName(g_MapLoadedID, g_MapString, sizeof g_MapString);
        format(g_TextdrawString, sizeof g_TextdrawString, "~w~Last Map Loaded: ~r~%s", g_MapString);
        TextDrawSetString(g_MapLoadedTD, g_TextdrawString);
        TextDrawShowForAll(g_MapLoadedTD);
    }
}
