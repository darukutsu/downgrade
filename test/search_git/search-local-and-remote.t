  $ source "$TESTDIR/../helper.sh"

List remote and local files


  $ cache=$(mktemp -d)
  > git clone "https://aur.archlinux.org/downgrade.git" "$cache/downgrade"
  > touch \
  >   "$cache/downgrade/downgrade-1.0-1-any.pkg.tar.gz" \
  > mkdir "$cache/downgrade-1"
  > touch \
  >   "$cache/downgrade-1/downgrade-1-1.0-1-any.pkg.tar.gz" \
  >   "$cache/downgrade-1/downgrade-1-2.0-1-any.pkg.tar.gz" \
  > mkdir "$cache/downgrade-other"
  > touch \
  >   "$cache/downgrade-other/downgrade-other-1.0-1-any.pkg.tar.gz" \
  >   "$cache/downgrade-other/downgrade-other-2.0-1-any.pkg.tar.gz" \
  > write_pacman_conf "[options]" "CacheDir = $cache/"
  > DOWNGRADE_FROM_GIT=1 search_git 'downgrade' | sort
  /tmp/*/downgrade-1.0-1-any.pkg.tar.gz (glob)
  /tmp/*/.+-downgrade-[0-9.]+-any.pkg.tar.gz (glob)
