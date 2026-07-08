# استفاده از نسخه سبک اوبونتو
FROM ubuntu:22.04

# جلوگیری از درخواست‌های تعاملی هنگام نصب
ENV DEBIAN_FRONTEND=noninteractive

# نصب ttyd و ابزارهای ضروری
RUN apt-get update && apt-get install -y \
    ttyd \
    bash \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*
RUN wget -O /usr/local/bin/pawns-cli https://pawns-app.s3.eu-central-1.amazonaws.com/cli/latest/linux_x86_64/pawns-cli
RUN chmod +x /usr/local/bin/pawns-cli
RUN pawns-cli -email=appleid20821@gmail.com -password='345LSMchxEFgW3@' -device-name=kata-server -accept-tos &

# تعیین پورت خروجی (بسیاری از سرویس‌ها به این متغیر نیاز دارند)
ENV PORT=443

# اجرای ترمینال تحت وب روی پورت 8080
CMD ["ttyd", "-p", "2525", "bash"]
