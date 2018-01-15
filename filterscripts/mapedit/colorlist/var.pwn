enum {
    Text: COLORLIST_GTD_BG,                                // Background
    Text: COLORLIST_GTD_CLOSE,                             // Close
    Text: COLORLIST_GTD_PAGE_F,                            // First Page
    Text: COLORLIST_GTD_PAGE_P,                            // Previous Page
    Text: COLORLIST_GTD_PAGE_N,                            // Next Page
    Text: COLORLIST_GTD_PAGE_L,                            // Last Page
          MAX_COLORLIST_GTDS
}

enum {
    PlayerText: COLORLIST_PTD_CAPTION,                 // Caption
    PlayerText: COLORLIST_PTD_PAGE,                    // Current Page
    PlayerText: COLORLIST_PTD_COLOR_APPLIED,           // Applied Color (Next to color row)
    PlayerText: COLORLIST_PTD_ROW[MAX_COLORLIST_ROWS], // Row
                MAX_COLORLIST_PTDS
}

enum {
    COLORLIST_DATA_PAGE,
    COLORLIST_DATA_MAXPAGE,
    COLORLIST_DATA_APPLIED_ROW,
    COLORLIST_DATA_ROW_ID[MAX_COLORLIST_ROWS],
    MAX_COLORLIST_DATA
}

new
                g_VehColorListData   [MAX_PLAYERS][MAX_COLORLIST_DATA],
                g_ModelColorListData [MAX_PLAYERS][MAX_COLORLIST_DATA],
    Text:       g_ColorListGTD       [MAX_COLORLIST_GTDS],
    PlayerText: g_ColorListPTD       [MAX_PLAYERS][MAX_COLORLIST_PTDS]
;
