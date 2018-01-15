DefaultCategorySelectData(playerid) {
    g_CategorySelectData[playerid][CATEGORYSELECT_PAGE] = MIN_CATEGORYSELECT_PAGE;

    g_CategorySelectData[playerid][CATEGORYSELECT_MAXPAGE] = MIN_CATEGORYSELECT_PAGE;

    strpack(g_CategorySelectData[playerid][CATEGORYSELECT_SEARCH], "");

    for(new row; row < MAX_CATEGORYSELECT_ROWS; row ++) {
        g_CategorySelectData[playerid][CATEGORYSELECT_ROW_ID][row] = INVALID_CATEGORY_ID;
    }
}

LoadCategorySelectData(playerid) {
    new rows_added, max_offset;

    strunpack(g_SearchString, g_CategorySelectData[playerid][CATEGORYSELECT_SEARCH]);

    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_CREATELIST_OBJECT, TDMODE_CREATELIST_PICKUP, TDMODE_CREATELIST_ATTACH, TDMODE_CATMANAGER_MODELS: {
            rows_added = FindModelCategories(
                .result = g_CategorySelectData[playerid][CATEGORYSELECT_ROW_ID],
                .result_size = MAX_CATEGORYSELECT_ROWS,
                .search = g_SearchString,
                .offset = g_CategorySelectData[playerid][CATEGORYSELECT_PAGE] * MAX_CATEGORYSELECT_ROWS,
                .max_offset = max_offset
            );
        }
        case TDMODE_CREATELIST_VEHICLE, TDMODE_CATMANAGER_VEHICLES: {
            rows_added = FindVehicleCategories(
                .result = g_CategorySelectData[playerid][CATEGORYSELECT_ROW_ID],
                .result_size = MAX_CATEGORYSELECT_ROWS,
                .search = g_SearchString,
                .offset = g_CategorySelectData[playerid][CATEGORYSELECT_PAGE] * MAX_CATEGORYSELECT_ROWS,
                .max_offset = max_offset
            );
        }
        case TDMODE_CREATELIST_ACTOR, TDMODE_CATMANAGER_SKINS: {
            rows_added = FindSkinCategories(
                .result = g_CategorySelectData[playerid][CATEGORYSELECT_ROW_ID],
                .result_size = MAX_CATEGORYSELECT_ROWS,
                .search = g_SearchString,
                .offset = g_CategorySelectData[playerid][CATEGORYSELECT_PAGE] * MAX_CATEGORYSELECT_ROWS,
                .max_offset = max_offset
            );
        }
        case TDMODE_TEXTURELIST, TDMODE_CATMANAGER_TEXTURES: {
            rows_added = FindTextureCategories(
                .result = g_CategorySelectData[playerid][CATEGORYSELECT_ROW_ID],
                .result_size = MAX_CATEGORYSELECT_ROWS,
                .search = g_SearchString,
                .offset = g_CategorySelectData[playerid][CATEGORYSELECT_PAGE] * MAX_CATEGORYSELECT_ROWS,
                .max_offset = max_offset
            );
        }
        default: {
            return 0;
        }
    }

    for(new row = rows_added; row < MAX_CATEGORYSELECT_ROWS; row ++) {
        g_CategorySelectData[playerid][CATEGORYSELECT_ROW_ID][row] = INVALID_CATEGORY_ID;
    }

    g_CategorySelectData[playerid][CATEGORYSELECT_MAXPAGE] = max_offset / MAX_CATEGORYSELECT_ROWS;
    return 1;
}

