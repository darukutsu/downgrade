  $ source "$TESTDIR/../helper.sh"

With a version string included

  $ cache=$(mktemp -d)
  > git clone "https://aur.archlinux.org/downgrade.git" "$cache/downgrade"
  > touch \
  >   "$cache/downgrade-7.0-1-any.pkg.tar.gz" \
  >   "$cache/downgrade-2.0-1-any.pkg.tar.gz" \
  >   "$cache/downgrade-3.5-1-any.pkg.tar.xz" \
  >   "$cache/downgrade-7.1-1-any.pkg.tar.gz" \
  >   "$cache/downgrade-completions-1.1-1-any.pkg.tar.gz"
  > write_pacman_conf "[options]" "CacheDir = $cache/"
  > DOWNGRADE_FROM_GIT=1 search_git 'downgrade' | filter_packages 'downgrade' '=~' '^7' | sort
  /tmp/*/513f504-downgrade-7.0.0-any.pkg.tar.gz (glob)
  /tmp/*/downgrade-7.0-1-any.pkg.tar.gz (glob)
  /tmp/*/downgrade-7.1-1-any.pkg.tar.gz (glob)

  $ cache=$(mktemp -d)
  > git clone "https://aur.archlinux.org/downgrade.git" "$cache/downgrade"
  > touch \
  >   "$cache/downgrade-5.1.3-any.pkg.tar.gz" \
  >   "$cache/downgrade-2.0-1-any.pkg.tar.gz" \
  >   "$cache/downgrade-3.5-1-any.pkg.tar.xz" \
  >   "$cache/downgrade-5.1.4-any.pkg.tar.gz" \
  >   "$cache/downgrade-completions-1.1-1-any.pkg.tar.gz"
  > write_pacman_conf "[options]" "CacheDir = $cache/"
  > DOWNGRADE_FROM_GIT=1 search_git 'downgrade' | filter_packages 'downgrade' '=' '5.1.3' | sort
  /tmp/*/0bdb507-downgrade-5.1.3-any.pkg.tar.gz (glob)
  /tmp/*/downgrade-5.1.3-any.pkg.tar.gz (glob)

  $ cache=$(mktemp -d)
  > git clone "https://aur.archlinux.org/downgrade.git" "$cache/downgrade"
  > touch \
  >   "$cache/downgrade-5.1.3-any.pkg.tar.gz" \
  >   "$cache/downgrade-2.0-1-any.pkg.tar.gz" \
  >   "$cache/downgrade-3.5-1-any.pkg.tar.xz" \
  >   "$cache/downgrade-5.1.4-any.pkg.tar.gz" \
  >   "$cache/downgrade-completions-1.1-1-any.pkg.tar.gz"
  > write_pacman_conf "[options]" "CacheDir = $cache/"
  > DOWNGRADE_FROM_GIT=1 search_git 'downgrade' | filter_packages 'downgrade' '==' '5.1.3' | sort
  /tmp/*/0bdb507-downgrade-5.1.3-any.pkg.tar.gz (glob)
  /tmp/*/downgrade-5.1.3-any.pkg.tar.gz (glob)

  # NOTE: can't check online source since this will break every time its upgraded
  $ cache=$(mktemp -d)
  > touch \
  >   "$cache/downgrade-1.0-1-any.pkg.tar.gz" \
  >   "$cache/downgrade-2.0-1-any.pkg.tar.gz" \
  >   "$cache/downgrade-3.5-1-any.pkg.tar.xz" \
  >   "$cache/downgrade-1.1-1-any.pkg.tar.gz" \
  >   "$cache/downgrade-completions-1.1-1-any.pkg.tar.gz"
  > write_pacman_conf "[options]" "CacheDir = $cache/"
  > DOWNGRADE_FROM_GIT=1 search_git 'downgrade' | filter_packages 'downgrade' '>=' '2.0-1' | sort
  /tmp/*/downgrade-2.0-1-any.pkg.tar.gz (glob)
  /tmp/*/downgrade-3.5-1-any.pkg.tar.xz (glob)

  $ cache=$(mktemp -d)
  > git clone "https://aur.archlinux.org/downgrade.git" "$cache/downgrade"
  > touch \
  >   "$cache/downgrade-5.0.0-1-any.pkg.tar.gz" \
  >   "$cache/downgrade-5.10.0-1-any.pkg.tar.gz" \
  >   "$cache/downgrade-7.5-1-any.pkg.tar.xz" \
  >   "$cache/downgrade-5.1.0-1-any.pkg.tar.gz" \
  >   "$cache/downgrade-completions-1.1-1-any.pkg.tar.gz"
  > write_pacman_conf "[options]" "CacheDir = $cache/"
  > DOWNGRADE_FROM_GIT=1 search_git 'downgrade' | filter_packages 'downgrade' '<=' '5.2.0-1' | sort
  /tmp/*/0bdb507-downgrade-5.1.3-any.pkg.tar.gz (glob)
  /tmp/*/dee7bd9-downgrade-5.1.4-any.pkg.tar.gz (glob)
  /tmp/*/16b7466-downgrade-5.2.0-any.pkg.tar.gz (glob)
  /tmp/*/downgrade-5.0.0-1-any.pkg.tar.gz (glob)
  /tmp/*/downgrade-5.1.0-1-any.pkg.tar.gz (glob)

  # NOTE: can't check online source since this will break every time its upgraded
  $ cache=$(mktemp -d)
  > touch \
  >   "$cache/downgrade-1.0-1-any.pkg.tar.gz" \
  >   "$cache/downgrade-2.0-1-any.pkg.tar.gz" \
  >   "$cache/downgrade-3.5-1-any.pkg.tar.xz" \
  >   "$cache/downgrade-1.1-1-any.pkg.tar.gz" \
  >   "$cache/downgrade-completions-1.1-1-any.pkg.tar.gz"
  > write_pacman_conf "[options]" "CacheDir = $cache/"
  > DOWNGRADE_FROM_GIT=1 search_git 'downgrade' | filter_packages 'downgrade' '>' '2.0-1' | sort
  /tmp/*/downgrade-3.5-1-any.pkg.tar.xz (glob)

  $ cache=$(mktemp -d)
  > git clone "https://aur.archlinux.org/downgrade.git" "$cache/downgrade"
  > touch \
  >   "$cache/downgrade-5.0.0-1-any.pkg.tar.gz" \
  >   "$cache/downgrade-5.10.0-1-any.pkg.tar.gz" \
  >   "$cache/downgrade-7.5-1-any.pkg.tar.xz" \
  >   "$cache/downgrade-5.1.0-1-any.pkg.tar.gz" \
  >   "$cache/downgrade-completions-1.1-1-any.pkg.tar.gz"
  > write_pacman_conf "[options]" "CacheDir = $cache/"
  > DOWNGRADE_FROM_GIT=1 search_git 'downgrade' | filter_packages 'downgrade' '<' '5.2.0' | sort
  /tmp/*/0bdb507-downgrade-5.1.3-any.pkg.tar.gz (glob)
  /tmp/*/dee7bd9-downgrade-5.1.4-any.pkg.tar.gz (glob)
  /tmp/*/downgrade-5.0.0-1-any.pkg.tar.gz (glob)
  /tmp/*/downgrade-5.1.0-1-any.pkg.tar.gz (glob)
