CreateToolbarTextdraws() {
    // Background
    g_ToolbarTextdraw[TD_TOOLBAR_BG] =
    TextDrawCreate     (236.0, 318.0, "_");
    TextDrawLetterSize (g_ToolbarTextdraw[TD_TOOLBAR_BG], 0.0, 14.3);
    TextDrawUseBox     (g_ToolbarTextdraw[TD_TOOLBAR_BG], 1);
    TextDrawBoxColor   (g_ToolbarTextdraw[TD_TOOLBAR_BG], 50);
    TextDrawTextSize   (g_ToolbarTextdraw[TD_TOOLBAR_BG], 639.0, 0.0);

    // Object
    g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_BG] =
    TextDrawCreate          (618.0, 397.0, "_");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_BG], 2);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_BG], 0.0, 5.5);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_BG], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_BG], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_BG], 0.0, 42.0);

    g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_MODEL] =
    TextDrawCreate          (598.0, 398.0, "_");
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_MODEL], 0);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_MODEL], 5);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_MODEL], RGBA_WHITE);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_MODEL], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_MODEL], 0);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_MODEL], 40.0, 40.0);
    TextDrawSetPreviewModel (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_MODEL], 1220);
    TextDrawSetPreviewRot   (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_MODEL], 335.0, 0.0, 45.0, 1.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_MODEL], 0);

    g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_TEXT] =
    TextDrawCreate          (598.0, 437.0, "Object");
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_TEXT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_TEXT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_TEXT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_TEXT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_TEXT], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_TEXT], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LISTSELECT] =
    TextDrawCreate          (618.0, 384.0, "List Select");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LISTSELECT], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LISTSELECT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LISTSELECT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LISTSELECT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LISTSELECT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LISTSELECT], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LISTSELECT], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LISTSELECT], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LISTSELECT], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LISTSELECT], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LISTSELECT], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_NSELECT] =
    TextDrawCreate          (618.0, 371.0, "Near Select");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_NSELECT], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_NSELECT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_NSELECT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_NSELECT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_NSELECT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_NSELECT], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_NSELECT], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_NSELECT], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_NSELECT], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_NSELECT], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_NSELECT], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LOOKSELECT] =
    TextDrawCreate          (618.0, 358.0, "Look Select");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LOOKSELECT], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LOOKSELECT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LOOKSELECT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LOOKSELECT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LOOKSELECT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LOOKSELECT], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LOOKSELECT], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LOOKSELECT], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LOOKSELECT], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LOOKSELECT], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_LOOKSELECT], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_SSELECT] =
    TextDrawCreate          (618.0, 345.0, "Surf Select");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_SSELECT], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_SSELECT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_SSELECT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_SSELECT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_SSELECT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_SSELECT], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_SSELECT], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_SSELECT], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_SSELECT], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_SSELECT], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_SSELECT], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_3DSELECT] =
    TextDrawCreate          (618.0, 332.0, "3D Select");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_3DSELECT], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_3DSELECT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_3DSELECT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_3DSELECT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_3DSELECT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_3DSELECT], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_3DSELECT], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_3DSELECT], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_3DSELECT], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_3DSELECT], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_3DSELECT], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_CREATE] =
    TextDrawCreate          (618.0, 319.0, "Create");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_CREATE], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_CREATE], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_CREATE], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_CREATE], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_CREATE], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_CREATE], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_CREATE], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_CREATE], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_CREATE], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_CREATE], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_OBJECT_CREATE], 1);

    // Vehicle
    g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_BG] =
    TextDrawCreate          (573.0, 397.0, "_");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_BG], 2);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_BG], 0.0, 5.5);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_BG], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_BG], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_BG], 0.0, 42.0);

    g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_MODEL] =
    TextDrawCreate          (553.0, 398.0, "_");
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_MODEL], 0);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_MODEL], 5);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_MODEL], RGBA_WHITE);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_MODEL], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_MODEL], 0);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_MODEL], 40.0, 40.0);
    TextDrawSetPreviewModel (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_MODEL], 557);
    TextDrawSetPreviewRot   (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_MODEL], 340.0, 0.0, 320.0, 0.8);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_MODEL], 0);

    g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_TEXT] =
    TextDrawCreate          (553.0, 437.0, "Vehicle");
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_TEXT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_TEXT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_TEXT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_TEXT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_TEXT], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_TEXT], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LISTSELECT] =
    TextDrawCreate          (573.0, 384.0, "List Select");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LISTSELECT], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LISTSELECT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LISTSELECT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LISTSELECT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LISTSELECT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LISTSELECT], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LISTSELECT], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LISTSELECT], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LISTSELECT], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LISTSELECT], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LISTSELECT], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_NSELECT] =
    TextDrawCreate          (573.0, 371.0, "Near Select");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_NSELECT], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_NSELECT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_NSELECT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_NSELECT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_NSELECT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_NSELECT], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_NSELECT], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_NSELECT], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_NSELECT], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_NSELECT], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_NSELECT], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LOOKSELECT] =
    TextDrawCreate          (573.0, 358.0, "Look Select");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LOOKSELECT], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LOOKSELECT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LOOKSELECT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LOOKSELECT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LOOKSELECT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LOOKSELECT], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LOOKSELECT], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LOOKSELECT], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LOOKSELECT], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LOOKSELECT], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_LOOKSELECT], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_SSELECT] =
    TextDrawCreate          (573.0, 345.0, "Surf Select");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_SSELECT], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_SSELECT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_SSELECT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_SSELECT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_SSELECT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_SSELECT], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_SSELECT], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_SSELECT], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_SSELECT], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_SSELECT], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_SSELECT], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_CREATE] =
    TextDrawCreate          (573.0, 332.0, "Create");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_CREATE], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_CREATE], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_CREATE], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_CREATE], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_CREATE], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_CREATE], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_CREATE], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_CREATE], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_CREATE], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_CREATE], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_VEHICLE_CREATE], 1);

    // Pickup
    g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_BG] =
    TextDrawCreate          (528.0, 397.0, "_");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_BG], 2);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_BG], 0.0, 5.5);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_BG], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_BG], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_BG], 0.0, 42.0);

    g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_MODEL] =
    TextDrawCreate          (508.0, 398.0, "_");
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_MODEL], 0);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_MODEL], 5);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_MODEL], RGBA_WHITE);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_MODEL], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_MODEL], 0);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_MODEL], 40.0, 40.0);
    TextDrawSetPreviewModel (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_MODEL], 1240);
    TextDrawSetPreviewRot   (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_MODEL], 330.0, 0.0, 325.0, 1.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_MODEL], 0);

    g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_TEXT] =
    TextDrawCreate          (508.0, 437.0, "Pickup");
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_TEXT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_TEXT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_TEXT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_TEXT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_TEXT], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_TEXT], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_LISTSELECT] =
    TextDrawCreate          (528.0, 384.0, "List Select");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_LISTSELECT], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_LISTSELECT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_LISTSELECT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_LISTSELECT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_LISTSELECT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_LISTSELECT], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_LISTSELECT], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_LISTSELECT], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_LISTSELECT], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_LISTSELECT], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_LISTSELECT], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_NSELECT] =
    TextDrawCreate          (528.0, 371.0, "Near Select");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_NSELECT], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_NSELECT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_NSELECT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_NSELECT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_NSELECT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_NSELECT], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_NSELECT], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_NSELECT], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_NSELECT], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_NSELECT], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_NSELECT], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_CREATE] =
    TextDrawCreate          (528.0, 358.0, "Create");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_CREATE], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_CREATE], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_CREATE], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_CREATE], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_CREATE], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_CREATE], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_CREATE], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_CREATE], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_CREATE], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_CREATE], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_PICKUP_CREATE], 1);

    // Attached
    g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_BG] =
    TextDrawCreate          (483.0, 397.0, "_");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_BG], 2);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_BG], 0.0, 5.5);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_BG], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_BG], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_BG], 0.0, 42.0);

    g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_MODEL] =
    TextDrawCreate          (463.0, 398.0, "_");
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_MODEL], 0);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_MODEL], 5);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_MODEL], RGBA_WHITE);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_MODEL], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_MODEL], 0);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_MODEL], 40.0, 40.0);
    TextDrawSetPreviewModel (g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_MODEL], 18978);
    TextDrawSetPreviewRot   (g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_MODEL], 0.0, 0.0, 50.0, 0.7);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_MODEL], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_TEXT] =
    TextDrawCreate          (463.0, 437.0, "Attached");
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_TEXT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_TEXT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_TEXT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_TEXT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_TEXT], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_ATTACHED_TEXT], 1);

    // Actor
    g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_BG] =
    TextDrawCreate          (438.0, 397.0, "_");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_BG], 2);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_BG], 0.0, 5.5);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_BG], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_BG], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_BG], 0.0, 42.0);

    g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_MODEL] =
    TextDrawCreate          (418.0, 398.0, "_");
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_MODEL], 0);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_MODEL], 5);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_MODEL], RGBA_WHITE);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_MODEL], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_MODEL], 0);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_MODEL], 40.0, 40.0);
    TextDrawSetPreviewModel (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_MODEL], 106);
    TextDrawSetPreviewRot   (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_MODEL], 340.0, 0.0, 330.0, 1.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_MODEL], 0);

    g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_TEXT] =
    TextDrawCreate          (418.0, 437.0, "Actor");
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_TEXT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_TEXT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_TEXT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_TEXT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_TEXT], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_TEXT], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_TEXT], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_TEXT], 0);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_TEXT], 459.0, 42.0);

    g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LISTSELECT] =
    TextDrawCreate          (438.0, 384.0, "List Select");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LISTSELECT], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LISTSELECT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LISTSELECT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LISTSELECT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LISTSELECT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LISTSELECT], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LISTSELECT], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LISTSELECT], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LISTSELECT], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LISTSELECT], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LISTSELECT], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_NSELECT] =
    TextDrawCreate          (438.0, 371.0, "Near Select");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_NSELECT], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_NSELECT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_NSELECT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_NSELECT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_NSELECT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_NSELECT], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_NSELECT], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_NSELECT], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_NSELECT], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_NSELECT], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_NSELECT], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LOOKSELECT] =
    TextDrawCreate          (438.0, 358.0, "Look Select");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LOOKSELECT], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LOOKSELECT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LOOKSELECT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LOOKSELECT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LOOKSELECT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LOOKSELECT], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LOOKSELECT], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LOOKSELECT], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LOOKSELECT], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LOOKSELECT], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_LOOKSELECT], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_CREATE] =
    TextDrawCreate          (438.0, 345.0, "Create");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_CREATE], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_CREATE], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_CREATE], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_CREATE], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_CREATE], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_CREATE], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_CREATE], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_CREATE], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_CREATE], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_CREATE], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_ACTOR_CREATE], 1);

    // Map
    g_ToolbarTextdraw[TD_TOOLBAR_MAP_BG] =
    TextDrawCreate          (393.0, 397.0, "_");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_MAP_BG], 2);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_MAP_BG], 0.0, 5.5);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_MAP_BG], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_MAP_BG], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_MAP_BG], 0.0, 42.0);

    g_ToolbarTextdraw[TD_TOOLBAR_MAP_MODEL] =
    TextDrawCreate          (373.0, 398.0, "_");
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_MAP_MODEL], 0);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_MAP_MODEL], 5);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_MAP_MODEL], RGBA_WHITE);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_MAP_MODEL], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_MAP_MODEL], 0);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_MAP_MODEL], 40.0, 40.0);
    TextDrawSetPreviewModel (g_ToolbarTextdraw[TD_TOOLBAR_MAP_MODEL], 3111);
    TextDrawSetPreviewRot   (g_ToolbarTextdraw[TD_TOOLBAR_MAP_MODEL], 90.0, 330.0, 180.0, 0.9);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_MAP_MODEL], 0);

    g_ToolbarTextdraw[TD_TOOLBAR_MAP_TEXT] =
    TextDrawCreate          (373.0, 437.0, "Map");
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_MAP_TEXT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_MAP_TEXT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_MAP_TEXT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_MAP_TEXT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_MAP_TEXT], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_MAP_TEXT], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_MAP_NEW] =
    TextDrawCreate          (393.0, 384.0, "New");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_MAP_NEW], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_MAP_NEW], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_MAP_NEW], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_MAP_NEW], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_MAP_NEW], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_MAP_NEW], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_MAP_NEW], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_MAP_NEW], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_MAP_NEW], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_MAP_NEW], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_MAP_NEW], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVE] =
    TextDrawCreate          (393.0, 371.0, "Save");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVE], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVE], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVE], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVE], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVE], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVE], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVE], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVE], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVE], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVE], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVE], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVEAS] =
    TextDrawCreate          (393.0, 358.0, "Save As..");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVEAS], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVEAS], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVEAS], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVEAS], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVEAS], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVEAS], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVEAS], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVEAS], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVEAS], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVEAS], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_MAP_SAVEAS], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADLIST] =
    TextDrawCreate          (393.0, 345.0, "Load f. List");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADLIST], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADLIST], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADLIST], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADLIST], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADLIST], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADLIST], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADLIST], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADLIST], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADLIST], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADLIST], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADLIST], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADNAME] =
    TextDrawCreate          (393.0, 332.0, "Load Name");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADNAME], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADNAME], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADNAME], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADNAME], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADNAME], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADNAME], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADNAME], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADNAME], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADNAME], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADNAME], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_MAP_LOADNAME], 1);

    // Cam
    g_ToolbarTextdraw[TD_TOOLBAR_CAM_BG] =
    TextDrawCreate          (348.0, 397.0, "_");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_CAM_BG], 2);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_CAM_BG], 0.0, 5.5);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_CAM_BG], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_CAM_BG], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_CAM_BG], 0.0, 42.0);

    g_ToolbarTextdraw[TD_TOOLBAR_CAM_MODEL] =
    TextDrawCreate          (328.0, 398.0, "_");
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_CAM_MODEL], 0);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_CAM_MODEL], 5);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_CAM_MODEL], RGBA_WHITE);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_CAM_MODEL], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_CAM_MODEL], 0);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_CAM_MODEL], 40.0, 40.0);
    TextDrawSetPreviewModel (g_ToolbarTextdraw[TD_TOOLBAR_CAM_MODEL], 367);
    TextDrawSetPreviewRot   (g_ToolbarTextdraw[TD_TOOLBAR_CAM_MODEL], 340.0, 0.0, 50.0, 0.8);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_CAM_MODEL], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_CAM_TEXT] =
    TextDrawCreate          (328.0, 437.0, "Cam");
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_CAM_TEXT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_CAM_TEXT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_CAM_TEXT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_CAM_TEXT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_CAM_TEXT], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_CAM_TEXT], 1);

    // Building
    g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_BG] =
    TextDrawCreate          (303.0, 397.0, "_");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_BG], 2);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_BG], 0.0, 5.5);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_BG], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_BG], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_BG], 0.0, 42.0);

    g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_MODEL] =
    TextDrawCreate          (283.0, 398.0, "_");
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_MODEL], 0);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_MODEL], 5);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_MODEL], RGBA_WHITE);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_MODEL], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_MODEL], 0);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_MODEL], 40.0, 40.0);
    TextDrawSetPreviewModel (g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_MODEL], 9319);
    TextDrawSetPreviewRot   (g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_MODEL], 350.0, 0.0, 220.0, 0.8);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_MODEL], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_TEXT] =
    TextDrawCreate          (283.0, 437.0, "Buildings");
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_TEXT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_TEXT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_TEXT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_TEXT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_TEXT], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_BUILDING_TEXT], 1);

    // Misc
    g_ToolbarTextdraw[TD_TOOLBAR_MISC_BG] =
    TextDrawCreate          (258.0, 397.0, "_");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_MISC_BG], 2);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_MISC_BG], 0.0, 5.5);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_MISC_BG], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_MISC_BG], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_MISC_BG], 0.0, 42.0);

    g_ToolbarTextdraw[TD_TOOLBAR_MISC_MODEL] =
    TextDrawCreate          (238.0, 398.0, "_");
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_MISC_MODEL], 0);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_MISC_MODEL], 5);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_MISC_MODEL], RGBA_WHITE);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_MISC_MODEL], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_MISC_MODEL], 0);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_MISC_MODEL], 40.0, 40.0);
    TextDrawSetPreviewModel (g_ToolbarTextdraw[TD_TOOLBAR_MISC_MODEL], 19918);
    TextDrawSetPreviewRot   (g_ToolbarTextdraw[TD_TOOLBAR_MISC_MODEL], 330.0, 0.0, 40.0, 1.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_MISC_MODEL], 0);

    g_ToolbarTextdraw[TD_TOOLBAR_MISC_TEXT] =
    TextDrawCreate          (238.0, 437.0, "Misc");
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_MISC_TEXT], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_MISC_TEXT], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_MISC_TEXT], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_MISC_TEXT], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_MISC_TEXT], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_MISC_CATEGORY] =
    TextDrawCreate          (258.0, 384.0, "Categories");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_MISC_CATEGORY], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_MISC_CATEGORY], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_MISC_CATEGORY], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_MISC_CATEGORY], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_MISC_CATEGORY], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_MISC_CATEGORY], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_MISC_CATEGORY], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_MISC_CATEGORY], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_MISC_CATEGORY], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_MISC_CATEGORY], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_MISC_CATEGORY], 1);

    g_ToolbarTextdraw[TD_TOOLBAR_MISC_INFO] =
    TextDrawCreate          (258.0, 371.0, "Info");
    TextDrawAlignment       (g_ToolbarTextdraw[TD_TOOLBAR_MISC_INFO], 2);
    TextDrawBackgroundColor (g_ToolbarTextdraw[TD_TOOLBAR_MISC_INFO], 255);
    TextDrawFont            (g_ToolbarTextdraw[TD_TOOLBAR_MISC_INFO], 1);
    TextDrawLetterSize      (g_ToolbarTextdraw[TD_TOOLBAR_MISC_INFO], 0.2, 1.0);
    TextDrawColor           (g_ToolbarTextdraw[TD_TOOLBAR_MISC_INFO], RGBA_WHITE);
    TextDrawSetOutline      (g_ToolbarTextdraw[TD_TOOLBAR_MISC_INFO], 1);
    TextDrawSetProportional (g_ToolbarTextdraw[TD_TOOLBAR_MISC_INFO], 1);
    TextDrawUseBox          (g_ToolbarTextdraw[TD_TOOLBAR_MISC_INFO], 1);
    TextDrawBoxColor        (g_ToolbarTextdraw[TD_TOOLBAR_MISC_INFO], 100);
    TextDrawTextSize        (g_ToolbarTextdraw[TD_TOOLBAR_MISC_INFO], 10.0, 42.0);
    TextDrawSetSelectable   (g_ToolbarTextdraw[TD_TOOLBAR_MISC_INFO], 1);
}

