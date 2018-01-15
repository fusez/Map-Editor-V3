enum { // Generic Textdraws
    Text: CREATELIST_GTD_BG,         // Background
    Text: CREATELIST_GTD_CLOSE,      // Close Button
    Text: CREATELIST_GTD_PAGE_F,     // First Page
    Text: CREATELIST_GTD_PAGE_P,     // Previous Page
    Text: CREATELIST_GTD_PAGE_N,     // Next Page
    Text: CREATELIST_GTD_PAGE_L,     // Last Page
    Text: CREATELIST_GTD_CATEGORY_R, // Category Reset
    Text: CREATELIST_GTD_ID_COL,     // Model ID Column
    Text: CREATELIST_GTD_NAME_COL,   // Name Column
          MAX_CREATELIST_GTDS
}

enum { // Player Textdraws
    PlayerText: CREATELIST_PTD_CAPTION,                        // Caption / Title
    PlayerText: CREATELIST_PTD_PAGE,                           // Page / Page Input Button
    PlayerText: CREATELIST_PTD_CATEGORY,                       // Category / Category Select Button
    PlayerText: CREATELIST_PTD_SEARCH,                         // Search / Search Input Button
    PlayerText: CREATELIST_PTD_ID_ROW   [MAX_CREATELIST_ROWS], // ID Row
    PlayerText: CREATELIST_PTD_NAME_ROW [MAX_CREATELIST_ROWS], // Name Row
                MAX_CREATELIST_PTDS
}

enum {
    CREATELIST_DATA_PAGE,
    CREATELIST_DATA_MAX_PAGE,
    CREATELIST_DATA_CATEGORY,
    CREATELIST_DATA_SEARCH [MAX_SEARCH_LEN+1 char],
    CREATELIST_DATA_ROW_ID [MAX_CREATELIST_ROWS],
    CREATELIST_DATA_SELECT_ID,
    CREATELIST_DATA_SELECT_ROW,
    MAX_CREATELIST_DATA
}

new
                g_CreateObjListData   [MAX_PLAYERS][MAX_CREATELIST_DATA],
                g_CreateVehListData   [MAX_PLAYERS][MAX_CREATELIST_DATA],
                g_CreatePickListData  [MAX_PLAYERS][MAX_CREATELIST_DATA],
                g_CreateActListData   [MAX_PLAYERS][MAX_CREATELIST_DATA],
                g_CreateAttachListData[MAX_PLAYERS][MAX_CREATELIST_DATA],
    Text:       g_CreateListGTD       [MAX_CREATELIST_GTDS],              // Generic Textdraws
    PlayerText: g_CreateListPTD       [MAX_PLAYERS][MAX_CREATELIST_PTDS]  // Player Textdraws
;
