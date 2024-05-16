#!/bin/sh

SEP=" AND "
RES="/tmp/result"
FLT="/tmp/filter"

vault="moretticb"

pattern="$(echo "." | choose -n -1 -m -s 18 -p "type a pattern or -p to paste")"
[ "$?" != "0" ] && exit 1

if [ "$pattern" = "-p" ]; then
	pattern="$(pbpaste)"
fi

# file="$(cd $HOME/$vault && grep -inr "$pattern" . | grep '\.md:' | choose -s 15 -w 80 | cut -d":" -f 1)"

export IFS="|"
#cd $HOME/$vault
cd "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/$vault"
[ -e $RES ] && rm $RES
[ -e $FLT ] && rm $FLT
for pat in $(echo $pattern | sed "s/$SEP/$IFS/g"); do
	grep -inr "$pat" . | grep '\.md:' | cut -d":" -f 1 | sort | uniq | tee $FLT > /dev/null
	if [ -e $RES ]; then
		echo "$(grep -Ff $FLT $RES)" > $RES
	else
		cp $FLT $RES
	fi
done

for file in $(cat $RES | tr "\n" "|"); do
	echo " \n $file" >> $RES
	for pat in $(echo $pattern | sed "s/$SEP/$IFS/g"); do
		grep -iHn "$pat" "$file" | grep '\.md:' | sed -E "s/([^:]+):[0-9]+:(.*)/   \2\t\t\t\t\t\t\t\t\t:\1/g" >> $RES
	done
done

file="$(cat $RES | grep "^ " | uniq | choose -s 15 -w 80 -n 20 | rev | cut -d":" -f 1 | rev)"

[ "$file" ] || exit 1

echo "opening file $file"

open "obsidian://advanced-uri?vault=$vault&filepath=$file&openmode=true"
