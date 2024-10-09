#!/bin/bash
assert() {
  expected="$1"
  input="$2"

  . "$HOME"/.cargo/env && cargo run "$input" > /tmp/test-target.s
  cc -o /tmp/test-target /tmp/test-target.s -z noexecstack
  /tmp/test-target
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

assert 0 0
assert 42 42

echo OK
