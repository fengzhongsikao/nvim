return {
  "nvimdev/dashboard-nvim",
  lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  opts = function()
    -- local logo = [[
    --      ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
    --      ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
    --      ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
    --      ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
    --      ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
    --      ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
    -- ]]

    local logo = [[
                                        +3631za                                                                    

                                  !83u3v*~^+++z                                                                    

                                nn;;^+*!vo;*^+z                                                                    

                                 3*;;*;~36*;*3     +nu!i1zno~ooovu3!                                               

                                  i*;;;;ua;;1n31;*~;;;;;++**;;;*;;;;u-                                             

                                   v;;;;~6*i3in;;;*;vi!uo^. ai**;;o6-                                              

                                    ^3**16o;;*3i336!1o*;+..   .^nu6u                                               

                                  1o;^6~;;!v36~ ............ .... .... ;81                                         

                                3~;;v631a81  ................ +v^ ....... ^33.                                     

                      izz     aa;*zz*;o1 ..................  .... ~i ........*8;                                   

                     zo;*i+  zn;na3!3* .  .............  ...  ...+63aa*........ z6o                                

          ~1iiiiiiiiiu*;*^1^      o1 ..   .. ..... ...............686633io^....... z8v                             

           -!o*;;;;;;;;*a1       6;....  ........................v6686!!!831 ..........v686!3+                     

              ^!z*;;;;;!.      o6 ...............................686686868i *i ........... !6                      

                 -iu;o!       1u ^..................... -..... z3688868666o.. !-......... !i                       

                    -%      -6  z ......................-........ -a666686;....~n.......-3n                        

                .+oai     o1 . o ......................-6 ..........- o386;......! .^v33u                          

            +iao***;!  i -  ..+..^ ......+.............;z1+......... .. i3v...... %  ~6%i~...-n33                  

                   -^ .1 ... o.. *.......!^............nn  vz ......;+...*3 ...... 6......     1o                  

                       n ...v .. +..... 3 3 ...........z*   .-6n ....n ............ 3.........n!z                  

                        n+.~....-..... i^ o;...........ao%      -63*  a ............ 6-..... 6!86   **             

                         .u.....-.....^aa  n;.^n... u38uu    +-   . -v1^............. 8... 1!6686v !683            

                         8 ......-... 6  -13i61 i3- ... !  -6666ii  .  i ............. %..+8868661u8866n           

                        v ...... ;... u   .v. .    ^nvvn6.  $668^6n+^^*+~.............. 6  188883!68686u           

                       --........n ..-;  -8668^ +^^^+^+^-      ^;u+^^^++6 ..............zu..6886!836863a           

                       u ........ a .-^ n.!%%z ..^^^^^+   .  ..^^^^^^^+.8+.............. 6+.u86!8618883-           

                      -*...........;^ i v~~^^-    ~  +. . z+ na-^^^^^^^ 3z ..............-i 1368i!i666i            

                      z............ 6!3^+^^^^^+ . z*a..;~^.^~   ^^^^^- a3i .............. 6 6888883886             

                      a-............a% ^^^^^^^+  z-      ^- .   .     666i .............. u!386886663.*i66^        

                      ;n........... !o  +^^+^-   -.      +.         u3666i .............. 1388866866868666*        

                       nu ..........z8 .              .. -.   .. +i368886^.------.... .-*1!888888688!i663v         

                          1%3uo;*^*;~u36!o~;;;;;******;~z.~33633663333!ii1uzvo;+.        .+~ui11iii11u+            

                                        ^+-                            .        .+^                                

                                      .^-..                                       .-++                             

                                          +^^++--...                      . *^+                                    

                                                ^-        .     ..      . ....----^^                               

                                                    .++^^^++++^++^^++++-....                                       


    ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
          { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
          { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
          { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
          { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- open dashboard after closing lazy
    if vim.o.filetype == "lazy" then
      vim.api.nvim_create_autocmd("WinClosed", {
        pattern = tostring(vim.api.nvim_get_current_win()),
        once = true,
        callback = function()
          vim.schedule(function()
            vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
          end)
        end,
      })
    end

    return opts
  end,
}
