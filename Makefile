help:
	@echo "Commands:"
	@echo "    update-bundles - updates all bundles"
	@echo
	@echo "Install:"
	@echo "    (un)install-hub - Git wrapper that adds GH support"

update-bundles:
	git submodule foreach "git pull"

install-hub:
	curl http://defunkt.io/hub/standalone -sLo bin/hub
	chmod +x bin/hub

uninstall-hub:
	rm -f bin/hub
