# !/bin/bash
# https://github.com/RickBarretto/Github-cli-scrapy



for arg in $*; do
    link=$(cat toopen | grep $arg)
    start $link
done

cd ..
exit