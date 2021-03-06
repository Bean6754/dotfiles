--                       _                _         
--                      | |              | |        
-- __  ___ __ ___   ___ | |__   __ _ _ __| |__  ___ 
-- \ \/ / '_ ` _ \ / _ \| '_ \ / _` | '__| '_ \/ __|
--  >  <| | | | | | (_) | |_) | (_| | |_ | | | \__ \
-- /_/\_\_| |_| |_|\___/|_.__/ \__,_|_(_)|_| |_|___/
--                                                  

-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

-- This is setup for a single 1920x1080 monitor
Config {
    font = "xft:Fixed-8",
    bgColor = "#000000",
    fgColor = "#990000",
    position = Static { xpos = 0, ypos = 0, width = 1920, height = 14 },
    lowerOnStart = True,
    commands = [
        Run Weather "KPAO" ["-t","<tempF>F <skyCondition>","-L","64","-H","77","-n","#CEFFAC","-h","#FFB6B0","-l","#96CBFE"] 36000,
        Run MultiCpu ["-t","Cpu: <total0> <total1> <total2> <total3>","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10,
        Run Memory ["-t","Mem: <usedratio>%","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Network "enp4s0" ["-t","Net: <rx>, <tx>","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Date "%a %b %_d %l:%M" "date" 10,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{ %multicpu%   %memory%   %swap%   %em1%   <fc=#FFFFCC>%date%</fc>   %KPAO%"
}
