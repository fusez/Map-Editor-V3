public OnFilterScriptInit() {
    CreateGenericTextureList();

    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            DefaultTextureListData(playerid);
        }
    }

    #if defined tl_OnFilterScriptInit
        tl_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit tl_OnFilterScriptInit
#if defined tl_OnFilterScriptInit
    forward tl_OnFilterScriptInit();
#endif


public OnFilterScriptExit() {
    DestroyGenericTextureList();

    #if defined tl_OnFilterScriptExit
        tl_OnFilterScriptExit();
    #endif
}
#if defined _ALS_OnFilterScriptExit
    #undef OnFilterScriptExit
#else
    #define _ALS_OnFilterScriptExit
#endif
#define OnFilterScriptExit tl_OnFilterScriptExit
#if defined tl_OnFilterScriptExit
    forward tl_OnFilterScriptExit();
#endif


public OnPlayerConnect(playerid) {
    DefaultTextureListData(playerid);

    #if defined tl_OnPlayerConnect
        return tl_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect tl_OnPlayerConnect
#if defined tl_OnPlayerConnect
    forward tl_OnPlayerConnect(playerid);
#endif


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    switch(dialogid) {
        case DIALOGID_TEXTURELIST_PAGE: {
            if( !response ) {
                return 1;
            }

            new page;

            if( sscanf(inputtext, "i", page) ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a valid page number!");
                ShowTextureListDialog(playerid, dialogid);
                return 1;
            }

            page --;

            if( page < MIN_TEXTURELIST_PAGE || page > g_TextureListData[playerid][TEXTURELIST_DATA_MAXPAGE] ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a valid page number!");
                ShowTextureListDialog(playerid, dialogid);
                return 1;
            }

            g_TextureListData[playerid][TEXTURELIST_DATA_PAGE] = page;
            LoadTextureListRowData(playerid);

            ApplyTextureListPage(playerid);
            ApplyTextureListRowData(playerid);
            return 1;
        }
        case DIALOGID_TEXTURELIST_SEARCH: {
            if( !response ) {
                return 1;
            }

            g_TextureListData[playerid][TEXTURELIST_DATA_PAGE] = MIN_TEXTURELIST_PAGE;
            strpack(g_TextureListData[playerid][TEXTURELIST_DATA_SEARCH], inputtext, MAX_SEARCH_LEN+1);
            LoadTextureListRowData(playerid);

            ApplyTextureListPage(playerid);
            ApplyTextureListSearch(playerid);
            ApplyTextureListRowData(playerid);
            return 1;
        }
    }

    #if defined tl_OnDialogResponse
        return tl_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif
#define OnDialogResponse tl_OnDialogResponse
#if defined tl_OnDialogResponse
    forward tl_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif


public OnPlayerClickTextDraw(playerid, Text:clickedid) {
    if( clickedid == Text: INVALID_TEXT_DRAW && g_PlayerData[playerid][PLAYER_DATA_TDMODE] == TDMODE_TEXTURELIST ) {
        HidePlayerTextdrawMode(playerid);
    }
    if( clickedid == g_TextureListGTD[TEXTURELIST_GTD_CLOSE] ) {
        ShowObjectDialog(playerid, DIALOGID_OBJECT_INDEX);
        HidePlayerTextdrawMode(playerid);
        return 1;
    }
    if( clickedid == g_TextureListGTD[TEXTURELIST_GTD_CATEGORY_R] ) {
        if( g_TextureListData[playerid][TEXTURELIST_DATA_CATEGORY] == INVALID_CATEGORY_ID ) {
            return 1;
        }

        g_TextureListData[playerid][TEXTURELIST_DATA_PAGE] = MIN_TEXTURELIST_PAGE;
        g_TextureListData[playerid][TEXTURELIST_DATA_CATEGORY] = INVALID_CATEGORY_ID;
        LoadTextureListRowData(playerid);

        ApplyTextureListPage(playerid);
        ApplyTextureListCategory(playerid);
        ApplyTextureListRowData(playerid);
        return 1;
    }
    if( clickedid == g_TextureListGTD[TEXTURELIST_GTD_PAGE_F] ) {
        if( g_TextureListData[playerid][TEXTURELIST_DATA_PAGE] == MIN_TEXTURELIST_PAGE ) {
            return 1;
        }

        g_TextureListData[playerid][TEXTURELIST_DATA_PAGE] = MIN_TEXTURELIST_PAGE;
        LoadTextureListRowData(playerid);

        ApplyTextureListPage(playerid);
        ApplyTextureListRowData(playerid);
        return 1;
    }
    if( clickedid == g_TextureListGTD[TEXTURELIST_GTD_PAGE_P] ) {
        if( g_TextureListData[playerid][TEXTURELIST_DATA_PAGE] == MIN_TEXTURELIST_PAGE ) {
            return 1;
        }

        if( -- g_TextureListData[playerid][TEXTURELIST_DATA_PAGE] < MIN_TEXTURELIST_PAGE ) {
            g_TextureListData[playerid][TEXTURELIST_DATA_PAGE] = MIN_TEXTURELIST_PAGE;
        }

        LoadTextureListRowData(playerid);

        ApplyTextureListPage(playerid);
        ApplyTextureListRowData(playerid);
        return 1;
    }
    if( clickedid == g_TextureListGTD[TEXTURELIST_GTD_PAGE_N] ) {
        if( g_TextureListData[playerid][TEXTURELIST_DATA_PAGE] == g_TextureListData[playerid][TEXTURELIST_DATA_MAXPAGE] ) {
            return 1;
        }

        if( ++ g_TextureListData[playerid][TEXTURELIST_DATA_PAGE] > g_TextureListData[playerid][TEXTURELIST_DATA_MAXPAGE] ) {
            g_TextureListData[playerid][TEXTURELIST_DATA_PAGE] = g_TextureListData[playerid][TEXTURELIST_DATA_MAXPAGE];
        }

        LoadTextureListRowData(playerid);

        ApplyTextureListPage(playerid);
        ApplyTextureListRowData(playerid);
        return 1;
    }
    if( clickedid == g_TextureListGTD[TEXTURELIST_GTD_PAGE_L] ) {
        if( g_TextureListData[playerid][TEXTURELIST_DATA_PAGE] == g_TextureListData[playerid][TEXTURELIST_DATA_MAXPAGE] ) {
            return 1;
        }

        g_TextureListData[playerid][TEXTURELIST_DATA_PAGE] = g_TextureListData[playerid][TEXTURELIST_DATA_MAXPAGE];
        LoadTextureListRowData(playerid);

        ApplyTextureListPage(playerid);
        ApplyTextureListRowData(playerid);
        return 1;
    }
    if( clickedid == g_TextureListGTD[TEXTURELIST_GTD_CATEGORY_R] ) {
        if( g_TextureListData[playerid][TEXTURELIST_DATA_CATEGORY] == INVALID_CATEGORY_ID ) {
            return 1;
        }

        g_TextureListData[playerid][TEXTURELIST_DATA_CATEGORY] = INVALID_CATEGORY_ID;
        g_TextureListData[playerid][TEXTURELIST_DATA_PAGE] = MIN_TEXTURELIST_PAGE;
        LoadTextureListRowData(playerid);

        ApplyTextureListCategory(playerid);
        ApplyTextureListPage(playerid);
        ApplyTextureListRowData(playerid);
    }

    #if defined tl_OnPlayerClickTextDraw
        return tl_OnPlayerClickTextDraw(playerid, Text:clickedid);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerClickTextDraw
    #undef OnPlayerClickTextDraw
#else
    #define _ALS_OnPlayerClickTextDraw
#endif
#define OnPlayerClickTextDraw tl_OnPlayerClickTextDraw
#if defined tl_OnPlayerClickTextDraw
    forward tl_OnPlayerClickTextDraw(playerid, Text:clickedid);
#endif


public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid) {
    if( playertextid == g_TextureListPTD[playerid][TEXTURELIST_PTD_PAGE] ) {
        return ShowTextureListDialog(playerid, DIALOGID_TEXTURELIST_PAGE), 1;
    }
    if( playertextid == g_TextureListPTD[playerid][TEXTURELIST_PTD_SEARCH] ) {
        return ShowTextureListDialog(playerid, DIALOGID_TEXTURELIST_SEARCH), 1;
    }
    if( playertextid == g_TextureListPTD[playerid][TEXTURELIST_PTD_CATEGORY] ) {
        DefaultCategorySelectData(playerid);
        LoadCategorySelectData(playerid);
        ShowCategorySelect(playerid);
        return 1;
    }

    for(new row; row < MAX_TEXTURELIST_ROWS; row ++) {
        if(
            playertextid == g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_MID][row] ||
            playertextid == g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_TXD][row] ||
            playertextid == g_TextureListPTD[playerid][TEXTURELIST_PTD_ROW_NAME][row]
        ) {
            new row_textureid = g_TextureListData[playerid][TEXTURELIST_DATA_ROW_TID][row];

            if( row_textureid == INVALID_TEXTURE_ID ) {
                return 1;
            }

            new objectid = GetPlayerEditObject(playerid);
            if( !IsValidObject(objectid) ) {
                return 1;
            }

            new materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX];
            if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] != MATERIALINDEX_TYPE_TEXTURE ) {
                g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] = MATERIALINDEX_TYPE_TEXTURE;
                DefaultObjectMaterialIndexData(objectid, materialindex);
            }

            g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TEXTURE][materialindex] = row_textureid;

            if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_MODCOUNT] >= MAX_MATERIALINDEX_MODCOUNT ) {
                new new_objectid = RecreateObject(objectid);
                if( new_objectid == INVALID_OBJECT_ID ) {
                    SendClientMessage(playerid, RGBA_RED, "ERROR: This object could not be color reset / re-created!");
                }
            } else {
                ApplyObjectMaterialIndexData(objectid, materialindex);
            }

            new prev_row = g_TextureListData[playerid][TEXTURELIST_DATA_COLORED_ROW];
            if( row != prev_row ) {
                g_TextureListData[playerid][TEXTURELIST_DATA_COLORED_ROW] = row;

                if( prev_row != INVALID_ROW ) {
                    ApplyTextureListRowColor(playerid, prev_row);
                }

                ApplyTextureListRowColor(playerid, row);
            }
            return 1;
        }
    }

    #if defined tl_OnPlayerClickPlayerTD
        return tl_OnPlayerClickPlayerTD(playerid, PlayerText:playertextid);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerClickPlayerTD
    #undef OnPlayerClickPlayerTextDraw
#else
    #define _ALS_OnPlayerClickPlayerTD
#endif
#define OnPlayerClickPlayerTextDraw tl_OnPlayerClickPlayerTD
#if defined tl_OnPlayerClickPlayerTD
    forward tl_OnPlayerClickPlayerTD(playerid, PlayerText:playertextid);
#endif
