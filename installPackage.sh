#!/bin/bash
dir=`dirname "$0"`
cd "$dir"
haxelib remove openfl-fgl
haxelib local openfl-fgl.zip
