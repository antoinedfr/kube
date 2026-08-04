.ONESHELL:
SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c
# ==========================
INFO_COLOR := \033[36;1m
MENU_COLOR := \033[35;1m
SUCCESS_COLOR := \033[32;1m
ERROR_COLOR := \033[31;1m
WARNING_COLOR := \033[33;1m
NO_COLOR := \033[0m
# ==========================
ANSIBLE_DIR := ansible
DOCKER_DIR := docker

# ============================
.DEFAULT_GOAL := help
.PHONY: help check.tools

guard-%: ## prevents undefined variables
	@[ -n "$($*)" ] || { echo -e "$(ERROR_COLOR) $* is REQUIRED $(NO_COLOR)"; exit 1; }


help:  ## shows this help
	@echo -e "$(MENU_COLOR)==================== TARGETS ========================$(NO_COLOR)"
	grep -hE "^[a-zA-Z._-]+:.*?## .*$$" $(MAKEFILE_LIST) | sort |\
		awk -F ":.*?##" '{printf "$(INFO_COLOR)%-20s$(NO_COLOR)%s\n", $$1, $$2}'
	echo -e "$(MENU_COLOR)=====================================================$(NO_COLOR)"
