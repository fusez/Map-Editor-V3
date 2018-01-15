GetAlignmentName(alignment, name[], name_size) {
    switch( alignment ) {
        case OBJECT_MATERIAL_TEXT_ALIGN_LEFT: {
            strunpack(name, !"Left", name_size);
        }
        case OBJECT_MATERIAL_TEXT_ALIGN_CENTER: {
            strunpack(name, !"Center", name_size);
        }
        case OBJECT_MATERIAL_TEXT_ALIGN_RIGHT: {
            strunpack(name, !"Right", name_size);
        }
        default: {
            format(name, name_size, "%i", alignment);
            return 0;
        }
    }
    return 1;
}
