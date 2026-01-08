  $ source "$TESTDIR/../helper.sh"

List remote files for chosen package


  $ setup_git_test
  > mkdir "$cache/downgrade-1"
  > mkdir "$cache/downgrade-other"
  > DOWNGRADE_FROM_GIT=1 search_git 'downgrade' | head -n2
  /tmp/*/downgrade-5.1.3-0bdb507-any.gitpkg.tar.gz (glob)
  /tmp/*/downgrade-5.1.4-dee7bd9-any.gitpkg.tar.gz (glob)
