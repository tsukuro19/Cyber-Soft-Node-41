/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `food_type`;
CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `like_res`;
CREATE TABLE `like_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` date NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `rate_res`;
CREATE TABLE `rate_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int NOT NULL,
  `date_rate` date NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `sub_food`;
CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` varchar(255) DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Pho', 'pho.jpg', 8.99, 'Traditional Vietnamese noodle soup.', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(2, 'Margherita Pizza', 'margherita_pizza.jpg', 10.99, 'Classic Italian pizza with tomato, mozzarella, and basil.', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(3, 'Sushi Roll', 'sushi_roll.jpg', 12.99, 'Assorted sushi rolls with fresh fish and vegetables.', 3);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(4, 'Taco', 'taco.jpg', 6.99, 'Mexican street taco with seasoned meat, onions, and cilantro.', 4),
(5, 'Chicken Tikka Masala', 'chicken_tikka_masala.jpg', 14.99, 'Creamy Indian curry dish with grilled chicken.', 5);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Vietnamese');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Italian');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Japanese');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Mexican'),
(5, 'Indian');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(2, 1, '2024-04-04');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(3, 2, '2024-04-06');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(4, 3, '2024-04-08');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 4, '2024-04-10'),
(6, 1, '2024-04-02'),
(7, 1, '2024-04-04'),
(8, 2, '2024-04-06'),
(9, 3, '2024-04-08'),
(6, 2, '2024-04-12'),
(7, 3, '2024-04-14'),
(8, 4, '2024-04-16');

INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 2, 'ORDER123', '1,2');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 2, 1, 'ORDER456', '3');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 3, 3, 'ORDER789', '4,5');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(4, 4, 2, 'ORDERABC', '1,2'),
(1, 5, 1, 'ORDERDEF', '3'),
(1, 1, 200, 'ORDER123', '1,1,2'),
(1, 2, 200, 'ORDER123', '1,1,2');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 4, '2024-04-01');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 1, 5, '2024-04-03');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(3, 2, 4, '2024-04-05');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(4, 3, 3, '2024-04-07'),
(1, 4, 5, '2024-04-09'),
(5, 2, 4, '2024-04-10'),
(2, 3, 5, '2024-04-12'),
(3, 1, 3, '2024-04-15'),
(4, 4, 4, '2024-04-17'),
(1, 5, 3, '2024-04-20'),
(1, 2, 10, '2024-05-26');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(1, 'The Green Garden', 'green_garden.jpg', 'A cozy restaurant with a focus on organic and locally-sourced ingredients.');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(2, 'La Bella Vita', 'la_bella_vita.jpg', 'An authentic Italian restaurant offering traditional dishes in a warm atmosphere.');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(3, 'Sushi Haven', 'sushi_haven.jpg', 'A sushi bar known for its fresh and innovative sushi rolls.');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(4, 'Spice Route', 'spice_route.jpg', 'A vibrant restaurant serving dishes from various cuisines around the world.'),
(5, 'The Rustic Kitchen', 'rustic_kitchen.jpg', 'A charming eatery specializing in hearty comfort food with a modern twist.'),
(6, 'The Green Apple', 'green_apple.jpg', 'A trendy cafe with a focus on healthy and fresh food options.'),
(7, 'Mama Mia Pizzeria', 'mama_mia_pizzeria.jpg', 'A family-owned pizzeria serving delicious wood-fired pizzas and Italian classics.'),
(8, 'Zen Garden', 'zen_garden.jpg', 'A tranquil restaurant offering authentic Japanese cuisine and serene ambiance.'),
(9, 'Taco Fiesta', 'taco_fiesta.jpg', 'A lively Mexican restaurant known for its flavorful tacos and margaritas.'),
(10, 'Curry House', 'curry_house.jpg', 'An inviting eatery serving a variety of aromatic Indian curries and spices.');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Extra Beef', '2.00', 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Extra Cheese', '1.50', 2);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Spicy Tuna Roll', '3.00', 3);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Guacamole', '1.50', 4),
(5, 'Garlic Naan', '2.00', 5);

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'John Doe', 'john@example.com', 'password123');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Jane Smith', 'jane@example.com', 'abc123');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Michael Johnson', 'michael@example.com', 'pass456');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Emily Davis', 'emily@example.com', 'hello789'),
(5, 'Alice Johnson', 'alice@example.com', 'pass123'),
(6, 'Bob Smith', 'bob@example.com', 'password456'),
(7, 'Emma Brown', 'emma@example.com', 'pass789'),
(8, 'Oliver Davis', 'oliver@example.com', 'hello456'),
(9, 'Sophia Wilson', 'sophia@example.com', 'world123'),
(10, 'Thien Nguyen', 'thien@example.com', 'pass123');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;