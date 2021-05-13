# !/bin/bash
# https://github.com/RickBarretto/Github-cli-scrapy

echo $*
# Cleaning file
echo '' > toopen

lang=''
since='daily'

while [ ! -z "$2" ]; do
    case "$2" in
        --month|--monthly|-m)
            since="monthly"
            ;;
        --week|--weekly|-w)
            since="weekly"
            ;;
        --day|--daily|-d)
            since="daily"
            ;;
        *)
            lang=$2
            ;;
    esac
shift
done

echo 'https://github.com/trending/developers/'$lang'?since='$since
curl 'https://github.com/trending/developers/'$lang'?since='$since > temp

# Picking relative link
links=$(cat temp | grep 'class="text-bold"' | cut -d '=' -f5 | cut -d'"' -f2)

# Printing
i=1
for link in $links;do
    # User/Project
    desc=$(cat temp | grep '<p class="color-text-secondary mb-0"><div>' | cut -d'>' -f3 | cut -d'<' -f1|cut -d$'\n' -f$i)
    echo $(echo $link | cut -d'/' -f2-3)
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