# Menggunakan image resmi Apache dengan PHP
FROM php:7.4-apache

# Install ekstensi MySQLi
RUN docker-php-ext-install mysqli

# Set working directory di dalam container
WORKDIR /var/www/html

# Menyalin seluruh folder proyek ke dalam container
COPY . .

# Menyalin file konfigurasi virtual host ke dalam container
COPY app.conf /etc/apache2/sites-available/000-default.conf

# Mengatur izin untuk folder
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html && \
    chmod -R 755 /var/www/html/imageabsen && \
    chmod -R 755 /var/www/html/imageevent && \
    chmod -R 755 /var/www/html/imagenews && \
    chmod -R 755 /var/www/html/imagereport && \
    chmod -R 755 /var/www/html/imagestatus && \
    chmod -R 755 /var/www/html/imageuser && \
    chmod -R 755 /var/www/html/imageworker && \
    chmod -R 755 /var/www/html/ipl_proof  # Memberikan akses ke semua folder

# Mengaktifkan mod_rewrite untuk Apache
RUN a2enmod rewrite

# Mengaktifkan konfigurasi virtual host
RUN a2ensite 000-default.conf
