return require("schema-companion").setup_client(
	require("schema-companion").adapters.yamlls.setup({
		sources = {
			-- Kubernetes matcher - automatically matches K8s resources and CRDs
			-- CRDs are fetched from datreeio/CRDs-catalog
			require("schema-companion").sources.matchers.kubernetes.setup({
				version = "master",
			}),
			-- Static schemas for manual selection
			require("schema-companion").sources.schemas.setup({
				-- ArgoCD
				{
					name = "ArgoCD Application",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json",
				},
				{
					name = "ArgoCD AppProject",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/appproject_v1alpha1.json",
				},
				-- External Secrets
				{
					name = "ExternalSecret",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/external-secrets.io/externalsecret_v1beta1.json",
				},
				{
					name = "SecretStore",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/external-secrets.io/secretstore_v1beta1.json",
				},
				{
					name = "ClusterSecretStore",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/external-secrets.io/clustersecretstore_v1beta1.json",
				},
				-- cert-manager
				{
					name = "Certificate",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cert-manager.io/certificate_v1.json",
				},
				{
					name = "ClusterIssuer",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cert-manager.io/clusterissuer_v1.json",
				},
				{
					name = "Issuer",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cert-manager.io/issuer_v1.json",
				},
				-- Sealed Secrets
				{
					name = "SealedSecret",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/bitnami.com/sealedsecret_v1alpha1.json",
				},
				-- Prometheus Operator
				{
					name = "ServiceMonitor",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/monitoring.coreos.com/servicemonitor_v1.json",
				},
				{
					name = "PodMonitor",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/monitoring.coreos.com/podmonitor_v1.json",
				},
				{
					name = "PrometheusRule",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/monitoring.coreos.com/prometheusrule_v1.json",
				},
				-- Kyverno
				{
					name = "ClusterPolicy",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/kyverno.io/clusterpolicy_v1.json",
				},
				{
					name = "Policy",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/kyverno.io/policy_v1.json",
				},
				-- Rook Ceph
				{
					name = "CephCluster",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/ceph.rook.io/cephcluster_v1.json",
				},
				{
					name = "CephBlockPool",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/ceph.rook.io/cephblockpool_v1.json",
				},
				{
					name = "CephFilesystem",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/ceph.rook.io/cephfilesystem_v1.json",
				},
				{
					name = "CephObjectStore",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/ceph.rook.io/cephobjectstore_v1.json",
				},
				-- Kubernetes core resources
				{
					name = "Kubernetes (all resources)",
					uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone-strict/all.json",
				},
			}),
			-- Add "none" option to clear schema if needed
			require("schema-companion").sources.none.setup(),
		},
	}),
	{
		-- Your yamlls configuration
		capabilities = {
			textDocument = {
				foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true,
				},
			},
		},
		settings = {
			redhat = { telemetry = { enabled = false } },
			yaml = {
				keyOrdering = false,
				validate = true,
				hover = true,
				completion = true,
				format = {
					enable = true,
				},
				schemaStore = {
					-- Must disable built-in schemaStore to use schema-companion
					enable = false,
					url = "",
				},
				schemas = {},
				customTags = {
					"!reference sequence",
				},
			},
		},
	}
)
