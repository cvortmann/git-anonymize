BIN_DIR   = ~/bin
LOADER    = git-anonymize

.PHONY: help
.DEFAULT_GOAL := help

help:
	@grep -E '^[[:alnum:][:punct:]]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install git-anonymize to ~/bin
	install -d -m 0755 $(BIN_DIR)
	install -m 0755 $(LOADER) $(BIN_DIR)

uninstall: ## Remove git-anonymize from ~/bin
	test -d $(BIN_DIR) && \
	cd $(BIN_DIR) && \
	rm -f $(LOADER)
