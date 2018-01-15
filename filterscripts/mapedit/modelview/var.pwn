enum { // Model View Data
    bool:  MODELVIEW_DATA_TOGGLE,  // Is Toggled
           MODELVIEW_DATA_MODELID, // Model ID
    Float: MODELVIEW_DATA_RX,      // RX
    Float: MODELVIEW_DATA_RY,      // RY
    Float: MODELVIEW_DATA_RZ,      // RZ
    Float: MODELVIEW_DATA_ZM,      // Zoom
    Float: MODELVIEW_DATA_RXS,     // RX Speed
    Float: MODELVIEW_DATA_RYS,     // RY Speed
    Float: MODELVIEW_DATA_RZS,     // RZ Speed
           MODELVIEW_DATA_VC1,     // Vehicle Color 1
           MODELVIEW_DATA_VC2,     // Vehicle Color 2
           MAX_MODELVIEW_DATA
}

enum { // View Model Modifiers
    Text: MODELVIEW_MOD_S2, // Subtract x2
    Text: MODELVIEW_MOD_S1, // Subtract x1
    Text: MODELVIEW_MOD_R,  // Reset
    Text: MODELVIEW_MOD_A1, // Add x1
    Text: MODELVIEW_MOD_A2, // Add x2
          MAX_MODELVIEW_MODS
}

enum {
    Text: MODELVIEW_GTD_BG,                          // Background
    Text: MODELVIEW_GTD_CLOSE,                       // Close
    Text: MODELVIEW_GTD_CAPTION,                     // Caption
    Text: MODELVIEW_GTD_RX_MOD [MAX_MODELVIEW_MODS], // RX Modify
    Text: MODELVIEW_GTD_RY_MOD [MAX_MODELVIEW_MODS], // RY Modify
    Text: MODELVIEW_GTD_RZ_MOD [MAX_MODELVIEW_MODS], // RZ Modify
    Text: MODELVIEW_GTD_ZM_MOD [MAX_MODELVIEW_MODS], // Zoom Modify
    Text: MODELVIEW_GTD_RXS_MOD[MAX_MODELVIEW_MODS], // RX Speed Modify
    Text: MODELVIEW_GTD_RYS_MOD[MAX_MODELVIEW_MODS], // RY Speed Modify
    Text: MODELVIEW_GTD_RZS_MOD[MAX_MODELVIEW_MODS], // RZ Speed Modify
    Text: MODELVIEW_GTD_VC1_MOD[MAX_MODELVIEW_MODS], // Vehicle Color 1 Modify
    Text: MODELVIEW_GTD_VC2_MOD[MAX_MODELVIEW_MODS], // Vehicle Color 2 Modify
          MAX_MODELVIEW_GTDS
}

enum {
    PlayerText: MODELVIEW_PTD_MODEL, // Model
    PlayerText: MODELVIEW_PTD_RX,    // RX
    PlayerText: MODELVIEW_PTD_RY,    // RY
    PlayerText: MODELVIEW_PTD_RZ,    // RZ
    PlayerText: MODELVIEW_PTD_ZM,    // Zoom
    PlayerText: MODELVIEW_PTD_RXS,   // RX Speed
    PlayerText: MODELVIEW_PTD_RYS,   // RY Speed
    PlayerText: MODELVIEW_PTD_RZS,   // RZ Speed
    PlayerText: MODELVIEW_PTD_VC1,   // Vehicle Color 1
    PlayerText: MODELVIEW_PTD_VC2,   // Vehicle Color 2
                MAX_MODELVIEW_PTDS
}

new
                g_ModelViewTimer, // Looping Update Timer
                g_ModelViewData[MAX_PLAYERS][MAX_MODELVIEW_DATA],
    Text:       g_ModelViewGTD [MAX_MODELVIEW_GTDS],
    PlayerText: g_ModelViewPTD [MAX_PLAYERS][MAX_MODELVIEW_PTDS]
;
