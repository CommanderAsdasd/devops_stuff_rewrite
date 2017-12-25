# remove tags from remote repo
# releases is for tags
git tag -d bitcoind-stable
git push origin :refs/tags/bitcoind-stable
git reset --hard origin/develop