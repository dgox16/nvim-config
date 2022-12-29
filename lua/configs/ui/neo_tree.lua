vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
local status, neo_tree = pcall(require, "neo-tree")
if not status then
    return
end

neo_tree.setup({

    filesystem = {
        filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = false,
        },
        follow_current_file = true,
    },
})
