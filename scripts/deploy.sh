#!/bin/bash

# Install python bindings
pip install llama-cpp-python==0.1.63

# Start Redis instance
redis-server /etc/redis/redis.conf &

# Start the API
cd api && uvicorn src.serge.main:app --host 0.0.0.0 --port 8008 &

# Wait for any process to exit
wait -n

# Exit with status of process that exited first
exit $?
