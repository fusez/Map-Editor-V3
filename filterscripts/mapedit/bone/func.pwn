GetBoneName(boneid, name[], name_size) {
    switch( boneid ) {
        case 1:
            strunpack(name, !"Spine", name_size);
        case 2:
            strunpack(name, !"Head", name_size);
        case 3:
            strunpack(name, !"Left Upper Arm", name_size);
        case 4:
            strunpack(name, !"Right Upper Arm", name_size);
        case 5:
            strunpack(name, !"Left Hand", name_size);
        case 6:
            strunpack(name, !"Right Hand", name_size);
        case 7:
            strunpack(name, !"Left Thigh", name_size);
        case 8:
            strunpack(name, !"Right Thigh", name_size);
        case 9:
            strunpack(name, !"Left Foot", name_size);
        case 10:
            strunpack(name, !"Right Foot", name_size);
        case 11:
            strunpack(name, !"Right Calf", name_size);
        case 12:
            strunpack(name, !"Left Calf", name_size);
        case 13:
            strunpack(name, !"Left Forearm", name_size);
        case 14:
            strunpack(name, !"Right Forearm", name_size);
        case 15:
            strunpack(name, !"Left Clavicle", name_size);
        case 16:
            strunpack(name, !"Right Clavicle", name_size);
        case 17:
            strunpack(name, !"Neck", name_size);
        case 18:
            strunpack(name, !"Jaw", name_size);
        default: {
            format(name, name_size, "Invalid Bone (%i)", boneid);
            return 0;
        }
    }
    return 1;
}
