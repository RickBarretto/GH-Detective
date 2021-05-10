# !/bin/bash
# https://github.com/RickBarretto/Github-cli-scrapy

# Cleaning file
echo '' > toopen
echo $*
user=$(echo $* | cut -d' ' -f3)

# Catching Github's explore
echo 'https://github.com/'$user
curl 'https://github.com/'$user > temp

name=$(cat temp | grep --color -A1 'itemprop="name"' | grep -v 'itemprop="name"' | awk '{print $1} {print $2} {print $3}' | tr $'\n' ' ')
aname=$(cat temp | grep --color -A1 'itemprop="additionalName"' | grep -v 'itemprop="additionalName"' | awk '{print $1} {print $2} {print $3}' | tr $'\n' ' ')

bio=$(cat temp | grep --color -A1 'class="p-note user-profile-bio mb-3 js-user-profile-bio f4"' | grep -v 'class="p-note user-profile-bio mb-3 js-user-profile-bio f4"' | awk '{print}'| cut -d'>' -f3 | cut -d'<' -f-1 )
followers=$(cat temp | grep --color 'class="text-bold color-text-primary"' | cut -d'>' -f2| cut -d'<' -f1 | cut -d$'\n' -f1)
following=$(cat temp | grep --color 'class="text-bold color-text-primary"' | cut -d'>' -f2| cut -d'<' -f1 | cut -d$'\n' -f2)

org=$(cat temp | grep --color 'class="user-mention"' | cut -d'@' -f2 | cut -d'<' -f1 )
orglink=$( cat temp | grep --color 'class="user-mention"' | cut -d'=' -f6 | cut -d'"' -f2)

website=$(cat temp | grep --color '<a rel="nofollow me" class="Link--primary "' | cut -d$'\n' -f1 | cut -d'=' -f4 | cut -d'"' -f2)
twitter_link=$(cat temp | grep --color '<a rel="nofollow me" class="Link--primary "' | grep --color 'https://twitter.com/' | cut -d'=' -f4 | cut -d'"' -f2)
twitter_name='@'$(cat temp | grep --color '<a rel="nofollow me" class="Link--primary "' | grep 'https://twitter.com/' | cut -d'@' -f2 | cut -d'<' -f1)

orgs=$(cat temp | grep --color 'data-hovercard-type="organization"' -A1 | grep --color 'size="32"' | cut -d'=' -f5 | cut -d'"' -f2)

try_artic=$(cat temp | grep 'alt="Arctic Code Vault Contributor"')
b=''
if [[ $try_artic = $b ]]
then
    artic='false'
else
    artic='true'
fi

pinnedTitles=$(cat temp | grep --color '<span class="repo"' | cut -d'<' -f-2 | cut -d'>' -f2)
pinnedLangs=$(cat temp | grep 'itemprop="programmingLanguage"' | cut -d'>' -f2 | cut -d'<' -f1)
pinnedLinks=$(cat temp | grep --color '<a class="text-bold flex-auto min-width-0 "' | cut -d'=' -f5 | cut -d'"' -f-2| cut -d'"' -f2)

repoCount=$(cat temp | grep 'class="Counter "' | cut -d'>' -f2 | cut -d'<' -f1 | cut -d$'\n' -f1)
contribuitionsLastY=$(cat temp | grep 'class="f4 text-normal mb-2"' -A1 | grep -v 'class="f4 text-normal mb-2"' | awk '{print $1}')
nCommitsOnMonth=$(cat temp | grep 'class="color-text-primary ws-normal text-left"' -A4 | grep -v 'class' | awk '{print $1} {print $2}' | tr $'\n' ' ' | awk '{print $2}')
inNRepos=$(cat temp | grep 'class="color-text-primary ws-normal text-left"' -A4 | grep -v 'class' | awk '{print $1} {print $2}' | tr $'\n' ' ' | awk '{print $5}')
month=$(cat temp | grep 'class="color-bg-canvas pl-2 pr-3"' | cut -d'>' -f2 | cut -d'<' -f1)
year=$(cat temp | grep 'class="color-bg-canvas pl-2 pr-3"' | cut -d'>' -f3 | cut -d'<' -f1)

## Printing

# Name
echo
echo $name '- @'$aname
echo
# Bio
echo -e '\t'$bio
echo
# Stats
echo -e '\t🤵Followers:' $followers '  -  🤵Following:' $following
echo -e '\tRepository count:' $repoCount
echo
# Orgs
echo -e '\t🏢Current Organization:' '@'$org
echo -e '\t>' $orglink
echo 
echo -e '\t🐧Arctic Code Vault Contributor:' $artic
echo
echo -e '\tOther Organizations:'


for o in $orgs; do
    if [ ${#o} -lt 12 ]; then
        echo -e '\t🏬'$o'\t\t> github.com/'$(echo $o | cut -d'@' -f2 )
    else
        echo -e '\t🏬'$o'\t> github.com/'$(echo $o | cut -d'@' -f2 )
    fi
done

# Main Repos
echo
echo -e 'Pinned Repos:'
i=1

for pinTitle in $pinnedTitles;do
    lang=$(echo $pinnedLangs | cut -d' ' -f$i)
    link=$(echo $pinnedLinks | cut -d' ' -f$i)
    echo -e '\t💾'$pinTitle
    echo -e '\t    > https://github.com'$link
    echo -e '\t   🈯[ '$lang ']'
    echo
    i=$((i+1))
done

echo
echo -e 'Commits stats:' 
echo -e '\t'$contribuitionsLastY 'contributions in the last year'
echo -e '    '$month '-' $year
echo -e '\t'$nCommitsOnMonth 'commits in' $inNRepos 'repositories'


cd ..
exit