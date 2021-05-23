# !/bin/bash
# https://github.com/RickBarretto/GH-Detective


# Cleaning file
echo '' > toopen

curl 'https://github.com/events' > temp

links=$(cat temp | grep 'data-view-component=' | grep ' class=' -v | grep 'href="https' --color | cut -d'"' -f4)
# Printing
i=1
echo
for link in $links;do
    # User/Project
    title=$(cat temp | grep 'data-view-component=' -A1 | grep 'href="https' --color -A1 | grep -v '-' | grep -v 'Learn more' | awk '{ sub(/^[ \t]+/, ""); print }' | cut -d$'\n' -f$i)
    desc=$(cat temp | grep 'class="mb-3"' | cut -d'>' -f2 | cut -d'<' -f1 | cut -d$'\n' -f$i)
    date=$(cat temp | grep 'class="color-text-secondary f5"' -A1 | grep '-' -v | awk '{ sub(/^[ \t]+/, ""); print }' | cut -d$'\n' -f$i)

    echo ⏰ $title '-' $date
    echo '    >'$link
    echo '    '$desc
    echo
    # saving in a temp file
    echo $link >> toopen
    i=$((i+1))
done

cd ..
exit