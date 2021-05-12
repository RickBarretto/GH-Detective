# !/bin/bash
# https://github.com/RickBarretto/Github-cli-scrapy

# Cleaning file
echo '' > toopen

user=$(echo $* | cut -d' ' -f2)

# Catching Github's explore
echo 'https://github.com/'$user'?tab=repositories'
curl 'https://github.com/'$user'?tab=repositories' > temp

name=$(cat temp | grep --color -A1 'itemprop="name"' | grep -v 'itemprop="name"' | awk '{print $1} {print $2} {print $3}' | tr $'\n' ' ')
aname=$(cat temp | grep --color -A1 'itemprop="additionalName"' | grep -v 'itemprop="additionalName"' | awk '{print $1} {print $2} {print $3}' | tr $'\n' ' ')
loc=$( cat temp | grep --color '<span class="p-label"' | cut -d'>' -f2 | cut -d'<' -f1)

## Printing

# Name
echo
echo $name '- @'$aname
echo -e '    🌎'$loc
echo
# Stats
echo -e '\tRepository count:' $repoCount
echo

repoLinks=$(cat temp |  grep --color 'itemprop="name codeRepository"' | cut -d'"' -f2 | cut -d'"' -f-2)

echo -e 'Repositories:\n'
i=1
for link in $repoLinks; do
    repo=$(echo $link | cut -d'/' -f3)
    echo -e '  💾' $repo
    echo -e '     > https://github.com'$link
    echo 'https://github.com'$link' ' >> toopen
    echo
    i=$((i+1))
done

cd ..
exit