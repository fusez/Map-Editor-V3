public OnFilterScriptInit() {
    CreateGenericColorList();

    for(new playerid, max_playerid = GetPlayerPoolSize(); playerid <= max_playerid; playerid ++) {
        if( IsPlayerConnected(playerid) ) {
            DefaultColorListData(playerid);
        }
    }


    #if defined color_OnFilterScriptInit
        color_OnFilterScriptInit();
    #endif
}
#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit color_OnFilterScriptInit
#if defined color_OnFilterScriptInit
    forward color_OnFilterScriptInit();
#endif


public OnFilterScriptExit() {
    DestroyGenericColorList();

    #if defined color_OnFilterScriptExit
        color_OnFilterScriptExit();
    #endif
}
#if defined _ALS_OnFilterScriptExit
    #undef OnFilterScriptExit
#else
    #define _ALS_OnFilterScriptExit
#endif
#define OnFilterScriptExit color_OnFilterScriptExit
#if defined color_OnFilterScriptExit
    forward color_OnFilterScriptExit();
#endif


public OnPlayerConnect(playerid) {
    DefaultColorListData(playerid);

    #if defined color_OnPlayerConnect
        return color_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect color_OnPlayerConnect
#if defined color_OnPlayerConnect
    forward color_OnPlayerConnect(playerid);
#endif


public OnPlayerClickTextDraw(playerid, Text:clickedid) {
    if( clickedid == Text: INVALID_TEXT_DRAW ) {
        switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
            case TDMODE_COLORLIST_TEXTURE, TDMODE_COLORLIST_FONTFACE, TDMODE_COLORLIST_FONTBACK, TDMODE_COLORLIST_ATTACH_1, TDMODE_COLORLIST_ATTACH_2, TDMODE_COLORLIST_VEHICLE_1, TDMODE_COLORLIST_VEHICLE_2: {
                HidePlayerTextdrawMode(playerid);
            }
        }
    }

    if( clickedid == g_ColorListGTD[COLORLIST_GTD_CLOSE] ) {
        switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
            case TDMODE_COLORLIST_TEXTURE, TDMODE_COLORLIST_FONTFACE, TDMODE_COLORLIST_FONTBACK: {
                ShowObjectDialog(playerid, DIALOGID_OBJECT_INDEX);
            }
            case TDMODE_COLORLIST_ATTACH_1, TDMODE_COLORLIST_ATTACH_2: {
                ShowAttachedDialog(playerid, DIALOGID_ATTACH_MAIN);
            }
            case TDMODE_COLORLIST_VEHICLE_1, TDMODE_COLORLIST_VEHICLE_2: {
                ShowVehicleDialog(playerid, DIALOGID_VEHICLE_MAIN);
            }
        }
        HidePlayerTextdrawMode(playerid);
        return 1;
    }

    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_COLORLIST_TEXTURE, TDMODE_COLORLIST_FONTFACE, TDMODE_COLORLIST_FONTBACK, TDMODE_COLORLIST_ATTACH_1, TDMODE_COLORLIST_ATTACH_2, TDMODE_COLORLIST_VEHICLE_1, TDMODE_COLORLIST_VEHICLE_2: {
            if( clickedid == Text: INVALID_TEXT_DRAW ) {
                HidePlayerTextdrawMode(playerid);
            } else if( clickedid == g_ColorListGTD[COLORLIST_GTD_CLOSE] ) {
                switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
                    case TDMODE_COLORLIST_TEXTURE, TDMODE_COLORLIST_FONTFACE, TDMODE_COLORLIST_FONTBACK: {
                        ShowObjectDialog(playerid, DIALOGID_OBJECT_INDEX);
                    }
                    case TDMODE_COLORLIST_ATTACH_1, TDMODE_COLORLIST_ATTACH_2: {
                        ShowAttachedDialog(playerid, DIALOGID_ATTACH_MAIN);
                    }
                    case TDMODE_COLORLIST_VEHICLE_1, TDMODE_COLORLIST_VEHICLE_2: {
                        ShowVehicleDialog(playerid, DIALOGID_VEHICLE_MAIN);
                    }
                }
                return HidePlayerTextdrawMode(playerid), 1;
            }
        }
    }

    if( clickedid == g_ColorListGTD[COLORLIST_GTD_PAGE_F] ) {
        if( GetColorListPage(playerid) == MIN_COLORLIST_PAGE ) {
            return 1;
        }

        SetColorListPage(playerid, MIN_COLORLIST_PAGE);
        LoadColorListRowData(playerid);

        ApplyColorListPage(playerid);
        ApplyColorListRowData(playerid);
        return 1;
    }
    if( clickedid == g_ColorListGTD[COLORLIST_GTD_PAGE_P] ) {
        new page = GetColorListPage(playerid);
        if( page == MIN_COLORLIST_PAGE ) {
            return 1;
        }

        if( -- page < MIN_COLORLIST_PAGE ) {
            page = MIN_COLORLIST_PAGE;
        }

        SetColorListPage(playerid, page);
        LoadColorListRowData(playerid);

        ApplyColorListPage(playerid);
        ApplyColorListRowData(playerid);
        return 1;
    }
    if( clickedid == g_ColorListGTD[COLORLIST_GTD_PAGE_N] ) {
        new
            page = GetColorListPage(playerid),
            maxpage = GetColorListMaxPage(playerid)
        ;

        if( page == maxpage ) {
            return 1;
        }

        if( ++ page > maxpage ) {
            page = maxpage;
        }

        SetColorListPage(playerid, page);
        LoadColorListRowData(playerid);

        ApplyColorListPage(playerid);
        ApplyColorListRowData(playerid);
        return 1;
    }
    if( clickedid == g_ColorListGTD[COLORLIST_GTD_PAGE_L] ) {
        new maxpage = GetColorListMaxPage(playerid);

        if( GetColorListPage(playerid) == maxpage ) {
            return 1;
        }

        SetColorListPage(playerid, maxpage);
        LoadColorListRowData(playerid);

        ApplyColorListPage(playerid);
        ApplyColorListRowData(playerid);
        return 1;
    }

    #if defined color_OnPlayerClickTextDraw
        return color_OnPlayerClickTextDraw(playerid, Text:clickedid);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerClickTextDraw
    #undef OnPlayerClickTextDraw
