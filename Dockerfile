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

# تعیین پورت خروجی (بسیاری از سرویس‌ها به این متغیر نیاز دارند)
ENV PORT=443

# اجرای ترمینال تحت وب روی پورت 8080
CMD ["ttyd", "-p", "2525", "bash"]
