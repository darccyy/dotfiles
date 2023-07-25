require('nvim-treesitter.configs').setup {
	-- A list of parser names, or "all"
	ensure_installed = {
		-- """Mandatory"""
		"c", "lua", "vim", "vimdoc", "query",
		-- Other languages
		"rust", "go"
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- List of parsers to ignore installing (for "all")
	-- ignore_install = { "javascript" },

	highlight = {
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
}

-- Phonet syntax highlighting
-- ln -s ~/code/tree-sitter-phonet/queries ~/.config/nvim/queries/phonet
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.phonet = {
  install_info = {
    url = "~/code/tree-sitter-phonet", -- local path or git repo
    files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    -- branch = "master", -- default branch in case of git repo if different from master
    -- generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    -- requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  -- filetype = "phonet", -- if filetype does not match the parser name
}

