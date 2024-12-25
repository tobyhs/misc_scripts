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
  run -0 gh-permalink gh-permalink/file
  popd
  [ "$output" = 'https://github.com/tobyhs/misc_scripts/blob/8858af58a94c23638f8dea65376fae878c7596d8/test/fixtures/gh-permalink/file' ]
}
