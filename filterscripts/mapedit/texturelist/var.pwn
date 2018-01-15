enum { // Generic Textdraws
    Text: TEXTURELIST_GTD_BG,         // Background
    Text: TEXTURELIST_GTD_CLOSE,      // Close Button
    Text: TEXTURELIST_GTD_PAGE_F,     // First Page
    Text: TEXTURELIST_GTD_PAGE_P,     // Previous Page
    Text: TEXTURELIST_GTD_PAGE_N,     // Next Page
    Text: TEXTURELIST_GTD_PAGE_L,     // Last Page
    Text: TEXTURELIST_GTD_CATEGORY_R, // Category Reset
    Text: TEXTURELIST_GTD_COL_MID,    // Model ID Column
    Text: TEXTURELIST_GTD_COL_TXD,    // TXD Column
    Text: TEXTURELIST_GTD_COL_NAME,   // Name Column
          MAX_TEXTURELIST_GTDS
}

enum { // Player Textdraws
    PlayerText: TEXTURELIST_PTD_CAPTION,                          // Caption / Title
    PlayerText: TEXTURELIST_PTD_PAGE,                             // Page / Page Input Button
    PlayerText: TEXTURELIST_PTD_CATEGORY,                         // Category / Category Select Button
    PlayerText: TEXTURELIST_PTD_SEARCH,                           // Search / Search Input Button
    PlayerText: TEXTURELIST_PTD_ROW_MID  [MAX_TEXTURELIST_ROWS],  // Model ID Row
    PlayerText: TEXTURELIST_PTD_ROW_TXD  [MAX_TEXTURELIST_ROWS],  // Txd Row
    PlayerText: TEXTURELIST_PTD_ROW_NAME [MAX_TEXTURELIST_ROWS],  // Name Row
                MAX_TEXTURELIST_PTDS
}

enum {
    TEXTURELIST_DATA_PAGE,                           // Current Page
    TEXTURELIST_DATA_MAXPAGE,                        // Max Page / Last Page
    TEXTURELIST_DATA_CATEGORY,                       // Category ID
    TEXTURELIST_DATA_SEARCH [MAX_SEARCH_LEN+1 char], // Search String
    TEXTURELIST_DATA_ROW_TID [MAX_TEXTURELIST_ROWS], // Texture ID
    TEXTURELIST_DATA_COLORED_ROW,
    MAX_TEXTURELIST_DATA
}

new
                g_TextureListData [MAX_PLAYERS][MAX_TEXTURELIST_DATA],
    Text:       g_TextureListGTD  [MAX_TEXTURELIST_GTDS],              // Generic Textdraws
    PlayerText: g_TextureListPTD  [MAX_PLAYERS][MAX_TEXTURELIST_PTDS]  // Player Textdraws
;
