#!/usr/bin/env bats

load test_helper

@test 'sql_in_list with one line' {
  local output=$(echo abc | sql_in_list)
  [ "$output" = "('abc')" ]
}

@test 'sql_in_list with multiple lines' {
  local input=$(echo -e "foo\nbar\nba'z'")
  local output=$(echo "$input" | sql_in_list)
  [ "$output" = "('foo', 'bar', 'ba\'z\'')" ]
}