#else
    #define _ALS_OnPlayerClickTextDraw
#endif
#define OnPlayerClickTextDraw color_OnPlayerClickTextDraw
#if defined color_OnPlayerClickTextDraw
    forward color_OnPlayerClickTextDraw(playerid, Text:clickedid);
#endif


public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid) {
    if( playertextid == g_ColorListPTD[playerid][COLORLIST_PTD_PAGE] ) {
        return ShowColorListDialog(playerid, DIALOGID_COLORLIST_PAGE), 1;
    }
    if( playertextid == g_ColorListPTD[playerid][COLORLIST_PTD_SEARCH] ) {
        return ShowColorListDialog(playerid, DIALOGID_COLORLIST_SEARCH), 1;
    }
    for(new row; row < MAX_COLORLIST_ROWS; row ++) {
        if( playertextid == g_ColorListPTD[playerid][COLORLIST_PTD_ROW_1][row] || playertextid == g_ColorListPTD[playerid][COLORLIST_PTD_ROW_2][row] ) {
            new row_colorid = GetColorListRowColorID(playerid, row);

            if( row_colorid == INVALID_COLOR_ID ) {
                return 1;
            }

            switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
                case TDMODE_COLORLIST_TEXTURE: {
                    new objectid = GetPlayerEditObject(playerid);
                    if( !IsValidObject(objectid) ) {
                        return 1;
                    }

                    new
                        materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX],
                        color_rgb = GetModelColorRGB(row_colorid),
                        color_argb = RGBtoARGB(color_rgb, 0xFF)
                    ;

                    if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] != MATERIALINDEX_TYPE_TEXTURE ) {
                        g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] = MATERIALINDEX_TYPE_TEXTURE;
                        DefaultObjectMaterialIndexData(objectid, materialindex);
                    }

                    g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex] = color_argb;

                    if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_MODCOUNT] >= MAX_MATERIALINDEX_MODCOUNT ) {
                        new new_objectid = RecreateObject(objectid);
                        if( new_objectid == INVALID_OBJECT_ID ) {
                            SendClientMessage(playerid, RGBA_RED, "ERROR: This object could not be colored / re-created!");
                        }
                    } else {
                        ApplyObjectMaterialIndexData(objectid, materialindex);
                    }
                }
                case TDMODE_COLORLIST_FONTFACE: {
                    new objectid = GetPlayerEditObject(playerid);
                    if( !IsValidObject(objectid) ) {
                        return 1;
                    }

                    new
                        materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX],
                        color_rgb = GetModelColorRGB(row_colorid),
                        color_argb = RGBtoARGB(color_rgb, 0xFF)
                    ;

                    if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] != MATERIALINDEX_TYPE_TEXT ) {
                        g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] = MATERIALINDEX_TYPE_TEXT;
                        DefaultObjectMaterialIndexData(objectid, materialindex);
                    }

                    g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_FONTCOLOR][materialindex] = color_argb;

                    if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_MODCOUNT] >= MAX_MATERIALINDEX_MODCOUNT ) {
                        new new_objectid = RecreateObject(objectid);
                        if( new_objectid == INVALID_OBJECT_ID ) {
                            SendClientMessage(playerid, RGBA_RED, "ERROR: This object could not be colored / re-created!");
                        }
                    } else {
                        ApplyObjectMaterialIndexData(objectid, materialindex);
                    }
                }
                case TDMODE_COLORLIST_FONTBACK: {
                    new objectid = GetPlayerEditObject(playerid);
                    if( !IsValidObject(objectid) ) {
                        return 1;
                    }

                    new
                        materialindex = g_PlayerData[playerid][PLAYER_DATA_EDIT_OBJMATIDX],
                        color_rgb = GetModelColorRGB(row_colorid),
                        color_argb = RGBtoARGB(color_rgb, 0xFF)
                    ;

                    if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] != MATERIALINDEX_TYPE_TEXT ) {
                        g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_TYPE][materialindex] = MATERIALINDEX_TYPE_TEXT;
                        DefaultObjectMaterialIndexData(objectid, materialindex);
                    }

                    g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_COLOR][materialindex] = color_argb;

                    if( g_ObjectData[objectid-1][OBJECT_DATA_MATINDEX_MODCOUNT] >= MAX_MATERIALINDEX_MODCOUNT ) {
                        new new_objectid = RecreateObject(objectid);
                        if( new_objectid == INVALID_OBJECT_ID ) {
                            SendClientMessage(playerid, RGBA_RED, "ERROR: This object could not be colored / re-created!");
                        }
                    } else {
                        ApplyObjectMaterialIndexData(objectid, materialindex);
                    }
                }
                case TDMODE_COLORLIST_ATTACH_1: {
                    new attach_index = GetPlayerEditAttached(playerid);
                    if( attach_index == INVALID_PLAYERATTACH_INDEX || !g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_TOGGLE] ) {
                        return 1;
                    }

                    new
                        color_rgb = GetModelColorRGB(row_colorid),
                        color_argb = RGBtoARGB(color_rgb, 0xFF)
                    ;

                    g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_COLOR1] = color_argb;
                    ApplyPlayerAttachData(playerid, attach_index);
                }
                case TDMODE_COLORLIST_ATTACH_2: {
                    new attach_index = GetPlayerEditAttached(playerid);
                    if( attach_index == INVALID_PLAYERATTACH_INDEX || !g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_TOGGLE] ) {
                        return 1;
                    }

                    new
                        color_rgb = GetModelColorRGB(row_colorid),
                        color_argb = RGBtoARGB(color_rgb, 0xFF)
                    ;

                    g_PlayerAttachData[playerid][attach_index][PLAYERATTACH_DATA_COLOR2] = color_argb;
                    ApplyPlayerAttachData(playerid, attach_index);
                }
                case TDMODE_COLORLIST_VEHICLE_1: {
                    new vehicleid = GetPlayerEditVehicle(playerid);
                    if( !IsValidVehicle(vehicleid) ) {
                        return 1;
                    }
                    g_VehicleData[vehicleid-1][VEHICLE_DATA_COLOR_1] = row_colorid;

                    ChangeVehicleColor(vehicleid, g_VehicleData[vehicleid-1][VEHICLE_DATA_COLOR_1], g_VehicleData[vehicleid-1][VEHICLE_DATA_COLOR_2]);
                }
                case TDMODE_COLORLIST_VEHICLE_2: {
                    new vehicleid = GetPlayerEditVehicle(playerid);
                    if( !IsValidVehicle(vehicleid) ) {
                        return 1;
                    }
                    g_VehicleData[vehicleid-1][VEHICLE_DATA_COLOR_2] = row_colorid;

                    ChangeVehicleColor(vehicleid, g_VehicleData[vehicleid-1][VEHICLE_DATA_COLOR_1], g_VehicleData[vehicleid-1][VEHICLE_DATA_COLOR_2]);
                }
            }

            if( row != GetColorListAppliedRow(playerid) ) {
                SetColorListAppliedRow(playerid, row);
                ApplyColorListAppliedRow(playerid);
            }
            return 1;
        }
    }

    #if defined color_OnPlayerClickPlayerTD
        return color_OnPlayerClickPlayerTD(playerid, PlayerText:playertextid);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnPlayerClickPlayerTD
    #undef OnPlayerClickPlayerTextDraw
