#!/usr/bin/env bats

sql_in_list=$BATS_TEST_DIRNAME/../bin/sql_in_list

@test 'sql_in_list with one line' {
  local output=$(echo abc | $sql_in_list)
  [ "$output" = "('abc')" ]
}

@test 'sql_in_list with multiple lines' {
  local input=$(echo -e "foo\nbar\nba'z'")
  local output=$(echo "$input" | $sql_in_list)
  [ "$output" = "('foo', 'bar', 'ba\'z\'')" ]
}
