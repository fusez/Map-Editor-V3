ShowPlayerTextdrawMode(playerid, tdmode) {
    if( g_PlayerData[playerid][PLAYER_DATA_TDMODE] == tdmode ) {
        return 0;
    }

    if( g_PlayerData[playerid][PLAYER_DATA_TDMODE] != TDMODE_NONE ) {
        HidePlayerTextdrawMode(playerid);
    }

    g_PlayerData[playerid][PLAYER_DATA_TDMODE] = tdmode;

    switch(tdmode) {
        case TDMODE_SELECTLIST_OBJECT, TDMODE_SELECTLIST_VEHICLE, TDMODE_SELECTLIST_PICKUP, TDMODE_SELECTLIST_ACTOR: {
            ShowSelectList(playerid);
        }
        case TDMODE_CREATELIST_OBJECT, TDMODE_CREATELIST_VEHICLE, TDMODE_CREATELIST_PICKUP, TDMODE_CREATELIST_ACTOR, TDMODE_CREATELIST_ATTACH: {
            ShowCreateList(playerid);
        }
        case TDMODE_COLORLIST_TEXTURE, TDMODE_COLORLIST_FONTFACE, TDMODE_COLORLIST_FONTBACK, TDMODE_COLORLIST_ATTACH_1, TDMODE_COLORLIST_ATTACH_2, TDMODE_COLORLIST_VEHICLE_1, TDMODE_COLORLIST_VEHICLE_2: {
            ShowColorList(playerid);
        }
        case TDMODE_TEXTURELIST: {
            ShowTextureList(playerid);
        }
        case TDMODE_HELP_INFO, TDMODE_HELP_KEYBIND, TDMODE_HELP_CREDIT: {
            ShowHelpWindow(playerid);
        }
        case TDMODE_FONTLIST: {
            ShowFontList(playerid);
        }
        case TDMODE_ANIMLIST: {
            ShowAnimationList(playerid);
        }
        case TDMODE_CATMANAGER_MODELS, TDMODE_CATMANAGER_VEHICLES, TDMODE_CATMANAGER_SKINS, TDMODE_CATMANAGER_TEXTURES: {
            ShowCategoryManager(playerid);
        }
        case TDMODE_BUILDLIST: {
            ShowBuildList(playerid);
        }
        default: {
            return 0;
        }
    }
    return 1;
}

HidePlayerTextdrawMode(playerid) {
    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_SELECTLIST_OBJECT, TDMODE_SELECTLIST_VEHICLE, TDMODE_SELECTLIST_PICKUP, TDMODE_SELECTLIST_ACTOR: {
            HideSelectList(playerid);
        }
        case TDMODE_CREATELIST_OBJECT, TDMODE_CREATELIST_VEHICLE, TDMODE_CREATELIST_PICKUP, TDMODE_CREATELIST_ACTOR, TDMODE_CREATELIST_ATTACH: {
            HideCreateList(playerid);
        }
        case TDMODE_COLORLIST_TEXTURE, TDMODE_COLORLIST_FONTFACE, TDMODE_COLORLIST_FONTBACK, TDMODE_COLORLIST_ATTACH_1, TDMODE_COLORLIST_ATTACH_2, TDMODE_COLORLIST_VEHICLE_1, TDMODE_COLORLIST_VEHICLE_2: {
            HideColorList(playerid);
        }
        case TDMODE_TEXTURELIST: {
            HideTextureList(playerid);
        }
        case TDMODE_HELP_INFO, TDMODE_HELP_KEYBIND, TDMODE_HELP_CREDIT: {
            HideHelpWindow(playerid);
        }
        case TDMODE_FONTLIST: {
            HideFontList(playerid);
        }
        case TDMODE_ANIMLIST: {
            HideAnimationList(playerid);
        }
        case TDMODE_CATMANAGER_MODELS, TDMODE_CATMANAGER_VEHICLES, TDMODE_CATMANAGER_SKINS, TDMODE_CATMANAGER_TEXTURES: {
            HideCategoryManager(playerid);
        }
        case TDMODE_BUILDLIST: {
            HideBuildList(playerid);
        }
        default: {
            return 0;
        }
    }

    g_PlayerData[playerid][PLAYER_DATA_TDMODE] = TDMODE_NONE;
    return 1;
}
