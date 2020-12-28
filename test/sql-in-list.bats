#!/usr/bin/env bats

load test_helper

@test 'sql-in-list with one line' {
  local output=$(echo abc | sql-in-list)
  [ "$output" = "('abc')" ]
}

@test 'sql-in-list with multiple lines' {
  local input=$(echo -e "foo\nbar\nba'z'")
  local output=$(echo "$input" | sql-in-list)
  [ "$output" = "('foo', 'bar', 'ba\'z\'')" ]
}
