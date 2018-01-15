public OnFilterScriptInit() {
    CreateGenericCategoryManager();

    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            DefaultCategoryManagerData(playerid);
        }
    }

    #if defined cm_OnFilterScriptInit
        cm_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit cm_OnFilterScriptInit
#if defined cm_OnFilterScriptInit
    forward cm_OnFilterScriptInit();
#endif


public OnFilterScriptExit() {
    DestroyGenericCategoryManager();

    #if defined cm_OnFilterScriptExit
        cm_OnFilterScriptExit();
    #endif
}
#if defined _ALS_OnFilterScriptExit
    #undef OnFilterScriptExit
#else
    #define _ALS_OnFilterScriptExit
#endif
#define OnFilterScriptExit cm_OnFilterScriptExit
#if defined cm_OnFilterScriptExit
    forward cm_OnFilterScriptExit();
#endif


public OnPlayerConnect(playerid) {
    DefaultCategoryManagerData(playerid);

    #if defined cm_OnPlayerConnect
        return cm_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect cm_OnPlayerConnect
#if defined cm_OnPlayerConnect
    forward cm_OnPlayerConnect(playerid);
#endif


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    switch( dialogid ) {
        case DIALOGID_CATMANAGER_CAT_CREATE: {
            if( !response ) {
                return 1;
            }

            if( isempty(inputtext) ) {
                ShowCategoryManagerDialog(playerid, dialogid);
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter anything into the textfield!");
                return 1;
            }

            new create_success;

            switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
                case TDMODE_CATMANAGER_MODELS: {
                    create_success = CreateModelCategory(inputtext);
                }
                case TDMODE_CATMANAGER_VEHICLES: {
                    create_success = CreateVehicleCategory(inputtext);
                }
                case TDMODE_CATMANAGER_SKINS: {
                    create_success = CreateSkinCategory(inputtext);
                }
                case TDMODE_CATMANAGER_TEXTURES: {
                    create_success = CreateTextureCategory(inputtext);
                }
                default: {
                    return 1;
                }
            }

            if( create_success ) {
                SendClientMessage(playerid, RGBA_GREEN, "Category created successfully.");
            } else {
                SendClientMessage(playerid, RGBA_RED, "ERROR: Category could not be created!");
                ShowCategoryManagerDialog(playerid, dialogid);
            }
            return 1;
        }
        case DIALOGID_CATMANAGER_CAT_DESTROY: {
            if( !response ) {
                return 1;
            }

            if( isempty(inputtext) || strcmp(inputtext, CATMANAGER_DELETE_CODE, true) != 0 ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter the correct delete code!");
                ShowCategoryManagerDialog(playerid, dialogid);
                return 1;
            }

            new categoryid = g_CatManagerData[playerid][CATMANAGER_DATA_CATEGORY];
            if( categoryid == INVALID_CATEGORY_ID ) {
                return 1;
            }

            new success;

            switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
                case TDMODE_CATMANAGER_MODELS: {
                    success = DestroyModelCategory(categoryid);
                }
                case TDMODE_CATMANAGER_VEHICLES: {
                    success = DestroyVehicleCategory(categoryid);
                }
                case TDMODE_CATMANAGER_SKINS: {
                    success = DestroySkinCategory(categoryid);
                }
                case TDMODE_CATMANAGER_TEXTURES: {
                    success = DestroyTextureCategory(categoryid);
                }
                default: {
                    return 1;
                }
            }

            if( success ) {
                SendClientMessage(playerid, RGBA_GREEN, "Category destroyed successfully.");

                SetCategoryManagerPage(playerid, CATMANAGER_WINDOW_CAT, MIN_CATMANAGER_PAGE);
                g_CatManagerData[playerid][CATMANAGER_DATA_CATEGORY] = INVALID_CATEGORY_ID;
                LoadCategoryManagerRowData(playerid, CATMANAGER_WINDOW_CAT);

                ApplyCategoryManagerPage(playerid, CATMANAGER_WINDOW_CAT);
                ApplyCategoryManagerCatName(playerid);
                ApplyCategoryManagerRowData(playerid, CATMANAGER_WINDOW_CAT);
            } else {
                SendClientMessage(playerid, RGBA_RED, "ERROR: This category could not be removed!");
                ShowCategoryManagerDialog(playerid, dialogid);
            }
            return 1;
        }
        case DIALOGID_CATMANAGER_CAT_RENAME: {
            if( !response ) {
                return 1;
            }

            if( isempty(inputtext) ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter anything into the textfield!");
                ShowCategoryManagerDialog(playerid, dialogid);
                return 1;
            }

            new categoryid = g_CatManagerData[playerid][CATMANAGER_DATA_CATEGORY];
            if( categoryid == INVALID_CATEGORY_ID ) {
                return 1;
            }

            new success;

            switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
                case TDMODE_CATMANAGER_MODELS: {
                    success = RenameModelCategory(categoryid, inputtext);
                }
                case TDMODE_CATMANAGER_VEHICLES: {
                    success = RenameVehicleCategory(categoryid, inputtext);
                }
                case TDMODE_CATMANAGER_SKINS: {
                    success = RenameSkinCategory(categoryid, inputtext);
                }
                case TDMODE_CATMANAGER_TEXTURES: {
                    success = RenameTextureCategory(categoryid, inputtext);
                }
                default: {
                    return 1;
                }
            }

            if( success ) {
                SendClientMessage(playerid, RGBA_GREEN, "Category renamed successfully.");

                ApplyCategoryManagerCatName(playerid);
            } else {
                SendClientMessage(playerid, RGBA_RED, "ERROR: This category could not be renamed!");
                ShowCategoryManagerDialog(playerid, dialogid);
            }
            return 1;
        }
        case DIALOGID_CATMANAGER_PAGE_ALL, DIALOGID_CATMANAGER_PAGE_CAT: {
            if( !response ) {
                return 1;
            }

            new
                bool:window = (dialogid == DIALOGID_CATMANAGER_PAGE_ALL) ? CATMANAGER_WINDOW_ALL : CATMANAGER_WINDOW_CAT,
                maxpage = GetCategoryManagerMaxPage(playerid, window),
                page
            ;

            if( sscanf(inputtext, "i", page) || (page-1) < MIN_CATMANAGER_PAGE || (page-1) > maxpage ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a valid page number!");
                ShowCategoryManagerDialog(playerid, dialogid);
                return 1;
            }

            SetCategoryManagerPage(playerid, window, page - 1);
            LoadCategoryManagerRowData(playerid, window);

            ApplyCategoryManagerPage(playerid, window);
            ApplyCategoryManagerRowData(playerid, window);
            return 1;
        }
        case DIALOGID_CATMANAGER_SEARCH_ALL, DIALOGID_CATMANAGER_SEARCH_CAT: {
            if( !response ) {
                return 1;
            }

            new bool:window = (dialogid == DIALOGID_CATMANAGER_SEARCH_ALL) ? CATMANAGER_WINDOW_ALL : CATMANAGER_WINDOW_CAT;

            SetCategoryManagerSearch(playerid, window, inputtext);
            SetCategoryManagerPage(playerid, window, MIN_CATMANAGER_PAGE);
            LoadCategoryManagerRowData(playerid, window);

            ApplyCategoryManagerSearch(playerid, window);
            ApplyCategoryManagerPage(playerid, window);
            ApplyCategoryManagerRowData(playerid, window);
            return 1;
        }
    }

    #if defined cm_OnDialogResponse
        return cm_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif
