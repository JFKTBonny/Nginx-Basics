#!/bin/bash
# wait-for-it.sh
host="$1"
shift
port="$1"
shift
timeout="$1"
shift
cmd="$@"

until nc -z "$host" "$port"; do
  echo "Waiting for $host:$port..."
  sleep 2
done

echo "$host:$port is available, starting command"
exec $cmd
