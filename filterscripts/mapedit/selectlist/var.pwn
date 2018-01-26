enum { // Generic Textdraws
    Text: SELECTLIST_GTD_BG,          // Background
    Text: SELECTLIST_GTD_CLOSE,       // Close Button
    Text: SELECTLIST_GTD_PAGE_F,      // First Page
    Text: SELECTLIST_GTD_PAGE_P,      // Previous Page
    Text: SELECTLIST_GTD_PAGE_N,      // Next Page
    Text: SELECTLIST_GTD_PAGE_L,      // Last Page
          MAX_SELECTLIST_GTDS
}

enum { // Player Textdraws
    PlayerText: SELECTLIST_PTD_CAPTION,                           // Caption / Title
    PlayerText: SELECTLIST_PTD_PAGE,                              // Current Page / Input Button
    PlayerText: SELECTLIST_PTD_SEARCH,                            // Current Search / Input Button
    PlayerText: SELECTLIST_PTD_ID_COL,                            // ID Column
    PlayerText: SELECTLIST_PTD_MODELID_COL,                       // Model ID Column
    PlayerText: SELECTLIST_PTD_COMMENT_COL,                       // Comment Column
    PlayerText: SELECTLIST_PTD_ID_ROW      [MAX_SELECTLIST_ROWS], // ID Row
    PlayerText: SELECTLIST_PTD_MODELID_ROW [MAX_SELECTLIST_ROWS], // Model ID Row
    PlayerText: SELECTLIST_PTD_COMMENT_ROW [MAX_SELECTLIST_ROWS], // Comment Row
                MAX_SELECTLIST_PTDS
}

enum SELECTLIST_DATA {
          SELECTLIST_DATA_PAGE,                              // page
          SELECTLIST_DATA_MAX_PAGE,                       // max page / last page
          SELECTLIST_DATA_SEARCH [MAX_SEARCH_LEN+1 char], // search for string
          SELECTLIST_DATA_ROW_ID [MAX_SELECTLIST_ROWS],   // row id
          SELECTLIST_DATA_EDIT_ROW,                       // edit row
    bool: SELECTLIST_DATA_EDIT_VIEWED,                    // edit viewed
}

new
                g_SelectObjListData  [MAX_PLAYERS][SELECTLIST_DATA],    // Select Object Data
                g_SelectVehListData  [MAX_PLAYERS][SELECTLIST_DATA],    // Select Vehicle Data
                g_SelectPickListData [MAX_PLAYERS][SELECTLIST_DATA],    // Select Pickup Data
                g_SelectActListData  [MAX_PLAYERS][SELECTLIST_DATA],    // Select Actor Data
    Text:       g_SelectListGTD      [MAX_SELECTLIST_GTDS],             // Generic Textdraws
    PlayerText: g_SelectListPTD      [MAX_PLAYERS][MAX_SELECTLIST_PTDS] // Player Textdraws
;
