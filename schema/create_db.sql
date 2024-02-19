-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Feb 19, 2024 at 12:36 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `Achievement`
--

CREATE TABLE `Achievement` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `points_needed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `Achievement`
--

INSERT INTO `Achievement` (`id`, `title`, `description`, `points_needed`) VALUES
(1, 'Explorer', 'Visited 10 different attractions', 100),
(2, 'Globetrotetr', 'Visited 20 different attractions', 200);

-- --------------------------------------------------------

--
-- Table structure for table `AgeGroup`
--

CREATE TABLE `AgeGroup` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `AgeGroup`
--

INSERT INTO `AgeGroup` (`id`, `name`) VALUES
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
-- Table structure for table `Attraction`
--

CREATE TABLE `Attraction` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `city` int(11) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `points` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `Attraction`
--

INSERT INTO `Attraction` (`id`, `name`, `city`, `location`, `description`, `image`, `points`) VALUES
(1, 'Ishavskatedralen', 1, 'Hans Nilsens veg 41', 'An iconic church with unique architecture and stunning views of the fjord.', 'https://www.ishavskatedralen.no/wp-content/uploads/2013/06/testfoto1.jpg', 10),
(2, 'Fjellheisen Tromsø', 1, 'Sollivegen 12', 'The Cable Car is Tromsø’s most popular tourist destination. It runs from Solliveien in Tromsdalen up to the mountain ledge Storsteinen. The lower station is located on Tromsø’s mainland, 50 m above sea level, while the upper station, Fjellstua, is situated at an altitude of 421 m above sea level. The trip up takes just four minutes. From the large outdoor terrace, you can enjoy the spectacular panoramic view of Tromsø and the virtually endless sight of islands, fjords, mountains and the open sea. Fjellheisen was built in 1961 by Brød­rene Jakob­sens Rederi, a local shipping company that was a major player in arctic hunting/trapping, fishing and expeditions to the arc­tic and Antarctic. The gondolas proudly convey this tradition by bearing the shipping company’s symbols: the polar bear and the seal.', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/9d/14/38/yellow-gondola-fjellheisen.jpg?w=1200&h=-1&s=1', 10),
(3, 'Polaria', 1, 'Hjalmar Johansens Gate 12', 'Polaria is an Arctic Experience Centre and Aquarium located in the heart of Tromsø. Learn about Climate Change through our brand-new interactive exhibitions, reflect over how all life in the Arctic is connected, and discover how you can make a difference. In our aquarium you will find unique species of fish and crustations from the northern regions, as well as our five seals. Join in on the daily feeding and training sessions of the seals at 10:30, 12:30 and 15:30. Sit down and enjoy our three Panoramic films about the nature and wildlife at Svalbard, the magical Northern Lights, and a behind the scenes documentary showing how we work with our animals. Polaria is suitable for all ages, and the perfect place for those who are interested in diving beneath the surface to explore the Arctic in a unique way.\n\n', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2b/57/e0/7a/meet-the-bearded-seals.jpg?w=1200&h=-1&s=1', 10);

-- --------------------------------------------------------

--
-- Table structure for table `AttractionAgeGroup`
--

CREATE TABLE `AttractionAgeGroup` (
  `attraction_id` int(11) NOT NULL,
  `age_group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `AttractionAgeGroup`
--