ShowCategorySelect(playerid) {
    g_DialogCaption = "Category Select";

    g_DialogInfo = "Category ID\tCategory Name\n";

    for(new listitem; listitem < MAX_CATEGORYSELECT_LITEMS; listitem ++) {
        switch(listitem) {
            case LITEM_CATEGORYSELECT_ROW_F..LITEM_CATEGORYSELECT_ROW_L: {
                new
                    row = listitem - LITEM_CATEGORYSELECT_ROW_F,
                    categoryid = INVALID_CATEGORY_ID
                ;

                categoryid = g_CategorySelectData[playerid][CATEGORYSELECT_ROW_ID][row];

                switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
                    case TDMODE_CREATELIST_OBJECT, TDMODE_CREATELIST_PICKUP, TDMODE_CREATELIST_ATTACH, TDMODE_CATMANAGER_MODELS: {
                        GetModelCategoryName(categoryid, g_CategoryNameString, sizeof g_CategoryNameString);
                    }
                    case TDMODE_CREATELIST_VEHICLE, TDMODE_CATMANAGER_VEHICLES: {
                        GetVehicleCategoryName(categoryid, g_CategoryNameString, sizeof g_CategoryNameString);
                    }
                    case TDMODE_CREATELIST_ACTOR, TDMODE_CATMANAGER_SKINS: {
                        GetSkinCategoryName(categoryid, g_CategoryNameString, sizeof g_CategoryNameString);
                    }
                    case TDMODE_TEXTURELIST, TDMODE_CATMANAGER_TEXTURES: {
                        GetTextureCategoryName(categoryid, g_CategoryNameString, sizeof g_CategoryNameString);
                    }
                    default: {
                        return 1;
                    }
                }

                if( categoryid == INVALID_CATEGORY_ID ) {
                    strcat(g_DialogInfo, "-\t-\n");
                } else {
                    format(g_DialogInfoRow, sizeof g_DialogInfoRow, "%i\t%s\n", categoryid, g_CategoryNameString);
                    strcat(g_DialogInfo, g_DialogInfoRow);
                }
            }
            case LITEM_CATEGORYSELECT_PAGE: {
                format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Page: %i / %i\n", g_CategorySelectData[playerid][CATEGORYSELECT_PAGE] + 1, g_CategorySelectData[playerid][CATEGORYSELECT_MAXPAGE] + 1);
                strcat(g_DialogInfo, g_DialogInfoRow);
            }
            case LITEM_CATEGORYSELECT_PAGE_F: {
                strcat(g_DialogInfo, "<< First Page <<\t \n");
            }
            case LITEM_CATEGORYSELECT_PAGE_P: {
                strcat(g_DialogInfo, "< Previous Page <\t \n");
            }
            case LITEM_CATEGORYSELECT_PAGE_N: {
                strcat(g_DialogInfo, "> Next Page >\t \n");
            }
            case LITEM_CATEGORYSELECT_PAGE_L: {
                strcat(g_DialogInfo, ">> Last Page >>\t \n");
            }
            case LITEM_CATEGORYSELECT_SEARCH: {
                strunpack(g_SearchString, g_CategorySelectData[playerid][CATEGORYSELECT_SEARCH]);
                if( isempty(g_SearchString) ) {
                    strcat(g_DialogInfo, "Search\n");
                } else {
                    format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Search: %s\n", g_SearchString);
                    strcat(g_DialogInfo, g_DialogInfoRow);
                }
            }
            default: {
                strcat(g_DialogInfo, " \t \n");
            }
        }
    }

    ShowPlayerDialog(playerid, DIALOGID_CATEGORYSELECT, DIALOG_STYLE_TABLIST_HEADERS, g_DialogCaption, g_DialogInfo, "Select", "Cancel");
    return 1;
}

ShowCategorySelectDialog(playerid, dialogid) {
    switch( dialogid ) {
        case DIALOGID_CATEGORYSELECT: {
            ShowCategorySelect(playerid);
        }
        case DIALOGID_CATEGORYSELECT_PAGE: {
            format(g_DialogInfo, sizeof g_DialogInfo, "Current Page: %i / %i", g_CategorySelectData[playerid][CATEGORYSELECT_PAGE] + 1, g_CategorySelectData[playerid][CATEGORYSELECT_MAXPAGE] + 1);
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Category Select: Page", g_DialogInfo, "Enter", "Cancel");
        }
        case DIALOGID_CATEGORYSELECT_SEARCH: {
            strunpack(g_SearchString, g_CategorySelectData[playerid][CATEGORYSELECT_SEARCH]);
            if( isempty(g_SearchString) ) {
                g_DialogInfo = "You are not searching for anything.";
            } else {
                format(g_DialogInfo, sizeof g_DialogInfo, "Current Search: %s", g_SearchString);
            }
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Category Select: Search", g_DialogInfo, "Enter", "Cancel");
        }
        default: {
            return 0;
        }
    }
    return 1;
}
