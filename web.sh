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
    devs)
        exec ./dev.sh $*
        ;;
    get)
        case $3 in
            --repos)
            exec ./repos.sh $*
            ;;
            *)
            exec ./user.sh $*
            ;;
        esac
        ;;
    opensource)
        start https://opensource.guide/
        ;;
    guide)
        start https://opensource.guide/
        ;;
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