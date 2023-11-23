CREATE TABLE `users` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(32) NOT NULL,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `schools` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(32) NOT NULL,
    `founding_year` YEAR NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `companies` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `connections_users` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user1_id` INT UNSIGNED,
    `user2_id` INT UNSIGNED,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user1_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`user2_id`) REFERENCES `users`(`id`)
);

CREATE TABLE `connections_users_schools` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED,
    `school_id` INT UNSIGNED,
    `start_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `graduation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `degree` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`)
);

CREATE TABLE `connections_users_companies` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED,
    `company_id` INT UNSIGNED,
    `start_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `end_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `title` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);