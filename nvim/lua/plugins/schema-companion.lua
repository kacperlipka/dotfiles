return {
	"cenk1cenk2/schema-companion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	ft = { "yaml", "helm" },
	opts = {
		log_level = vim.log.levels.INFO,
	},
	config = function(_, opts)
		require("schema-companion").setup(opts)
	end,
	keys = {
		{
			"<leader>cs",
			function()
				require("schema-companion").select_schema()
			end,
			desc = "Select schema",
			ft = { "yaml", "helm" },
		},
		{
			"<leader>cm",
			function()
				require("schema-companion").select_matching_schema()
			end,
			desc = "Select matching schema",
			ft = { "yaml", "helm" },
		},
	},
}
