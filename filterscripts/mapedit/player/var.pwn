enum PLAYER_DATA {
           PLAYER_DATA_EDIT_IDTYPE,       // Edit IDTYPE
           PLAYER_DATA_EDIT_ID,           // Edit ID of IDTYPE
           PLAYER_DATA_EDIT_ATTACHOBJECT, // Attach this object to other objects and vehicles
           PLAYER_DATA_EDIT_MATERIALOBJ,  // Copy textures / text from this object to another
           PLAYER_DATA_EDIT_OBJMATIDX,    // object material Index
           PLAYER_DATA_CLICKDRAG_POID,    // player object used for click & drag editing
    bool:  PLAYER_DATA_SELECTTD,          // is player selecting textdraw
           PLAYER_DATA_TDMODE,            // textdraw mode / current set of textdraws being shown
    bool:  PLAYER_DATA_POS_SAVED,         // used for saving / loading position
    Float: PLAYER_DATA_POS_X,             // used for saving / loading position
    Float: PLAYER_DATA_POS_Y,             // used for saving / loading position
    Float: PLAYER_DATA_POS_Z              // used for saving / loading position
}

new g_PlayerData[MAX_PLAYERS][PLAYER_DATA];
