#!/bin/bash
# Script để kill process đang chạy trên 1 port

if [ -z "$1" ]; then
  echo "❌ Vui lòng nhập port cần kill"
  echo "Cách dùng: ./killport.sh <port>"
  exit 1
fi

PORT=$1
echo "🔎 Đang kiểm tra process trên port $PORT..."

PID=$(lsof -t -i:$PORT)

if [ -z "$PID" ]; then
  echo "✅ Không có process nào chạy trên port $PORT"
else
  echo "⚠️ Tìm thấy PID: $PID, tiến hành kill..."
  kill -9 $PID
  echo "✅ Đã kill process $PID trên port $PORT"
fi
