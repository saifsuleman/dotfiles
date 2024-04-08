for config_dir in ./*/; do
  name=${config_dir:2}
  rm -rf $name
  rsync -az ~/.config/$name $name
done
