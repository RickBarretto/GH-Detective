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
        case $2 in 
            dev)
                user=$($3)
                exec ./user.sh $*
                ;;
            *)
                echo 'Type github help'
                ;;
            esac
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