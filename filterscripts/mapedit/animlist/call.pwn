public OnFilterScriptInit() {
    CreateGenericAnimationList();

    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            DefaultAnimationListData(playerid);
        }
    }

    #if defined al_OnFilterScriptInit
        al_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit al_OnFilterScriptInit
#if defined al_OnFilterScriptInit
    forward al_OnFilterScriptInit();
#endif


public OnFilterScriptExit() {
    DestroyGenericAnimationList();

    #if defined al_OnFilterScriptExit
        al_OnFilterScriptExit();
    #endif
}
#if defined _ALS_OnFilterScriptExit
    #undef OnFilterScriptExit
#else
    #define _ALS_OnFilterScriptExit
#endif
#define OnFilterScriptExit al_OnFilterScriptExit
#if defined al_OnFilterScriptExit
    forward al_OnFilterScriptExit();
#endif


public OnPlayerConnect(playerid) {
    DefaultAnimationListData(playerid);

    #if defined al_OnPlayerConnect
        return al_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect al_OnPlayerConnect
#if defined al_OnPlayerConnect
    forward al_OnPlayerConnect(playerid);
#endif


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    switch(dialogid) {
        case DIALOGID_ANIMLIST_PAGE: {
            if( !response ) {
                return 1;
            }

            new page;

            if( sscanf(inputtext, "i", page) ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a valid page number!");
                ShowAnimationListDialog(playerid, dialogid);
                return 1;
            }

            page --;

            if( page < MIN_ANIMLIST_PAGE || page > g_AnimListData[playerid][ANIMLIST_DATA_MAXPAGE] ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a valid page number!");
                ShowAnimationListDialog(playerid, dialogid);
                return 1;
            }

            g_AnimListData[playerid][ANIMLIST_DATA_PAGE] = page;
            LoadAnimationListRowData(playerid);

            ApplyAnimationListPage(playerid);
            ApplyAnimationListRowData(playerid);
            return 1;
        }
        case DIALOGID_ANIMLIST_SEARCH: {
            if( !response ) {
                return 1;
            }

            g_AnimListData[playerid][ANIMLIST_DATA_PAGE] = MIN_ANIMLIST_PAGE;
            strpack(g_AnimListData[playerid][ANIMLIST_DATA_SEARCH], inputtext, MAX_SEARCH_LEN+1);
            LoadAnimationListRowData(playerid);

            ApplyAnimationListPage(playerid);
            ApplyAnimationListSearch(playerid);
            ApplyAnimationListRowData(playerid);
            return 1;
        }
    }

    #if defined al_OnDialogResponse
        return al_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif
#define OnDialogResponse al_OnDialogResponse
#if defined al_OnDialogResponse
    forward al_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif


public OnPlayerClickTextDraw(playerid, Text:clickedid) {
    if( g_PlayerData[playerid][PLAYER_DATA_TDMODE] == TDMODE_ANIMLIST && clickedid == Text: INVALID_TEXT_DRAW ) {
        HidePlayerTextdrawMode(playerid);
	}

    if( clickedid == g_AnimListGTD[ANIMLIST_GTD_CLOSE] ) {
		ShowActorDialog(playerid, DIALOGID_ACTOR_MAIN);
        return HidePlayerTextdrawMode(playerid), 1;
    }

    if( clickedid == g_AnimListGTD[ANIMLIST_GTD_PAGE_F] ) {
        if( g_AnimListData[playerid][ANIMLIST_DATA_PAGE] == MIN_ANIMLIST_PAGE ) {
            return 1;
        }

        g_AnimListData[playerid][ANIMLIST_DATA_PAGE] = MIN_ANIMLIST_PAGE;
        LoadAnimationListRowData(playerid);

        ApplyAnimationListPage(playerid);
        ApplyAnimationListRowData(playerid);
        return 1;
    }
    if( clickedid == g_AnimListGTD[ANIMLIST_GTD_PAGE_P] ) {
        if( g_AnimListData[playerid][ANIMLIST_DATA_PAGE] == MIN_ANIMLIST_PAGE ) {
            return 1;
        }

        if( -- g_AnimListData[playerid][ANIMLIST_DATA_PAGE] < MIN_ANIMLIST_PAGE ) {
            g_AnimListData[playerid][ANIMLIST_DATA_PAGE] = MIN_ANIMLIST_PAGE;
        }
        LoadAnimationListRowData(playerid);

        ApplyAnimationListPage(playerid);
        ApplyAnimationListRowData(playerid);
        return 1;
    }
    if( clickedid == g_AnimListGTD[ANIMLIST_GTD_PAGE_N] ) {
        if( g_AnimListData[playerid][ANIMLIST_DATA_PAGE] == g_AnimListData[playerid][ANIMLIST_DATA_MAXPAGE] ) {
            return 1;
        }

        if( ++ g_AnimListData[playerid][ANIMLIST_DATA_PAGE] > g_AnimListData[playerid][ANIMLIST_DATA_MAXPAGE] ) {
            g_AnimListData[playerid][ANIMLIST_DATA_PAGE] = g_AnimListData[playerid][ANIMLIST_DATA_MAXPAGE];
        }
        LoadAnimationListRowData(playerid);

        ApplyAnimationListPage(playerid);
        ApplyAnimationListRowData(playerid);
        return 1;
    }
    if( clickedid == g_AnimListGTD[ANIMLIST_GTD_PAGE_L] ) {
        if( g_AnimListData[playerid][ANIMLIST_DATA_PAGE] == g_AnimListData[playerid][ANIMLIST_DATA_MAXPAGE] ) {
            return 1;
        }

        g_AnimListData[playerid][ANIMLIST_DATA_PAGE] = g_AnimListData[playerid][ANIMLIST_DATA_MAXPAGE];
        LoadAnimationListRowData(playerid);

        ApplyAnimationListPage(playerid);
        ApplyAnimationListRowData(playerid);
        return 1;
    }

    #if defined al_OnPlayerClickTextDraw
        return al_OnPlayerClickTextDraw(playerid, Text:clickedid);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerClickTextDraw
    #undef OnPlayerClickTextDraw
#else
    #define _ALS_OnPlayerClickTextDraw
#endif
#define OnPlayerClickTextDraw al_OnPlayerClickTextDraw
#if defined al_OnPlayerClickTextDraw
    forward al_OnPlayerClickTextDraw(playerid, Text:clickedid);
#endif


public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid) {
    if( playertextid == g_AnimListPTD[playerid][ANIMLIST_PTD_PAGE] ) {
        return ShowAnimationListDialog(playerid, DIALOGID_ANIMLIST_PAGE), 1;
    }
    if( playertextid == g_AnimListPTD[playerid][ANIMLIST_PTD_SEARCH] ) {
        return ShowAnimationListDialog(playerid, DIALOGID_ANIMLIST_SEARCH), 1;
    }
    for(new row; row < MAX_SELECTLIST_ROWS; row ++) {
        if(
            playertextid == g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_INDEX][row] ||
            playertextid == g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_LIBRARY][row] ||
            playertextid == g_AnimListPTD[playerid][ANIMLIST_PTD_ROW_NAME][row]
        ) {
            new row_anim_idx = g_AnimListData[playerid][ANIMLIST_DATA_ROW_INDEX][row];
            if( row_anim_idx == INVALID_ANIM_INDEX ) {
                return 1;
            }

            new actorid = GetPlayerEditActor(playerid);
            if( !IsValidActor(actorid) ) {
                return 1;
            }

            if( g_ActorData[actorid][ACTOR_DATA_ANIM_INDEX] == INVALID_ANIM_INDEX ) {
                DefaultActorAnimationData(actorid);
            }

            g_ActorData[actorid][ACTOR_DATA_ANIM_INDEX] = row_anim_idx;
            ApplyActorAnimationData(actorid);

            new prev_row = g_AnimListData[playerid][ANIMLIST_DATA_COLORED_ROW];
            if( row != prev_row ) {
                g_AnimListData[playerid][ANIMLIST_DATA_COLORED_ROW] = row;

                if( prev_row != INVALID_ROW ) {
                    ApplyAnimationListRowColor(playerid, prev_row); // Unapply color on previous row
                }

                ApplyAnimationListRowColor(playerid, row); // Apply color on new row
            }
            return 1;
        }
    }

    #if defined al_OnPlayerClickPlayerTD
        return al_OnPlayerClickPlayerTD(playerid, PlayerText:playertextid);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerClickPlayerTD
    #undef OnPlayerClickPlayerTextDraw
#else
    #define _ALS_OnPlayerClickPlayerTD
#endif
#define OnPlayerClickPlayerTextDraw al_OnPlayerClickPlayerTD
#if defined al_OnPlayerClickPlayerTD
    forward al_OnPlayerClickPlayerTD(playerid, PlayerText:playertextid);
#endif
