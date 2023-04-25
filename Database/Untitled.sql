CREATE TABLE `User` (
  `user_id` INTEGER PRIMARY KEY,
  `name` TEXT,
  `email` TEXT,
  `phone` TEXT,
  `address` TEXT,
  `role` TEXT
);

CREATE TABLE `Room` (
  `room_id` INTEGER PRIMARY KEY,
  `name` TEXT,
  `location` TEXT,
  `capacity` INTEGER
);

CREATE TABLE `Book` (
  `book_id` INTEGER PRIMARY KEY,
  `title` TEXT,
  `author` TEXT,
  `publisher` TEXT,
  `publish_date` DATETIME
);

CREATE TABLE `Room_Booking` (
  `booking_id` INTEGER PRIMARY KEY,
  `user_id` INTEGER,
  `room_id` INTEGER,
  `start_time` DATETIME,
  `end_time` DATETIME
);

CREATE TABLE `Room_Booking_Detail` (
  `booking_detail_id` INTEGER PRIMARY KEY,
  `booking_id` INTEGER,
  `room_id` INTEGER,
  `borrow_time` DATETIME,
  `return_time` DATETIME
);

CREATE TABLE `Book_Borrowing` (
  `borrowing_id` INTEGER PRIMARY KEY,
  `user_id` INTEGER,
  `book_id` INTEGER,
  `room_id` INTEGER,
  `borrow_time` DATETIME,
  `return_time` DATETIME
);

ALTER TABLE `Room_Booking` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

ALTER TABLE `Room_Booking` ADD FOREIGN KEY (`room_id`) REFERENCES `Room` (`room_id`);

ALTER TABLE `Room_Booking_Detail` ADD FOREIGN KEY (`booking_id`) REFERENCES `Room_Booking` (`booking_id`);

ALTER TABLE `Room_Booking_Detail` ADD FOREIGN KEY (`room_id`) REFERENCES `Room` (`room_id`);

ALTER TABLE `Book_Borrowing` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

ALTER TABLE `Book_Borrowing` ADD FOREIGN KEY (`book_id`) REFERENCES `Book` (`book_id`);

ALTER TABLE `Book_Borrowing` ADD FOREIGN KEY (`room_id`) REFERENCES `Room` (`room_id`);
