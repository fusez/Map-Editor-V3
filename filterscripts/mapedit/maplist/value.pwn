#define MAX_MAPLIST_ROWS \
    20

#define MIN_MAPLIST_PAGE \
    0

enum {
    MAPLIST_LISTITEM_ROW_F,                                                   // first row
    MAPLIST_LISTITEM_ROW_L = (MAPLIST_LISTITEM_ROW_F + MAX_MAPLIST_ROWS) - 1, // last row
    MAPLIST_LISTITEM_SPACE,                                                   // empty
    MAPLIST_LISTITEM_SEARCH,                                                  // search
    MAPLIST_LISTITEM_PAGE,                                                    // current page
    MAPLIST_LISTITEM_PAGE_F,                                                  // first page
    MAPLIST_LISTITEM_PAGE_P,                                                  // previous page
    MAPLIST_LISTITEM_PAGE_N,                                                  // next page
    MAPLIST_LISTITEM_PAGE_L,                                                  // last page
    MAX_MAPLIST_LISTITEMS
}
