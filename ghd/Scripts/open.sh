# !/bin/bash
# https://github.com/RickBarretto/GH-Detective

echo
echo 'opening links with: [' $2, $3, $4, $5, $6, $7, $8, $9 ']'
for arg in $*; do
    links=$(cat toopen | grep $arg | cut -d' ' -f2)
    for link in $links; do
        start $link
    done
done

cd ..
exit