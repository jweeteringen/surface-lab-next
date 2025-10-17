#!/usr/bin/env bats

load 'test_helper/bats-support/load'
load 'test_helper/bats-assert/load'

@test "surface-lab.sh runs successfully" {
  run ./bin/surface-lab.sh
  [ "$status" -eq 0 ]
  assert_output --partial "[ OK ]  Mission completed successfully."
}
