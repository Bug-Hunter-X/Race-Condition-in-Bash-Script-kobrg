# Race Condition in Bash Script

This repository demonstrates a race condition bug in a bash script.  Two threads concurrently increment a shared counter variable, leading to a potential outcome where the final counter value is not the expected 2. The solution implements proper locking mechanisms to prevent this issue.