NOW=$(date "+%d %b %Y")
for config_dir in dotfiles/*/; do
  NAME=${config_dir:9}
  rm -rf $config_dir
  rsync -az ~/.config/$NAME dotfiles/$NAME
done

git add .
git commit -am "Update: $NOW"
git push -u origin master
