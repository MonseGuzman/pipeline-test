#!/bin/bash

# read last version
lastVersion=$(cat VERSION)
# delete VERSION file
rm VERSION
# my variables
arrayVersion=();
change=false
IFS='.' read -ra ADDR <<< "$lastVersion"
for x in "${ADDR[@]}" 
do
    # Is it a number? 
    if [[ "$x" =~ ^[0-9]+$ ]]; then 
        # only for change one number
        if [ "$change" = false ]; then
            # x <= 9 (any number)
            if [ "$x" -lt 99 ]; then
                new_vs=`expr $x + 1`;
                # invert the number
                arrayVersion+=.$(echo $new_vs | rev);
                # change the variable to avoid change another number
                change=true
            else
                arrayVersion+=(.0)
            fi
        else
            arrayVersion+=.$x
        fi
    fi
done

# save the new version
echo $arrayVersion >> VERSION
# invert the version
rev=$(echo $arrayVersion | rev)
# final version
echo "${rev%?}"