#!/usr/bin/env bats

load test_helper

@test 'prettyxml formats XML nicely' {
  local input='<?xml version="1.0"?>'
  input+=$(echo -e '\n<root><inside a="b">txt</inside></root>')
  local output=$(echo "$input" | prettyxml)
  local expected="<?xml version='1.0'?>
<root>
  <inside a='b'>txt</inside>
</root>"
  [ "$output" = "$expected" ]
}
