<#
Capt McKinney
Capt Morgan
03OCT2023
Dark Lord Triage
#>
#Welcome player to game 

function GameStart {
    Write-Host "Ahoyhoy Challenger!"
}
function RequestInput {

    $int_iterator = 1

    $character_array = ("Darth Vader", "Sauron", "Voldemort")

    "The fight for Dark Side supremacy begins now!!!"

    foreach ($dark_lord in $character_array) {
        "$int_iterator $dark_lord"
        $int_iterator ++
    }

    do {
        [int]$PlayerChoice = Read-Host "Choose your Dark Lord for battle! (Enter 1-3):"
    }
    while ($PlayerChoice -notin 1..3)

    Write-Host "You have chosen $PlayerChoice"
    DisplayCharacter $PlayerChoice
    CPUChooses $PlayerChoice
}
#Randomly generate a number from 1 to 3
function CPUChooses ($PlayerChoice) {
    [int]$CPUChoice = 1..3 | Get-Random

    write-host "The Gods have chosen $CPUChoice" 
    DisplayCharacter $CPUChoice

    PickWinner $PlayerChoice, $CPUChoice
}
function PickWinner ($PlayerChoice, $CPUChoice) {
    switch ($PlayerChoice, $CPUChoice) {
        (1, 1) { "Tie"; $Result = "Tie" }
        (1, 2) { "CPU"; $Result = "CPU"; $script:numofcpu++ }
        (1, 3) { "Player"; $Result = "Player"; $script:numOfPlayer++ }
        (2, 2) { "Tie"; $Result = "Tie" }
        (2, 1) { "Player"; $Result = "Player"; $script:numOfPlayer++ }
        (2, 3) { "CPU"; $Result = "CPU"; $script:numofcpu++ }
        (3, 3) { "Tie"; $Result = "Tie" }
        (3, 1) { "CPU"; $Result = "CPU"; $script:numofcpu++ }
        (3, 2) { "Player"; $Result = "Player"; $script:numOfPlayer++ }     
    }

    Write-Host "TESTING... $script:NumOfPlayer - $script:NumOfCPU"  

    DisplayWinner $Result
}

function DisplayWinner ($Result) {  
    if ($result -eq "Tie") {
        "You're Both Losers!"
    }
    elseif ($result -eq "CPU") {
        "The Gods Prevail!"
    }
    else {
        "Humanity Wins...For Now!"
    }

    "The Winner is $result"

    Write-Host "$script:NumOfPlayer - $script:NumOfCPU"     

    PlayAgain
}

function PlayAgain {
    do {
        [int]$StartOver = Read-Host "Enter 1 to Restart. Enter Any Other Number to Quit."
    }
    while ($StartOver -notin 0..9)

    if ($StartOver -eq $true) {
        RequestInput
    }
    else {
        Write-host "GAME OVER"
    }
}

function DisplayCharacter($PlayerChoice) {
    switch ($PlayerChoice) {
        1 { DisplayDarthVader }
        2 { DisplaySauron }
        3 { DisplayVoldemort }
    }
}

