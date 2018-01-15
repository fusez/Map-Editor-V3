enum MAPLIST_DATA {
    MAPLIST_DATA_PAGE,                          // page
    MAPLIST_DATA_MAXPAGE,                       // max page / last page
    MAPLIST_DATA_SEARCH[MAX_SEARCH_LEN+1 char], // search for
    MAPLIST_DATA_ROW_ID[MAX_MAPLIST_ROWS]       // map id's

}

new g_MapListData[MAX_PLAYERS][MAPLIST_DATA];
