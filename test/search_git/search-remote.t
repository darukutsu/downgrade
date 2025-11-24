  $ source "$TESTDIR/../helper.sh"

List remote files for chosen package


  $ git_clone
  > mkdir "$cache/downgrade-1"
  > mkdir "$cache/downgrade-other"
  > DOWNGRADE_FROM_GIT=1 search_git 'downgrade'
  /tmp/.*/.+-downgrade-[0-9.]+-any.pkg.tar.gz (re)
