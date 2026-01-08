  $ source "$TESTDIR/../helper.sh"
  > setup_git_test
  > export DOWNGRADE_FROM_GIT=1 

With a version string included

  $ search_git 'downgrade' | filter_packages 'downgrade' '=~' '^7'
  /tmp/*/downgrade-7.0.0-513f504-any.gitpkg.tar.gz (glob)

  $ search_git 'downgrade' | filter_packages 'downgrade' '=' '5.1.3'
  /tmp/*/downgrade-5.1.3-0bdb507-any.gitpkg.tar.gz (glob)

  $ search_git 'downgrade' | filter_packages 'downgrade' '==' '5.1.3'
  /tmp/*/downgrade-5.1.3-0bdb507-any.gitpkg.tar.gz (glob)

  $ search_git 'downgrade' | filter_packages 'downgrade' '>=' '6.0.0' | head -n3
  /tmp/*/downgrade-6.0.0-096ab6d-any.gitpkg.tar.gz (glob)
  /tmp/*/downgrade-6.1.0-4f09045-any.gitpkg.tar.gz (glob)
  /tmp/*/downgrade-6.2.0-ac26c1c-any.gitpkg.tar.gz (glob)

  $ search_git 'downgrade' | filter_packages 'downgrade' '<=' '5.2.0'
  /tmp/*/downgrade-5.1.3-0bdb507-any.gitpkg.tar.gz (glob)
  /tmp/*/downgrade-5.1.4-dee7bd9-any.gitpkg.tar.gz (glob)
  /tmp/*/downgrade-5.2.0-16b7466-any.gitpkg.tar.gz (glob)

  $ search_git 'downgrade' | filter_packages 'downgrade' '>' '6.0.0' | head -n2
  /tmp/*/downgrade-6.1.0-4f09045-any.gitpkg.tar.gz (glob)
  /tmp/*/downgrade-6.2.0-ac26c1c-any.gitpkg.tar.gz (glob)

  $ search_git 'downgrade' | filter_packages 'downgrade' '<' '5.2.0' | sort
  /tmp/*/downgrade-5.1.3-0bdb507-any.gitpkg.tar.gz (glob)
  /tmp/*/downgrade-5.1.4-dee7bd9-any.gitpkg.tar.gz (glob)
