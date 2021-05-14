############################################
# Functions to get current git repo & current directory *within* that repo
#

__git_top() { echo `git rev-parse --show-toplevel`; }
__git_repo() { echo `git remote -v 2>/dev/null | grep origin | grep fetch | awk '{ print $2; }' | cut -d'/' -f 5 | cut -d'.' -f 1`; }
__git_cwd() { echo `echo $PWD | sed "s:$(__git_top)::"`; }

############################################
# Go to repo with given name
#

function gitgo() {
	if [ -d ${OKTA_HOME}/$1 ];
	then
		cd ${OKTA_HOME}/$1;
		return 0
	fi;
	if [ -d ${HOME}/github.com/$1 ]; 
	then
		cd ${HOME}/github.com/$1
		return 0
	fi;
	echo "No repository named <$1> is locally cloned"
	return 1
}
