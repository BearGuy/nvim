local glab = {}

function glab.gbrowse_line()
    r, c = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_command(string.format("%sGBrowse", r))
end

return glab
