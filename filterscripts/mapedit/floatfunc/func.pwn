Float:fixrot(Float:r) {
    new laps = floatround(r / 360, floatround_floor);
    if( laps != 0 ) {
        r -= laps * 360.0;
    }
    return r;
}

Float:GetDistanceBetweenPoints(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2) {
    return VectorSize(x1-x2, y1-y2, z1-z2);
}

// Renamed GetAttachedObjectPos (Original made by Stylock)
PositionFromOffset(
	Float:  input_x,
	Float:  input_y,
	Float:  input_z,
	Float:  input_rx,
    Float:  input_ry,
    Float:  input_rz,
    Float:  offset_x,
	Float:  offset_y,
	Float:  offset_z,
	&Float: ret_x,
	&Float: ret_y,
	&Float: ret_z
) {
    new
        Float:cos_x = floatcos(input_rx, degrees),
        Float:cos_y = floatcos(input_ry, degrees),
        Float:cos_z = floatcos(input_rz, degrees),
        Float:sin_x = floatsin(input_rx, degrees),
        Float:sin_y = floatsin(input_ry, degrees),
        Float:sin_z = floatsin(input_rz, degrees)
    ;

    ret_x = input_x + offset_x * cos_y * cos_z - offset_x * sin_x * sin_y * sin_z - offset_y * cos_x * sin_z + offset_z * sin_y * cos_z + offset_z * sin_x * cos_y * sin_z;
    ret_y = input_y + offset_x * cos_y * sin_z + offset_x * sin_x * sin_y * cos_z + offset_y * cos_x * cos_z + offset_z * sin_y * sin_z - offset_z * sin_x * cos_y * cos_z;
    ret_z = input_z - offset_x * cos_x * sin_y + offset_y * sin_x + offset_z * cos_x * cos_y;
}
