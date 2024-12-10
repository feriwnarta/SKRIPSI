# Menggunakan image resmi Apache dengan PHP
FROM php:7.4-apache

# Install ekstensi MySQLi
RUN docker-php-ext-install mysqli

# Set timezone ke Asia/Jakarta
ENV TZ=Asia/Jakarta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Set working directory di dalam container
WORKDIR /var/www/html

# Menyalin seluruh folder proyek ke dalam container
COPY . .

# Menyalin file konfigurasi virtual host ke dalam container
COPY app.conf /etc/apache2/sites-available/000-default.conf

# Mengatur pengaturan PHP untuk upload file besar
RUN echo "upload_max_filesize = 50M" >> /usr/local/etc/php/conf.d/uploads.ini && \
    echo "post_max_size = 50M" >> /usr/local/etc/php/conf.d/uploads.ini && \
    echo "memory_limit = 128M" >> /usr/local/etc/php/conf.d/uploads.ini

# Mengatur izin untuk folder
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Mengaktifkan mod_rewrite untuk Apache
RUN a2enmod rewrite

# Mengaktifkan konfigurasi virtual host
RUN a2ensite 000-default.conf

# Install cron
RUN apt-get update && apt-get install -y cron

# Menyalin file crontab ke dalam container
COPY crontab.txt /etc/cron.d/my-cron

RUN chmod +x /var/www/html/cronjob_eskalasi/eskalasi.php

# Memberikan izin pada file crontab
RUN chmod 0644 /etc/cron.d/my-cron

# Menerapkan cron job
RUN crontab /etc/cron.d/my-cron

# Membuat file log untuk cron
RUN touch /var/log/cron.log

# Menjalankan cron dan Apache saat kontainer dimulai
CMD service cron start && apache2-foreground
