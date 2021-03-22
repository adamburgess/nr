#!/bin/bash

# Find the nearest package.json.
find_package_json()
{
    # if it exists here then stop
    if [ -f "package.json" ]; then
        return;
    fi
    # If we are at the root then fail
    if [ "$PWD" = "/" ]; then
        >&2 echo "package.json not found"
        exit 1;
    fi
    # Go to parent and start again
    cd ..
    find_package_json
}

find_package_json

# Run the script. If jq succeeds then cmd will hold it
if cmd=$(jq .scripts.\""$1"\" -r -e package.json); then
    # Add node_modules to path, and run the script + any arguments with bash
    PATH=node_modules/.bin:$PATH bash -c "$cmd ${@:2}"
else
    >&2 echo "Script $1 not found"
    exit 1
fi
