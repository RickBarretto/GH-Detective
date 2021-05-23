# !/bin/bash
# https://github.com/RickBarretto/GH-Detective


# Cleaning file
echo '' > toopen
topic=$2

while [ ! -z "$3" ]; do
    case "$3" in
        --best|-b)
            sort='?o=desc&s='
            ;;
        --star | -s)
            sort='?o=desc&s=stars'
            ;;
        --forks | -f)
            sort='?o=desc&s=forks'
            ;;
        --new | -n)
            sort='?o=desc&s=updated'
            ;;
        *)
            ;;
    esac
shift
done

# Catching Github's explore
echo 'reading https://github.com/topics/'$topic$sort' ...'
curl -s 'https://github.com/topics/'$topic$sort > temp
echo

# Picking relative link
links=$(cat temp | grep 'class="text-bold"' | cut -d'=' -f7 | cut -d'"' -f2)

# Printing
i=1
for link in $links;do
    # User/Project
    desc=$(cat temp | grep '<p class="color-text-secondary mb-0"><div>' | cut -d'>' -f3 | cut -d'<' -f1|cut -d$'\n' -f$i)
    echo 💾$(echo $link | cut -d'/' -f2-3)
    # Href
    echo '    https://github.com'$link
    echo '    >' $desc
    echo
    # Saving in a temp file
    echo 'https://github.com'$link >> toopen
    i=$((i+1))
done


cd ..
exit