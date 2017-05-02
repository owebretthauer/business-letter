#!/usr/bin/sh
mkdir ~/.letter/ -p
rm -rf ~/.letter/{fonts,images,xsl}
cp letter.sh ~/.letter/
cp -r src/main/resources/* ~/.letter/
cp example/sender.xml ~/.letter/sender.xml.example
cp example/closing.xml ~/.letter/closing.xml.example

#example letter
rm -rf ~/.letter/example
mkdir ~/.letter/example -p
cp -rf example ~/.letter
