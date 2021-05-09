# !/bin/bash
# https://github.com/RickBarretto/Github-cli-scrapy

# Catching Github's explore
curl 'https://github.com/explore' > explore

# Picking relative link
links=$(cat explore | grep 'class="text-bold"' | cut -d '=' -f5 | cut -d'"' -f2)

i=1

for link in $links;do
    # User/Project
    desc=$(cat explore | grep '<p class="color-text-secondary mb-0"><div>' | cut -d'>' -f3 | cut -d'<' -f1|cut -d$'\n' -f$i)
    echo $(echo $link | cut -d'/' -f2-3)
    # Href
    echo '    https://github.com/explore'$link
    echo '    >' $desc
    echo
    i=$((i+1))
done

cd ..

exit