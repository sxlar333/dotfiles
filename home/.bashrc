# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Put your fun stuff here.

# random
alias ff='fastfetch'
alias pf='pfetch'
alias please='doas'
alias gentoo,='opencode run'
alias cmatrix='cmatrix-theme'
alias icat='kitten icat'
alias reboot='doas reboot'

# portage
alias install='doas emerge -av --autounmask=y'
alias remove='doas emerge --deselect'
alias select='doas emerge --select'
alias purge='doas emerge --depclean'

# portage: write the package.use/keywords/license changes emerge wants,
# let me review them in dispatch-conf, then actually build.
# usage: refresh <atom> [<atom>...]
refresh() {
	if [[ $# -eq 0 ]]; then
		echo "usage: refresh <atom> [<atom>...]" >&2
		return 1
	fi
	doas bash -c 'emerge -p --autounmask-write "$@" >/dev/null || true
		dispatch-conf
		exec emerge -av "$@"' _ "$@"
}

# rebuild everything affected by USE/profile changes
alias refreshworld='doas emerge -avuDN @world'

# reload env after "eselect profile set"
alias reload='env-update && source /etc/profile'

# bash
alias src='source ~/.bashrc'
alias bash-config='cat ~/.bashrc'
alias bash-edit='vim ~/.bashrc'

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

# local binaries
export PATH="$HOME/.local/bin:$PATH"
