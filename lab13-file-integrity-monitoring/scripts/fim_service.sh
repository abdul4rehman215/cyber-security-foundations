#!/bin/bash
LOG="$HOME/monitoring_logs/fim_service.log"
PID="$HOME/fim_service.pid"

start() {
 while true; do
   ./file_integrity_checker.sh -s >> "$LOG"
   sleep 300
 done &
 echo $! > "$PID"
}

stop() {
 kill "$(cat $PID)" && rm -f "$PID"
}

case "$1" in
 start) start ;;
 stop) stop ;;
 status) ps -p "$(cat $PID)" ;;
 *) echo "Usage: $0 start|stop|status" ;;
esac
