# !/bin/bash
# https://github.com/RickBarretto/Github-cli-scrapy

cd Scripts/

case $1 in
    explore)
        exec ./explore.sh $*
        ;;
    learn)
        exec ./learntocode.sh $*
        ;;
    dev)
        exec ./dev.sh $*
        ;;
    opensource)
        start https://opensource.guide/;;
    guide)
        start https://opensource.guide/;;
    --help)
        exec ./help.sh
        ;;
    open)
        exec ./open.sh $*
        ;;
    topic)
        exec ./topics.sh $*
        ;;
    *)
        exec ./explore.sh $*
        ;;   
    esac

exit