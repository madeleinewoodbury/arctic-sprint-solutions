-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Mar 05, 2024 at 11:34 AM
-- Server version: 11.2.3-MariaDB-1:11.2.3+maria~ubu2204
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
--
-- Database: `arcticSprintSolutionsDB`
--

CREATE DATABASE IF NOT EXISTS `arcticSprintSolutionsDB` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `arcticSprintSolutionsDB`;

-- --------------------------------------------------------


--
-- DROP TABLES
--

DROP TABLE IF EXISTS friendship;
DROP TABLE IF EXISTS userAchievement;
DROP TABLE IF EXISTS achievement;
DROP TABLE IF EXISTS visitedAttraction;
DROP TABLE IF EXISTS groupedAttraction;
DROP TABLE IF EXISTS attractionTag;
DROP TABLE IF EXISTS attractionCategory;
DROP TABLE IF EXISTS attractionAgeGroup;
DROP TABLE IF EXISTS attractionGroup;
DROP TABLE IF EXISTS userAgeGroupPreference;
DROP TABLE IF EXISTS userTagPreference;
DROP TABLE IF EXISTS userCategoryPreference;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS ageGroup;
DROP TABLE IF EXISTS attraction;
DROP TABLE IF EXISTS userProfile;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS userRole;
DROP TABLE IF EXISTS city;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS language;

--
-- Table structure for table `achievement`
--

CREATE TABLE `achievement` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `points_needed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `achievement`
--

INSERT INTO `achievement` (`id`, `title`, `description`, `points_needed`) VALUES
(1, 'Explorer', 'Visited 10 different attractions', 100),
(2, 'Globetrotetr', 'Visited 20 different attractions', 200);

-- --------------------------------------------------------

--
-- Table structure for table `ageGroup`
--

CREATE TABLE `ageGroup` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `ageGroup`
--

INSERT INTO `ageGroup` (`id`, `name`) VALUES
(1, 'All age groups'),
(2, '0-4 years'),
(3, '5-9 years'),
(4, '10-12 years'),
(5, '13-17 years'),
(6, '18-25 years'),
(7, '26-35 years'),
(8, '36-45 years'),
(9, '46-55 years'),
(10, '56-65 years'),
(11, '65+ years');

-- --------------------------------------------------------

--
-- Table structure for table `attraction`
--

CREATE TABLE `attraction` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `city` int(11) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `points` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `attraction`
--

INSERT INTO `attraction` (`id`, `name`, `city`, `location`, `description`, `image`, `points`) VALUES
(1, 'Ishavskatedralen', 1, 'Hans Nilsens veg 41', 'An iconic church with unique architecture and stunning views of the fjord.', 'https://www.ishavskatedralen.no/wp-content/uploads/2013/06/testfoto1.jpg', 10),
(2, 'Fjellheisen Tromsø', 1, 'Sollivegen 12', 'The Cable Car is Tromsø’s most popular tourist destination. It runs from Solliveien in Tromsdalen up to the mountain ledge Storsteinen. The lower station is located on Tromsø’s mainland, 50 m above sea level, while the upper station, Fjellstua, is situated at an altitude of 421 m above sea level. The trip up takes just four minutes. From the large outdoor terrace, you can enjoy the spectacular panoramic view of Tromsø and the virtually endless sight of islands, fjords, mountains and the open sea. Fjellheisen was built in 1961 by Brød­rene Jakob­sens Rederi, a local shipping company that was a major player in arctic hunting/trapping, fishing and expeditions to the arc­tic and Antarctic. The gondolas proudly convey this tradition by bearing the shipping company’s symbols: the polar bear and the seal.', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/9d/14/38/yellow-gondola-fjellheisen.jpg?w=1200&h=-1&s=1', 10),
(3, 'Polaria', 1, 'Hjalmar Johansens Gate 12', 'Polaria is an Arctic Experience Centre and Aquarium located in the heart of Tromsø. Learn about Climate Change through our brand-new interactive exhibitions, reflect over how all life in the Arctic is connected, and discover how you can make a difference. In our aquarium you will find unique species of fish and crustations from the northern regions, as well as our five seals. Join in on the daily feeding and training sessions of the seals at 10:30, 12:30 and 15:30. Sit down and enjoy our three Panoramic films about the nature and wildlife at Svalbard, the magical Northern Lights, and a behind the scenes documentary showing how we work with our animals. Polaria is suitable for all ages, and the perfect place for those who are interested in diving beneath the surface to explore the Arctic in a unique way.\n\n', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2b/57/e0/7a/meet-the-bearded-seals.jpg?w=1200&h=-1&s=1', 10);

-- --------------------------------------------------------

--
-- Table structure for table `attractionAgeGroup`
--

CREATE TABLE `attractionAgeGroup` (
  `attraction_id` int(11) NOT NULL,
  `age_group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `attractionAgeGroup`
