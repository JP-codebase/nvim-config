return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},

	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				formatting = {
					fields = { "abbr", "kind", "menu" }, -- Controls what is shown
					format = function(entry, vim_item)

						-- Safely truncate the 'menu' field only if it is not nil
						local max_menu_width = 20 -- Adjust this number as needed
						if vim_item.menu ~= nil and #vim_item.menu > max_menu_width then
							vim_item.menu = string.sub(vim_item.menu, 1, max_menu_width) .. "…"
						end

						-- Truncate abbr to a max width (e.g., 30 characters)
						local max_width = 30
						if #vim_item.abbr > max_width then
							vim_item.abbr = string.sub(vim_item.abbr, 1, max_width) .. "…"
						end
						return vim_item
					end,
				},

				window = {
					completion = cmp.config.window.bordered({
						winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
					}),
					documentation = cmp.config.window.bordered({
						winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
					}),
				},

				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),

					["<C-e>"] = cmp.mapping.abort(),
					["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
