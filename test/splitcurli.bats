#!/usr/bin/env bats

load test_helper

inputfile="${BATS_TEST_DIRNAME}/fixtures/splitcurli/input.txt"

setup() {
  export SPLIT_CURLI_OUTPUT="${BATS_TMPDIR}/bats_splitcurli_headers.txt"
}

teardown() {
  rm -f "$SPLIT_CURLI_OUTPUT"
}

@test 'splitcurli prints response headers to SPLIT_CURLI_OUTPUT' {
  splitcurli < "$inputfile" > /dev/null
  [ "$(cat "$SPLIT_CURLI_OUTPUT")" = "$(head -4 "$inputfile")" ]
}

@test 'splitcurli prints the response body to stdout' {
  local output="$(splitcurli < "$inputfile")"
  [ "$output" = '{"key":"value"}' ]
}
