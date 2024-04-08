NOW=$(date "+%d %b %Y")
rm -rf dotfiles/*
for config_dir in dotfiles/*/; do
  rsync -az ~/.config/$config_dir $config_dir
done

git add .
git commit -am "Update: $NOW"
git push -u origin master
