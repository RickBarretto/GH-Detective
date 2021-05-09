# !/bin/bash
# https://github.com/RickBarretto/Github-cli-scrapy

# Catching Github's explore
curl 'https://github.com/collections/learn-to-code' > learn

# Picking relative link
links=$(cat learn | grep 'data-ga-click="Explore, go to repository, location: collection"' | cut -d'=' -f2 | cut -d'"' -f2)

i=1

for link in $links;do
    # User/Project
    desc=$(cat learn | grep 'class="color-text-secondary mb-2 ws-normal"' | cut -d'>' -f2| cut -d'<' -f1 | cut -d$'\n' -f$i)
    echo $(echo $link | cut -d'/' -f2-3)
    # Href
    echo '    https://github.com/collections/learn-to-code'$link
    echo '    >' $desc
    echo
    i=$((i+1))
done

cd ..

exit