function DisplayVoldemort{
    Write-Host "

..........................&**......**(##(%%#######((((#((#//(((((//.........................../////.
........................*#%(......*/(#%#%#%##((##(((((((#(///(///(//......................./////////
.........................(%*.....*.*#%%###((###(((((((((((////*#/***..........................././//
.........................%%.....*.*(%%##(#(#((((((((/(((((/(///******............................../
.........................@#.....*.//%%##(((#(##(/((//(/(((///**/******........................./././
.........................&/......*(*#%#######((((/(////(/(((*****.****...........................///
.........................&(......*/(####(##(####((///////*/*.***/******//...........................
........................(%#.......((%####(%&%%%#(##%%%&%##((/**///**#((/%(..........................
........................*%*......(##(#&&&##(((//%&%###(/(%%#/((/*(*.*/&((%..........................
........................(&*......(*(#(%%%(%(((//((%###(/(((((((//*.*(*&#((..........................
........................(%*......***(###/.#((/////*((#(((((#(((/****(#/*#...........................
........................#%........*/(/(**.*#(((((#(((#(((((##(/((/**#((.............................
...........(#(..........##.........*/*#%#*.#((((((%&%#(**/*//(((//*.#/..............................
.........../((((*......*%#.........**.##%*&.%(@((//(/%%#(*////*/(*.*%...............................
......../%/...####(//...@#...........*%%#*./%##(/((((//&#////./(/**/#*/.............................
........*/((#(./&##((//%(((...........*%*.####((##((((((#(/*(*//(*&%&&((//..........................
............####((&&%#(//%#(...........(%&%%####(##((((%#(//(*(/(@&&&%%%/...........................
........((/***##(#%&%%##(/(##/........./#.*#(#%#%#((///(((*#/(%@&&&&((%@&&..........................
........*.%(((#(#((/#&%%((/.%#(/.........*....*(%#(((((///((@@&&&&%&&@&@&&*///......................
.............*%#&%#(((/%%#(**//*...........*../##((/(//(##&&&&&&&&&&&&@@&%*%/(#(....................
............(.%(///((//*#((*//*/.............*/#%##%#%&&&&&&&&&&@@@@@@@@&@#%%#%%&##/................
..........*&%%#(/(##(/(/(((.///..............((..%/@@@@@@@@@&@@@@@@@@@@@@@&&@((%#%#(#(..............
...........%%#%(((((#/((/(/*//(.............#*%(&&@@&@@@@@@&@@@@%&&&@@@@%@@@@@@@%#%((((#/***........
...........(###(((#(#(((((//(#..........*.#%*(#@#(/(%@@@@@@#/&%%(&##%((%&@@@@@&%((@@&###%%%(........
...........(##((((((((((###(#(.....*/.*.(&*/(/(&@@&%&@@@((/&&%(&/(&(#(@@@@@@%(##%@@@@#(&&%####(.....
............%%(//(#(#((%%%%%%/...*.*/.(&(*/(&@&%&%(%@#%&&//(#&&&&&&&@@@@@&%@@@@@@@@@@@&@@@#####(/...
.............##(/(##(##(#%%%%#.....*(%((#&&@////%&&(&&@#*/(&@@@@@@@@@@@@@@@@@@@@@@@@@@&&@&%%((((((..
..............######(##%%%%%%%....(#/&&&&&#///&(//@@&%//(%&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%##(((//.
..............*###%%%%%%%%%%&%&.((*#&@@@#((*/(((@@&@/((%#.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#@@%%%(((////
...............*#%%%%%%%%%%&&&&&*/(@@&/(/((%&&@@@@@@@@@&&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&##%(/////
................*#%%%%%%%%&&&&&&&@@%%#%%%&&@@@@@@@@@@@&&&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%(%#/////
........../@*..*.#%%%%%%&&&&&&&&&&@@@@@@@@@@@@@@@@@@@&&&&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#(((////
.........@&.#..#%*#%%%&&%&&&&&&&&&&@@@@@@@@@@@@@@@@@@&&&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&((/////
.......#&%*%*.##%(/%%%&&&&&&&&&&&&&&&&@@@@@@@@@@@@@@&&&&&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&#(////(

"
}

function DisplaySauron{
    Write-Host " 

                                                                    *,                              
                                              *                     .(,                             
                                             ,/.                     %/                             
                                             .#(      .              (%*                            
                                              %%(     .(     /       *##                            
                                              ,%(.     *#    #/      ,##                            
                                               #&(     ##,   (%  (    %%,                           
                                                &((    ,(#   //& #,   %#/                           
                                                 ((,    (((  *(/(%#   &##                           
                                                 /(%    %/% (((%%%(   /&#                           
                                                  /##   *(#%%%%#/&(#, .%(                           
                                                  ,##% /###%#((/#&%(&&(%%.                          
                                                   (%&&(%%#%%&&%*&%#%&##                            
                                                    ##/%%&%#%&%(/%&%%&%(                            
                                                      *%#%%%##%(#&@(#&%%#                           
                                            .         ##&%&%#&%&@@&(&%#%                            
                                          .(#*        (%#%(#&%%#/&%%(%%#                            
                                         ***/%&       *%&%&@(&#%&%%%#&&&                 ,,,.*      
                                          .(#%#%,       (%(&(&&&(&%(&@%&.             **//*/        
                                         /(/(#%%%,       &&&(&%%%%%#&@%             (%##(%/**,      
          ,(#                             .(,&&(&        /%&/#%%&&@%&#             #&%/((/%.        
            %((                           /%*&&(%%%/      *&/(%/%&@#&&(          .#/%/@&%*          
      .%&&%&/&&%,                      /#%(#&%&%#&%&#*(%@#&&(#%%%&&&@%#&##(%# ((%(*(/@@%&/          
    /#/  ,@&@@@&*#,                   ###(****(%%((%&%%&%%&%###@@%%#/(#*((##%#&((&&@(%%%%&%*        
  ,(#&@@@&%@@&@&&&%(                 .#(((%(/*/((&%%&#(#&#%#%#%&%((%#(##%(#&,(((#&%##%#%&%%#*       
  ((@&%&(&&@@@&&@@&&&(               #####%%%#%&&%%&#/%#/&%&%#@####%##@&&%%&&//##(&%%###&###%       
 (%/./(&@@@&&&@@@@&&&&%&%#((,   */*/%/%##/#%/(/@&##&#%#(%(@&%%##(#(@##%%@%&@@@#((#%#&%%#%#%%%       
          #&&&&&@@&&&@&@&%###((%%&@#%%&&@&#%%(%%#(%#%%#/@%%%&%(((###(/%&@&&@@@@&(##%&%%%%#%%%#      
             @@&&&&&&&&&&%%&&&%##&%&%&&(&@@@@&##(&#%%#@@@(###&%&%(#%/&%%&&&&@@@@@#%&&&%%%%%*        
                    /%%%##%&&%%%%%@@%&%%%&&(    *@@@@@@&@@&@#(/&#%&%%%%@%&&&&@@@@@&%&&%#%(/         
                   ,%*###%%#%%#%#@&%#%&&%&       @@@@@&&@&&@#(//(#(&###%#@&&&&@&/@@&&%%#(##.        
                      &##&@&%(&&#@&%#&%          .@@&%%&%&&@&(%#/%##@#%##&&&&&@&@ @@%&%%(/&##       
                      (((#&%%%&&@@&/.            .@&&(//@@&&&%####%&&&%(#&&&&&&&@,.&&&%%%&@@&#(     
                      .//((/#%(%/(*              .@@@@@@@@&%&###%%&&&@&&&@&&&&&&&@@&@@&&&&&@%%##.   
                                                 @&&&@@%@&@%&%%##(%%&&%@@@&&&&&&&@@@@@@&%&%#%%%%%#  
                                                 #&&&@@@&&&&%%%#(&#&%&&@@@&&&&&&&@@&@%&@&#&#%%##%%% 
                                                .&&&@@@@%&&&&%%%%#&&&&&%@@&&&&&&&&@&&@(#####(%%*  *,
                                                 .&@#   (@@&&%%&%%&&&@@&@&&&&&&&&@&.                

                                                 "
}

function DisplayDarthVader{
    write-host "  

                                       *#//(#%&&.,/*.%#(//(,                                        
                                  *#&/#&&&&&&&&&@&*.(,&&&&&&(, /.                                   
                                .( (&@@& ,#&@&@&#*&&& @&&,../@&&* ,                                 
                              .*&&&&(*&&@@@@@@@@%@&&&#@@&&&@&%./%%//                                
                             ,(#&@& %&&&@&&@&&@@@(&&&##&&@@@&&&*/@# %                               
                            .#(&&& /&&&&&&&&%#(#&*&@&%/&&@@@&&&&(&  #%                              
                            %%(&&& %&&&&&&&%/,.,#*&&&%/%#&&&@&&&%&  #%/                             
                           .%&/(&&.#&&&&&&%#/.     (,*/  ,&&&&%&&&. %%%                             
                           #%&/.&@,  *#..*&%*.,. , ., %  .*&&%&&/.,,&&%(                            
                           %&&&/&&&@@&&@@@&&@%@&@*#%##(%@&&@&&(/%&(&&&&%                            
                           %%# *&#&&#&&@@&&&&&#@@*.&&%%&&%###%%%(*,&% *%*                           
                           %%&/&.@&@@&%.,//(%@&&@&%&&%&&&@&@%%#&@@@@@@*.*                           
                          /&%*#@@@@&%&&&&&##..&&&&((%@&&@%/,,.,%&&&@@@&@(*                          
                         *%&,@@@@@&&&&&&&&,,%&&&@&#%@@&&&&@&@&@@&@&@@@@@&%*                         
                        .&&#&@@@&@@@@&%%##, (&&@&&#.#&&#,(%%&@&@@@@@@@@@&&%,                        
                       .&#@&@&@@@@@@@@&&&@@&,((#/%&%(@@&&%#%%&@@&@@@@@@@@&&%                        
                       %%@&&&@@@@@@&&@&&&&&@@&&@@#%/%@@&(,.*##%@@&&&@@@@@@&&%                       
                      &%&&@@@@@@@@&@,/%%%#  *(###(&@&&&#(&&@&&#(%@#@&@@@@@@&&#                      
                     ##&@&@@@@@@@@&&&%%&%( ./(%&(&.  ,#%@@&&#//(#&#&@@@@@@@@@&,                     
                    *%&&&@@@@@@@@&&%%%&&&#&&@&(%%&&&&&@(%@%&(*,(##@@@@@@@@@@@@@                     
                   *#&@@@@@@@@@@@&@&##%&@,&&,(#&@@&&&&&@(/@&(&&/%&@@@@@@@@@@@&&(                    
                  ,(@@@@@@@@@@@@@&&&@#//&&&**&&&&(%&#%&&&&*@&%(&@@@@@@@@@@@@@@&%                    
                 #%&@&@@@@&&@@@&&&&%%&#,&(@&&%(&&*%%/#&##&&*%&#@&@@@@@@@@@@@@@&&(                   
                          ....&@&&&%&&(  &%#%#(((//**/((((((%* .&@&&@&@@@&&%(*.                     
                        .,,*@@@@&@#%@&&@@&@@&#%#####%#%#%#@&&&&@@@@&#                               
                    *&&&&@&@&&@@&&&&&&&&&&&@@@@@&&&&%%&@&@&@@@@@@@@@@@.                             
                 .#&&@&&&&@@@@@@@@&%%&&&@&&@&&&&@@@@@@@@@&&@@@@@@@&&&&&&&&&(,                       
               /%&%&&&&&&&&&&@@@@@@@%####&&&&@&@@@@&&&&#&@&&&&@@@@&@&@&&&&@&&%%#(/,.,.              
            ,/##%#%####%%&&&&&&&&@@@@@&%,&&&&%##(#(/.../&&&#&@@@&&&&&&&&&&&&&%((((/**,, .           
         .*/((((##(((((#%%&&&&&@&&&@&&@@@&&&&&&&&&%%##%&@&@@&&&&&&%&&&&&&@&&&&%%#(#((/**,..         
       .,*/*///(((((/(##%%%&&&&&&&&&&&@&@@@&&&&&@&@&&&&@&&*@&#*#&&&*###&&&&&&@&&((%#((///*,,        
     .,*//////((((/(##%%###%%%%%@&&&&&&&(&&&&&&&&&&@@@@&&#/@&&&&,./&,((/(*&/.*# @&##&%#((#(*,.      
    .*///*///((((((#%#####(##%&&&&&%(#&&&@*&&&&&&&&&&&&%%(..&@&&*, *%,(/* *&#*(,  *&&%%%####(,.     
    .,**////((##(####((((((#&&&@&&%%#((##%#(,..,**..,,/./,,./&&&*...%(.//. %&&&&   ,/@&#%###((,     
     .,*/////##%##(((//((/&%&@&&&##%#(*,/(%((&&&&(.(&&@(../. &&&@&&&*&/ . ..&&%%& .*///@%%##((,.    
      ..,**/(#%%#(/(///(%&&&&&&&@&#(/*.   .(((&%,&&&&&&%..,*,*&%&&&&&(%.     &%&*%   ,/(%&%#(*.     
            ......,,,*/##%&&#/%%&%&#**,      ./&(*&&&&(&(  .../#,&&((%((     .&%#*(    ,/##/,.      
                                               ......., ,,    .*,,#%,,(*,     .,.,...*,....
                                               
                                               "
}


function Main {
    $script:numOfPlayer = 0
    $script:numOfCPU = 0

    GameStart
    RequestInput
}
cls
Main