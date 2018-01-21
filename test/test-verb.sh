#!/usr/bin/env bash

# Todo: Test test-system: https://github.com/sstephenson/bats

cleanup() {
    rm -rf ./README.md
}

echo Current dir: "$PWD";
cd "$PWD/test/fixtures"

verb

if [ ! -f README.md ]; then
    echo ""
    echo "==> Test: README.md not found!";
    exit 1;
else
    echo
    echo "==> Test: README.md successfully created."
fi

# compare files
cd ..
comm -2 -3 ./fixtures/README.md ./expected/README.md


#cleanup;

echo "";
echo "==> Tests successfully finished";
exit 0;
