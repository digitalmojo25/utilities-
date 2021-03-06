CREATE TABLE `users` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`username` varchar(32) NOT NULL,
	`password` TEXT NOT NULL,
	`email` varchar(64) NOT NULL UNIQUE,
	`favorite_pet` varchar(32),
	PRIMARY KEY (`id`)
);

CREATE TABLE `pets` (
	`name` varchar(32) NOT NULL,
	`type` INT NOT NULL,
	`age` INT(3) NOT NULL,
	`gender` BOOLEAN,
	`owner` INT NOT NULL,
	PRIMARY KEY (`name`,`owner`)
);

CREATE TABLE `pet_types` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`family` varchar(16) NOT NULL,
	`breed` varchar(30),
	PRIMARY KEY (`id`)
);

CREATE TABLE `cars` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`make` varchar(16) NOT NULL,
	`model` varchar(16) NOT NULL,
	`year` INT(4) NOT NULL,
	`color` varchar(16) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `user_cars` (
	`user_id` INT NOT NULL,
	`cars_id` INT NOT NULL,
	PRIMARY KEY (`user_id`,`cars_id`)
);

ALTER TABLE `users` ADD CONSTRAINT `users_fk0` FOREIGN KEY (`favorite_pet`) REFERENCES `pets`(`name`);

ALTER TABLE `pets` ADD CONSTRAINT `pets_fk0` FOREIGN KEY (`type`) REFERENCES `pet_types`(`id`);

ALTER TABLE `pets` ADD CONSTRAINT `pets_fk1` FOREIGN KEY (`owner`) REFERENCES `users`(`id`);

ALTER TABLE `user_cars` ADD CONSTRAINT `user_cars_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `user_cars` ADD CONSTRAINT `user_cars_fk1` FOREIGN KEY (`cars_id`) REFERENCES `cars`(`id`);
