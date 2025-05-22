# Base image
FROM php:8.1-cli

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    libtesseract-dev \
    unzip \
    && docker-php-ext-install mysqli

# Install Composer
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy application files
COPY . .

# Install PHP dependencies
RUN composer install

# Expose port
EXPOSE 8000

# Start PHP's built-in server
CMD ["php", "-S", "0.0.0.0:8000"]