#else
    #define _ALS_OnPlayerClickPlayerTD
#endif
#define OnPlayerClickPlayerTextDraw color_OnPlayerClickPlayerTD
#if defined color_OnPlayerClickPlayerTD
    forward color_OnPlayerClickPlayerTD(playerid, PlayerText:playertextid);
#endif


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    switch(dialogid) {
        case DIALOGID_COLORLIST_PAGE: {
            if( !response ) {
                return 1;
            }

            new page;

            if( sscanf(inputtext, "i", page) ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a valid page number!");
                ShowColorListDialog(playerid, dialogid);
                return 1;
            }

            page --;

            if( page < MIN_COLORLIST_PAGE || page > GetColorListMaxPage(playerid) ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: You did not enter a valid page number!");
                ShowColorListDialog(playerid, dialogid);
                return 1;
            }

            SetColorListPage(playerid, page);
            LoadColorListRowData(playerid);

            ApplyColorListPage(playerid);
            ApplyColorListRowData(playerid);
            return 1;
        }
        case DIALOGID_COLORLIST_SEARCH: {
            if( !response ) {
                return 1;
            }

            SetColorListPage(playerid, MIN_COLORLIST_PAGE);
            SetColorListSearch(playerid, inputtext);
            LoadColorListRowData(playerid);

            ApplyColorListPage(playerid);
            ApplyColorListSearch(playerid);
            ApplyColorListRowData(playerid);
            return 1;
        }
    }

    #if defined color_OnDialogResponse
        return color_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif
#define OnDialogResponse color_OnDialogResponse
#if defined color_OnDialogResponse
    forward color_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif
