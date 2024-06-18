return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup({
            theme = 'doom',
            config = {
              header = {
                    	"            :h-                                  Nhy`               ",
                    	"           -mh.                           h.    `Ndho               ",
                    	"           hmh+                          oNm.   oNdhh               ",
                    	"          `Nmhd`                        /NNmd  /NNhhd               ",
                    	"          -NNhhy                      `hMNmmm`+NNdhhh               ",
                    	"          .NNmhhs              ```....`..-:/./mNdhhh+               ",
                    	"           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
                    	"           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
                    	"      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
                    	" .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
                    	" h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
                    	" hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ",
                    	" /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ",
                    	"  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ",
                    	"   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
                    	"     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
                    	"       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
                    	"       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
                    	"       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
                    	"       //+++//++++++////+++///::--                 .::::-------::   ",
                    	"       :/++++///////////++++//////.                -:/:----::../-   ",
                    	"       -/++++//++///+//////////////               .::::---:::-.+`   ",
                    	"       `////////////////////////////:.            --::-----...-/    ",
                    	"        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
                    	"         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ",
                    	"           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ",
                    	"            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``",
                    	"           s-`::--:::------:////----:---.-:::...-.....`./:          ",
                    	"          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
                    	"         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
                    	"        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
                    	"                        .-:mNdhh:.......--::::-`                    ",
                    	"                           yNh/..------..`                          ",
                    	"                                                                    ",}, --your header
              center = {
                {
                  icon = ' ',
                  desc = 'Open Float Term',
                  keymap = 'SPC t',
                  key = 'f',
                  key_format = ' %s', -- remove default surrounding `[]`
                  action = '<cmd>:ToggleTerm direction=float name=float<CR>'
                },
              },
              footer = {}  --your footer
            }
          })
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
