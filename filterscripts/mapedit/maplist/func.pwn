DefaultMapListData(playerid) {
    g_MapListData[playerid][MAPLIST_DATA_PAGE] = MIN_MAPLIST_PAGE;

    g_MapListData[playerid][MAPLIST_DATA_MAXPAGE] = MIN_MAPLIST_PAGE;

    strpack(g_MapListData[playerid][MAPLIST_DATA_SEARCH], "", MAX_SEARCH_LEN+1);

    for(new row; row < MAX_MAPLIST_ROWS; row ++) {
        g_MapListData[playerid][MAPLIST_DATA_ROW_ID][row] = INVALID_MAP_ID;
    }
}

LoadMapListData(playerid) {
    new rows_added, max_offset;

    strunpack(g_SearchString, g_MapListData[playerid][MAPLIST_DATA_SEARCH]);

    rows_added = FindMaps(
        .result = g_MapListData[playerid][MAPLIST_DATA_ROW_ID],
        .result_size = MAX_MAPLIST_ROWS,
        .search = g_SearchString,
        .offset = g_MapListData[playerid][MAPLIST_DATA_PAGE] * MAX_MAPLIST_ROWS,
        .max_offset = max_offset
    );

    for(new row = rows_added; row < MAX_MAPLIST_ROWS; row ++) {
        g_MapListData[playerid][MAPLIST_DATA_ROW_ID][row] = INVALID_MAP_ID;
    }

    g_MapListData[playerid][MAPLIST_DATA_MAXPAGE] = max_offset / MAX_MAPLIST_ROWS;
}

ShowMapListDialog(playerid, dialogid) {
    switch( dialogid ) {
        case DIALOGID_MAPLIST: {
            g_DialogCaption = "Map List";
            g_DialogInfo = "";

            for(new listitem; listitem < MAX_MAPLIST_LISTITEMS; listitem ++) {
                switch( listitem ) {
                    case MAPLIST_LISTITEM_ROW_F..MAPLIST_LISTITEM_ROW_L: {
                        new
                            row = listitem - MAPLIST_LISTITEM_ROW_F,
                            mapid = g_MapListData[playerid][MAPLIST_DATA_ROW_ID][row]
                        ;

                        if( mapid == INVALID_MAP_ID ) {
                            strcat(g_DialogInfo, "-\t-\n");
                        } else {
                            GetMapName(mapid, g_MapString, sizeof g_MapString);
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "%i\t%s\n", mapid, g_MapString);
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        }
                    }
                    case MAPLIST_LISTITEM_SEARCH: {
                        strunpack(g_SearchString, g_MapListData[playerid][MAPLIST_DATA_SEARCH]);
                        if( isempty(g_SearchString) ) {
                            strcat(g_DialogInfo, "Search\t \n");
                        } else {
                            format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Search: %s\t \n", g_SearchString);
                            strcat(g_DialogInfo, g_DialogInfoRow);
                        }

                    }
                    case MAPLIST_LISTITEM_PAGE: {
                        format(g_DialogInfoRow, sizeof g_DialogInfoRow, "Page: %i / %i\t \n", g_MapListData[playerid][MAPLIST_DATA_PAGE] + 1, g_MapListData[playerid][MAPLIST_DATA_MAXPAGE] + 1);
                        strcat(g_DialogInfo, g_DialogInfoRow);
                    }
                    case MAPLIST_LISTITEM_PAGE_F: {
                        strcat(g_DialogInfo, "<< First Page <<\t \n");
                    }
                    case MAPLIST_LISTITEM_PAGE_P: {
                        strcat(g_DialogInfo, "< Previous Page <\t \n");
                    }
                    case MAPLIST_LISTITEM_PAGE_N: {
                        strcat(g_DialogInfo, "> Next Page >\t \n");
                    }
                    case MAPLIST_LISTITEM_PAGE_L: {
                        strcat(g_DialogInfo, ">> Last Page >>\t \n");
                    }
                    default: {
                        strcat(g_DialogInfo, " \t \n");
                    }
                }
            }
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, g_DialogCaption, g_DialogInfo, "Load", "Cancel");
        }
        case DIALOGID_MAPLIST_PAGE: {
            g_DialogCaption = "Map List: Page";
            format(g_DialogInfo, sizeof g_DialogInfo, "Current Page: %i", g_MapListData[playerid][MAPLIST_DATA_PAGE] + 1);
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, g_DialogCaption, g_DialogInfo, "Enter", "Cancel");
        }
        case DIALOGID_MAPLIST_SEARCH: {
            g_DialogCaption = "Map List: Search";
            strunpack(g_SearchString, g_MapListData[playerid][MAPLIST_DATA_SEARCH]);
            if( isempty(g_SearchString) ) {
                g_DialogInfo = "You are not searching for anything.";
            } else {
                format(g_DialogInfo, sizeof g_DialogInfo, "Searching for: %s", g_SearchString);
            }
            ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, g_DialogCaption, g_DialogInfo, "Enter", "Cancel");
        }
        default: {
            return 0;
        }
    }
    return 1;
}
