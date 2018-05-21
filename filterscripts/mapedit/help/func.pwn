CreateGenericHelpWindow() {
    g_TextdrawString = "";
    strcat(g_TextdrawString, "~r~What is the purpose of this script?~n~");
    strcat(g_TextdrawString, "~w~This script is made for creating your own maps ingame with ease. In other words it's a user friendly Map Editor.~n~ ~n~");

    strcat(g_TextdrawString, "~r~What can i modify with this map editor?~n~");
    strcat(g_TextdrawString, "~w~Objects~n~");
    strcat(g_TextdrawString, "Vehicles~n~");
    strcat(g_TextdrawString, "Pickups~n~");
    strcat(g_TextdrawString, "Actors~n~");
    strcat(g_TextdrawString, "Player Attachments~n~ ~n~");

    strcat(g_TextdrawString, "~r~What is unique about this map editor?~n~");
    strcat(g_TextdrawString, "~w~The graphical user interface makes this map editor one of the most user friendly available. ");
    strcat(g_TextdrawString, "This map editor has every tool you need to make a high quality map.");

    g_HelpGTD[HELP_GTD_BG] =
    TextDrawCreate          (320.0, 40.0, "_");
    TextDrawAlignment       (g_HelpGTD[HELP_GTD_BG], 2);
    TextDrawLetterSize      (g_HelpGTD[HELP_GTD_BG], 0.0, 27.0);
    TextDrawUseBox          (g_HelpGTD[HELP_GTD_BG], 1);
    TextDrawBoxColor        (g_HelpGTD[HELP_GTD_BG], 100);
    TextDrawTextSize        (g_HelpGTD[HELP_GTD_BG], 0.0, 270.0);

    g_HelpGTD[HELP_GTD_CLOSE] =
    TextDrawCreate          (445.0, 40.0, "X");
    TextDrawAlignment       (g_HelpGTD[HELP_GTD_CLOSE], 2);
    TextDrawBackgroundColor (g_HelpGTD[HELP_GTD_CLOSE], 255);
    TextDrawFont            (g_HelpGTD[HELP_GTD_CLOSE], 1);
    TextDrawLetterSize      (g_HelpGTD[HELP_GTD_CLOSE], 0.3, 1.0);
    TextDrawColor           (g_HelpGTD[HELP_GTD_CLOSE], RGBA_WHITE);
    TextDrawSetOutline      (g_HelpGTD[HELP_GTD_CLOSE], 1);
    TextDrawSetProportional (g_HelpGTD[HELP_GTD_CLOSE], 1);
    TextDrawUseBox          (g_HelpGTD[HELP_GTD_CLOSE], 1);
    TextDrawBoxColor        (g_HelpGTD[HELP_GTD_CLOSE], 0xFF000064);
    TextDrawTextSize        (g_HelpGTD[HELP_GTD_CLOSE], 10.0, 20.0);
    TextDrawSetSelectable   (g_HelpGTD[HELP_GTD_CLOSE], 1);

    g_HelpGTD[HELP_GTD_CAPTION] =
    TextDrawCreate          (191.0, 28.0, "Fusez's Map Editor");
    TextDrawBackgroundColor (g_HelpGTD[HELP_GTD_CAPTION], 255);
    TextDrawFont            (g_HelpGTD[HELP_GTD_CAPTION], 0);
    TextDrawLetterSize      (g_HelpGTD[HELP_GTD_CAPTION], 0.5, 2.0);
    TextDrawColor           (g_HelpGTD[HELP_GTD_CAPTION], RGBA_WHITE);
    TextDrawSetOutline      (g_HelpGTD[HELP_GTD_CAPTION], 1);
    TextDrawSetProportional (g_HelpGTD[HELP_GTD_CAPTION], 1);
    TextDrawSetSelectable   (g_HelpGTD[HELP_GTD_CAPTION], 0);

    g_HelpGTD[HELP_GTD_INFO_TAB] =
    TextDrawCreate          (351.0, 40.0, "Info");
    TextDrawAlignment       (g_HelpGTD[HELP_GTD_INFO_TAB], 2);
    TextDrawBackgroundColor (g_HelpGTD[HELP_GTD_INFO_TAB], 255);
    TextDrawFont            (g_HelpGTD[HELP_GTD_INFO_TAB], 1);
    TextDrawLetterSize      (g_HelpGTD[HELP_GTD_INFO_TAB], 0.2, 1.0);
    TextDrawColor           (g_HelpGTD[HELP_GTD_INFO_TAB], RGBA_WHITE);
    TextDrawSetOutline      (g_HelpGTD[HELP_GTD_INFO_TAB], 1);
    TextDrawSetProportional (g_HelpGTD[HELP_GTD_INFO_TAB], 1);
    TextDrawUseBox          (g_HelpGTD[HELP_GTD_INFO_TAB], 1);
    TextDrawBoxColor        (g_HelpGTD[HELP_GTD_INFO_TAB], 100);
    TextDrawTextSize        (g_HelpGTD[HELP_GTD_INFO_TAB], 10.0, 30.0);
    TextDrawSetSelectable   (g_HelpGTD[HELP_GTD_INFO_TAB], 1);

    g_HelpGTD[HELP_GTD_INFO_CAPTION] =
    TextDrawCreate          (320.0, 60.0, "Information");
    TextDrawAlignment       (g_HelpGTD[HELP_GTD_INFO_CAPTION], 2);
    TextDrawBackgroundColor (g_HelpGTD[HELP_GTD_INFO_CAPTION], 255);
    TextDrawFont            (g_HelpGTD[HELP_GTD_INFO_CAPTION], 1);
    TextDrawLetterSize      (g_HelpGTD[HELP_GTD_INFO_CAPTION], 0.3, 1.5);
    TextDrawColor           (g_HelpGTD[HELP_GTD_INFO_CAPTION], RGBA_WHITE);
    TextDrawSetOutline      (g_HelpGTD[HELP_GTD_INFO_CAPTION], 1);
    TextDrawSetProportional (g_HelpGTD[HELP_GTD_INFO_CAPTION], 1);
    TextDrawUseBox          (g_HelpGTD[HELP_GTD_INFO_CAPTION], 1);
    TextDrawBoxColor        (g_HelpGTD[HELP_GTD_INFO_CAPTION], 0);
    TextDrawTextSize        (g_HelpGTD[HELP_GTD_INFO_CAPTION], 0.0, 260.0);
    TextDrawSetSelectable   (g_HelpGTD[HELP_GTD_INFO_CAPTION], 0);

    g_HelpGTD[HELP_GTD_INFO_CONTENT] =
    TextDrawCreate          (320.0, 80.0, g_TextdrawString);
    TextDrawAlignment       (g_HelpGTD[HELP_GTD_INFO_CONTENT], 2);
    TextDrawBackgroundColor (g_HelpGTD[HELP_GTD_INFO_CONTENT], 255);
    TextDrawFont            (g_HelpGTD[HELP_GTD_INFO_CONTENT], 1);
    TextDrawLetterSize      (g_HelpGTD[HELP_GTD_INFO_CONTENT], 0.2, 1.0);
    TextDrawColor           (g_HelpGTD[HELP_GTD_INFO_CONTENT], RGBA_WHITE);
    TextDrawSetOutline      (g_HelpGTD[HELP_GTD_INFO_CONTENT], 1);
    TextDrawSetProportional (g_HelpGTD[HELP_GTD_INFO_CONTENT], 1);
    TextDrawUseBox          (g_HelpGTD[HELP_GTD_INFO_CONTENT], 1);
    TextDrawBoxColor        (g_HelpGTD[HELP_GTD_INFO_CONTENT], 0);
    TextDrawTextSize        (g_HelpGTD[HELP_GTD_INFO_CONTENT], 0.0, 260.0);

    g_HelpGTD[HELP_GTD_KEYBIND_TAB] =
    TextDrawCreate          (384.0, 40.0, "Keys");
    TextDrawAlignment       (g_HelpGTD[HELP_GTD_KEYBIND_TAB], 2);
    TextDrawBackgroundColor (g_HelpGTD[HELP_GTD_KEYBIND_TAB], 255);
    TextDrawFont            (g_HelpGTD[HELP_GTD_KEYBIND_TAB], 1);
    TextDrawLetterSize      (g_HelpGTD[HELP_GTD_KEYBIND_TAB], 0.2, 1.0);
    TextDrawColor           (g_HelpGTD[HELP_GTD_KEYBIND_TAB], RGBA_WHITE);
    TextDrawSetOutline      (g_HelpGTD[HELP_GTD_KEYBIND_TAB], 1);
    TextDrawSetProportional (g_HelpGTD[HELP_GTD_KEYBIND_TAB], 1);
    TextDrawUseBox          (g_HelpGTD[HELP_GTD_KEYBIND_TAB], 1);
    TextDrawBoxColor        (g_HelpGTD[HELP_GTD_KEYBIND_TAB], -206);
    TextDrawTextSize        (g_HelpGTD[HELP_GTD_KEYBIND_TAB], 10.0, 30.0);
    TextDrawSetSelectable   (g_HelpGTD[HELP_GTD_KEYBIND_TAB], 1);

    g_HelpGTD[HELP_GTD_KEYBIND_CAPTION] =
    TextDrawCreate          (320.0, 60.0, "Keybinds");
    TextDrawAlignment       (g_HelpGTD[HELP_GTD_KEYBIND_CAPTION], 2);
    TextDrawBackgroundColor (g_HelpGTD[HELP_GTD_KEYBIND_CAPTION], 255);
    TextDrawFont            (g_HelpGTD[HELP_GTD_KEYBIND_CAPTION], 1);
    TextDrawLetterSize      (g_HelpGTD[HELP_GTD_KEYBIND_CAPTION], 0.3, 1.5);
    TextDrawColor           (g_HelpGTD[HELP_GTD_KEYBIND_CAPTION], RGBA_WHITE);
    TextDrawSetOutline      (g_HelpGTD[HELP_GTD_KEYBIND_CAPTION], 1);
    TextDrawSetProportional (g_HelpGTD[HELP_GTD_KEYBIND_CAPTION], 1);
    TextDrawUseBox          (g_HelpGTD[HELP_GTD_KEYBIND_CAPTION], 1);
    TextDrawBoxColor        (g_HelpGTD[HELP_GTD_KEYBIND_CAPTION], 0);
    TextDrawTextSize        (g_HelpGTD[HELP_GTD_KEYBIND_CAPTION], 0.0, 260.0);
    TextDrawSetSelectable   (g_HelpGTD[HELP_GTD_KEYBIND_CAPTION], 0);

    for(new row, Float:y = 80.0; row < MAX_HELP_KEYBINDS; row ++, y += 12.0) {
        g_HelpGTD[HELP_GTD_KEYBIND_L][row] =
        TextDrawCreate          (310.0, y, "Key");
        TextDrawAlignment       (g_HelpGTD[HELP_GTD_KEYBIND_L][row], 3);
        TextDrawBackgroundColor (g_HelpGTD[HELP_GTD_KEYBIND_L][row], 255);
        TextDrawFont            (g_HelpGTD[HELP_GTD_KEYBIND_L][row], 1);
        TextDrawLetterSize      (g_HelpGTD[HELP_GTD_KEYBIND_L][row], 0.2, 1.0);
        TextDrawColor           (g_HelpGTD[HELP_GTD_KEYBIND_L][row], RGBA_WHITE);
        TextDrawSetOutline      (g_HelpGTD[HELP_GTD_KEYBIND_L][row], 1);
        TextDrawSetProportional (g_HelpGTD[HELP_GTD_KEYBIND_L][row], 1);
        TextDrawSetSelectable   (g_HelpGTD[HELP_GTD_KEYBIND_L][row], 0);

        g_HelpGTD[HELP_GTD_KEYBIND_C][row] =
        TextDrawCreate          (320.0, y, "-");
        TextDrawAlignment       (g_HelpGTD[HELP_GTD_KEYBIND_C][row], 2);
        TextDrawBackgroundColor (g_HelpGTD[HELP_GTD_KEYBIND_C][row], 255);
        TextDrawFont            (g_HelpGTD[HELP_GTD_KEYBIND_C][row], 1);
        TextDrawLetterSize      (g_HelpGTD[HELP_GTD_KEYBIND_C][row], 0.2, 1.0);
        TextDrawColor           (g_HelpGTD[HELP_GTD_KEYBIND_C][row], RGBA_WHITE);
        TextDrawSetOutline      (g_HelpGTD[HELP_GTD_KEYBIND_C][row], 1);
        TextDrawSetProportional (g_HelpGTD[HELP_GTD_KEYBIND_C][row], 1);
        TextDrawSetSelectable   (g_HelpGTD[HELP_GTD_KEYBIND_C][row], 0);

        g_HelpGTD[HELP_GTD_KEYBIND_R][row] =
        TextDrawCreate          (330.0, y, "Action");
        TextDrawBackgroundColor (g_HelpGTD[HELP_GTD_KEYBIND_R][row], 255);
        TextDrawFont            (g_HelpGTD[HELP_GTD_KEYBIND_R][row], 1);
        TextDrawLetterSize      (g_HelpGTD[HELP_GTD_KEYBIND_R][row], 0.2, 1.0);
        TextDrawColor           (g_HelpGTD[HELP_GTD_KEYBIND_R][row], RGBA_WHITE);
        TextDrawSetOutline      (g_HelpGTD[HELP_GTD_KEYBIND_R][row], 1);
        TextDrawSetProportional (g_HelpGTD[HELP_GTD_KEYBIND_R][row], 1);
        TextDrawSetSelectable   (g_HelpGTD[HELP_GTD_KEYBIND_R][row], 0);

        switch(row) {
            case HELP_KEYBIND_OFFEDIT_ADD: { // KEY_ANALOG_RIGHT
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_L][row], "~k~~VEHICLE_TURRETRIGHT~");
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_R][row], "Offset Edit +");
            }
            case HELP_KEYBIND_OFFEDIT_SUB: { // KEY_ANALOG_LEFT
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_L][row], "~k~~VEHICLE_TURRETLEFT~");
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_R][row], "Offset Edit -");
            }
            case HELP_KEYBIND_OFFEDIT_MODE: { // KEY_SPRINT
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_L][row], "Hold ~k~~PED_SPRINT~ / ~k~~VEHICLE_ACCELERATE~");
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_R][row], "Offset Edit Mode");
            }
            case HELP_KEYBIND_OFFEDIT_SLOW: { // KEY_WALK
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_L][row], "Hold ~k~~SNEAK_ABOUT~");
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_R][row], "Offset Edit Slower");
            }
            case HELP_KEYBIND_CAM_FORWARD: { // Up Key
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_L][row], "Up");
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_R][row], "Move Camera Forward");
            }
            case HELP_KEYBIND_CAM_BACK: { // Down Key
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_L][row], "Down");
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_R][row], "Move Camera Backwards");
            }
            case HELP_KEYBIND_CAM_LEFT: { // Left Key
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_L][row], "Left");
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_R][row], "Move Camera Left");
            }
            case HELP_KEYBIND_CAM_RIGHT: { // Right Key
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_L][row], "Right");
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_R][row], "Move Camera Right");
            }
            case HELP_KEYBIND_CAM_FAST: { // KEY_JUMP
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_L][row], "Hold ~k~~PED_JUMPING~");
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_R][row], "Move Camera Faster");
            }
            case HELP_KEYBIND_CAM_SLOW: { // KEY_WALK
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_L][row], "Hold ~k~~SNEAK_ABOUT~");
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_R][row], "Move Camera Slower");
            }
            case HELP_KEYBIND_MOUSE_ON: { // KEY_CROUCH
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_L][row], "~k~~CONVERSATION_YES~ / ~k~~PED_DUCK~");
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_R][row], "Toggle Mouse Mode");
            }
            case HELP_KEYBIND_MOUSE_OFF: { // ESC
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_L][row], "ESC");
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_R][row], "Untoggle Mouse Mode");
            }
            case HELP_KEYBIND_EDIT_LOOK: { // KEY_SPRINT
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_L][row], "Hold ~k~~PED_SPRINT~ / ~k~~VEHICLE_ACCELERATE~");
                TextDrawSetString(g_HelpGTD[HELP_GTD_KEYBIND_R][row], "Click&Drag/3D Select Look Around");
            }
            default: {
                continue;
            }
        }
    }

    g_HelpGTD[HELP_GTD_CREDIT_TAB] =
    TextDrawCreate          (417.0, 40.0, "Credits");
    TextDrawAlignment       (g_HelpGTD[HELP_GTD_CREDIT_TAB], 2);
    TextDrawBackgroundColor (g_HelpGTD[HELP_GTD_CREDIT_TAB], 255);
    TextDrawFont            (g_HelpGTD[HELP_GTD_CREDIT_TAB], 1);
    TextDrawLetterSize      (g_HelpGTD[HELP_GTD_CREDIT_TAB], 0.2, 1.0);
    TextDrawColor           (g_HelpGTD[HELP_GTD_CREDIT_TAB], RGBA_WHITE);
    TextDrawSetOutline      (g_HelpGTD[HELP_GTD_CREDIT_TAB], 1);
    TextDrawSetProportional (g_HelpGTD[HELP_GTD_CREDIT_TAB], 1);
    TextDrawUseBox          (g_HelpGTD[HELP_GTD_CREDIT_TAB], 1);
    TextDrawBoxColor        (g_HelpGTD[HELP_GTD_CREDIT_TAB], 100);
    TextDrawTextSize        (g_HelpGTD[HELP_GTD_CREDIT_TAB], 10.0, 30.0);
    TextDrawSetSelectable   (g_HelpGTD[HELP_GTD_CREDIT_TAB], 1);

    g_HelpGTD[HELP_GTD_CREDIT_CAPTION] =
    TextDrawCreate          (320.0, 60.0, "Credits");
    TextDrawAlignment       (g_HelpGTD[HELP_GTD_CREDIT_CAPTION], 2);
    TextDrawBackgroundColor (g_HelpGTD[HELP_GTD_CREDIT_CAPTION], 255);
    TextDrawFont            (g_HelpGTD[HELP_GTD_CREDIT_CAPTION], 1);
    TextDrawLetterSize      (g_HelpGTD[HELP_GTD_CREDIT_CAPTION], 0.3, 1.5);
    TextDrawColor           (g_HelpGTD[HELP_GTD_CREDIT_CAPTION], RGBA_WHITE);
    TextDrawSetOutline      (g_HelpGTD[HELP_GTD_CREDIT_CAPTION], 1);
    TextDrawSetProportional (g_HelpGTD[HELP_GTD_CREDIT_CAPTION], 1);
    TextDrawUseBox          (g_HelpGTD[HELP_GTD_CREDIT_CAPTION], 1);
    TextDrawBoxColor        (g_HelpGTD[HELP_GTD_CREDIT_CAPTION], 0);
    TextDrawTextSize        (g_HelpGTD[HELP_GTD_CREDIT_CAPTION], 0.0, 260.0);
    TextDrawSetSelectable   (g_HelpGTD[HELP_GTD_CREDIT_CAPTION], 0);

    for(new row, Float:y = 80.0; row < MAX_HELP_CREDITS; row ++, y += 12.0) {
        g_HelpGTD[HELP_GTD_CREDIT_L][row] =
        TextDrawCreate          (310.0, y, "User");
        TextDrawAlignment       (g_HelpGTD[HELP_GTD_CREDIT_L][row], 3);
        TextDrawBackgroundColor (g_HelpGTD[HELP_GTD_CREDIT_L][row], 255);
        TextDrawFont            (g_HelpGTD[HELP_GTD_CREDIT_L][row], 1);
        TextDrawLetterSize      (g_HelpGTD[HELP_GTD_CREDIT_L][row], 0.2, 1.0);
        TextDrawColor           (g_HelpGTD[HELP_GTD_CREDIT_L][row], RGBA_WHITE);
        TextDrawSetOutline      (g_HelpGTD[HELP_GTD_CREDIT_L][row], 1);
        TextDrawSetProportional (g_HelpGTD[HELP_GTD_CREDIT_L][row], 1);
        TextDrawSetSelectable   (g_HelpGTD[HELP_GTD_CREDIT_L][row], 0);

        g_HelpGTD[HELP_GTD_CREDIT_C][row] =
        TextDrawCreate          (320.0, y, "-");
        TextDrawAlignment       (g_HelpGTD[HELP_GTD_CREDIT_C][row], 2);
        TextDrawBackgroundColor (g_HelpGTD[HELP_GTD_CREDIT_C][row], 255);
        TextDrawFont            (g_HelpGTD[HELP_GTD_CREDIT_C][row], 1);
        TextDrawLetterSize      (g_HelpGTD[HELP_GTD_CREDIT_C][row], 0.2, 1.0);
        TextDrawColor           (g_HelpGTD[HELP_GTD_CREDIT_C][row], RGBA_WHITE);
        TextDrawSetOutline      (g_HelpGTD[HELP_GTD_CREDIT_C][row], 1);
        TextDrawSetProportional (g_HelpGTD[HELP_GTD_CREDIT_C][row], 1);
        TextDrawSetSelectable   (g_HelpGTD[HELP_GTD_CREDIT_C][row], 0);

        g_HelpGTD[HELP_GTD_CREDIT_R][row] =
        TextDrawCreate          (330.0, y, "Contribution");
        TextDrawBackgroundColor (g_HelpGTD[HELP_GTD_CREDIT_R][row], 255);
        TextDrawFont            (g_HelpGTD[HELP_GTD_CREDIT_R][row], 1);
        TextDrawLetterSize      (g_HelpGTD[HELP_GTD_CREDIT_R][row], 0.2, 1.0);
        TextDrawColor           (g_HelpGTD[HELP_GTD_CREDIT_R][row], RGBA_WHITE);
        TextDrawSetOutline      (g_HelpGTD[HELP_GTD_CREDIT_R][row], 1);
        TextDrawSetProportional (g_HelpGTD[HELP_GTD_CREDIT_R][row], 1);
        TextDrawSetSelectable   (g_HelpGTD[HELP_GTD_CREDIT_R][row], 0);

        switch(row) {
            case HELP_CREDIT_AUTHOR: {
                TextDrawSetString(g_HelpGTD[HELP_GTD_CREDIT_L][row], "Fusez");
                TextDrawSetString(g_HelpGTD[HELP_GTD_CREDIT_R][row], "Author");
            }
            case HELP_CREDIT_TDEDIT: {
                TextDrawSetString(g_HelpGTD[HELP_GTD_CREDIT_L][row], "Zamaroht");
                TextDrawSetString(g_HelpGTD[HELP_GTD_CREDIT_R][row], "Textdraw Editor");
            }
            case HELP_CREDIT_TEXTURES: {
                TextDrawSetString(g_HelpGTD[HELP_GTD_CREDIT_L][row], "Pottus");
                TextDrawSetString(g_HelpGTD[HELP_GTD_CREDIT_R][row], "Textures");
            }
            case HELP_CREDIT_BUILDINGS: {
                TextDrawSetString(g_HelpGTD[HELP_GTD_CREDIT_L][row], "Pottus");
                TextDrawSetString(g_HelpGTD[HELP_GTD_CREDIT_R][row], "Buildings");
            }
            case HELP_CREDIT_MODELNAMES: {
                TextDrawSetString(g_HelpGTD[HELP_GTD_CREDIT_L][row], "SuperViper");
                TextDrawSetString(g_HelpGTD[HELP_GTD_CREDIT_R][row], "Model Names");
            }
            case HELP_CREDIT_MODELSIZES: {
                TextDrawSetString(g_HelpGTD[HELP_GTD_CREDIT_L][row], "Crayder");
                TextDrawSetString(g_HelpGTD[HELP_GTD_CREDIT_R][row], "Model Sizes");
            }
            case HELP_CREDIT_CAMMODE: {
                TextDrawSetString(g_HelpGTD[HELP_GTD_CREDIT_L][row], "h02");
                TextDrawSetString(g_HelpGTD[HELP_GTD_CREDIT_R][row], "Camera Mode");
            }
            case HELP_CREDIT_STRLIB: {
                TextDrawSetString(g_HelpGTD[HELP_GTD_CREDIT_L][row], "Slice");
                TextDrawSetString(g_HelpGTD[HELP_GTD_CREDIT_R][row], "strlib");
            }
            case HELP_CREDIT_SSCANF: {
                TextDrawSetString(g_HelpGTD[HELP_GTD_CREDIT_L][row], "Y_Less");
                TextDrawSetString(g_HelpGTD[HELP_GTD_CREDIT_R][row], "sscanf");
            }
            case HELP_CREDIT_SKINNAMES: {
                TextDrawSetString(g_HelpGTD[HELP_GTD_CREDIT_L][row], "Crayder");
                TextDrawSetString(g_HelpGTD[HELP_GTD_CREDIT_R][row], "Skin Names");
            }
            case HELP_CREDIT_ATTACHOBJPOS: {
                TextDrawSetString(g_HelpGTD[HELP_GTD_CREDIT_L][row], "Stylock");
                TextDrawSetString(g_HelpGTD[HELP_GTD_CREDIT_R][row], "GetAttachedObjectPos");
            }
            default: {
                continue;
            }
        }
    }
}

