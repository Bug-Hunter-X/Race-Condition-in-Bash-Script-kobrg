#!/bin/bash

# This script demonstrates a race condition bug.

counter=0

function increment_counter() {
  local new_counter=$((counter + 1))
  counter=$new_counter
}

# Create two threads that increment the counter simultaneously.
thread1_pid=$(
  increment_counter &
echo $!
)
thread2_pid=$(
  increment_counter &
echo $!
)

# Wait for both threads to complete.
wait $thread1_pid $thread2_pid

# Print the final counter value.
echo "Final counter value: $counter"
