  $ source "$TESTDIR/../helper.sh"

With a version string included

  $ cache=$(mktemp -d)
  > git clone -q "https://aur.archlinux.org/downgrade.git" "$cache/downgrade"
  > write_pacman_conf "[options]" "CacheDir = $cache/"
  > DOWNGRADE_FROM_GIT=1 search_git 'downgrade' | filter_packages 'downgrade' '=~' '^7'
  /tmp/*/513f504-downgrade-7.0.0-any.pkg.tar.gz (glob)

  $ cache=$(mktemp -d)
  > git clone -q "https://aur.archlinux.org/downgrade.git" "$cache/downgrade"
  > write_pacman_conf "[options]" "CacheDir = $cache/"
  > DOWNGRADE_FROM_GIT=1 search_git 'downgrade' | filter_packages 'downgrade' '=' '5.1.3'
  /tmp/*/0bdb507-downgrade-5.1.3-any.pkg.tar.gz (glob)

  $ cache=$(mktemp -d)
  > git clone -q "https://aur.archlinux.org/downgrade.git" "$cache/downgrade"
  > write_pacman_conf "[options]" "CacheDir = $cache/"
  > DOWNGRADE_FROM_GIT=1 search_git 'downgrade' | filter_packages 'downgrade' '==' '5.1.3'
  /tmp/*/0bdb507-downgrade-5.1.3-any.pkg.tar.gz (glob)

  $ cache=$(mktemp -d)
  > git clone -q "https://aur.archlinux.org/downgrade.git" "$cache/downgrade"
  > write_pacman_conf "[options]" "CacheDir = $cache/"
  > DOWNGRADE_FROM_GIT=1 search_git 'downgrade' | filter_packages 'downgrade' '>=' '6.0.0'
  /tmp/.*/.*-downgrade-6.0.0-any.pkg.tar.gz (re)
  /tmp/.*/.*-downgrade-([6-9]|[1-9][0-9]+).[0-9.-]+-any.pkg.tar.gz (re)

  $ cache=$(mktemp -d)
  > git clone -q "https://aur.archlinux.org/downgrade.git" "$cache/downgrade"
  > write_pacman_conf "[options]" "CacheDir = $cache/"
  > DOWNGRADE_FROM_GIT=1 search_git 'downgrade' | filter_packages 'downgrade' '<=' '5.2.0-1'
  /tmp/*/0bdb507-downgrade-5.1.3-any.pkg.tar.gz (glob)
  /tmp/*/dee7bd9-downgrade-5.1.4-any.pkg.tar.gz (glob)
  /tmp/*/16b7466-downgrade-5.2.0-any.pkg.tar.gz (glob)

  $ cache=$(mktemp -d)
  > git clone -q "https://aur.archlinux.org/downgrade.git" "$cache/downgrade"
  > write_pacman_conf "[options]" "CacheDir = $cache/"
  > DOWNGRADE_FROM_GIT=1 search_git 'downgrade' | filter_packages 'downgrade' '>' '6.0.0'
  /tmp/.*/.*-downgrade-(?!6\.0\.0)[0-9.]+-any.pkg.tar.gz (re)
  /tmp/.*/.*-downgrade-([6-9]|[1-9][0-9]+).[0-9.-]+-any.pkg.tar.gz (re)

  $ cache=$(mktemp -d)
  > git clone -q "https://aur.archlinux.org/downgrade.git" "$cache/downgrade"
  > touch \
  > write_pacman_conf "[options]" "CacheDir = $cache/"
  > DOWNGRADE_FROM_GIT=1 search_git 'downgrade' | filter_packages 'downgrade' '<' '5.2.0' | sort
  /tmp/*/0bdb507-downgrade-5.1.3-any.pkg.tar.gz (glob)
  /tmp/*/dee7bd9-downgrade-5.1.4-any.pkg.tar.gz (glob)
