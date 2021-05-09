# !/bin/bash
# https://github.com/RickBarretto/Github-cli-scrapy


# Catching Github's devs
case $2 in
    --month)
    curl 'https://github.com/trending/developers?since=monthly'> temp
    repolinks=$(cat temp | grep --color $'data-ga-click="Explore, go to repository, location:trending developers"' | cut -d'=' -f7 | cut -d'"' -f2)
    ;;
    -m)
    curl 'https://github.com/trending/developers?since=monthly'> temp
    repolinks=$(cat temp | grep --color $'data-ga-click="Explore, go to repository, location:trending developers"' | cut -d'=' -f7 | cut -d'"' -f2)
    ;;
    --week)
    curl 'https://github.com/trending/developers?since=weekly'> temp
    repolinks=$(cat temp | grep --color $'data-ga-click="Explore, go to repository, location:trending developers"' | cut -d'=' -f7 | cut -d'"' -f2)
    ;;
    -w)
    curl 'https://github.com/trending/developers?since=weekly'> temp
    repolinks=$(cat temp | grep --color $'data-ga-click="Explore, go to repository, location:trending developers"' | cut -d'=' -f7 | cut -d'"' -f2)
    ;;
    *)
    curl 'https://github.com/trending/developers'> temp
    repolinks=$(cat temp | grep --color $'data-ga-click="Explore, go to repository, location:trending developers"' | cut -d'=' -f6 | cut -d'"' -f2)
    ;;
    esac

# Picking relative link


i=1

for link in $repolinks;do
    # User/Project
    userlink=$(echo $link | cut -d'/' -f2)
    repo=$(echo $link | cut -d'/' -f3)

    echo $userlink
    echo '    https://github.com/'$userlink
    echo '    > Popular Repo: '$repo
    echo '    > https://github.com'$link
    echo
    i=$((i+1))
done

cd ..

exit