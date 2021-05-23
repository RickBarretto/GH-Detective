# !/bin/bash
# https://github.com/RickBarretto/GH-Detective

echo
echo 'opening links...'
for arg in $*; do
    links=$(cat toopen | grep $arg | cut -d' ' -f2)
    for link in $links; do
        start $link
    done
done

cd ..
exit