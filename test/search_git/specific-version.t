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

because cram does not support multi-line regex matching we have to match this way
  $ search_git 'downgrade' | filter_packages 'downgrade' '>=' '6.0.0' > file.matches
  > grep -vP '/tmp/.*/downgrade-(6.0.0|([6-9]|[1-9][0-9]+).[0-9.-]+)-.*-any.gitpkg.tar.gz' file.matches
  > echo end
  end

  $ search_git 'downgrade' | filter_packages 'downgrade' '<=' '5.2.0'
  /tmp/*/downgrade-5.1.3-0bdb507-any.gitpkg.tar.gz (glob)
  /tmp/*/downgrade-5.1.4-dee7bd9-any.gitpkg.tar.gz (glob)
  /tmp/*/downgrade-5.2.0-16b7466-any.gitpkg.tar.gz (glob)

because cram does not support multi-line regex matching we have to match this way
  $ search_git 'downgrade' | filter_packages 'downgrade' '>' '6.0.0' > file.matches
  > grep -vP '/tmp/.*/downgrade-((?!6\.0\.0)[0-9.]+|([6-9]|[1-9][0-9]+).[0-9.-]+)-.*-any.gitpkg.tar.gz' file.matches
  > echo end
  end

  $ search_git 'downgrade' | filter_packages 'downgrade' '<' '5.2.0' | sort
  /tmp/*/downgrade-5.1.3-0bdb507-any.gitpkg.tar.gz (glob)
  /tmp/*/downgrade-5.1.4-dee7bd9-any.gitpkg.tar.gz (glob)
