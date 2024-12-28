#!/usr/bin/env bats

load test_helper

@test "gh-permalink without any arguments prints usage" {
  run -1 gh-permalink
  [[ "$output" == Usage:\ *gh-permalink\ PATH_TO_FILE ]]
}

@test "gh-permalink when given a non-existent file prints an error" {
  run -1 gh-permalink non-existent-file
  [ "$output" = 'Error: File does not exist: non-existent-file' ]
}

@test "gh-permalink when given an existent file prints a GitHub permalink" {
  pushd "${BATS_TEST_DIRNAME}/fixtures"
  run -0 gh-permalink 'gh-permalink/[dir]/[(file)].txt'
  popd
  [ "$output" = 'https://github.com/tobyhs/misc_scripts/blob/1755eb9363ec244b59f87edf5e027d59ed091630/test/fixtures/gh-permalink/%5Bdir%5D/%5B(file)%5D.txt' ]
}
