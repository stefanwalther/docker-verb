#!/bin/bash

# Delete silently an existing ./README.md file, otherwise we run into the following error
#   => Error: ENOENT: no such file or directory, open '/opt/verb/README.md'
rm -f ./README.md

# Now run the main program
verb
