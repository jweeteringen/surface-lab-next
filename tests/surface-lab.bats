#!/usr/bin/env bats

@test "surface-lab.sh runs and returns 0" {
  run ./bin/surface-lab.sh
  [ "$status" -eq 0 ]
  [[ "$output" == *"[ OK ]  Mission completed successfully."* ]]
}

