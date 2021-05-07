# !/bin/bash

# Catching Github's explore
curl 'https://github.com/explore' > scrapping

# Picking relative link
links=$(cat scrapping | grep 'class="text-bold"' | cut -d '=' -f5 | cut -d'"' -f2)

for link in $links;do
    echo 'https://github.com/explore'$link
done