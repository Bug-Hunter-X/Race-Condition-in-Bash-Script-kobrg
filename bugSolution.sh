#!/bin/bash

# This script demonstrates a solution to the race condition bug using a lock file.

counter=0
lock_file="counter.lock"

function increment_counter() {
  # Acquire the lock
  flock $lock_file

  local new_counter=$((counter + 1))
  counter=$new_counter
  echo "Counter updated to: $counter"

  # Release the lock
  flock -u $lock_file
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

# Remove the lock file
rm -f $lock_file
