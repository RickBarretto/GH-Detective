# !/bin/bash



link=$(cat topopen | grep '$*')

start $link

cd ..
exit