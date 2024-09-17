// autosplit for DX-Ball 2
// v2.1 by 52044

state("DXBall2", "2.3.0") {
    int level : "DXBall2.exe", 0x1BA544;
    int pause : "DXBall2.exe", 0x1A70CC;
    int menu : "DXBall2.exe", 0x1A4090;
}
state("DXBall2", "1.2") {
    int level : "DXBall2.exe", 0x1274E0;
    int pause : "DXBall2.exe", 0x03B238;
    int menu : "DXBall2.exe", 0x03B25C;
}
state("DXBall2", "1.0") {
    int level : "DXBall2.exe", 0x122F74;
    int pause : "DXBall2.exe", 0x0371A4;
    int menu : "DXBall2.exe", 0x0371C0;
}

init{
    // thx https://raw.githubusercontent.com/streetbackguy/Autosplitter-Projects/main/Livesplit.Bloodline.asl
    if (timer.CurrentTimingMethod == TimingMethod.RealTime){
        var timingMessage = MessageBox.Show (
            "LiveSplit is currently set to show Real Time (RTA).\nGame pause will not stop timer."+
            "Would you like to set the timing method to Game Time?",
            "LiveSplit | DX-Ball 2",
            MessageBoxButtons.YesNo, MessageBoxIcon.Question
        );
        if (timingMessage == DialogResult.Yes)
            timer.CurrentTimingMethod = TimingMethod.GameTime;
    }

    //print(modules.First().ModuleMemorySize.ToString());
    if (modules.First().ModuleMemorySize == 2908160){ // Steam, 2.3.0. rev 47836
        version = "2.3.0";
        vars.menu_select = 3;
        vars.menu_game = 4;
    } else if (modules.First().ModuleMemorySize == 2666496){ // 1.2
        version = "1.2";
        vars.menu_select = 2;
        vars.menu_game = 3;
    } else if (modules.First().ModuleMemorySize == 1994752){ // 1.0
        version = "1.0";
        vars.menu_select = 2;
        vars.menu_game = 3;
    };

    print("Detected version - " + version);
}

start {
    if (old.menu != vars.menu_game && current.menu == vars.menu_game) {
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
    if (current.pause != 0) {
        return true;
    };
    return false;
}

reset
{
    if (current.menu == vars.menu_select) {
        return true;
    }
    return false;
}
