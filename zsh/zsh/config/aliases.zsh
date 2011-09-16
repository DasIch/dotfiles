# `-` -> change to previous directory
alias -- -='cd -'
alias ack=ack-grep

# wrap git with hub if available
if [ -e ~/bin/hub ]
then
	alias git=hub
fi
