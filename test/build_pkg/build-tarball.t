  $ source "$TESTDIR/../helper.sh"

Build tarball and rename it in to_install correctly
# TODO: this needs to have non-root user to be able to build

  $ cache=$(mktemp -d)
  > git clone "https://aur.archlinux.org/downgrade.git" "$cache/downgrade"
  > write_pacman_conf "[options]" "CacheDir = $cache/"
  > export to_install=( "/tmp/downgrade/downgrade-2.0-1-any.pkg.tar.gz" "3c3182bb-/tmp/downgrade/downgrade-11.5.5-any.pkg.tar.gz" "https://archive.archlinux.org/packages/x/xorg-twm/xorg-twm-1.0.7-1-x86_64.pkg.tar.xz") 
  > build_pkg

  to_install_new=( "/tmp/downgrade/downgrade-2.0-1-any.pkg.tar.gz" "/tmp/downgrade/downgrade-11.5.5-any.pkg.tar.zst" "https://archive.archlinux.org/packages/x/xorg-twm/xorg-twm-1.0.7-1-x86_64.pkg.tar.xz") 
  for i in $(seq ${#to_install{@}}); do
    if [[ "${to_install[i-1]}" != "${to_install_new[i-1]}" ]]; then
      exit 1
    fi
  done
