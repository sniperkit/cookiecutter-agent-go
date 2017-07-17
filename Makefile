default: test

.PHONY: dependencies ci test
PARENT_DIR:="${GOPATH}/src/github.com/crucibuild"

dependencies:
	pip install --user cookiecutter

test: dependencies
	rm -rf "$(PARENT_DIR)/agent-foo"
	printf "\n\n\n\n\n\n\n\n" | cookiecutter "$(CURDIR)" -o "$(PARENT_DIR)"
	make -C "$(PARENT_DIR)/agent-foo" check
	rm -rf "$(PARENT_DIR)/agent-foo"

ci: test
	true
