# `-` -> change to previous directory
alias -- -='cd -'

# wrap git with hub if available
if [ -e ~/bin/hub ]
then
	alias git=hub
fi

# cabal             -> cabal-global
# cabal-dev         -> cabal
# cabal-dev ghci    -> ghci
# cabal-dev ghc-pkg -> ghc-pkg
#
# This keeps everything in the current sandbox, which is the sane way to go
# for something that's supposed to be a build tool and not a package manager
_ghci() {
	# launches cabal-dev ghci if file matching *.cabal is found in the current
	# directory or ghci if not
	FILTER=$(find . -maxdepth 1 -type f \( -name "*.cabal" \) )
	if [ -z ${FILTER} ]
	then
		ghci
	else
		cabal-dev ghci
	fi
}

_ghc_pkg() {
	# launches cabal-dev ghc-pkg if a "cabal-dev" directory is found or ghc-pkg
	# if not
	if [ -e "cabal-dev" ]
	then
		cabal-dev ghc-pkg
	else
		ghc-pkg
	fi
}

command -v cabal-dev >> /dev/null
if [ $? -eq 0 ]
then
	alias cabal-global=`which cabal`
	alias cabal=cabal-dev
	alias ghci=_ghci
	alias ghc-pkg=_ghc_pkg
fi
