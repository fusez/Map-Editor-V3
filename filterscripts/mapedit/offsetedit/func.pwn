forward OnOffsetEditUpdate();

GetOffsetEditModeName(mode) {
    new modename[3];
    switch(mode) {
        case OFFSETEDIT_MODE_X: {
            strunpack(modename, !"x");
        }
        case OFFSETEDIT_MODE_Y: {
            strunpack(modename, !"y");
        }
        case OFFSETEDIT_MODE_Z: {
            strunpack(modename, !"z");
        }
        case OFFSETEDIT_MODE_RX: {
            strunpack(modename, !"rx");
        }
        case OFFSETEDIT_MODE_RY: {
            strunpack(modename, !"ry");
        }
        case OFFSETEDIT_MODE_RZ: {
            strunpack(modename, !"rz");
        }
        default: {
            strunpack(modename, !"-");
        }
    }
    return modename;
}

ShowOffsetEditMode(playerid) {
    new text[21];
    format(text, sizeof text, "~r~editing %s offset", GetOffsetEditModeName(g_OffsetEditData[playerid][OFFSETEDIT_DATA_MODE]));
    GameTextForPlayer(playerid, text, 2000, 4);
}

ShowOffsetEditOffset(playerid, objectid) {
    new text[28];
    switch( g_OffsetEditData[playerid][OFFSETEDIT_DATA_MODE] ) {
        case OFFSETEDIT_MODE_X: {
            format(text, sizeof text, "~r~%s offset: ~w~%.4f", GetOffsetEditModeName(OFFSETEDIT_MODE_X), g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_X] );
        }
        case OFFSETEDIT_MODE_Y: {
            format(text, sizeof text, "~r~%s offset: ~w~%.4f", GetOffsetEditModeName(OFFSETEDIT_MODE_Y), g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Y] );
        }
        case OFFSETEDIT_MODE_Z: {
            format(text, sizeof text, "~r~%s offset: ~w~%.4f", GetOffsetEditModeName(OFFSETEDIT_MODE_Z), g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_Z] );
        }
        case OFFSETEDIT_MODE_RX: {
            format(text, sizeof text, "~r~%s offset: ~w~%.4f", GetOffsetEditModeName(OFFSETEDIT_MODE_RX), g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RX] );
        }
        case OFFSETEDIT_MODE_RY: {
            format(text, sizeof text, "~r~%s offset: ~w~%.4f", GetOffsetEditModeName(OFFSETEDIT_MODE_RY), g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RY] );
        }
        case OFFSETEDIT_MODE_RZ: {
            format(text, sizeof text, "~r~%s offset: ~w~%.4f", GetOffsetEditModeName(OFFSETEDIT_MODE_RZ), g_ObjectData[objectid-1][OBJECT_DATA_ATTACH_RZ] );
        }
        default: {
            return 0;
        }
    }
    GameTextForPlayer(playerid, text, 1000, 4);
    return 1;
}

ToggleOffsetEdit(playerid, bool:toggle) {
    if(toggle == g_OffsetEditData[playerid][OFFSETEDIT_DATA_TOGGLE]) {
        return 0;
    }

    g_OffsetEditData[playerid][OFFSETEDIT_DATA_TOGGLE] = toggle;

    if(toggle) {
        g_OffsetEditData[playerid][OFFSETEDIT_DATA_MULTIPLIER] = 0.0;

        GameTextForPlayer(playerid, "~w~offset editor ~g~toggled", 4000, 4);

        SendClientMessage(playerid, RGBA_ORANGE, "Offset Edit Keys:");
        SendClientMessage(playerid, RGBA_ORANGE, "Direction: {FFFFFF}+~k~~VEHICLE_TURRETRIGHT~ / -~k~~VEHICLE_TURRETLEFT~");
        SendClientMessage(playerid, RGBA_ORANGE, "Move Slower: {FFFFFF}~k~~SNEAK_ABOUT~ + Direction Key");
        SendClientMessage(playerid, RGBA_ORANGE, "Change Mode: {FFFFFF}~k~~PED_SPRINT~ + Direction Key");
        SendClientMessage(playerid, RGBA_ORANGE, " ");
    } else {
        GameTextForPlayer(playerid, "~w~offset editor ~r~untoggled", 4000, 4);
    }
    return 1;
}

DefaultOffsetEditData(playerid) {
    g_OffsetEditData[playerid][OFFSETEDIT_DATA_TOGGLE] = false;
    g_OffsetEditData[playerid][OFFSETEDIT_DATA_MODE] = OFFSETEDIT_MODE_X;
    g_OffsetEditData[playerid][OFFSETEDIT_DATA_MULTIPLIER] = 0.0;
}
