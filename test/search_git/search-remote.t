  $ source "$TESTDIR/../helper.sh"

List remote files for chosen package


  $ cache=$(mktemp -d)
  > git clone -q "https://aur.archlinux.org/downgrade.git" "$cache/downgrade"
  > mkdir "$cache/downgrade-1"
  > mkdir "$cache/downgrade-other"
  > write_pacman_conf "[options]" "CacheDir = $cache/"
  > DOWNGRADE_FROM_GIT=1 search_git 'downgrade'
  /tmp/.*/.+-downgrade-[0-9.]+-any.pkg.tar.gz (re)
