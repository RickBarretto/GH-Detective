# !/bin/bash


link=$(cat toopen | grep $2)

start $link

cd ..
exit