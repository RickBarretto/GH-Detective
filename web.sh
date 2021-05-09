# !/bin/bash

cd Scripts/

case $1 in
    explore)
        echo 'What?'
        cd ..
        ;;
    learn)
        cd Scripts/
        exec ./learntocode.sh
        ;;
    *)
        cd Scripts/
        exec ./explore.sh
        ;;   
    esac

exit