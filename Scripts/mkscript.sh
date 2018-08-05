#!/usr/bin/bash

for i in "$*"
do
	touch $i
	chmod u+x $i
done

echo "File(s) created!"
