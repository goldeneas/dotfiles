return {
  "ibhagwan/fzf-lua",
  dependencies = {
      "nvim-tree/nvim-web-devicons",
      { "junegunn/fzf", build = "./install --bin" }
  },
  config = function()
    require("fzf-lua").setup({
        defaults = {
            formatter = "path.filename_first",
            previewer = false,
            prompt = "> ",
            header = false,

            -- add gap betwenn marker and git icons
            -- change tab and s-tab keybinds
            -- -- tab goes down instead of up and viceversa
            -- -- tab and s-tab also mark files (idk what that does)

            winopts = {
                treesitter = true,
                backdrop = 100,
                width = 0.5,
                height = 0.5,
            },

            fzf_colors = {
                ["gutter"] = "-1",
                ["marker"] = "Red",
                ["pointer"] = "Red",
            },

            fzf_opts = {
                ["--layout"] = "default",
                ["--marker"] = "+ ",
                ["--cycle"] = true,
            },
        },

        files = {
            cwd_prompt = false,
        },

        oldfiles = {
            cwd_prompt = true,
        },

        profiles = {
            previewer = true,

            winopts = {
                height = 0.8,
                width = 0.8,
                preview = {
                    scrollbar = false,
                },
            }
        }
    })
  end
}