--

INSERT INTO `attractionAgeGroup` (`attraction_id`, `age_group_id`) VALUES
(1, 1),
(1, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `attractionCategory`
--

CREATE TABLE `attractionCategory` (
  `category_id` int(11) NOT NULL,
  `attraction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `attractionCategory`
--

INSERT INTO `attractionCategory` (`category_id`, `attraction_id`) VALUES
(9, 1),
(3, 2),
(7, 3),
(8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `attractionGroup`
--

CREATE TABLE `attractionGroup` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `visibility` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attractionTag`
--

CREATE TABLE `attractionTag` (
  `tag_id` int(11) NOT NULL,
  `attraction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `attractionTag`
--

INSERT INTO `attractionTag` (`tag_id`, `attraction_id`) VALUES
(5, 1),
(17, 1),
(1, 2),
(3, 2),
(8, 2),
(17, 2),
(3, 3),
(7, 3),
(17, 3);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Historical sites'),
(2, 'Art and culture'),
(3, 'Nature and outdoor experiences'),
(4, 'Architecture and landmarks'),
(5, 'Adventure and extreme sports'),
(6, 'Food and drink'),
(7, 'Family activities and amusement parks'),
(8, 'Science and technology'),
(9, 'Religious sites and shrines'),
(10, 'Local markets and shopping streets');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `country` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `description`, `image`, `country`) VALUES
(1, 'Tromsø', 'Tromsø, a vibrant city surrounded by majestic mountains and the Arctic landscape, is known as the \'Gateway to the Arctic Sea.\' The city offers a unique blend of culture, history, and nature, with attractions such as the Arctic Cathedral, Polaria, and opportunities for Northern Lights safaris and outdoor activities', 'https://images.unsplash.com/photo-1609538205185-40f2701cf7d6?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 1);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`, `code`) VALUES
(1, 'Norway', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `friendship`
--

CREATE TABLE `friendship` (
  `user_1` int(11) NOT NULL,
  `user_2` int(11) NOT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groupedAttraction`
--

CREATE TABLE `groupedAttraction` (
  `group_id` int(11) NOT NULL,
  `attraction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `name`) VALUES
(1, 'English');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `name`) VALUES
(1, 'Outdoor'),
(2, 'Historical'),
(3, 'Family-friendly'),
(4, 'Shopping'),
(5, 'Architecture'),
(6, 'Culinary experience'),
(7, 'Wildlife'),
(8, 'Scenic beauty'),
(9, 'Wheelchair accessible'),
(10, 'Child-friendly'),
(11, 'Visually impaired accessible'),
(12, 'Hearing impaired accessible'),
(13, 'Winter'),
(14, 'Summer'),
(15, 'Fall'),
(16, 'Spring'),
(17, 'Year-round');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userAchievement`
--

CREATE TABLE `userAchievement` (
  `achievement_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time_achieved` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userAgeGroupPreference`
--

CREATE TABLE `userAgeGroupPreference` (
  `user_id` int(11) NOT NULL,
  `age_group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userCategoryPreference`
--

CREATE TABLE `userCategoryPreference` (
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userProfile`
--

CREATE TABLE `userProfile` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bio` text DEFAULT NULL,
  `country` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userRole`
--

CREATE TABLE `userRole` (
  `id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `is_admin` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userRole`
--

INSERT INTO `userRole` (`id`, `title`, `is_admin`) VALUES
(1, 'Administrator', 1),
(2, 'Bruker', 0);

-- --------------------------------------------------------

--
-- Table structure for table `userTagPreference`
--

CREATE TABLE `userTagPreference` (
  `user_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitedAttraction`
--

CREATE TABLE `visitedAttraction` (
  `user_id` int(11) NOT NULL,
  `attraction_id` int(11) NOT NULL,
  `time_visited` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achievement`
--
ALTER TABLE `achievement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ageGroup`
--
ALTER TABLE `ageGroup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attraction`
--
ALTER TABLE `attraction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city` (`city`);

--
-- Indexes for table `attractionAgeGroup`
--
ALTER TABLE `attractionAgeGroup`
  ADD PRIMARY KEY (`attraction_id`,`age_group_id`),
  ADD KEY `age_group_id` (`age_group_id`);

--
-- Indexes for table `attractionCategory`
--
ALTER TABLE `attractionCategory`
  ADD PRIMARY KEY (`category_id`,`attraction_id`),
  ADD KEY `attraction_id` (`attraction_id`);

--
-- Indexes for table `attractionGroup`
--
ALTER TABLE `attractionGroup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`);

--
-- Indexes for table `attractionTag`
--
ALTER TABLE `attractionTag`
  ADD PRIMARY KEY (`tag_id`,`attraction_id`),
  ADD KEY `attraction_id` (`attraction_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_city_country` (`country`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friendship`
--
ALTER TABLE `friendship`
  ADD PRIMARY KEY (`user_1`,`user_2`),
  ADD KEY `user_2` (`user_2`);

--
-- Indexes for table `groupedAttraction`
--
ALTER TABLE `groupedAttraction`
  ADD PRIMARY KEY (`group_id`,`attraction_id`),
  ADD KEY `attraction_id` (`attraction_id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_role` (`role`);

--
-- Indexes for table `userAchievement`
--
ALTER TABLE `userAchievement`
  ADD PRIMARY KEY (`achievement_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `userAgeGroupPreference`
--
ALTER TABLE `userAgeGroupPreference`
  ADD PRIMARY KEY (`user_id`,`age_group_id`),
  ADD KEY `age_group_id` (`age_group_id`);

--
-- Indexes for table `userCategoryPreference`
--
ALTER TABLE `userCategoryPreference`
  ADD PRIMARY KEY (`user_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `userProfile`
--
ALTER TABLE `userProfile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `country` (`country`);

--
-- Indexes for table `userRole`
--
ALTER TABLE `userRole`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userTagPreference`
--
ALTER TABLE `userTagPreference`
  ADD PRIMARY KEY (`user_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `visitedAttraction`
--
ALTER TABLE `visitedAttraction`
  ADD PRIMARY KEY (`user_id`,`attraction_id`),
  ADD KEY `attraction_id` (`attraction_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achievement`
--
ALTER TABLE `achievement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ageGroup`
--
ALTER TABLE `ageGroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `attraction`
--
ALTER TABLE `attraction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attractionGroup`
--
ALTER TABLE `attractionGroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userProfile`
--
ALTER TABLE `userProfile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userRole`
--
ALTER TABLE `userRole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attraction`
--
ALTER TABLE `attraction`
  ADD CONSTRAINT `attraction_ibfk_1` FOREIGN KEY (`city`) REFERENCES `city` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attractionAgeGroup`
--
ALTER TABLE `attractionAgeGroup`
  ADD CONSTRAINT `attractionAgeGroup_ibfk_1` FOREIGN KEY (`attraction_id`) REFERENCES `attraction` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attractionAgeGroup_ibfk_2` FOREIGN KEY (`age_group_id`) REFERENCES `ageGroup` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attractionCategory`
--
ALTER TABLE `attractionCategory`
  ADD CONSTRAINT `attractionCategory_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attractionCategory_ibfk_2` FOREIGN KEY (`attraction_id`) REFERENCES `attraction` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attractionGroup`
--
ALTER TABLE `attractionGroup`
  ADD CONSTRAINT `attractionGroup_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attractionTag`
--
ALTER TABLE `attractionTag`
  ADD CONSTRAINT `attractionTag_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attractionTag_ibfk_2` FOREIGN KEY (`attraction_id`) REFERENCES `attraction` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `fk_city_country` FOREIGN KEY (`country`) REFERENCES `country` (`id`);

--
-- Constraints for table `friendship`
--
ALTER TABLE `friendship`
  ADD CONSTRAINT `friendship_ibfk_1` FOREIGN KEY (`user_1`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `friendship_ibfk_2` FOREIGN KEY (`user_2`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `groupedAttraction`
--
ALTER TABLE `groupedAttraction`
  ADD CONSTRAINT `groupedAttraction_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `attractionGroup` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `groupedAttraction_ibfk_2` FOREIGN KEY (`attraction_id`) REFERENCES `attraction` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_role` FOREIGN KEY (`role`) REFERENCES `userRole` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `userAchievement`
--
ALTER TABLE `userAchievement`
  ADD CONSTRAINT `userAchievement_ibfk_1` FOREIGN KEY (`achievement_id`) REFERENCES `achievement` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userAchievement_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userAgeGroupPreference`
--
ALTER TABLE `userAgeGroupPreference`
  ADD CONSTRAINT `userAgeGroupPreference_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `userAgeGroupPreference_ibfk_2` FOREIGN KEY (`age_group_id`) REFERENCES `ageGroup` (`id`);

--
-- Constraints for table `userCategoryPreference`
--
ALTER TABLE `userCategoryPreference`
  ADD CONSTRAINT `userCategoryPreference_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `userCategoryPreference_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `userProfile`
--
ALTER TABLE `userProfile`
  ADD CONSTRAINT `userProfile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `userProfile_ibfk_2` FOREIGN KEY (`country`) REFERENCES `country` (`id`);

--
-- Constraints for table `userTagPreference`
--
ALTER TABLE `userTagPreference`
  ADD CONSTRAINT `userTagPreference_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `userTagPreference_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`);

--
-- Constraints for table `visitedAttraction`
--
ALTER TABLE `visitedAttraction`
  ADD CONSTRAINT `visitedAttraction_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `visitedAttraction_ibfk_2` FOREIGN KEY (`attraction_id`) REFERENCES `attraction` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
