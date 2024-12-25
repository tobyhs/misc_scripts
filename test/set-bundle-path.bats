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
  run -1 set-bundle-path
  [ "$output" = "Run this in a directory with a Gemfile" ]
  ! [ -e .bundle ]
}

@test "set-bundle-path with Gemfile in directory sets the bundler path" {
  touch Gemfile
  run -0 set-bundle-path

  run -0 bundle config get path
  [[ "$output" == *\"../bundles/set-bundle-path-test\"* ]]
}
