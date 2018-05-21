enum { // Generic Textdraws
    Text: BUILDLIST_GTD_BG,     // Background
    Text: BUILDLIST_GTD_CLOSE,  // Close Button
    Text: BUILDLIST_GTD_PAGE_F, // First Page
    Text: BUILDLIST_GTD_PAGE_P, // Previous Page
    Text: BUILDLIST_GTD_PAGE_N, // Next Page
    Text: BUILDLIST_GTD_PAGE_L, // Last Page
          MAX_BUILDLIST_GTDS
}

enum { // Player Textdraws
    PlayerText: BUILDLIST_PTD_CAPTION,                            // Caption / Title
    PlayerText: BUILDLIST_PTD_PAGE,                               // Current Page / Input Button
    PlayerText: BUILDLIST_PTD_INCMODE,                            // Including All, Removed, Existing / Button
    PlayerText: BUILDLIST_PTD_BUILDID_COL,                        // Building ID Column
    PlayerText: BUILDLIST_PTD_MODELID_COL,                        // Model ID Column
    PlayerText: BUILDLIST_PTD_MODELNAME_COL,                      // Model Name Column
    PlayerText: BUILDLIST_PTD_BUILDID_ROW   [MAX_BUILDLIST_ROWS], // Building ID Row
    PlayerText: BUILDLIST_PTD_MODELID_ROW   [MAX_BUILDLIST_ROWS], // Model ID Row
    PlayerText: BUILDLIST_PTD_MODELNAME_ROW [MAX_BUILDLIST_ROWS], // Model Name Row
                MAX_BUILDLIST_PTDS
}

enum BUILDLIST_DATA {
          BUILDLIST_DATA_PAGE,                        // page
          BUILDLIST_DATA_INCMODE,                     // including all, removed only, existing only
          BUILDLIST_DATA_ROW_ID [MAX_BUILDLIST_ROWS], // row id
          BUILDLIST_DATA_EDIT_ROW,                    // edit row
    bool: BUILDLIST_DATA_EDIT_VIEWED,                 // edit viewed
}

new
                g_BuildListData [MAX_PLAYERS][BUILDLIST_DATA],    // Building List Data
    Text:       g_BuildListGTD  [MAX_BUILDLIST_GTDS],             // Generic Textdraws
    PlayerText: g_BuildListPTD  [MAX_PLAYERS][MAX_BUILDLIST_PTDS] // Player Textdraws
;
