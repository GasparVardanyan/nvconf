#!/usr/bin/env bash

cmd_list="$1"
arg_list=${@:2}

mkdir -p build

proj=$(basename "$(pwd)")

status=0

while read cmd
do
	if [ "$cmd" = 'q' ]
	then
		qmake6 CONFIG+=debug .
		status=$?
		if [ $status -eq 0 ]
		then
			compiledb -n make
			sed -i 's/"-mno-direct-extern-access",//' compile_commands.json
		fi
	elif [ "$cmd" = 'b' ]
	then
		make -j$(nproc)
		status=$?
	elif [ "$cmd" = 'r' ]
	then
		./build/"$proj" $arg_list
		status=$?
	elif [ "$cmd" = 'c' ]
	then
		make clean
		status=$?
	fi

	[ $status -ne 0 ] && break
done < <(echo "$cmd_list" | fold -w 1)

echo -e "\n\nFINISHED WITH STATUS $status"

exit $status
