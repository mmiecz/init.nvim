local wk = require("which-key")
local tele_builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "[U]ndoTree toggle" })
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {})
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "LSP [F]ormat" })
-- search and replace currently highlighted word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "[S]ubstitute point in file" })

wk.register({
    p = {
        name = "[P]roject (respects .gitgnore)",
        f = { function() tele_builtin.find_files() end, "[F]ind file" },
        g = { function()
            tele_builtin.live_grep()
        end, "Live[G]rep in project"
        }
    },
    l = {
        name = "[L]SP commands",
        d = { function() vim.lsp.buf.definition() end, "[G]o to definition" }
    },
    b = {
        name = "[B]uffers",
        b = { function() tele_builtin.buffers() end, "List [B]uffers" }
    }
}, { prefix = "<leader>" })
