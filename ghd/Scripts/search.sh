# !/bin/bash
# https://github.com/RickBarretto/GH-Detective


# Cleaning file
echo '' > toopen

lang=''
sort='&s='
type='&type=Repositories'
search='&o=desc&q='$2
shift

while [ ! -z "$2" ]; do
    case "$2" in
        --best|-b)
            sort='&s='
            ;;
        --star | -s)
            sort='&s=stars'
            ;;
        --forks | -f)
            sort='&s=forks'
            ;;
        --new | -n)
            sort='&s=updated'
            ;;
        --repos | -r)
            type='&type=Repositories'
            ;;
        --discussions | -d)
            type='&type=discussions'
            ;;
        --users | -u)
            type='&type=users'
            ;;
        *)
            lang='l='$2
            ;;
    esac
shift
done

echo -e 'https://github.com/search?l=HTML&o=desc&q=git&s=stars&type=Repositories'

echo 'reading https://github.com/search?'$lang$search$sort$type' ...'
curl -s 'https://github.com/search?'$lang$search$sort$type > temp
echo

# Picking relative link
links=$(cat temp | grep --color 'class="v-align-middle"' | cut -d':' -f14 | cut -d ';' -f1 | cut -d '&' -f1)

# Printing
i=1
for link in $links;do
    # User/Project
    desc=$(cat temp | grep --color '<p class="mb-1">' -A1  | grep --color '<p class="mb-1">' -v | awk '{ sub(/^[ \t]+/, ""); print }'|cut -d$'\n' -f$i)
    echo 💾$(echo $link | cut -d'/' -f4-5)
    # Href
    echo '    https:'$link
    echo '    >' $desc
    echo
    # Saving in a temp file
    echo 'https:'$link'#readme' >> toopen
    i=$((i+2))
done

cd ..
exit