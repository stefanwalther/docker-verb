#!/usr/bin/env bash

RESTORE='\033[0m'

# Misc colors
RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
BLUE='\033[00;34m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
LIGHTGRAY='\033[00;37m'

LRED='\033[01;31m'
LGREEN='\033[01;32m'
LYELLOW='\033[01;33m'
LBLUE='\033[01;34m'
LPURPLE='\033[01;35m'
LCYAN='\033[01;36m'
WHITE='\033[01;37m'

# Icons
S_CHECK='[OK] '
S_BULLET='- '

SPACE='    '

# Todo: Test test-system: https://github.com/sstephenson/bats

cleanup() {
    rm -rf ./README.md
}

cd /app/fixtures;
cleanup;
verb;

if [ ! -f /app/fixtures/README.md ]; then
    echo ""
    echo "${RED}==> Test: README.md not found!" 1>&2${RESTORE};
    exit 1;

else
    echo
    echo "${GREEN}${S_CHECK}Test: README.md successfully created.${RESTORE}"
fi

# compare files
comm -2 -3 /app/fixtures/README.md /app/expected/README.md


#cleanup;

echo "==> tests successfully finished";
exit 0;
