#!/usr/bin/env bats

@test 'sql_in_list with one line' {
  local output=$(echo abc | $BATS_TEST_DIRNAME/../sql_in_list)
  [ "$output" = "('abc')" ]
}

@test 'sql_in_list with multiple lines' {
  local input=$(echo -e "foo\nbar\nba'z'")
  local output=$(echo "$input" | $BATS_TEST_DIRNAME/../sql_in_list)
  [ "$output" = "('foo', 'bar', 'ba\'z\'')" ]
}
