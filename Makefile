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
	ln -s `stat -f "$(PWD)/%N" bin` $(HOME)/bin

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
	ln -s `stat -f "$(PWD)/%N" vim/vimrc` $(HOME)/.vimrc
	ln -s `stat -f "$(PWD)/%N" vim/gvimrc` $(HOME)/.gvimrc
	ln -s `stat -f "$(PWD)/%N" vim/vim` $(HOME)/.vim

uninstall-vim:
	rm -f $(HOME)/.vimrc
	rm -f $(HOME)/.gvimrc
	rm -f $(HOME)/.vim

install-zsh:
	ln -s `stat -f "$(PWD)/%N" zsh/zshrc` $(HOME)/.zshrc
	ln -s `stat -f "$(PWD)/%N" zsh/zshnv` $(HOME)/.zshenv
	ln -s `stat -f "$(PWD)/%N" zsh/zsh` $(HOME)/.zsh

uninstall-zsh:
	rm -f $(HOME)/.zshrc
	rm -f $(HOME)/.zshenv
	rm -f $(HOME)/.zsh

install-virtualenvwrapper:
	pip install virtualenvwrapper
	ln -s `stat -f "$(PWD)/%N" virtualenv` $(HOME)/.virtualenv
	pip install virtualenvwrapper.npm
	pip install virtualenvwrapper.gem

update-virtualenvwrapper:
	pip install --upgrade virtualenvwrapper
	pip install --upgrade virtualenvwrapper.{npm,gem}

uninstall-virtualenvwrapper:
	pip uninstall virtualenvwrapper
	pip uninstall virtualenvwrapper.{npm,gem}
	rm -f $(HOME)/.virtualenv

install-pyflakes:
	pip install "hg+http://bitbucket.org/birkenfeld/pyflakes-ast@experimental#egg=pyflakes"

update-pyflakes:
	pip install --upgrade "hg+http://bitbucket.org/birkenfeld/pyflakes-ast@experimental#egg=pyflakes"

uninstall-pyflakes:
	pip uninstall pyflakes

install-hg:
	cd hg/extensions && hg clone http://bitbucket.org/birkenfeld/hgbb
	cd hg/extensions && hg clone http://bitbucket.org/birkenfeld/hgpaste
	ln -s `stat -f "$(PWD)/%N" hg/hgrc` $(HOME)/.hgrc
	ln -s `stat -f "$(PWD)/%N" hg/extensions` $(HOME)/.hgextensions

uninstall-hg:
	rm -f $(HOME)/.hgrc
	rm -f $(HOME)/.hgextensions
	rm -rf hg/extensions/{hgbb,hgpaste}
