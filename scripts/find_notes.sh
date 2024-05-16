#!/bin/sh

vault="moretticb"

#cd $HOME/$vault
cd "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/$vault"

echo "today.md" > /tmp/notes
find . | sort -r >> /tmp/notes

file="$(grep '\.md$' /tmp/notes | choose)"

[ "$?" != "0" ] && exit 1

if [ "$file" = "today.md" ]; then
	file="$(grep Daily$ /tmp/notes)/$(date -j "+%Y-%m-%d %a").md"
fi

open "obsidian://advanced-uri?vault=$vault&filepath=$file&openmode=true"
