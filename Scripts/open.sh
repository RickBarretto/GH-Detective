# !/bin/bash
# https://github.com/RickBarretto/Github-cli-scrapy


for arg in $*; do
    link=$(cat toopen | grep $arg | cut -d' ' -f-2)
    start $link
done

cd ..
exit