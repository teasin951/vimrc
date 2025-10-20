# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# Outsource alias definitions
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# User defaults
EDITOR=vim

# git PS1 magic
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=0
    GIT_PROMPT_THEME=Default_Ubuntu
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

# --- for fzf ---
export FZF_COMPLETION_TRIGGER='??'
# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
export FZF_DEFAULT_OPTS="--preview '
if [ -d "{}" ]; then
    tree -C -a -L 1 "{}"
elif [ -f "{}" ]; then
    if file --mime-type "{}" | grep -q "text/"; then
        bat --color=always "{}"
    else
        stat "{}"
    fi
fi'
"
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix"  # for files search only current directory by default
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--bind 'ctrl-d:reload(fd --type f . $HOME),ctrl-f:reload(eval $FZF_DEFAULT_COMMAND)'"  # ctrl-d changes it to global
export FZF_ALT_C_COMMAND="fd --type d . $HOME"  # directories are searched from home and local directory
export FZF_ALT_C_OPTS="--bind 'ctrl-d:reload(eval $FZF_ALT_C_COMMAND),ctrl-f:reload(fd --type d --strip-cwd-prefix)'"  # ctrl-f to change that 
source /usr/share/fzf/shell/key-bindings.bash
