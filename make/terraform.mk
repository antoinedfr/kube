ENV ?= dev
TF_DIR := infra/envs/$(ENV)

.PHONY: tf.init
tf.init: ## 🚀initializes a terraform repo
	@terraform -chdir=$(TF_DIR) init -input=false -lock=true

.PHONY: tf.fmt
tf.fmt: ## formats the terraform configuration files
	@terraform -chdir=$(TF_DIR) fmt -diff -recursive

.PHONY: tf.fmt.check
tf.fmt.check:
	@terraform -chdir=$(TF_DIR) fmt -check -recursive

.PHONY: tf.fmt.ci
tf.fmt.ci: tf.fmt.check
