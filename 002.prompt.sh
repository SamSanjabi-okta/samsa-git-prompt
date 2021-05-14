###
# Functions to print bits of my prompt
#
__ss_ps1_gitrepo() { echo "\[\e[0;34m\]$(__git_repo)\[\e[m\]"; } 
__ss_ps1_gitbranch() { echo "\[\e[0;32m\]\$(__git_ps1 '%s')\[\e[m\]"; }
__ss_ps1_gitcwd() { echo "\[\e[0;35m\]$(__git_cwd)\[\e[m\]"; }
__ss_ps1_cwd() { echo "\[\e[0;35m\]\w\[\e[m\]"; }
__ss_ps1_histn() { echo "\[\e[0;33m\]\!\[\e[m\]"; }

###
# Conditional prompt depending on whether or not I'm in a git repo
#
__ss_ps1() {
	if [ -z $(git rev-parse --git-dir 2> /dev/null) ]; then
		export PS1="\n\T [$(__ss_ps1_cwd)]\n[$(__ss_ps1_histn)]\$ "
	else
		export PS1="\n\T [$(__ss_ps1_gitrepo)] [$(__ss_ps1_gitbranch)] [$(__ss_ps1_gitcwd)]\n[$(__ss_ps1_histn)]\$ "
	fi;
}

case "$TERM" in
xterm*|rxvt*)
	source /usr/local//etc/bash_completion.d/git-completion.bash
	GIT_PS1_SHOWDIRTYSTATE=1
	GIT_PS1_SHOWSTASHSTATE=1
	GIT_PS1_SHOWCOLORHINTS=1
	GIT_PS1_SHOWUPSTREAM='auto'

	PROMPT_COMMAND='__ss_ps1'
	;;
esac