#define OnDialogResponse cm_OnDialogResponse
#if defined cm_OnDialogResponse
    forward cm_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif


public OnPlayerClickTextDraw(playerid, Text:clickedid) {
    if( clickedid == Text: INVALID_TEXT_DRAW ) {
        switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
            case TDMODE_CATMANAGER_MODELS, TDMODE_CATMANAGER_VEHICLES, TDMODE_CATMANAGER_SKINS, TDMODE_CATMANAGER_TEXTURES: {
                HidePlayerTextdrawMode(playerid);
            }
        }
    }
    if( clickedid == g_CatManagerGTD[CATMANAGER_GTD_CLOSE] ) {
        return HidePlayerTextdrawMode(playerid), 1;
    }
    if( clickedid == g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_CREATE] ) {
        return ShowCategoryManagerDialog(playerid, DIALOGID_CATMANAGER_CAT_CREATE), 1;
    }
    if(clickedid == g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_DESTROY]) {
        return ShowCategoryManagerDialog(playerid, DIALOGID_CATMANAGER_CAT_DESTROY), 1;
    }
    if(clickedid == g_CatManagerGTD[CATMANAGER_GTD_CATEGORY_RENAME]) {
        return ShowCategoryManagerDialog(playerid, DIALOGID_CATMANAGER_CAT_RENAME), 1;
    }
    if( clickedid == g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_ALL] || clickedid == g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_CAT] ) {
        new bool: window = ( clickedid == g_CatManagerGTD[CATMANAGER_GTD_PAGE_F_ALL] ) ? CATMANAGER_WINDOW_ALL : CATMANAGER_WINDOW_CAT;

        if( GetCategoryManagerPage(playerid, window) == MIN_CATMANAGER_PAGE ) {
            return 1;
        }

        SetCategoryManagerPage(playerid, window, MIN_CATMANAGER_PAGE);
        LoadCategoryManagerRowData(playerid, window);

        ApplyCategoryManagerPage(playerid, window);
        ApplyCategoryManagerRowData(playerid, window);
        return 1;
    }
    if( clickedid == g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_ALL] || clickedid == g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_CAT] ) {
        new
            bool: window = ( clickedid == g_CatManagerGTD[CATMANAGER_GTD_PAGE_P_ALL] ) ? CATMANAGER_WINDOW_ALL : CATMANAGER_WINDOW_CAT,
            page = GetCategoryManagerPage(playerid, window)
        ;

        if( page == MIN_CATMANAGER_PAGE ) {
            return 1;
        }

        if( -- page < MIN_CATMANAGER_PAGE ) {
            page = MIN_CATMANAGER_PAGE;
        }

        SetCategoryManagerPage(playerid, window, page);
        LoadCategoryManagerRowData(playerid, window);

        ApplyCategoryManagerPage(playerid, window);
        ApplyCategoryManagerRowData(playerid, window);
        return 1;
    }
    if( clickedid == g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_ALL] || clickedid == g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_CAT] ) {
        new
            bool: window = ( clickedid == g_CatManagerGTD[CATMANAGER_GTD_PAGE_N_ALL] ) ? CATMANAGER_WINDOW_ALL : CATMANAGER_WINDOW_CAT,
            page = GetCategoryManagerPage(playerid, window),
            maxpage = GetCategoryManagerMaxPage(playerid, window)
        ;

        if( page == maxpage ) {
            return 1;
        }

        if( ++ page > maxpage ) {
            page = maxpage;
        }

        SetCategoryManagerPage(playerid, window, page);
        LoadCategoryManagerRowData(playerid, window);

        ApplyCategoryManagerPage(playerid, window);
        ApplyCategoryManagerRowData(playerid, window);
        return 1;
    }
    if( clickedid == g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_ALL] || clickedid == g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_CAT] ) {
        new
            bool: window = ( clickedid == g_CatManagerGTD[CATMANAGER_GTD_PAGE_L_ALL] ) ? CATMANAGER_WINDOW_ALL : CATMANAGER_WINDOW_CAT,
            maxpage = GetCategoryManagerMaxPage(playerid, window)
        ;

        if( GetCategoryManagerPage(playerid, window) == maxpage ) {
            return 1;
        }

        SetCategoryManagerPage(playerid, window, maxpage);
        LoadCategoryManagerRowData(playerid, window);

        ApplyCategoryManagerPage(playerid, window);
        ApplyCategoryManagerRowData(playerid, window);
        return 1;
    }

    #if defined cm_OnPlayerClickTextDraw
        return cm_OnPlayerClickTextDraw(playerid, Text:clickedid);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerClickTextDraw
    #undef OnPlayerClickTextDraw
