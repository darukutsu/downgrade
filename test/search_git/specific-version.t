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

  $ search_git 'downgrade' | filter_packages 'downgrade' '>=' '6.0.0'
  /tmp/.*/downgrade-6.0.0-.*-any.gitpkg.tar.gz (re)
  /tmp/.*/downgrade-([6-9]|[1-9][0-9]+).[0-9.-]+-.*-any.gitpkg.tar.gz (re)

  $ search_git 'downgrade' | filter_packages 'downgrade' '<=' '5.2.0-1'
  /tmp/*/downgrade-5.1.3-0bdb507-any.gitpkg.tar.gz (glob)
  /tmp/*/downgrade-5.1.4-dee7bd9-any.gitpkg.tar.gz (glob)
  /tmp/*/downgrade-5.2.0-16b7466-any.gitpkg.tar.gz (glob)

  $ search_git 'downgrade' | filter_packages 'downgrade' '>' '6.0.0'
  /tmp/.*/downgrade-(?!6\.0\.0)[0-9.]+-.*-any.gitpkg.tar.gz (re)
  /tmp/.*/downgrade-([6-9]|[1-9][0-9]+).[0-9.-]+-.*-any.gitpkg.tar.gz (re)

  $ search_git 'downgrade' | filter_packages 'downgrade' '<' '5.2.0' | sort
  /tmp/*/downgrade-5.1.3-0bdb507-any.gitpkg.tar.gz (glob)
  /tmp/*/downgrade-5.1.4-dee7bd9-any.gitpkg.tar.gz (glob)
