#!/usr/bin/env bats

load test_helper

setup() {
  PROJECT_DIR="${BATS_TMPDIR}/set-bundle-path-test"
  mkdir -p "$PROJECT_DIR"
  cd "$PROJECT_DIR"
}

teardown() {
  rm -rf "$PROJECT_DIR"
  unset PROJECT_DIR
}

@test "set-bundle-path without Gemfile in directory prints usage" {
  run set-bundle-path
  [ "$status" -eq 1 ]
  [ "$output" = "Run this in a directory with a Gemfile" ]
  ! [ -e .bundle ]
}

@test "set-bundle-path with Gemfile in directory sets the bundler path" {
  touch Gemfile
  run set-bundle-path
  [ "$status" -eq 0 ]

  run bundle config get path
  [ "$status" -eq 0 ]
  [[ "$output" == *\"${HOME}/bundles/set-bundle-path-test\"* ]]
}