#else
    #define _ALS_OnPlayerClickTextDraw
#endif
#define OnPlayerClickTextDraw cm_OnPlayerClickTextDraw
#if defined cm_OnPlayerClickTextDraw
    forward cm_OnPlayerClickTextDraw(playerid, Text:clickedid);
#endif


public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid) {
    if( playertextid == g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_MODELS] ) {
        return ShowPlayerTextdrawMode(playerid, TDMODE_CATMANAGER_MODELS), 1;
    }
    if( playertextid == g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_VEHICLES] ) {
        return ShowPlayerTextdrawMode(playerid, TDMODE_CATMANAGER_VEHICLES), 1;
    }
    if( playertextid == g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_SKINS] ) {
        return ShowPlayerTextdrawMode(playerid, TDMODE_CATMANAGER_SKINS), 1;
    }
    if( playertextid == g_CatManagerPTD[playerid][CATMANAGER_PTD_TYPE_TEXTURES] ) {
        return ShowPlayerTextdrawMode(playerid, TDMODE_CATMANAGER_TEXTURES), 1;
    }
    if( playertextid == g_CatManagerPTD[playerid][CATMANAGER_PTD_CATEGORY_NAME] ) {
        DefaultCategorySelectData(playerid);
        LoadCategorySelectData(playerid);
        ShowCategorySelect(playerid);
        return 1;
    }
    if( playertextid == g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_ALL] ) {
        return ShowCategoryManagerDialog(playerid, DIALOGID_CATMANAGER_PAGE_ALL), 1;
    }
    if( playertextid == g_CatManagerPTD[playerid][CATMANAGER_PTD_PAGE_CAT] ) {
        return ShowCategoryManagerDialog(playerid, DIALOGID_CATMANAGER_PAGE_CAT), 1;
    }
    if( playertextid == g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_ALL] ) {
        return ShowCategoryManagerDialog(playerid, DIALOGID_CATMANAGER_SEARCH_ALL), 1;
    }
    if( playertextid == g_CatManagerPTD[playerid][CATMANAGER_PTD_SEARCH_CAT] ) {
        return ShowCategoryManagerDialog(playerid, DIALOGID_CATMANAGER_SEARCH_CAT), 1;
    }

    for(new row; row < MAX_CATMANAGER_ROWS; row ++) {
        if(
            playertextid == g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row] ||
            playertextid == g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row] ||
            playertextid == g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_ALL][row] ||
            playertextid == g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_CAT][row] ||
            playertextid == g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_CAT][row] ||
            playertextid == g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_CAT][row]
        ) {
            new bool: window;

            if(
                playertextid == g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_1_ALL][row] ||
                playertextid == g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_2_ALL][row] ||
                playertextid == g_CatManagerPTD[playerid][CATMANAGER_PTD_ROW_3_ALL][row]
            ) {
                window = CATMANAGER_WINDOW_ALL;
            } else {
                window = CATMANAGER_WINDOW_CAT;
            }

            new
                bool: prev_window = g_CatManagerData[playerid][CATMANAGER_DATA_SELECT_WINDOW],
                      prev_row = g_CatManagerData[playerid][CATMANAGER_DATA_SELECT_ROW],
                      row_id = GetCategoryManagerRowID(playerid, window, row),
                bool: ismodel
            ;

            // model or texture ?
            switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
                case TDMODE_CATMANAGER_MODELS, TDMODE_CATMANAGER_VEHICLES, TDMODE_CATMANAGER_SKINS: {
                    ismodel = true; // model
                }
                default: {
                    ismodel = false; // texture
                }
            }

            if( ismodel && row_id == INVALID_MODEL_ID ) {
                return 1; // invalid modelid
            }

            if( !ismodel && row_id == INVALID_TEXTURE_ID ) {
                return 1; // invalid textureid
            }

            if( prev_window != window || prev_row != row ) {
                // New row selected

                g_CatManagerData[playerid][CATMANAGER_DATA_SELECT_WINDOW] = window;
                g_CatManagerData[playerid][CATMANAGER_DATA_SELECT_ROW] = row;
                g_CatManagerData[playerid][CATMANAGER_DATA_SELECT_ID] = row_id;

                if( prev_row != INVALID_ROW ) {
                    ApplyCategoryManagerRowColor(playerid, prev_window, prev_row); // apply color to previous row (uncolor)
                }

                ApplyCategoryManagerRowColor(playerid, window, row); // apply color to new row

                if( ismodel ) {
                    DestroyTextureView(playerid);

                    g_ModelViewData[playerid][MODELVIEW_DATA_MODELID] = row_id;
                    if( g_ModelViewData[playerid][MODELVIEW_DATA_TOGGLE] ) {
                        ApplyModelViewModel(playerid, .showtd = true);
                    } else {
                        ShowModelView(playerid);
                    }
                } else {
                    HideModelView(playerid);

                    RefreshTextureView(playerid, .textureid = row_id);
                }
                return 1;
            }

            // Same row selected

            new categoryid = g_CatManagerData[playerid][CATMANAGER_DATA_CATEGORY];
            if( categoryid == INVALID_CATEGORY_ID ) {
                return 1;
            }

            new
                bool: create_bind = (window == CATMANAGER_WINDOW_ALL) ? true : false,
                bool: bind_success = false
            ;

            switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
                case TDMODE_CATMANAGER_MODELS: {
                    if( create_bind ) {
                        bind_success = ( CreateModelCategoryBind(categoryid, .modelid = row_id) ) ? true : false;
                    } else {
                        bind_success = ( DestroyModelCategoryBind(categoryid, .modelid = row_id) ) ? true : false;
                    }
                }
                case TDMODE_CATMANAGER_VEHICLES: {
                    if( create_bind ) {
                        bind_success = ( CreateVehicleCategoryBind(categoryid, .modelid = row_id) ) ? true : false;
                    } else {
                        bind_success = ( DestroyVehicleCategoryBind(categoryid, .modelid = row_id) ) ? true : false;
                    }
                }
                case TDMODE_CATMANAGER_SKINS: {
                    if( create_bind ) {
                        bind_success = ( CreateSkinCategoryBind(categoryid, .modelid = row_id) ) ? true : false;
                    } else {
                        bind_success = ( DestroySkinCategoryBind(categoryid, .modelid = row_id) ) ? true : false;
                    }
                }
                case TDMODE_CATMANAGER_TEXTURES: {
                    if( create_bind ) {
                        bind_success = ( CreateTextureCategoryBind(categoryid, .textureid = row_id) ) ? true : false;
                    } else {
                        bind_success = ( DestroyTextureCategoryBind(categoryid, .textureid = row_id) ) ? true : false;
                    }
                }
            }

            if( bind_success ) {
                LoadCategoryManagerRowData(playerid, CATMANAGER_WINDOW_CAT);
                ApplyCategoryManagerRowData(playerid, CATMANAGER_WINDOW_CAT);
            } else {
                format(g_ClientMessage, sizeof g_ClientMessage, "ERROR: This item could not be %s the category!", create_bind ? ("added to") : ("removed from"));
                SendClientMessage(playerid, RGBA_RED, g_ClientMessage);
            }

            return 1;
        }
    }

    #if defined cm_OnPlayerClickPlayerTD
        return cm_OnPlayerClickPlayerTD(playerid, PlayerText:playertextid);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerClickPlayerTD
    #undef OnPlayerClickPlayerTextDraw
#else
    #define _ALS_OnPlayerClickPlayerTD
#endif
#define OnPlayerClickPlayerTextDraw cm_OnPlayerClickPlayerTD
#if defined cm_OnPlayerClickPlayerTD
    forward cm_OnPlayerClickPlayerTD(playerid, PlayerText:playertextid);
#endif
