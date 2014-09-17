#!/bin/sh

epub=$1

rm -rf $epub 2> /dev/null

zip -X  "${epub}" mimetype 
zip -rg "${epub}" META-INF -x \*.DS_Store 
zip -rg "${epub}" OEBPS -x \*.DS_Store 


echo ""
echo ""
echo -n "Add to calibre? [y/n] > "
read answer

if [[ x"$answer" -eq x"y" ]]
then
	calibredb add "${epub}"
fi
