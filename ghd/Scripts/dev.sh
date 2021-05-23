# !/bin/bash
# https://github.com/RickBarretto/GH-Detective


# Cleaning file
echo '' > toopen
lang=$('')

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

echo 'reading https://github.com/trending/developers/'$lang'?since='$since' ...'
curl -s 'https://github.com/trending/developers/'$lang'?since='$since > temp
echo

# Printing
i=1
for link in $repolinks;do
    # User/Project
    userlink=$(echo $link | cut -d'/' -f2)
    repo=$(echo $link | cut -d'/' -f3)

    echo $dev '-' $userlink
    echo '    https://github.com/'$userlink
    echo '    > Popular Repo: '$repo
    echo '    > https://github.com'$link
    echo
    # saving in a temp file
    echo 'https://github.com/'$userlink >> toopen
    echo 'https://github.com'$link >> toopen
    i=$((i+1))
done

cd ..
exit