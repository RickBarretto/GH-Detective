# !/bin/bash
# https://github.com/RickBarretto/Github-cli-scrapy

cd Scripts/

case $1 in
    explore)
        exec ./explore.sh $2
        ;;
    learn)
        exec ./learntocode.sh $2
        ;;
    dev)
        exec ./dev.sh $*
        ;;
    --help)
        exec ./help.sh
        ;;
    open)
        exec ./open.sh $2
        ;;
    *)
        exec ./explore.sh $2
        ;;   
    esac

exit