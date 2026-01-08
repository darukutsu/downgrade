  $ source "$TESTDIR/../helper.sh"

List remote files for chosen package


because cram does not support multi-line regex matching we have to match this way
  $ setup_git_test
  > mkdir "$cache/downgrade-1"
  > mkdir "$cache/downgrade-other"
  > DOWNGRADE_FROM_GIT=1 search_git 'downgrade' > file.matches
  > grep -vP '/tmp/.*/downgrade-([a-zA-Z0-9.]+)-.+-any.gitpkg.tar.gz' file.matches
  > echo end
  end