DestroyToolbarTextdraws() {
    for(new td; td < MAX_TOOLBAR_TEXTDRAWS; td ++) {
        TextDrawDestroy(g_ToolbarTextdraw[td]);

        g_ToolbarTextdraw[td] = Text:INVALID_TEXT_DRAW;
    }
}

CreateToolbarKeyTextdraw(playerid, bool:mousemode) {
    if( g_ToolbarKeyTextdraw[playerid] != PlayerText: INVALID_TEXT_DRAW ) {
        PlayerTextDrawDestroy(playerid, g_ToolbarKeyTextdraw[playerid]);

        g_ToolbarKeyTextdraw[playerid] = PlayerText: INVALID_TEXT_DRAW;
    }

    if( mousemode ) {
        g_ToolbarKeyTextdraw[playerid] = CreatePlayerTextDraw(playerid, 637.0, 296.0, "~w~Press ~r~ESC ~w~to disable mouse mode");
    } else {
        if( GetPlayerState(playerid) == PLAYER_STATE_SPECTATING ) {
            g_ToolbarKeyTextdraw[playerid] = CreatePlayerTextDraw(playerid, 637.0, 425.0, "~w~Press ~r~~k~~PED_DUCK~ ~w~to enable mouse mode");
        } else {
            g_ToolbarKeyTextdraw[playerid] = CreatePlayerTextDraw(playerid, 637.0, 425.0, "~w~Press ~r~~k~~CONVERSATION_YES~ ~w~to enable mouse mode");
        }
    }

    PlayerTextDrawAlignment       (playerid, g_ToolbarKeyTextdraw[playerid], 3);
    PlayerTextDrawBackgroundColor (playerid, g_ToolbarKeyTextdraw[playerid], 255);
    PlayerTextDrawFont            (playerid, g_ToolbarKeyTextdraw[playerid], 3);
    PlayerTextDrawLetterSize      (playerid, g_ToolbarKeyTextdraw[playerid], 0.5, 2.0);
    PlayerTextDrawColor           (playerid, g_ToolbarKeyTextdraw[playerid], RGBA_WHITE);
    PlayerTextDrawSetOutline      (playerid, g_ToolbarKeyTextdraw[playerid], 2);
    PlayerTextDrawSetProportional (playerid, g_ToolbarKeyTextdraw[playerid], 1);
    PlayerTextDrawShow            (playerid, g_ToolbarKeyTextdraw[playerid]);
}

DestroyToolbarKeyTextdraw(playerid) {
    if( g_ToolbarKeyTextdraw[playerid] == PlayerText: INVALID_TEXT_DRAW ) {
        return 0;
    }

    PlayerTextDrawDestroy(playerid, g_ToolbarKeyTextdraw[playerid]);

    g_ToolbarKeyTextdraw[playerid] = PlayerText: INVALID_TEXT_DRAW;

    return 1;
}
