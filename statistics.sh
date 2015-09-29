#!/usr/bin/env bash

# how many lines does a language take to implement same algorithms?
# don't include test files

declare -A languages
languages[c++]=$(find c++ -name '*.hpp' -exec wc -l {} + | tail -1 | awk '{print $1}')
languages[coffee]=$(find coffeescript -name '*.coffee' -not -iname '*spec.coffee' -exec wc -l {} + | tail -1 | awk '{print $1}')
languages[go]=$(find go -name '*.go' -not -iname '*_test.go' -exec wc -l {} + | tail -1 | awk '{print $1}')
languages[java]=$(find java/AlgorithmAndDataStructure/src/main/java/* -name '*.java' -exec wc -l {} + | tail -1 | awk '{print $1}')
languages[javascript]=$(find javascript -name '*.js' -not -iname '*spec.js' -exec wc -l {} + | tail -1 | awk '{print $1}')
languages[python]=$(find python -name '*.py' -not -iname 'test_*.py' -exec wc -l {} + | tail -1 | awk '{print $1}')
languages[scala]=$(find scala/src/main/scala/algorithm/ -name '*.scala' -exec wc -l {} + | tail -1 | awk '{print $1}')

printf '%-15s    %-5s\n' language lines
base="${languages[c++]}"
for language in "${!languages[@]}"
do
    scale=$(bc <<< "scale=6; ${languages[$language]} / $base")
    printf '%-15s    %-5d    %f\n' "$language" "${languages[$language]}" "$scale"
done
