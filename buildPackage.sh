#!/bin/bash
dir=`dirname "$0"`
cd "$dir"
rm -f openfl-fgl.zip
zip -0r openfl-fgl.zip extension haxelib.json include.xml dependencies 
