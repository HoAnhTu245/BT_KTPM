#!/bin/bash

# Khởi động dịch vụ SSH ở chế độ foreground
# Tùy chọn -D đảm bảo container không bị tắt ngay sau khi chạy script
/usr/sbin/sshd -D