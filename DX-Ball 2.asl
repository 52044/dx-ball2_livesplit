// autosplit for DX-Ball 2 20th Anniversary Edition (v2.3.0.0)
// by 52044
state("DXBall2") {
    int level : "DXBall2.exe", 0x1BA544;
    int pause : "DXBall2.exe", 0x1A70CC;
    int menu : "DXBall2.exe", 0x1A4090;
}

start {
    if (old.menu !=4 && current.menu == 4) {
        return true;
    };
    return false;
}

split {
    if (current.level > old.level) {
        return true;
    }
    return false;
}

isLoading
{
    if (current.pause == 1) {
        return true;
    }
    return false;
}

reset
{
    if (current.menu == 3) {
        return true;
    }
    return false;
}
