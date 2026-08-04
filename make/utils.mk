check.tools: ## checks if softwares are installed
	@for software in terraform eksctl kubectl docker aws pre-commit git; do
		command -v "$$software" >/dev/null 2>&1 && echo -e "$(SUCCESS_COLOR) "$$software" ✅ $(NO_COLOR)" \
		|| echo -e "$(ERROR_COLOR) "$$software" absent ⚠️  $(NO_COLOR)";
	done