INSERT INTO `AttractionAgeGroup` (`attraction_id`, `age_group_id`) VALUES
(1, 1),
(1, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `AttractionCategory`
--

CREATE TABLE `AttractionCategory` (
  `category_id` int(11) NOT NULL,
  `attraction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `AttractionCategory`
--

INSERT INTO `AttractionCategory` (`category_id`, `attraction_id`) VALUES
(9, 1),
(3, 2),
(7, 3),
(8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `AttractionGroup`
--

CREATE TABLE `AttractionGroup` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `visibility` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `AttractionTag`
--

CREATE TABLE `AttractionTag` (
  `tag_id` int(11) NOT NULL,
  `attraction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `AttractionTag`
--

INSERT INTO `AttractionTag` (`tag_id`, `attraction_id`) VALUES
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
-- Table structure for table `Category`
--

CREATE TABLE `Category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`id`, `name`) VALUES
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
-- Table structure for table `City`
--

CREATE TABLE `City` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `City`
--

INSERT INTO `City` (`id`, `name`, `description`, `image`) VALUES
(1, 'Tromsø', 'Tromsø, a vibrant city surrounded by majestic mountains and the Arctic landscape, is known as the \'Gateway to the Arctic Sea.\' The city offers a unique blend of culture, history, and nature, with attractions such as the Arctic Cathedral, Polaria, and opportunities for Northern Lights safaris and outdoor activities', 'https://images.unsplash.com/photo-1609538205185-40f2701cf7d6?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');

-- --------------------------------------------------------

--
-- Table structure for table `Friendship`
--

CREATE TABLE `Friendship` (
  `user_1` int(11) NOT NULL,
  `user_2` int(11) NOT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GroupedAttraction`
--

CREATE TABLE `GroupedAttraction` (
  `group_id` int(11) NOT NULL,
  `attraction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Language`
--

CREATE TABLE `Language` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `Language`
--

INSERT INTO `Language` (`id`, `name`) VALUES
(1, 'English');

-- --------------------------------------------------------

--
-- Table structure for table `Tag`
--

CREATE TABLE `Tag` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `Tag`
--

INSERT INTO `Tag` (`id`, `name`) VALUES
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
-- Table structure for table `User`
--

CREATE TABLE `User` (
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
-- Table structure for table `UserAchievement`
--

CREATE TABLE `UserAchievement` (
  `achievement_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time_achieved` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserRole`
--

CREATE TABLE `UserRole` (
  `id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `is_admin` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `UserRole`
--

INSERT INTO `UserRole` (`id`, `title`, `is_admin`) VALUES
(1, 'Administrator', 1),
(2, 'Bruker', 0);

-- --------------------------------------------------------

--
-- Table structure for table `VisitedAttraction`
--

CREATE TABLE `VisitedAttraction` (
  `user_id` int(11) NOT NULL,
  `attraction_id` int(11) NOT NULL,
  `time_visited` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Achievement`
--
ALTER TABLE `Achievement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `AgeGroup`
--
ALTER TABLE `AgeGroup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Attraction`
--
ALTER TABLE `Attraction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city` (`city`);

--
-- Indexes for table `AttractionAgeGroup`
--
ALTER TABLE `AttractionAgeGroup`
  ADD PRIMARY KEY (`attraction_id`,`age_group_id`),
  ADD KEY `age_group_id` (`age_group_id`);

--
-- Indexes for table `AttractionCategory`
--
ALTER TABLE `AttractionCategory`
  ADD PRIMARY KEY (`category_id`,`attraction_id`),
  ADD KEY `attraction_id` (`attraction_id`);

--
-- Indexes for table `AttractionGroup`
--
ALTER TABLE `AttractionGroup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`);

--
-- Indexes for table `AttractionTag`
--
ALTER TABLE `AttractionTag`
  ADD PRIMARY KEY (`tag_id`,`attraction_id`),
  ADD KEY `attraction_id` (`attraction_id`);

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `City`
--
ALTER TABLE `City`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Friendship`
--
ALTER TABLE `Friendship`
  ADD PRIMARY KEY (`user_1`,`user_2`),
  ADD KEY `user_2` (`user_2`);

--
-- Indexes for table `GroupedAttraction`
--
ALTER TABLE `GroupedAttraction`
  ADD PRIMARY KEY (`group_id`,`attraction_id`),
  ADD KEY `attraction_id` (`attraction_id`);

--
-- Indexes for table `Language`
--
ALTER TABLE `Language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Tag`
--
ALTER TABLE `Tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_role` (`role`);

--
-- Indexes for table `UserAchievement`
--
ALTER TABLE `UserAchievement`
  ADD PRIMARY KEY (`achievement_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `UserRole`
--
ALTER TABLE `UserRole`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `VisitedAttraction`
--
ALTER TABLE `VisitedAttraction`
  ADD PRIMARY KEY (`user_id`,`attraction_id`),
  ADD KEY `attraction_id` (`attraction_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Achievement`
--
ALTER TABLE `Achievement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `AgeGroup`
--
ALTER TABLE `AgeGroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `Attraction`
--
ALTER TABLE `Attraction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `AttractionGroup`
--
ALTER TABLE `AttractionGroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Category`
--
ALTER TABLE `Category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `City`
--
ALTER TABLE `City`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Language`
--
ALTER TABLE `Language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Tag`
--
ALTER TABLE `Tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `UserRole`
--
ALTER TABLE `UserRole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Attraction`
--
ALTER TABLE `Attraction`
  ADD CONSTRAINT `Attraction_ibfk_1` FOREIGN KEY (`city`) REFERENCES `City` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `AttractionAgeGroup`
--
ALTER TABLE `AttractionAgeGroup`
  ADD CONSTRAINT `AttractionAgeGroup_ibfk_1` FOREIGN KEY (`attraction_id`) REFERENCES `Attraction` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `AttractionAgeGroup_ibfk_2` FOREIGN KEY (`age_group_id`) REFERENCES `AgeGroup` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `AttractionCategory`
--
ALTER TABLE `AttractionCategory`
  ADD CONSTRAINT `AttractionCategory_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `Category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `AttractionCategory_ibfk_2` FOREIGN KEY (`attraction_id`) REFERENCES `Attraction` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `AttractionGroup`
--
ALTER TABLE `AttractionGroup`
  ADD CONSTRAINT `AttractionGroup_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `User` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `AttractionTag`
--
ALTER TABLE `AttractionTag`
  ADD CONSTRAINT `AttractionTag_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `Tag` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `AttractionTag_ibfk_2` FOREIGN KEY (`attraction_id`) REFERENCES `Attraction` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Friendship`
--
ALTER TABLE `Friendship`
  ADD CONSTRAINT `Friendship_ibfk_1` FOREIGN KEY (`user_1`) REFERENCES `User` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Friendship_ibfk_2` FOREIGN KEY (`user_2`) REFERENCES `User` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `GroupedAttraction`
--
ALTER TABLE `GroupedAttraction`
  ADD CONSTRAINT `GroupedAttraction_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `AttractionGroup` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `GroupedAttraction_ibfk_2` FOREIGN KEY (`attraction_id`) REFERENCES `Attraction` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `User`
--
ALTER TABLE `User`
  ADD CONSTRAINT `fk_role` FOREIGN KEY (`role`) REFERENCES `UserRole` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `UserAchievement`
--
ALTER TABLE `UserAchievement`
  ADD CONSTRAINT `UserAchievement_ibfk_1` FOREIGN KEY (`achievement_id`) REFERENCES `Achievement` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `UserAchievement_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `VisitedAttraction`
--
ALTER TABLE `VisitedAttraction`
  ADD CONSTRAINT `VisitedAttraction_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `VisitedAttraction_ibfk_2` FOREIGN KEY (`attraction_id`) REFERENCES `Attraction` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
