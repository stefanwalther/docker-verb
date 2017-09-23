#!/usr/bin/env bash

# Todo: Test test-system: https://github.com/sstephenson/bats

cleanup() {
    rm -rf ./README.md
}

echo "";
echo "==> run tests:";
echo "current dir: ${PWD}";

cd $PWD/test/fixtures;
echo "current dir: ${PWD}";
cleanup;
echo "test image: ${TEST_IMAGE}";
docker run --rm -v ${PWD}:/opt/verb $TEST_IMAGE

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
echo "current dir: ${PWD}";
comm -2 -3 ./fixtures/README.md ./expected/README.md


#cleanup;

echo "";
echo "==> Tests successfully finished";
exit 0;
