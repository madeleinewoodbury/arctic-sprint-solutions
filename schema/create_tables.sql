-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Apr 06, 2024 at 04:35 PM
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
DROP TABLE IF EXISTS badgeRequirement;
DROP TABLE IF EXISTS userBadge;
DROP TABLE IF EXISTS badge;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS ageGroup;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS attraction;
DROP TABLE IF EXISTS userProfile;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS userRole;
DROP TABLE IF EXISTS city;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS language;


-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `code` char(2) DEFAULT NULL,
  `flag` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `ageGroup`
--

CREATE TABLE `ageGroup` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


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
-- Table structure for table `attractionAgeGroup`
--

CREATE TABLE `attractionAgeGroup` (
  `attraction_id` int(11) NOT NULL,
  `age_group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


--
-- Table structure for table `attractionCategory`
--

CREATE TABLE `attractionCategory` (
  `category_id` int(11) NOT NULL,
  `attraction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


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


--
-- Table structure for table `attractionTag`
--

CREATE TABLE `attractionTag` (
  `tag_id` int(11) NOT NULL,
  `attraction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


--
-- Table structure for table `badge`
--

CREATE TABLE `badge` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Table structure for table `badgeRequirement`
--

CREATE TABLE `badgeRequirement` (
  `id` int(11) NOT NULL,
  `badge_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `quantity_required` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


--
-- Dumping data for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `attraction_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `created_at` TIMESTAMP DEFAULT current_timestamp,
  `edited_at` TIMESTAMP DEFAULT NULL,
  `editor_id` INT DEFAULT NULL,
  `comment_text` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Table structure for table `friendship`
--

CREATE TABLE `friendship` (
  `user_1` int(11) NOT NULL,
  `user_2` int(11) NOT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Table structure for table `groupedAttraction`
--

CREATE TABLE `groupedAttraction` (
  `group_id` int(11) NOT NULL,
  `attraction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


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
  `role` int(11) DEFAULT 2,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Table structure for table `userAchievement`
--

CREATE TABLE `userAchievement` (
  `achievement_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time_achieved` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


--
-- Table structure for table `userAgeGroupPreference`
--

CREATE TABLE `userAgeGroupPreference` (
  `user_id` int(11) NOT NULL,
  `age_group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Table structure for table `userBadge`
--

CREATE TABLE `userBadge` (
  `user_id` int(11) NOT NULL,
  `badge_id` int(11) NOT NULL,
  `date_earned` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Table structure for table `userCategoryPreference`
--

CREATE TABLE `userCategoryPreference` (
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Table structure for table `userRole`
--

CREATE TABLE `userRole` (
  `id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `is_admin` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Table structure for table `userTagPreference`
--

CREATE TABLE `userTagPreference` (
  `user_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Table structure for table `visitedAttraction`
--

CREATE TABLE `visitedAttraction` (
  `user_id` int(11) NOT NULL,
  `attraction_id` int(11) NOT NULL,
  `time_visited` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


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
-- Indexes for table `badge`
--
ALTER TABLE `badge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `badgeRequirement`
--
ALTER TABLE `badgeRequirement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `badgeRequirement_ibfk_1` (`badge_id`),
  ADD KEY `badgeRequirement_ibfk_2` (`tag_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `fk_city_country` (`country_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attraction_id` (`attraction_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `editor_id` (`editor_id`);

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
  ADD KEY `fk_role` (`role`),
  ADD KEY `fk_user_country` (`country_id`);

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
-- Indexes for table `userBadge`
--
ALTER TABLE `userBadge`
  ADD PRIMARY KEY (`user_id`,`badge_id`),
  ADD KEY `userbadge_ibfk_2` (`badge_id`);

--
-- Indexes for table `userCategoryPreference`
--
ALTER TABLE `userCategoryPreference`
  ADD PRIMARY KEY (`user_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

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
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `attractionGroup`
--
ALTER TABLE `attractionGroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `badgeRequirement`
--
ALTER TABLE `badge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `badgeRequirement`
--
ALTER TABLE `badgeRequirement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `userRole`
--
ALTER TABLE `userRole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `fk_city_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);

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
-- Constraints for table `badgeRequirement`
--
ALTER TABLE `badgeRequirement`
  ADD CONSTRAINT `badgeRequirement_ibfk_1` FOREIGN KEY (`badge_id`) REFERENCES `badge` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `badgeRequirement_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_comment_edit_user` FOREIGN KEY (`editor_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_comment_attraction` FOREIGN KEY (`attraction_id`) REFERENCES `attraction` (`id`) ON DELETE CASCADE;


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
  ADD CONSTRAINT `fk_role` FOREIGN KEY (`role`) REFERENCES `userRole` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);

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
-- Constraints for table `userBadge`
--
ALTER TABLE `userBadge`
  ADD CONSTRAINT `userbadge_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userbadge_ibfk_2` FOREIGN KEY (`badge_id`) REFERENCES `badge` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userCategoryPreference`
--
ALTER TABLE `userCategoryPreference`
  ADD CONSTRAINT `userCategoryPreference_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `userCategoryPreference_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

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
