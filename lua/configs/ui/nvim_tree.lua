local icons = {
    diagnostics = require("configs.ui.icons").get("diagnostics"),
    documents = require("configs.ui.icons").get("documents"),
    git = require("configs.ui.icons").get("git"),
    ui = require("configs.ui.icons").get("ui"),
}

require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = false,
    },
    sort_by = "name",
    sync_root_with_cwd = true,
    view = {

        adaptive_size = false,
        centralize_selection = false,
        width = 30,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        hide_root_folder = false,
        float = {
            enable = false,
            open_win_config = {
                relative = "editor",
                border = "rounded",
                width = 30,

                height = 30,
                row = 1,
                col = 1,
            },
        },
    },
    renderer = {
        add_trailing = false,
        group_empty = true,
        highlight_git = false,
        full_name = false,
        highlight_opened_files = "none",
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "CMakeLists.txt" },
        symlink_destination = true,
        indent_markers = {
            enable = true,
            icons = {
                corner = "└ ",
                edge = "│ ",
                item = "│ ",
                none = "  ",
            },
        },
        root_folder_modifier = ":e",
        icons = {
            webdev_colors = true,
            git_placement = "before",
            show = {
                file = true,
                folder = true,
                folder_arrow = false,
                git = true,
            },
            padding = " ",
            symlink_arrow = "  ",

            glyphs = {
                default = icons.documents.Default, --
                symlink = icons.documents.Symlink, --
                bookmark = icons.ui.Bookmark,
                git = {
                    unstaged = icons.git.Mod_alt,
                    staged = icons.git.Add, --

                    unmerged = icons.git.Unmerged,
                    renamed = icons.git.Rename, --
                    untracked = icons.git.Untracked, -- "ﲉ"
                    deleted = icons.git.Remove, --
                    ignored = icons.git.Ignore, --◌
                },
                folder = {

                    -- arrow_open = "",
                    -- arrow_closed = "",
                    arrow_open = "",
                    arrow_closed = "",

                    default = icons.ui.Folder,
                    open = icons.ui.FolderOpen,
                    empty = icons.ui.EmptyFolder,
                    empty_open = icons.ui.EmptyFolderOpen,
                    symlink = icons.ui.SymlinkFolder,
                    symlink_open = icons.ui.FolderOpen,
                },
            },
        },
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    ignore_ft_on_setup = {},
    filters = {
        dotfiles = false,
        custom = { ".DS_Store" },
        exclude = {},
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
        },
        open_file = {
            quit_on_open = true,
            resize_window = false,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
        remove_file = {
            close_window = true,
        },
    },
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        debounce_delay = 50,
        icons = {
            hint = icons.diagnostics.Hint_alt,
            info = icons.diagnostics.Information_alt,
            warning = icons.diagnostics.Warning_alt,
            error = icons.diagnostics.Error_alt,
        },
    },
    filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
    },
    git = {
        enable = true,
        ignore = true,
        show_on_dirs = true,
        timeout = 400,
    },
    trash = {
        cmd = "gio trash",
        require_confirm = true,
    },
    live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = true,
    },

    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            dev = false,
            diagnostics = false,
            git = false,
            profile = false,
            watcher = false,
        },
    },
})