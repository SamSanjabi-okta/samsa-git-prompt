# samsa-git-prompt

## Prerequisites
1. Only supports bash
2. Must have `__git_ps1` command available.  If you don't have this download the script from here and source it: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
3. `/usr/local/etc/bash_completion.d/git-completion.bash` needs to exist

## Installation
1. Add the following to your `~/.bashrc`:
```
# ~/.bashrc.d support
if ls -A "${HOME}"/.bashrc.d/*.sh >/dev/null 2>&1; then
  for file in "${HOME}"/.bashrc.d/*.sh; do
    source "${file}"
  done
fi
```
2. Create a `.bashrc.d` directory in your home folder
3. Copy `001.git.sh` and `002.prompt.sh` into `~/.bashrc.d`
4. Open a new terminal window

## Cool gif
![GitPromptLag](https://user-images.githubusercontent.com/46615457/118318022-cf565d00-b4c6-11eb-8a41-cfc869987e61.gif)
