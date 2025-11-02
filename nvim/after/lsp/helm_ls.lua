return require("schema-companion").setup_client(
	require("schema-companion").adapters.helmls.setup({
		sources = {
			-- Kubernetes matcher for Helm templates - includes CRDs from datreeio
			require("schema-companion").sources.matchers.kubernetes.setup({
				version = "master",
			}),
		},
	}),
	{
		-- Your helm_ls configuration
		settings = {
			["helm-ls"] = {
				yamlls = {
					enabled = true,
					diagnosticsLimit = 50,
					showDiagnosticsDirectly = false,
					path = "yaml-language-server",
					config = {
						schemas = {},
						validation = true,
						completion = true,
						hover = true,
					},
				},
			},
		},
	}
)
