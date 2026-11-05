#!/bin/sh
# Install these dotfiles by symlinking each tracked file into $HOME.
#
# Existing files are moved to ~/.dotfiles-backup-<timestamp> first, so nothing
# is overwritten. Only files present in ./home are touched; unrelated files in
# ~/.config (browser profiles, gh tokens, etc.) are left alone.
#
# Usage:
#   ./install.sh              link the dotfiles
#   ./install.sh --dry-run    show what would happen
#   ./install.sh --uninstall  remove symlinks that point into this repo
#   ./install.sh --help
set -eu

REPO_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
SOURCE_DIR="$REPO_DIR/home"
DRY_RUN=0
UNINSTALL=0

usage() {
	cat <<'EOF'
Usage: ./install.sh [--dry-run | --uninstall]

  (no option)   Symlink every file under home/ into $HOME.
  --dry-run     Print the actions without changing anything.
  --uninstall   Remove symlinks that point into this repo.
  --help        Show this help.
EOF
}

for arg in "$@"; do
	case "$arg" in
	--dry-run) DRY_RUN=1 ;;
	--uninstall) UNINSTALL=1 ;;
	-h | --help) usage; exit 0 ;;
	*)
		echo "install.sh: unknown option: $arg" >&2
		usage >&2
		exit 1
		;;
	esac
done

if [ ! -d "$SOURCE_DIR" ]; then
	echo "install.sh: missing directory: $SOURCE_DIR" >&2
	exit 1
fi

BACKUP_ROOT="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

if [ "$UNINSTALL" -eq 1 ]; then
	find "$SOURCE_DIR" -type f | while IFS= read -r src; do
		rel=${src#"$SOURCE_DIR"/}
		dest="$HOME/$rel"
		if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
			if [ "$DRY_RUN" -eq 1 ]; then
				printf 'would remove %s\n' "$rel"
			else
				rm -f "$dest"
				printf 'removed %s\n' "$rel"
			fi
		fi
	done
	exit 0
fi

echo "Repo:   $REPO_DIR"
echo "Target: $HOME"
if [ "$DRY_RUN" -eq 1 ]; then
	echo "Mode:   dry run"
else
	echo "Backup: $BACKUP_ROOT (only used for files that already exist)"
fi
echo

find "$SOURCE_DIR" -type f | while IFS= read -r src; do
	rel=${src#"$SOURCE_DIR"/}
	dest="$HOME/$rel"

	if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
		printf 'ok       %s\n' "$rel"
		continue
	fi

	if [ -e "$dest" ] || [ -L "$dest" ]; then
		backup="$BACKUP_ROOT/$rel"
		if [ "$DRY_RUN" -eq 1 ]; then
			printf 'backup   %s -> %s\n' "$rel" "$backup"
		else
			mkdir -p "$(dirname "$backup")"
			mv "$dest" "$backup"
		fi
	fi

	if [ "$DRY_RUN" -eq 1 ]; then
		printf 'link     %s\n' "$rel"
	else
		mkdir -p "$(dirname "$dest")"
		ln -s "$src" "$dest"
		printf 'linked   %s\n' "$rel"
	fi
done

echo
if [ "$DRY_RUN" -eq 1 ]; then
	echo "Dry run complete; nothing was changed."
else
	echo "Done. Start a new shell (or re-source your shell config) to pick up changes."
fi
