# !/bin/bash
# https://github.com/RickBarretto/Github-cli-scrapy

echo $*
i=1
for arg in $*; do
    links=$(cat toopen | grep $arg | cut -d' ' -f2)
    link=$(echo $links | cut -d$'\n' -f$i)
    start $link
    i=$((i+1))
done

cd ..
exit