help:
	@echo "Commands:"
	@echo "    update-bundles  -  updates all bundles"
	@echo "    help            -  Show this"
	@echo
	@echo "Install:"
	@echo "    (un)install-hub      -  Git wrapper that adds GH support"
	@echo "    (un)install-lodgeit  -  Lodgeit pasting"
	@echo "    (un)install-vim      -  (G)vim configuration"
	@echo "    (un)install-zsh      -  ZSH configuration"

update-bundles:
	git submodule foreach "git pull"

prepare-bin:
	mkdir bin

install-hub: prepare-bin
	curl http://defunkt.io/hub/standalone -sLo bin/hub
	chmod +x bin/hub

uninstall-hub:
	rm -f bin/hub

install-lodgeit: prepare-bin
	curl http://dev.pocoo.org/hg/lodgeit-main/raw-file/tip/scripts/lodgeit.py -sLo bin/lodgeit
	chmod +x bin/lodgeit

uninstall-lodgeit:
	rm -f bin/lodgeit

install-vim:
	ln -s `readlink -f vim/vimrc` $(HOME)/.vimrc
	ln -s `readlink -f vim/vim` $(HOME)/.vim

uninstall-vim:
	rm -f $(HOME)/.vimrc
	rm -f $(HOME)/.vim

install-zsh:
	ln -s `readlink -f zsh/zshrc` $(HOME)/.zshrc
	ln -s `readlink -f zsh/zshenv` $(HOME)/.zshenv
	ln -s `readlink -f zsh/zsh` $(HOME)/.zsh

uninstall-zsh:
	rm -f $(HOME)/.zshrc
	rm -f $(HOME)/.zshenv
	rm -f $(HOME)/.zsh
