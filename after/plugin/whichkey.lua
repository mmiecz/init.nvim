local wk = require("which-key")
local tele_builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- respecting .gitignore

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "[U]ndoTree toggle" })

wk.register({
    f = {
        name = "[F]ile",
    },
    p = {
        name = "[P]roject (respects .gitgnore)",
        f = { function() tele_builtin.find_files() end, "[F]ind file" },
        g = { function()
            tele_builtin.live_grep()
        end, "Livegrep in project"
        }
    },
}, { prefix = "<leader>" })

