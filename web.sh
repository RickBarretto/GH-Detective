# !/bin/bash

cd Scripts/

case $1 in
    explore)
        echo 'What?'
        cd ..
        ;;
    *)
        exec ./explore.sh
        ;;   
    esac

exit