Float:fixrot(Float:r) {
    new laps = floatround(r / 360, floatround_floor);
    if( laps != 0 ) {
        r -= laps * 360.0;
    }
    return r;
}

PositionFromObjectOffset(objectid, Float:offset_x, Float:offset_y, Float:offset_z, &Float:x, &Float:y, &Float:z) {
	// Renamed GetAttachedObjectPos (Original made by Stylock)

    new
        Float:object_px,
        Float:object_py,
        Float:object_pz,
        Float:object_rx,
        Float:object_ry,
        Float:object_rz
    ;

    GetObjectPos(objectid, object_px, object_py, object_pz);
    GetObjectRot(objectid, object_rx, object_ry, object_rz);

    new
        Float:cos_x = floatcos(object_rx, degrees),
        Float:cos_y = floatcos(object_ry, degrees),
        Float:cos_z = floatcos(object_rz, degrees),
        Float:sin_x = floatsin(object_rx, degrees),
        Float:sin_y = floatsin(object_ry, degrees),
        Float:sin_z = floatsin(object_rz, degrees)
    ;

    x = object_px + offset_x * cos_y * cos_z - offset_x * sin_x * sin_y * sin_z - offset_y * cos_x * sin_z + offset_z * sin_y * cos_z + offset_z * sin_x * cos_y * sin_z;
    y = object_py + offset_x * cos_y * sin_z + offset_x * sin_x * sin_y * cos_z + offset_y * cos_x * cos_z + offset_z * sin_y * sin_z - offset_z * sin_x * cos_y * cos_z;
    z = object_pz - offset_x * cos_x * sin_y + offset_y * sin_x + offset_z * cos_x * cos_y;
}
