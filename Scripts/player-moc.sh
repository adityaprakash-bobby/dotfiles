#!/usr/bin/sh

if [ "$(mocp -c /home/aditya/.moc/timidity.cfg -Q %state)" != "STOP" ];then
    echo "$(mocp -c /home/aditya/.moc/timidity.cfg -Q %song) - $(mocp -c /home/aditya/.moc/timidity.cfg -Q %album)"
else
    echo ""
fi
