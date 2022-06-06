#!/bin/bash

declare -a numbers=($1)
declare -i needle=$2

hasInt() {
	local -a numbers=($1)
	local -a needle=$2

	if [ "${numbers[0]}" -eq "$needle" ]; then
		echo "true"
		return 0
	fi

	if [ "${#numbers[@]}" -eq 1 ]; then
		echo "false"
		return 0
	fi

	numbers=("${numbers[@]:1}")
	hasInt "${numbers[*]}" "$needle"
}

hasInt "${numbers[*]}" "$needle"

#➜  hasInt git:(dev) ✗ sh hasInt.sh "9 6 3 2 7" 1
# false
#➜  hasInt git:(dev) ✗ sh hasInt.sh "9 6 3 2 7" 3
# true
