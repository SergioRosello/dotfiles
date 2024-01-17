local function map(mode, key, fun, opts)
	vim.api.nvim_set_keymap(mode, key, fun, opts)
end

local function nmap(key, fun, opts)
	vim.api.nvim_set_keymap('n', key, fun, opts)
end

local function nmap_cmd(key, fun, opts)
	local rhs = string.format('<Cmd>%s<CR>', fun)
	opts = opts or {}
	opts.silent = true
	vim.api.nvim_set_keymap('n', key, rhs, opts)
end

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = ">",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {
      -- TODO add builtin options.
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {".git/", ".terraform/"},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}

local opts = { noremap=true, silent=true }

-- Buffer bindings
nmap('<leader><space>', '<cmd>:lua require("telescope.builtin").buffers()<cr>', opts)
nmap('<leader>ff', '<cmd>:lua require("telescope.builtin").git_files()<cr>', opts)
nmap_cmd('<leader>fg', ':lua require("telescope.builtin").live_grep()', opts)
nmap_cmd('<leader>fh', ':lua require("telescope.builtin").help_tags()', opts)
nmap_cmd('<leader>fk', ':lua require("telescope.builtin").keymaps()', opts)
nmap_cmd('<leader>fb', ':lua require("telescope.builtin").current_buffer_fuzzy_find()', opts)
nmap_cmd('<leader>ft', ':lua require("telescope.builtin").tags()', opts)
nmap_cmd('<leader>fm', ':lua require("telescope.builtin").marks()', opts)
-- nmap_cmd('<leader>fm', ':lua require("telescope.builtin").man_pages()', opts)

-- LSP bindings
nmap_cmd('<leader>r', ':lua require("telescope.builtin").lsp_references()', opts)
nmap_cmd('<leader>s', ':lua require("telescope.builtin").lsp_document_symbols()', opts)
nmap_cmd('<leader>S', ':lua require("telescope.builtin").lsp_workspace_symbols()', opts)

