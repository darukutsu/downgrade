  $ source "$TESTDIR/../helper.sh"

List remote files for chosen package


  $ git_clone
  > mkdir "$cache/downgrade-1"
  > mkdir "$cache/downgrade-other"
  > DOWNGRADE_FROM_GIT=1 search_git 'downgrade'
  /tmp/.*/downgrade-([a-zA-Z0-9.]+)-.+-any.gitpkg.tar.gz (re)