DestroyGenericHelpWindow() {
    for(new gtd; gtd < MAX_HELP_GTDS; gtd ++) {
        TextDrawDestroy( g_HelpGTD[gtd] );

        g_HelpGTD[gtd] = Text: INVALID_TEXT_DRAW;
    }
}

ShowHelpWindow(playerid) {
    TextDrawBoxColor(g_HelpGTD[HELP_GTD_INFO_TAB],    0x00000064);
    TextDrawBoxColor(g_HelpGTD[HELP_GTD_KEYBIND_TAB], 0x00000064);
    TextDrawBoxColor(g_HelpGTD[HELP_GTD_CREDIT_TAB],  0x00000064);

    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_HELP_INFO: {
            TextDrawBoxColor(g_HelpGTD[HELP_GTD_INFO_TAB],    0xFFFFFF64);
        }
        case TDMODE_HELP_KEYBIND: {
            TextDrawBoxColor(g_HelpGTD[HELP_GTD_KEYBIND_TAB], 0xFFFFFF64);
        }
        case TDMODE_HELP_CREDIT: {
            TextDrawBoxColor(g_HelpGTD[HELP_GTD_CREDIT_TAB],  0xFFFFFF64);
        }
    }

    TextDrawShowForPlayer(playerid, g_HelpGTD[HELP_GTD_BG]);
    TextDrawShowForPlayer(playerid, g_HelpGTD[HELP_GTD_CLOSE]);
    TextDrawShowForPlayer(playerid, g_HelpGTD[HELP_GTD_CAPTION]);
    TextDrawShowForPlayer(playerid, g_HelpGTD[HELP_GTD_INFO_TAB]);
    TextDrawShowForPlayer(playerid, g_HelpGTD[HELP_GTD_KEYBIND_TAB]);
    TextDrawShowForPlayer(playerid, g_HelpGTD[HELP_GTD_CREDIT_TAB]);

    switch( g_PlayerData[playerid][PLAYER_DATA_TDMODE] ) {
        case TDMODE_HELP_INFO: {
            TextDrawShowForPlayer(playerid, g_HelpGTD[HELP_GTD_INFO_CAPTION]);
            TextDrawShowForPlayer(playerid, g_HelpGTD[HELP_GTD_INFO_CONTENT]);
        }
        case TDMODE_HELP_KEYBIND: {
            TextDrawShowForPlayer(playerid, g_HelpGTD[HELP_GTD_KEYBIND_CAPTION]);
            for(new row; row < MAX_HELP_KEYBINDS; row ++) {
                TextDrawShowForPlayer(playerid, g_HelpGTD[HELP_GTD_KEYBIND_L][row]);
                TextDrawShowForPlayer(playerid, g_HelpGTD[HELP_GTD_KEYBIND_C][row]);
                TextDrawShowForPlayer(playerid, g_HelpGTD[HELP_GTD_KEYBIND_R][row]);
            }
        }
        case TDMODE_HELP_CREDIT: {
            TextDrawShowForPlayer(playerid, g_HelpGTD[HELP_GTD_CREDIT_CAPTION]);
            for(new row; row < MAX_HELP_CREDITS; row ++) {
                TextDrawShowForPlayer(playerid, g_HelpGTD[HELP_GTD_CREDIT_L][row]);
                TextDrawShowForPlayer(playerid, g_HelpGTD[HELP_GTD_CREDIT_C][row]);
                TextDrawShowForPlayer(playerid, g_HelpGTD[HELP_GTD_CREDIT_R][row]);
            }
        }
    }
}

HideHelpWindow(playerid) {
    for(new gtd; gtd < MAX_HELP_GTDS; gtd ++) {
        TextDrawHideForPlayer(playerid, g_HelpGTD[gtd]);
    }
}
