#!/bin/bash

cd /Applications/JBShuffle.app

if [[ -d  play_session ]] //see if previous session ended prematurely
then
  rm -rf  play_session
fi

mkdir play_session
cd /var/music

while true; do
  ls |sort -R |tail -1 |while read rand_file; do  #randomly select file and set as variable
    if [[-e  play_session/$rand_file ]] #if file already played...
    then
      ls |sort -R |tail -1 |while read rand_file; do  #randomly select file and set$
        if [[-e  play_session/$rand_file ]] #if file already played...
        then 
          ls |sort -R |tail -1 |while read rand_file; do #reselect a song
	    echo "played" > /Applications/JBShuffle.app/play_session/$rand_file
            playcli $rand_file
          done
        fi
      done
    fi
    elif [[ ! -e  play_session/$rand_file ]]
    then  
      playcli $rand_file
    fi
  done
done
