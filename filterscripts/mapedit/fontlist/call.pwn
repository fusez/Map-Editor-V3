public OnFilterScriptInit() {
    CreateGenericFontList();

    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            DefaultFontListData(playerid);
        }
    }

    #if defined fl_OnFilterScriptInit
        fl_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit fl_OnFilterScriptInit
#if defined fl_OnFilterScriptInit
    forward fl_OnFilterScriptInit();
#endif


public OnFilterScriptExit() {
    DestroyGenericFontList();

    #if defined fl_OnFilterScriptExit
        fl_OnFilterScriptExit();
    #endif
}
#if defined _ALS_OnFilterScriptExit
    #undef OnFilterScriptExit
#else
    #define _ALS_OnFilterScriptExit
#endif
#define OnFilterScriptExit fl_OnFilterScriptExit
#if defined fl_OnFilterScriptExit
    forward fl_OnFilterScriptExit();
#endif


public OnPlayerConnect(playerid) {
    DefaultFontListData(playerid);

    #if defined fl_OnPlayerConnect
        return fl_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect fl_OnPlayerConnect
#if defined fl_OnPlayerConnect
    forward fl_OnPlayerConnect(playerid);
#endif


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    switch(dialogid) {
        case DIALOGID_FONTLIST_PAGE: {
            if( !response ) {
                return 1;
            }

            new page;

            if( sscanf(inputtext, "i", page) ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a valid page number!");
                ShowFontListDialog(playerid, dialogid);
                return 1;
            }

            page --;

            if( page < MIN_FONTLIST_PAGE || page > g_FontListData[playerid][FONTLIST_DATA_MAXPAGE] ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a valid page number!");
                ShowFontListDialog(playerid, dialogid);
                return 1;
            }

            g_FontListData[playerid][FONTLIST_DATA_PAGE] = page;
            LoadFontListRowData(playerid);

            ApplyFontListPage(playerid);
            ApplyFontListRowData(playerid);
            return 1;
        }
        case DIALOGID_FONTLIST_SEARCH: {
            if( !response ) {
                return 1;
            }

            g_FontListData[playerid][FONTLIST_DATA_PAGE] = MIN_FONTLIST_PAGE;
            strpack(g_FontListData[playerid][FONTLIST_DATA_SEARCH], inputtext, MAX_SEARCH_LEN+1);
            LoadFontListRowData(playerid);

            ApplyFontListPage(playerid);
            ApplyFontListSearch(playerid);
            ApplyFontListRowData(playerid);
            return 1;
        }
    }

    #if defined fl_OnDialogResponse
        return fl_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif
#define OnDialogResponse fl_OnDialogResponse
#if defined fl_OnDialogResponse
    forward fl_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif


public OnPlayerClickTextDraw(playerid, Text:clickedid) {
    if( clickedid == Text: INVALID_TEXT_DRAW && g_PlayerData[playerid][PLAYER_DATA_TDMODE] == TDMODE_FONTLIST ) {
        HidePlayerTextdrawMode(playerid);
    }
    if( clickedid == g_FontListGTD[FONTLIST_GTD_CLOSE] ) {
        ShowObjectDialog(playerid, DIALOGID_OBJECT_INDEX);
        HidePlayerTextdrawMode(playerid);
        return 1;
    }
    if( clickedid == g_FontListGTD[FONTLIST_GTD_PAGE_F] ) {
        if( g_FontListData[playerid][FONTLIST_DATA_PAGE] == MIN_FONTLIST_PAGE ) {
            return 1;
        }

        g_FontListData[playerid][FONTLIST_DATA_PAGE] = MIN_FONTLIST_PAGE;
        LoadFontListRowData(playerid);

        ApplyFontListPage(playerid);
        ApplyFontListRowData(playerid);
        return 1;
    }
    if( clickedid == g_FontListGTD[FONTLIST_GTD_PAGE_P] ) {
        if( g_FontListData[playerid][FONTLIST_DATA_PAGE] == MIN_FONTLIST_PAGE ) {
            return 1;
        }

        if( -- g_FontListData[playerid][FONTLIST_DATA_PAGE] < MIN_FONTLIST_PAGE ) {
            g_FontListData[playerid][FONTLIST_DATA_PAGE] = MIN_FONTLIST_PAGE;
        }
        LoadFontListRowData(playerid);

        ApplyFontListPage(playerid);
        ApplyFontListRowData(playerid);
        return 1;
    }
    if( clickedid == g_FontListGTD[FONTLIST_GTD_PAGE_N] ) {
        if( g_FontListData[playerid][FONTLIST_DATA_PAGE] == g_FontListData[playerid][FONTLIST_DATA_MAXPAGE] ) {
            return 1;
        }

        if( ++ g_FontListData[playerid][FONTLIST_DATA_PAGE] > g_FontListData[playerid][FONTLIST_DATA_MAXPAGE] ) {
            g_FontListData[playerid][FONTLIST_DATA_PAGE] = g_FontListData[playerid][FONTLIST_DATA_MAXPAGE];
        }
        LoadFontListRowData(playerid);

        ApplyFontListPage(playerid);
        ApplyFontListRowData(playerid);
        return 1;
    }
    if( clickedid == g_FontListGTD[FONTLIST_GTD_PAGE_L] ) {
        if( g_FontListData[playerid][FONTLIST_DATA_PAGE] == g_FontListData[playerid][FONTLIST_DATA_MAXPAGE] ) {
            return 1;
        }

        g_FontListData[playerid][FONTLIST_DATA_PAGE] = g_FontListData[playerid][FONTLIST_DATA_MAXPAGE];
        LoadFontListRowData(playerid);

        ApplyFontListPage(playerid);
        ApplyFontListRowData(playerid);
        return 1;
    }

    #if defined fl_OnPlayerClickTextDraw
        return fl_OnPlayerClickTextDraw(playerid, Text:clickedid);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerClickTextDraw
    #undef OnPlayerClickTextDraw
#else
    #define _ALS_OnPlayerClickTextDraw
#endif
#define OnPlayerClickTextDraw fl_OnPlayerClickTextDraw
#if defined fl_OnPlayerClickTextDraw
    forward fl_OnPlayerClickTextDraw(playerid, Text:clickedid);
#endif


public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid) {
    if( playertextid == g_FontListPTD[playerid][FONTLIST_PTD_PAGE] ) {
        return ShowFontListDialog(playerid, DIALOGID_FONTLIST_PAGE), 1;
    }
    if( playertextid == g_FontListPTD[playerid][FONTLIST_PTD_SEARCH] ) {
        return ShowFontListDialog(playerid, DIALOGID_FONTLIST_SEARCH), 1;
    }
    for(new row; row < MAX_FONTLIST_ROWS; row ++) {
        if( playertextid == g_FontListPTD[playerid][FONTLIST_PTD_ROW][row] ) {
            new row_font_id = g_FontListData[playerid][FONTLIST_DATA_ROW_FONTID][row];

            if( row_font_id == INVALID_FONT_ID ) {
                return 1;
            }

            new objectid = GetPlayerEditObject(playerid);
            if( !IsValidObject(objectid) ) {
                return 1;
            }

            new materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX];
            if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] != MATERIALINDEX_TYPE_TEXT ) {
                g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] = MATERIALINDEX_TYPE_TEXT;
                DefaultObjectMaterialIndexData(objectid, materialindex);
            }

            GetFontName(row_font_id, g_FontString, sizeof g_FontString);
            strpack(g_ObjectFont[objectid-1][materialindex], g_FontString, MAX_FONTNAME_LEN+1);

            if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_MODCOUNT] >= MAX_MATERIALINDEX_MODCOUNT ) {
                new new_objectid = RecreateObject(objectid);
                if( new_objectid == INVALID_OBJECT_ID ) {
                    SendClientMessage(playerid, RGBA_RED, "ERROR: This object could not be font set / re-created!");
                } else {
                    g_PlayerData[playerid][PLAYER_DATA_EDIT_IDTYPE] = ID_TYPE_OBJECT;
                    g_PlayerData[playerid][PLAYER_DATA_EDIT_ID] = new_objectid;
                }
            } else {
                ApplyObjectMaterialIndexData(objectid, materialindex);
            }

            new prev_row = g_FontListData[playerid][FONTLIST_DATA_APPLIED_ROW];
            if( row != prev_row ) {
                g_FontListData[playerid][FONTLIST_DATA_APPLIED_ROW] = row;

                if( prev_row != INVALID_ROW ) {
                    ApplyFontListRowApplied(playerid, prev_row);
                }

                ApplyFontListRowApplied(playerid, row);
            }
            return 1;
        }
    }

    #if defined fl_OnPlayerClickPlayerTD
        return fl_OnPlayerClickPlayerTD(playerid, PlayerText:playertextid);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerClickPlayerTD
    #undef OnPlayerClickPlayerTextDraw
#else
    #define _ALS_OnPlayerClickPlayerTD
#endif
#define OnPlayerClickPlayerTextDraw fl_OnPlayerClickPlayerTD
#if defined fl_OnPlayerClickPlayerTD
    forward fl_OnPlayerClickPlayerTD(playerid, PlayerText:playertextid);
#endif
