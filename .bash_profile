# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

alias sub='subl'

alias git-lo="git log --oneline"
alias git-edit='git config --global -e' 
alias git-name='git config --global user.name' 
alias git-email='git config --global user.email' 
alias git-log='git log --oneline --decorate --graph' 
alias git-s='git status -s' 
alias git-sw='git switch -C'
alias git-stat='git log --stat' 
alias git-patch='git log --patch' 
alias git-c='git checkout -' 
alias git-b='git branch'
alias git-d='git branch -d'	# Delete a branch -- git branch -d <branch-name>
alias git-cm='git commit -m'	# Commit changes -- git commit -m <commit-message>
alias git-a='git add .'

alias start="gio open"

alias open-alias="gedit ~/.bash_profile"
alias source-alias="source ~/.bash_profile"
alias open-bash="gedit ~/.bash_prompt"
alias source-bash="source ~/.bash_prompt"

alias goto-jiva="cd ~/jiva/jiva_buildout"
alias goto-module="cd ~/jiva/jiva_buildout/modules"
alias goto-zeo="cd ~/jiva/jiva_buildout/modules/zeo_build"
alias goto-mem="cd ~/jiva/jiva_buildout/modules/memcached_build"
alias goto-zope="cd ~/jiva/jiva_buildout/modules/zope_build"
alias goto-stl="cd ~/jiva/jiva_buildout/modules/sentinel_build"

alias setup-jiva="sudo yum installgcc gcc-c++ make openssl-devel bzip2-devel zlib-devel readline readline-devel libxml2-devel libxslt-devel glib2-devel enchant unixODBC libevent-devel python-devel unixODBC-devel libaio sqlite-devel libffi-devel db4-devel"
alias setup-zeo="cd ~/jiva/jiva_buildout/modules/zeo_build;../../usr/bin/buildout -c linux_64bit.cfg"
alias setup-mem="cd ~/jiva/jiva_buildout/modules/memcached_build;../../usr/bin/buildout -c linux_64bit.cfg"
alias setup-zope="cd ~/jiva/jiva_buildout/modules/zope_build;../../usr/bin/buildout -c linux_64bit.cfg"
alias setup-stl="cd ~/jiva/jiva_buildout/modules/sentinel_build;../../usr/bin/buildout -c linux_64bit.cfg"

alias start-setup="../../usr/bin/buildout -c linux_64bit.cfg -vvv"
alias start-zeo="cd ~/jiva/jiva_buildout/modules/zeo_build;./bin/zeo_svc start"
alias start-mem="cd ~/jiva/jiva_buildout/modules/memcached_build;./bin/memcached_svc start"
alias start-zope="cd ~/jiva/jiva_buildout/modules/zope_build;source bin/mssql_odbc.sh; ./bin/zope_fixed_install fg"
alias start-stl="cd ~/jiva/jiva_buildout/modules/sentinel_build;"
alias start-win='xfreerdp --plugin cliprdr -u jriyaz -g 1366*768 172.27.2.11'

alias stop-zeo="./bin/zeo_svc stop"
alias stop-mem="./bin/memcached_svc stop"

alias zope-threads="gedit ~/jiva/jiva_buildout/modules/zope_build/parts/zope_fixed_install/etc/zope.conf"


alias db-source="source bin/mssql_odbc.sh"
alias db-string="mssql+mxodbc://jiva_65dev_user:J!va_6S03V_user@Jiva_65"
alias mirror-db-string="mssql+mxodbc://jiva_65dev_user:J!va_6S03V_user@jiva_65_dev_sc"

alias big-ip='route add 192.168.0.0 mask 255.255.0.0'

