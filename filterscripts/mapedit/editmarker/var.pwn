enum EDITMARKER_DATA {
    bool:  EDITMARKER_DATA_ON,     // On/Off
    bool:  EDITMARKER_DATA_ATTACH, // Attached / Not Attached
           EDITMARKER_DATA_POID,   // Player Object ID
           EDITMARKER_DATA_MODEL,  // Model ID
    Float: EDITMARKER_DATA_Z,      // Z Offset
           EDITMARKER_DATA_TICK    // Next Tickcount Update
}

new g_EditMarkerData[MAX_PLAYERS][EDITMARKER_DATA];
