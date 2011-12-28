help:
	@echo "Commands:"
	@echo "    update-bundles                 -  updates all bundles"
	@echo "    clean                          -  Like uninstall but includes repo contents"
	@echo "    help                           -  Show this help"
	@echo "    (un)install                    -  Everything (requires root)"
	@echo "    (un)install-hub                -  Git wrapper that adds GH support"
	@echo "    (un)install-lodgeit            -  Lodgeit pasting"
	@echo "    (un)install-vim                -  (G)vim configuration"
	@echo "    (un)install-zsh                -  ZSH configuration"
	@echo "    (un)install-virtualenvwrapper  -  Virtualenvwrapper (requires root)"
	@echo "    (un)install-pyflakes           -  PyFlakes (requires root)"
	@echo "    (un)install-hg                 -  Mercurial configuration"

update-bundles:
	git submodule foreach "git pull"

clean: uninstall
	rmdir bin

install: install-hub install-lodgeit install-vim install-zsh \
         install-virtualenvwrapper install-pyflakes install-hg

uninstall: uninstall-hub uninstall-lodgeit uninstall-vim uninstall-zsh \
           uninstall-virtualenvwrapper uninstall-pyflakes uninstall-hg

update: update-hub update-lodgeit update-virtualenvwrapper update-pyflakes

prepare-bin:
	mkdir -p bin

install-hub: prepare-bin
	curl http://defunkt.io/hub/standalone -sLo bin/hub
	chmod +x bin/hub

update-hub: install-hub

uninstall-hub:
	rm -f bin/hub

install-lodgeit: prepare-bin
	curl http://dev.pocoo.org/hg/lodgeit-main/raw-file/tip/scripts/lodgeit.py -sLo bin/lodgeit
	chmod +x bin/lodgeit

update-lodgeit: install-lodgeit

uninstall-lodgeit:
	rm -f bin/lodgeit

install-vim:
	ln -s `readlink -f vim/vimrc` $(HOME)/.vimrc
	ln -s `readlink -f vim/gvimrc` $(HOME)/.gvimrc
	ln -s `readlink -f vim/vim` $(HOME)/.vim

uninstall-vim:
	rm -f $(HOME)/.vimrc
	rm -f $(HOME)/.gvimrc
	rm -f $(HOME)/.vim

install-zsh:
	ln -s `readlink -f zsh/zshrc` $(HOME)/.zshrc
	ln -s `readlink -f zsh/zshenv` $(HOME)/.zshenv
	ln -s `readlink -f zsh/zsh` $(HOME)/.zsh

uninstall-zsh:
	rm -f $(HOME)/.zshrc
	rm -f $(HOME)/.zshenv
	rm -f $(HOME)/.zsh

install-virtualenvwrapper:
	pip install virtualenvwrapper
	ln -s `readlink -f virtualenv` $(HOME)/.virtualenv

update-virtualenvwrapper:
	pip install --upgrade virtualenvwrapper

uninstall-virtualenvwrapper:
	pip uninstall virtualenvwrapper
	rm -f $(HOME)/.virtualenv

install-pyflakes:
	pip install "hg+http://bitbucket.org/birkenfeld/pyflakes-ast@experimental#egg=pyflakes"

update-pyflakes:
	pip install --upgrade "hg+http://bitbucket.org/birkenfeld/pyflakes-ast@experimental#egg=pyflakes"

uninstall-pyflakes:
	pip uninstall pyflakes

install-hg:
	ln -s `readlink -f hg/hgrc` $(HOME)/.hgrc

uninstall-hg:
	rm -f $(HOME)/.hgrc
