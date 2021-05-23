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
        exec ./dev.sh $2 $3 $4
        ;;
    search)
        exec ./search.sh $*
        ;;
    get)
        case $3 in
            --repos | -r)
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
    test)
        cd ../test/
        exec ./test.sh $*
        ;;
    events)
        exec ./events.sh
        ;;
    *)
        exec ./explore.sh $*
        ;;   
    esac

exit