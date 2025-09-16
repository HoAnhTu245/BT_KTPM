# BƯỚC 1: Chọn một hệ điều hành làm nền tảng. Ubuntu 22.04 là một lựa chọn phổ biến.
FROM ubuntu:22.04

# Ghi chú tác giả (tùy chọn)
LABEL maintainer="ten_cua_ban@email.com"

# BƯỚC 2: Cập nhật hệ điều hành và cài đặt các gói cơ bản ban đầu
# -y: tự động trả lời "yes" cho các câu hỏi
# openssh-server: cần thiết để truy cập từ xa qua SSH
# sudo: cho phép người dùng thường thực thi lệnh với quyền quản trị
# nano: một trình soạn thảo văn bản đơn giản trong terminal, tiện cho việc chỉnh sửa
RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    nano \
    && rm -rf /var/lib/apt/lists/*

# BƯỚC 3: Tạo một người dùng mới để làm việc (an toàn hơn là dùng user 'root')
RUN useradd -m -s /bin/bash hatus \
    && echo "hatus:3011" | chpasswd \
    && adduser hatus sudo

# BƯỚC 4: Cấu hình cho SSH
RUN mkdir /var/run/sshd
# Thông báo rằng image này sẽ sử dụng cổng 22
EXPOSE 22

# BƯỚC 5: Sao chép kịch bản khởi động từ máy thật vào trong image
COPY startup.sh /usr/local/bin/startup.sh
# Cấp quyền thực thi cho kịch bản đó
RUN chmod +x /usr/local/bin/startup.sh

# BƯỚC 6: Lệnh sẽ được chạy khi container khởi động
CMD ["/usr/local/bin/startup.sh"]