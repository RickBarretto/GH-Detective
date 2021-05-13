# !/bin/bash
# https://github.com/RickBarretto/Github-cli-scrapy

# Cleaning file
echo '' > toopen
lang=$('')

# Catching Github's devs
case $2 in
    --month)
    curl 'https://github.com/trending/developers/'$lang'?since=monthly'> temp
    repolinks=$(cat temp | grep --color $'data-ga-click="Explore, go to repository, location:trending developers"' | cut -d'=' -f7 | cut -d'"' -f2)
    ;;
    -m)
    curl 'https://github.com/trending/developers/'$lang'?since=monthly'> temp
    repolinks=$(cat temp | grep --color $'data-ga-click="Explore, go to repository, location:trending developers"' | cut -d'=' -f7 | cut -d'"' -f2)
    ;;
    --week)
    curl 'https://github.com/trending/developers/'$lang'?since=weekly'> temp
    repolinks=$(cat temp | grep --color $'data-ga-click="Explore, go to repository, location:trending developers"' | cut -d'=' -f7 | cut -d'"' -f2)
    ;;
    -w)
    curl 'https://github.com/trending/developers/'$lang'?since=weekly'> temp
    repolinks=$(cat temp | grep --color $'data-ga-click="Explore, go to repository, location:trending developers"' | cut -d'=' -f7 | cut -d'"' -f2)
    ;;
    *)
    curl 'https://github.com/trending/developers/'$lang > temp
    repolinks=$(cat temp | grep --color $'data-ga-click="Explore, go to repository, location:trending developers"' | cut -d'=' -f6 | cut -d'"' -f2)
    ;;
    esac

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