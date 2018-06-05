GetMaterialSizeName(materialsize, name[], name_size) {
    new index = (materialsize / 10) - 1;

    if( index >= 0 && index < MAX_MATERIAL_SIZES ) {
        strunpack(name, g_MaterialSizeName[index], name_size);
    } else {
        format(name, name_size, "Unknown Material Size (%i)", materialsize);
    }
}

GetMaterialSize(search[]) {
    new size = INVALID_MATERIAL_SIZE;
    if( !sscanf(search, "i", size) ) {
        return size;
    }

    new packed_search[MAX_MATERIALSIZE_LEN+1 char];
    if( !ispacked(search) ) {
        strpack(packed_search, search, sizeof packed_search);
    }

    for(new i; i < MAX_MATERIAL_SIZES; i ++) {
        if( !strcmp(packed_search, g_MaterialSizeName[i]) ) {
            return ((i + 1) * 10);
        }
    }

    return INVALID_MATERIAL_SIZE;
}
