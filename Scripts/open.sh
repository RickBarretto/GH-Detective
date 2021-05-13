# !/bin/bash
# https://github.com/RickBarretto/Github-cli-scrapy


for arg in $*; do
    links=$(cat toopen | grep $arg | cut -d' ' -f2)
    start $link
done

cd ..
exit