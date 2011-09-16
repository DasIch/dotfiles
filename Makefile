help:
	@echo "Commands:"
	@echo "    update-bundles  -  updates all bundles"
	@echo "    help            -  Show this"
	@echo
	@echo "Install:"
	@echo "    (un)install-hub      -  Git wrapper that adds GH support"
	@echo "    (un)install-lodgeit  -  Lodgeit pasting"

update-bundles:
	git submodule foreach "git pull"

install-hub:
	curl http://defunkt.io/hub/standalone -sLo bin/hub
	chmod +x bin/hub

uninstall-hub:
	rm -f bin/hub

install-lodgeit:
	curl http://dev.pocoo.org/hg/lodgeit-main/raw-file/tip/scripts/lodgeit.py -sLo bin/lodgeit
	chmod +x bin/lodgeit

uninstall-lodgeit:
	rm -f bin/lodgeit
