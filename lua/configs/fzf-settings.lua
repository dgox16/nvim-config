local present, fzf = pcall(require, "fzf-lua")
if not present then
    return
end

fzf.setup({
    files = {
        git_icons = false,
        file_icons = false,
        color_icons = false,
        rg_opts = "--color=never --files --hidden --follow -g '!.git' -g '!node_modules'",
        fd_opts = "--color=never --type f --hidden --follow --exclude .git --exclude node_modules",
    },
    grep = {
        input_prompt = "Palabra a buscar ❯ ",
        git_icons = false,
        file_icons = false,
        color_icons = false,
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=512 -g '!node_modules' -g '!package-lock.json'",
    },
})
