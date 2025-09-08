local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local c = require("libs.config")

-- Safely execute immediately
now(function()
	require("mini.notify").setup()
	vim.notify = require("mini.notify").make_notify()
end)
now(function()
	require("mini.icons").setup()
	require("mini.tabline").setup()
	require("mini.statusline").setup()
end)

later(function()
	require("mini.ai").setup()
	require("mini.comment").setup()
	require("mini.pairs").setup()
	require("mini.pick").setup()
	require("mini.surround").setup()
end)

now(function()
	add({
		source = "neovim/nvim-lspconfig",
		depends = { "williamboman/mason.nvim" },
	})
end)

later(function()
	add({
		source = "nvim-treesitter/nvim-treesitter",
		checkout = "master",
		monitor = "main",
		hooks = {
			post_checkout = function()
				vim.cmd("TSUpdate")
			end,
		},
	})
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "lua", "vimdoc" },
		highlight = { enable = true },
	})
end)

add({
	source = "nvim-neo-tree/neo-tree.nvim",
	checkout = "v3.x",
	depends = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
})
add({ source = "stevearc/oil.nvim" })
require("oil").setup({
	default_file_explorer = true,
})

add({ source = "aznhe21/actions-preview.nvim" })

add({
	source = "williamboman/mason.nvim",
	hooks = {
		post_checkout = function()
			vim.cmd("MasonUpdate")
		end,
	},
})
require("mason").setup({})

add({
	source = "williamboman/mason-lspconfig.nvim",
	hooks = {
		post_checkout = function()
			vim.cmd("MasonUpdate")
		end,
	},
})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"vtsls",
	},
	automatic_installation = true,
})

add({ source = "rebelot/kanagawa.nvim" })
add({ source = "RRethy/base16-nvim" })
add({ source = "zaldih/themery.nvim" })
require("themery").setup({
	themes = vim.fn.getcompletion("", "color"),
	livePreview = true,
})

add({
	source = "nvim-telescope/telescope.nvim",
	depends = {
		"nvim-lua/plenary.nvim",
	},
})
add({
	source = "danielfalk/smart-open.nvim",
	depends = {
		"kkharji/sqlite.lua",
		"nvim-telescope/telescope-fzy-native.nvim",
	},
})

add({
	source = "nvimtools/none-ls.nvim",
	depends = { "nvim-lua/plenary.nvim" },
})
add({ source = "jay-babu/mason-null-ls.nvim" })

later(function()
	add({
		source = "L3MON4D3/LuaSnip",
	})
	require("luasnip").setup({})
	require("luasnip.loaders.from_snipmate").lazy_load()
	require("luasnip.loaders.from_lua").lazy_load()

	add({
		source = "saghen/blink.cmp",
		depends = {
			"L3MON4D3/LuaSnip",
		},
	})
	c.load_conf("blink")
end)

later(function()
	add({ source = "lewis6991/hover.nvim" })
	c.load_conf("hover")
end)

later(function()
	add({ source = "folke/flash.nvim" })
	c.load_conf("flash")
end)

later(function()
	add({ source = "akinsho/toggleterm.nvim" })
	c.load_conf("toggleterm")
end)

later(function()
	add({ source = "stevearc/conform.nvim" })
	c.load_conf("conform")
end)

later(function()
	add({ source = "dnlhc/glance.nvim" })
	c.load_conf("glance")
end)
add({ source = "mrcjkb/rustaceanvim" })
