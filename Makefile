help:
	@echo "Commands:"
	@echo "    update-bundles - updates all bundles"

update-bundles:
	git submodule foreach "git pull"
