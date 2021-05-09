# !/bin/bash
# https://github.com/RickBarretto/Github-cli-scrapy

cd Scripts/

case $1 in
    explore)
        cd Scripts/
        exec ./explore.sh
        ;;
    learn)
        cd Scripts/
        exec ./learntocode.sh
        ;;
    dev)
        cd Scripts/
        exec ./dev.sh $*
        ;;
    --help)
        cd Scripts/
        exec ./help.sh
        ;;
    *)
        cd Scripts/
        exec ./explore.sh
        ;;   
    esac

exit