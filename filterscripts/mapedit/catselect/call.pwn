public OnFilterScriptInit() {
    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            DefaultCategorySelectData(playerid);
        }
    }

    #if defined cs_OnFilterScriptInit
        cs_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit cs_OnFilterScriptInit
#if defined cs_OnFilterScriptInit
    forward cs_OnFilterScriptInit();
#endif


public OnPlayerConnect(playerid) {
    DefaultCategorySelectData(playerid);

    #if defined cs_OnPlayerConnect
        return cs_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect cs_OnPlayerConnect
#if defined cs_OnPlayerConnect
    forward cs_OnPlayerConnect(playerid);
#endif


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    switch(dialogid) {
        case DIALOGID_CATEGORYSELECT: {
            if( !response ) {
                return 1;
            }

            switch(listitem) {
                case LITEM_CATEGORYSELECT_ROW_F..LITEM_CATEGORYSELECT_ROW_L: {
                    new
                        row = listitem - LITEM_CATEGORYSELECT_ROW_F,
                        categoryid = g_CategorySelectData[playerid][CATEGORYSELECT_ROW_ID][row]
                    ;

                    if( categoryid == INVALID_CATEGORY_ID ) {
                        return ShowCategorySelect(playerid), 1;
                    }

                    new bool:isvalid_category;

                    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
                        case TDMODE_CREATELIST_OBJECT, TDMODE_CREATELIST_PICKUP, TDMODE_CREATELIST_ATTACH, TDMODE_CATMANAGER_MODELS: {
                            isvalid_category = IsModelCategoryIDCreated(categoryid) ? true : false;
                        }
                        case TDMODE_CREATELIST_VEHICLE, TDMODE_CATMANAGER_VEHICLES: {
                            isvalid_category = IsVehicleCategoryIDCreated(categoryid) ? true : false;
                        }
                        case TDMODE_CREATELIST_ACTOR, TDMODE_CATMANAGER_SKINS: {
                            isvalid_category = IsSkinCategoryIDCreated(categoryid) ? true : false;
                        }
                        case TDMODE_TEXTURELIST, TDMODE_CATMANAGER_TEXTURES: {
                            isvalid_category = IsTextureCategoryIDCreated(categoryid) ? true : false;
                        }
                    }

                    if( !isvalid_category ) {
                        LoadCategorySelectData(playerid);
                        ShowCategorySelect(playerid);
                        return 1;
                    }

                    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
                        case TDMODE_CREATELIST_OBJECT, TDMODE_CREATELIST_VEHICLE, TDMODE_CREATELIST_PICKUP, TDMODE_CREATELIST_ACTOR, TDMODE_CREATELIST_ATTACH: {
                            SetCreateListPage(playerid, MIN_CREATELIST_PAGE);
                            SetCreateListCategory(playerid, categoryid);
                            LoadCreateListRowData(playerid);

                            ApplyCreateListPage(playerid);
                            ApplyCreateListCategory(playerid);
                            ApplyCreateListRowData(playerid);
                            return 1;
                        }
                        case TDMODE_CATMANAGER_MODELS, TDMODE_CATMANAGER_VEHICLES, TDMODE_CATMANAGER_SKINS, TDMODE_CATMANAGER_TEXTURES: {
                            SetCategoryManagerPage(playerid, CATMANAGER_WINDOW_CAT, MIN_CATMANAGER_PAGE);
                            g_CatManagerData[playerid][CATMANAGER_DATA_CATEGORY] = categoryid;
                            LoadCategoryManagerRowData(playerid, CATMANAGER_WINDOW_CAT);

                            ApplyCategoryManagerPage(playerid, CATMANAGER_WINDOW_CAT);
                            ApplyCategoryManagerCatName(playerid);
                            ApplyCategoryManagerRowData(playerid, CATMANAGER_WINDOW_CAT);
                            return 1;
                        }
                        case TDMODE_TEXTURELIST: {
                            g_TextureListData[playerid][TEXTURELIST_DATA_PAGE] = MIN_TEXTURELIST_PAGE;
                            g_TextureListData[playerid][TEXTURELIST_DATA_CATEGORY] = categoryid;
                            LoadTextureListRowData(playerid);

                            ApplyTextureListPage(playerid);
                            ApplyTextureListCategory(playerid);
                            ApplyTextureListRowData(playerid);
                            return 1;
                        }
                    }
                }
                case LITEM_CATEGORYSELECT_PAGE: {
                    return ShowCategorySelectDialog(playerid, DIALOGID_CATEGORYSELECT_PAGE), 1;
                }
                case LITEM_CATEGORYSELECT_PAGE_F: {
                    g_CategorySelectData[playerid][CATEGORYSELECT_PAGE] = MIN_CATEGORYSELECT_PAGE;
                    LoadCategorySelectData(playerid);
                }
                case LITEM_CATEGORYSELECT_PAGE_P: {
                    if( -- g_CategorySelectData[playerid][CATEGORYSELECT_PAGE] < MIN_CATEGORYSELECT_PAGE ) {
                        g_CategorySelectData[playerid][CATEGORYSELECT_PAGE] = MIN_CATEGORYSELECT_PAGE;
                    }
                    LoadCategorySelectData(playerid);
                }
                case LITEM_CATEGORYSELECT_PAGE_N: {
                    if( ++ g_CategorySelectData[playerid][CATEGORYSELECT_PAGE] > g_CategorySelectData[playerid][CATEGORYSELECT_MAXPAGE] ) {
                        g_CategorySelectData[playerid][CATEGORYSELECT_PAGE] = g_CategorySelectData[playerid][CATEGORYSELECT_MAXPAGE];
                    }
                    LoadCategorySelectData(playerid);
                }
                case LITEM_CATEGORYSELECT_PAGE_L: {
                    g_CategorySelectData[playerid][CATEGORYSELECT_PAGE] = g_CategorySelectData[playerid][CATEGORYSELECT_MAXPAGE];
                    LoadCategorySelectData(playerid);
                }

                case LITEM_CATEGORYSELECT_SEARCH: {
                    return ShowCategorySelectDialog(playerid, DIALOGID_CATEGORYSELECT_SEARCH), 1;
                }
            }
            ShowCategorySelect(playerid);
            return 1;
        }
        case DIALOGID_CATEGORYSELECT_PAGE: {
            if( !response ) {
                return ShowCategorySelect(playerid), 1;
            }

            new page;

            if( sscanf(inputtext, "i", page) ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a valid page number!");
                ShowCategorySelectDialog(playerid, dialogid);
                return 1;
            }

            page --;

            if( page < MIN_CATEGORYSELECT_PAGE || page > g_CategorySelectData[playerid][CATEGORYSELECT_MAXPAGE] ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a valid page number!");
                ShowCategorySelectDialog(playerid, dialogid);
                return 1;
            }

            g_CategorySelectData[playerid][CATEGORYSELECT_PAGE] = page;
            LoadCategorySelectData(playerid);
            ShowCategorySelect(playerid);
            return 1;
        }
        case DIALOGID_CATEGORYSELECT_SEARCH: {
            if( response ) {
                strpack(g_CategorySelectData[playerid][CATEGORYSELECT_SEARCH], inputtext, MAX_SEARCH_LEN+1);
                g_CategorySelectData[playerid][CATEGORYSELECT_PAGE] = MIN_CATEGORYSELECT_PAGE;
                LoadCategorySelectData(playerid);
            }
            ShowCategorySelect(playerid);
            return 1;
        }
    }

    #if defined cs_OnDialogResponse
        return cs_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif
#define OnDialogResponse cs_OnDialogResponse
#if defined cs_OnDialogResponse
    forward cs_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif
