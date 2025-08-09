CREATE TABLE `Customers`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` TEXT NOT NULL,
    `last_name` TEXT NOT NULL,
    `email` TEXT NOT NULL,
    `phone` TEXT NOT NULL,
    `address` JSON NOT NULL
);
CREATE TABLE `Destinations`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `city` TEXT NOT NULL,
    `country` TEXT NOT NULL,
    `description` LONGTEXT NOT NULL
);
CREATE TABLE `Trips`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` TEXT NOT NULL,
    `destination_id` BIGINT NOT NULL,
    `hotel_id` BIGINT NOT NULL,
    `transport_id` BIGINT NOT NULL,
    `start_date` DATETIME NOT NULL,
    `end_date` DATETIME NOT NULL,
    `price` DECIMAL(8, 2) NOT NULL
);
CREATE TABLE `Bookings`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `customer_id` BIGINT NOT NULL,
    `trip_id` BIGINT NOT NULL,
    `booking_date` DATETIME NOT NULL,
    `num_people` INT NOT NULL,
    `total_cost` DECIMAL(8, 2) NOT NULL
);
CREATE TABLE `Payments`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `booking_id` BIGINT NOT NULL,
    `payment_date` DATETIME NOT NULL,
    `amount` DECIMAL(8, 2) NOT NULL,
    `payment_method` TEXT NOT NULL
);
CREATE TABLE `Reviews`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `customer_id` BIGINT NOT NULL,
    `trip_id` BIGINT NOT NULL,
    `rating` DECIMAL(8, 2) NOT NULL,
    `comments` TEXT NOT NULL,
    `review_date` DATETIME NOT NULL
);
CREATE TABLE `Hotels`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `hotel_name` TEXT NOT NULL,
    `destinamtion_id` BIGINT NOT NULL,
    `rating` DECIMAL(8, 2) NOT NULL,
    `room_type` TEXT NOT NULL,
    `price_per_night` DECIMAL(8, 2) NOT NULL
);
CREATE TABLE `Transports`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `transport_type` TEXT NOT NULL,
    `seat_capacity` INT NOT NULL,
    `departure_time` DATETIME NOT NULL,
    `arrival_time` DATETIME NOT NULL
);
ALTER TABLE
    `Reviews` ADD CONSTRAINT `reviews_customer_id_foreign` FOREIGN KEY(`customer_id`) REFERENCES `Customers`(`id`);
ALTER TABLE
    `Payments` ADD CONSTRAINT `payments_booking_id_foreign` FOREIGN KEY(`booking_id`) REFERENCES `Bookings`(`id`);
ALTER TABLE
    `Bookings` ADD CONSTRAINT `bookings_trip_id_foreign` FOREIGN KEY(`trip_id`) REFERENCES `Trips`(`id`);
ALTER TABLE
    `Hotels` ADD CONSTRAINT `hotels_destinamtion_id_foreign` FOREIGN KEY(`destinamtion_id`) REFERENCES `Destinations`(`id`);
ALTER TABLE
    `Trips` ADD CONSTRAINT `trips_hotel_id_foreign` FOREIGN KEY(`hotel_id`) REFERENCES `Hotels`(`id`);
ALTER TABLE
    `Bookings` ADD CONSTRAINT `bookings_customer_id_foreign` FOREIGN KEY(`customer_id`) REFERENCES `Customers`(`id`);
ALTER TABLE
    `Trips` ADD CONSTRAINT `trips_destination_id_foreign` FOREIGN KEY(`destination_id`) REFERENCES `Destinations`(`id`);
ALTER TABLE
    `Trips` ADD CONSTRAINT `trips_transport_id_foreign` FOREIGN KEY(`transport_id`) REFERENCES `Transports`(`id`);