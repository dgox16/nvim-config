vim.g.mkdp_filetypes = { "markdown" }

vim.cmd([[
function! MdpOpenPreview(url) abort
		let l:mdp_browser = '/mnt/c/Program\ Files\ \(x86\)/Microsoft/Edge/Application/msedge.exe'
		let l:mdp_browser_opts = '--new-window'
	execute join(['silent! !', l:mdp_browser, l:mdp_browser_opts, a:url])
	redraw!
endfunction

let g:mkdp_browserfunc = 'MdpOpenPreview'
]])

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.keymap.set("n", "<leader>b", ":MarkdownPreviewToggle<CR>", { noremap = true, silent = true })
    end,
})
