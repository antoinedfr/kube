.PHONY: ansible.config
ansible.config: ## configures the managed node
	@ansible-playbook $(ANSIBLE_DIR)/playbook.yml
