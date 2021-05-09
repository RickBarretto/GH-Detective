# !/bin/bash
# https://github.com/RickBarretto/Github-cli-scrapy

cd Scripts/

case $1 in
    explore)
        exec ./explore.sh
        ;;
    learn)
        exec ./learntocode.sh
        ;;
    dev)
        exec ./dev.sh $*
        ;;
    --help)
        exec ./help.sh
        ;;
    *)
        exec ./explore.sh
        ;;   
    esac

exit