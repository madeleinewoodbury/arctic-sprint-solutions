-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: May 14, 2024 at 11:55 AM
-- Server version: 10.11.2-MariaDB-1:10.11.2+maria~ubu2204
-- PHP Version: 8.1.15

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
(3, 'Polaria', 1, 'Hjalmar Johansens Gate 12', 'Polaria is an Arctic Experience Centre and Aquarium located in the heart of Tromsø. Learn about Climate Change through our brand-new interactive exhibitions, reflect over how all life in the Arctic is connected, and discover how you can make a difference. In our aquarium you will find unique species of fish and crustations from the northern regions, as well as our five seals. Join in on the daily feeding and training sessions of the seals at 10:30, 12:30 and 15:30. Sit down and enjoy our three Panoramic films about the nature and wildlife at Svalbard, the magical Northern Lights, and a behind the scenes documentary showing how we work with our animals. Polaria is suitable for all ages, and the perfect place for those who are interested in diving beneath the surface to explore the Arctic in a unique way.', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2b/57/e0/7a/meet-the-bearded-seals.jpg?w=1200&h=-1&s=1', 10),
(4, 'The Polar Museum', 1, 'Søndre Tollbodgate 11B', 'Expeditions, everyday life and adventures in the Arctic from the 17th century up to the present. In our historic buildings, which are the former Customs premises in Tromsø, we communicate polar history with national and local roots. Our permanent exhibitions deal with sealing, overwintering, polar expeditions and the cultural history of Svalbard. The former boathouse houses temporary exhibitions based on new polar research.', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/7c/72/d9/polarmuseet-2017.jpg?w=1200&h=-1&s=1', 25),
(5, 'Ølhallen Brewpub', 1, 'Storgata 4', 'Ølhallen opened in 1928 and is the oldest pub in Tromsø. It is a place where townspeople of all ages meet and taste the best beers from Mack as well as other Norwegian breweries. We have one of the largest tap selections in Europe serving Norwegian quality beer from 72 different taps! All beers are possible to buy in tasting size glass. We also have tasting trays', 'https://images.citybreakcdn.com/image.aspx?ImageId=7267566&height=560&width=1440&crop=1', 15),
(6, 'Tromsø Villmarkssenter', 1, 'Straumsvegen 601, 9105 Kvaløya', '30 years ago, the renowned dog sled racer Tove Sørensen opened her home to guests from all over the world. Since then, she and her family have dedicated their life to educating visitors about Alaskan huskies, dog sledding and the arctic nature through sustainable outdoor activities.', 'https://images.citybreakcdn.com/image.aspx?ImageId=6689293&height=800&width=1200&crop=1', 30),
(7, 'Storgata Camping', 1, 'Storgata 5, 9008 Tromsø', 'Storgata Camping has the biggest indoor minigolfcourse in Norway! With 18 different challenges to conquer.', 'https://images.citybreakcdn.com/image.aspx?ImageId=8859233&height=560&width=1440&crop=1', 10),
(8, 'Fiskekompaniet Sjøsiden', 1, 'Killengreens gate, 9007 Tromsø', 'In a stressful society dominated by kiosks and fast-food chains, we would like to offer you some of the genuine and healthy food we harvest from the ocean.', 'https://images.citybreakcdn.com/image.aspx?ImageId=7207348&height=560&width=1440&crop=1', 10),
(9, 'Northern Light Safari', 1, NULL, 'This tour is conducted by Northern Yachting. If you want to see the experience the Northern Lights, there is no better way to experience it than to join us on a trip. On board our beautiful catamaran, our guests can lie on the well-known catamaran net, to look straight up at the sky while the sea sculpts smoothly below.', 'https://images.citybreakcdn.com/image.aspx?ImageId=7094166&height=800&width=1200&crop=1', 42),
(10, 'Galleri Nord', 1, 'Sjøgata 7, 9259 Tromsø', 'At Galleri Nord you will find a variety of pictorial art, sculptures, handicrafts and design products from Tromsø and Northern Norway. They sell photographs of Northern Norway taken by award-winning photographers, art cards and gift articles. In addition, the gallery provides ateliers for local artist – you are welcome to visit and watch the artists at work.', 'https://images.citybreakcdn.com/image.aspx?ImageId=6323760&height=560&width=1440&crop=1', 15),
(11, 'ByBowling', 1, 'Storgata 68A, 9008 Tromsø', 'Bowling - pool - shuffleboard - darts - in the heart of Tromsø city center! Perfect place for birthdays, team building, and corporate events. Bar with a wide selection of drinks, and all rights for alcohol service.', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/a0/90/bf/vip-lanes.jpg?w=1200&h=-1&s=1', 10),
(12, 'Buldreterminalen', 1, 'Kvaløyvegen 329, 9016 Tromsø', 'Buldreterminalen offers a plethora of climbing challenges for all ages. The venue spans 2100 square meters and features challenges suitable for beginners, experienced climbers, old, and young alike. They also have an area dedicated to children with a weekly focus on climbing games, bouldering for kids, and climbing walls with automatic safety features. Within the terminal, you’ll also find a café where they sell fresh pastries and coffee. The shop stocks equipment you may need for both indoor and outdoor climbing, available for both sale and rental.', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2b/93/e9/44/have-a-seat-and-encourage.jpg?w=1200&h=-1&s=1', 15),
(13, 'Hval- og arktisk dyrelivsafari', 1, 'Stortorget 2, 9008 Tromsø', 'Increase your chances of seeing humpback whales and killer whales as they roam along the coastline of Northern Norway from October to January. The boat trip departing from Tromsø takes you on a scenic cruise through fjords and islands in search of whales. With stunning views of the beautiful Norwegian fjords, you can observe the whales from a respectful distance, providing an unforgettable experience.', 'https://ntc.objects.frb.io/assets/images/Mane-Image-Photo_LigaSirava-4-of-8.jpg', 25),
(14, 'Arktiske-Alpine botaniske hage', 1, 'Universitet i Tromsø postboks 6050 Langnes, 9037 Tromsø', 'The garden features 28 themed collections of saxifrage, sweetroot, and primrose families, aconites, Himalayan plants, the southernmost South America, and plants from good old North Norwegian gardens, which are especially fascinating for many experts who come to visit. Many of the species here cannot be found in other gardens. During your tour of the garden, you can also visit the café located on the premises, Hansine Hansen Café, housed in the old 1850s building that was relocated to the area from the city center. In the café’s guestbook, you can read through a long and interesting history of many visitors.', 'https://lh3.googleusercontent.com/p/AF1QipMPXMygFtuW62SGNM2gWkxDIHlsA3IlQ45u5T7G=s680-w680-h510', 15),
(15, 'Telegrafbukta', 1, 'Unnamed Road 9006, 9006 Tromsø', 'Telegrafbukta is a scenic and popular park area located on the southwest tip of Tromsø Island. The area is often referred to as Tromsø’s Gran Canaria. Both locals and tourists frequent the beach area during the summer for relaxation and swimming. Swimming in the natural surroundings of Northern Norway provides a unique experience.', 'https://lh3.googleusercontent.com/p/AF1QipPiQEJJtDU9uNdBHjZbao8bhBKYDczvoPfK8yak=s680-w680-h510', 15),
(16, 'Gründer cafe og bar', 1, 'Storgata 44, 9008 Tromsø', 'The place offers tasty lunch dishes and a party atmosphere in the evenings. Gründer is among the more popular nightlife spots in Tromsø. Delicious meals are served from 11:00 every day and transform into a nightclub in the evenings with two different floors, featuring lively dancing and high energy.', 'https://vcdn.polarismedia.no/4ba75809-f114-4f43-8c32-00ac27f87e2b?fit=clip&h=700&q=80&tight=false&w=1000', 10),
(17, 'Arctic Escape', 1, 'Grønnegata 53 etg. 3, 9008 Tromsø', 'The world’s northernmost escape room. Escape rooms may not need an explanation, but here you and your team players can be assigned missions to solve in a room filled with puzzles, locks, codes, etc., which must be solved within 60 minutes. With good teamwork, this provides a unique and enjoyable experience. No prior experience is necessary, just a good mood and an open mind.', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/3f/f7/b0/arctic-escape.jpg?w=1200&h=-1&s=1', 15),
(18, 'Fiske og fjordcruise', 1, 'Havnegata, 9008 Tromsø', 'If fishing and sightseeing are what you’re looking for, this tour on an old, newly renovated boat from 1917 might be just the thing. Here, you can enjoy a cruise and fishing adventure with a knowledgeable guide through beautiful fjords, while experiencing fishing amidst spectacular surroundings.', 'https://cdn.getyourguide.com/img/tour/84a3e143d07901be.jpeg/145.jpg', 20),
(19, 'Tromsdalstinden', 1, 'Tromsdalen', 'Tromsdalstinden is a well-known landmark for the people of Tromsø, often referred to simply as \"tinden\" (the peak). Tromsdalstinden is a mountain peak located at the innermost part of Tromsdalen, with an altitude of 1238 meters, positioned to provide a spectacular view.', 'https://vcdn.polarismedia.no/fe2c3b5a-19d8-4a15-aecd-08fd3e34b996?fit=clip&h=1000&q=80&tight=false&w=1000', 20),
(20, 'Raketten bar og pølse', 1, 'Erling Bangsunds plass 1, 9008 Tromsø', '\"Løkkekiosken\" was built in 1911 and is now called \"Raketten\" (The Rocket), as it somewhat resembles a rocket in appearance. Here, you can experience a unique adventure with Norway’s smallest bar serving locally produced beer and the city’s best sausages also other small dishes. Raketten is located in the heart of Tromsø city center.', 'https://g.acdn.no/obscura/API/dynamic/r1/ece5/tr_2000_2000_s_f/0000/trom/2022/1/26/8/Raketten-30.jpg?chk=76E76B', 10),
(21, 'The Oslo Operahouse', 2, 'Sjøgata 7, 9259 Tromsø', 'The Norwegian nature is free for everyone to walk in, and The Oslo Opera House, which opened in 2008, was built as an extension to this idea. Usually, you are likely to be arrested if you walk on rooftops. This new building in the very epicentre of the capital of Norway feels like the complete opposite of the usual “Please don’t touch” culture tourists are often met with worldwide. The subtle variations in the structure of the marble-embellished roof is signed by Norwegian artists Kristian Blystad, Kalle Grude and Jorunn Sannes, and is truly a beautiful surface meant to be stepped on. Please keep in mind that under your feet there are three highly differently designed scenes, a myriad of public rooms and halls to explore, and a vibrant workplace for more than 600 opera and ballet professionals. If this sounds like your cup of tea, you should explore the Operahouse of Oslo.', 'https://res.cloudinary.com/simpleview/image/upload/v1634555140/clients/norway/Oslo_operahus_2_447c01a6-7d1c-4cd6-a87a-0c38e552a893.jpg', 15),
(22, 'Akershus Fortress', 2, '0150 Oslo', 'Welcome to Norways national arena and 700 years of Norwegian history. The facility was originally built at the end of the 13th century as a medieval royal castle with a seat for the kings representatives. Today, the fortress serves as Norways national arena. With us you will find Akershus Castle, the Defense Museum and Norways Home Front Museum. You will also find the concert and theater stage Karpedammen stage, as well as cultural institutions and restaurants. Throughout its more than 700-year history, the fortress has survived several sieges, but has never been taken by force by a hostile, foreign army. Today it lies like a pearl in the center of Oslo, surrounded by green oak trees in the summer. As well as being a popular tourist destination and recreation area, the area is still a military fortress under Akershus command.', 'https://tellusdmsmedia.newmindmedia.com/wsimgs/Akershus-festning_kveld__c_VisitOSLO_Thomas-Johannessen_880943739.jpg[ProductImage]', 10),
(23, 'Viking Times Museum', 2, 'Huk Aveny 35, 0287 Oslo', 'The Viking Times Museum on Bygdøy houses the world’s best-preserved Viking ships and artifacts from Viking tombs around the Oslo fjord. The museum’s displays include ships such as the Oseberg, Gokstad, and Tune, which were used as burial sites for prominent figures from the Viking Age. The museum provides a deep insight into Viking ship construction, voyages, and the historical context of their era, revealing a rich narrative of Viking maritime prowess and daily life. The Viking Ship House is currently closed, and will open its doors after its rebranding, in 2027.', 'https://tellusdmsmedia.newmindmedia.com/wsimgs/Vikingskipshuset_vogn__c_VisitOSLO_Didrick-Stenersen_491360458.jpg[ProductImage][4C167B0DBADE28D2418DEA6C4A1BEA43]', 10),
(24, 'Frognerparken', 2, 'Kirkeveien, 0268 Oslo', 'Frognerparken is not only the largest park in Oslo but also a cultural heritage site, featuring Gustav Vigeland’s famous sculpture installation, Vigelandsparken. The park is a hub for outdoor activities with vast lawns, a large collection of roses, and Norway’s biggest playground. It hosts Frogner Manor and is a beloved space for relaxation, offering sculptures that explore human emotions and experiences, integrated into a beautifully designed landscape.', 'https://www.aktivioslo.no/wp-content/uploads/2011/08/shutterstock_543816478-768x512.jpg', 20),
(25, 'The Fram Museum', 2, 'Bygdøynesveien 39, 0286 Oslo', 'Frammuseet, located on the Bygdøy peninsula, is dedicated to showcasing the historical Norwegian polar expeditions. It features the polar ship Fram, which is renowned for its extensive voyages into the Arctic and Antarctic. The museum is interactive, making it engaging for both children and adults, and includes exhibits on various explorers and expeditions alongside multimedia presentations and historical artifacts.', 'https://www.nyebilder.no/wp-content/uploads/2019/03/Flyfoto-Bygd%C3%B8y-Fram-museet.jpg', 15),
(26, 'Kristiansand Animal Park', 3, 'Dyreparkveien, 4609 Kristiansand', 'Norway’s most frequently visited attraction, Kristiansand Animal Park is a vibrant blend of a zoo and amusement park. Spanning 150 acres, it hosts a myriad of animals and themed areas like Cardamom Town and Captain Sabertooth’s World. It’s an enchanting place for family fun, offering close encounters with both Nordic and exotic animals.', 'https://www.dyreparken.no/content/uploads/2021/06/SC_Felles_013-1920x1230-1.jpg', 20),
(27, 'Kristiansand Cannon Museum', 3, 'Movik Fort, 4520 Kristiansand', 'Home to one of the world’s largest land-based cannons, the Kristiansand Cannon Museum offers a historical glimpse into World War II defenses. The museum features detailed exhibits on the fort’s strategic importance and the daily life of soldiers stationed here.', 'https://assets.simpleviewcms.com/simpleview/image/fetch/c_limit,h_1200,q_75,w_1200/https://media.newmindmedia.com/TellUs/image/%3Ffile%3DKristiansand_Kanonmuseum_-_Foto_Steinar_Furu_3__1091314706.jpg%26dh%3D493%26dw%3D800%26t%3D4', 10),
(28, 'Agder Natural History Museum', 3, 'Gimleveien 23, 4686 Kristiansand', 'This museum and botanical garden offers extensive displays of the natural history of southern Norway. The botanical garden features a variety of plant species both native and from around the world, while the museum houses significant geological and zoological collections.', 'https://assets.simpleviewcms.com/simpleview/image/fetch/c_fill,h_1080,w_1920/f_jpg/q_65/https://media.newmindmedia.com/TellUs/image/%3Ffile%3D0CA4563281ADB452F7E7EAAB97D34C12890EF618.jpg&dh%3D600&dw%3D800&t%3D4', 15),
(29, 'Bergen Aquarium', 4, 'Nordnesbakken 4, 5005 Bergen', 'Bergen Aquarium, located on the Nordnes peninsula, is Norway’s largest aquarium and a prominent Bergen attraction. It showcases over 300 species in more than 60 tanks and three outdoor ponds, featuring diverse marine and tropical fauna, including sea lions, penguins, and crocodiles. Engaging and educational, the aquarium offers daily feedings and film screenings, providing insights into both local and exotic marine ecosystems.', 'https://i.ytimg.com/vi/bj0L9PjX2Cw/maxresdefault.jpg', 15),
(30, 'Edvard Grieg Museum', 4, 'Troldhaugvegen 65, 5232 Bergen', 'Troldhaugen, the home of composer Edvard Grieg, is a museum located in Bergen. This historic site offers a glimpse into the life of Norway’s most famous composer, with his well-preserved villa, composer’s cabin, and gravesite. The museum not only celebrates Grieg’s musical achievements but also his inspirations drawn from the scenic surroundings. Visitors can explore the house, enjoy concerts, and view exhibitions dedicated to his life and work.', 'https://upload.wikimedia.org/wikipedia/commons/6/64/1885_bis_1907_lebte_hier_der_Komponist_Edvard_Grieg._02.jpg', 10);

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
(1, 3),
(4, 1),
(5, 6),
(5, 8),
(5, 9),
(5, 10),
(5, 11),
(6, 1),
(7, 6),
(7, 7),
(7, 8),
(8, 1),
(9, 1),
(10, 6),
(10, 7),
(10, 9),
(10, 10),
(10, 11),
(11, 1),
(12, 4),
(12, 5),
(12, 6),
(12, 7),
(12, 8),
(13, 1),
(14, 7),
(14, 8),
(14, 9),
(14, 10),
(14, 11),
(15, 1),
(16, 6),
(16, 7),
(16, 8),
(16, 9),
(17, 1),
(18, 1),
(19, 4),
(19, 5),
(19, 6),
(19, 7),
(19, 8),
(19, 9),
(19, 10),
(20, 1),
(21, 1),
(21, 2),
(22, 8),
(22, 9),
(22, 10),
(22, 11),
(23, 1),
(23, 2),
(23, 3),
(24, 1),
(24, 2),
(24, 3),
(25, 1),
(25, 2),
(25, 3),
(26, 1),
(26, 2),
(26, 3),
(27, 2),
(27, 3),
(28, 2),
(28, 3),
(29, 1),
(29, 2),
(29, 3),
(30, 2),
(30, 3);

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
(1, 4),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 27),
(2, 4),
(2, 10),
(2, 21),
(2, 23),
(2, 24),
(2, 25),
(2, 28),
(2, 30),
(3, 2),
(3, 6),
(3, 9),
(3, 13),
(3, 15),
(3, 18),
(3, 19),
(3, 24),
(4, 14),
(4, 22),
(5, 6),
(5, 9),
(5, 12),
(5, 18),
(5, 19),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 11),
(6, 16),
(6, 20),
(7, 3),
(7, 6),
(7, 11),
(7, 15),
(7, 26),
(8, 3),
(8, 17),
(8, 25),
(8, 29),
(9, 1);

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

--
-- Dumping data for table `attractionGroup`
--

INSERT INTO `attractionGroup` (`id`, `owner`, `title`, `visibility`, `created_at`) VALUES
(1, 10, 'Tromsø July 2024', 'private', '2024-05-14 11:35:45'),
(2, 10, 'Awesome Places', 'public', '2024-05-14 11:36:07'),
(3, 3, 'Oslo May 2024', 'public', '2024-05-14 11:52:55'),
(4, 3, 'Great Restaurants', 'public', '2024-05-14 11:53:10');

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
(1, 2),
(1, 6),
(1, 9),
(1, 13),
(1, 14),
(1, 15),
(1, 18),
(1, 19),
(1, 24),
(2, 4),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 25),
(2, 27),
(2, 30),
(3, 2),
(3, 3),
(3, 4),
(3, 6),
(3, 11),
(3, 12),
(3, 14),
(3, 17),
(3, 21),
(3, 24),
(3, 26),
(3, 29),
(5, 1),
(5, 22),
(5, 23),
(5, 30),
(6, 5),
(6, 8),
(6, 20),
(6, 25),
(6, 29),
(7, 3),
(7, 6),
(7, 13),
(7, 18),
(7, 29),
(8, 2),
(8, 9),
(8, 15),
(8, 18),
(8, 19),
(8, 24),
(8, 25),
(9, 4),
(9, 6),
(9, 7),
(9, 11),
(9, 14),
(9, 17),
(9, 24),
(9, 29),
(10, 12),
(10, 24),
(10, 26),
(12, 23),
(12, 25),
(13, 9),
(13, 13),
(14, 6),
(14, 14),
(14, 19),
(14, 28),
(15, 19),
(17, 1),
(17, 2),
(17, 3),
(17, 4),
(17, 5),
(17, 7),
(17, 8),
(17, 10),
(17, 15),
(17, 16),
(17, 17),
(17, 18),
(17, 20),
(17, 21),
(17, 22),
(17, 23),
(17, 24),
(17, 25),
(17, 26),
(17, 27),
(17, 29),
(17, 30),
(18, 11),
(18, 16);

-- --------------------------------------------------------

--
-- Table structure for table `badge`
--

CREATE TABLE `badge` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `badge`
--

INSERT INTO `badge` (`id`, `name`, `description`) VALUES
(1, 'Outsider', 'Visit five outdoor attractions'),
(2, 'Historian', 'Visit five historical attractions'),
(3, 'Familiar', 'Visit five family friendly attractions'),
(4, 'Big Spender', 'Visit five shopping attractions'),
(5, 'Architect', 'Visit five architecture attractions'),
(6, 'Foodie', 'Visit five culinary experience attractions'),
(7, 'Nature Born', 'Visit five wildlife attractions'),
(8, 'Magnificent', 'Visit five scenic beauty attractions'),
(9, 'Winter explorer', 'Visit five winter attractions'),
(10, 'Summer explorer', 'Visit five summer attractions'),
(11, 'Fall explorer', 'Visit five fall attractions'),
(12, 'Spring explorer', 'Visit five spring attractions'),
(13, 'Ultimate explorer', 'Visit five year-round attractions');

-- --------------------------------------------------------

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
-- Dumping data for table `badgeRequirement`
--

INSERT INTO `badgeRequirement` (`id`, `badge_id`, `tag_id`, `quantity_required`) VALUES
(1, 1, 1, 5),
(2, 2, 2, 5),
(3, 3, 3, 5),
(4, 4, 4, 5),
(5, 5, 5, 5),
(6, 6, 6, 5),
(7, 7, 7, 5),
(8, 8, 8, 5),
(9, 9, 13, 5),
(10, 10, 14, 5),
(11, 11, 15, 5),
(12, 12, 16, 5),
(13, 13, 17, 5);

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
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `description`, `image`, `country_id`) VALUES
(1, 'Tromsø', 'Tromsø, a vibrant city surrounded by majestic mountains and the Arctic landscape, is known as the \"Gateway to the Arctic Sea.\" The city offers a unique blend of culture, history, and nature, with attractions such as the Arctic Cathedral, Polaria, and opportunities for Northern Lights safaris and outdoor activities', 'https://images.unsplash.com/photo-1609538205185-40f2701cf7d6?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 165),
(2, 'Oslo', 'Oslo of Norway is known as a hub for every explorers dream - Attractions. And lots of them, too. We have cherry picked the best locations for our users, and believe we have the perfect recipe for any time spent in the capital. What are you waiting for? Go explore Oslo!', 'https://lp-cms-production.imgix.net/2023-03/shutterstock_1879262575.jpg', 165),
(3, 'Kristiansand', 'Some locations are just hidden gems - Kristiansand is one of them. Within Norway, Kristiansund is known for its great attractions and in particular, the Kristiansand Animal Park, a fun and interesting spot for the entire family for a chillout day at the zoo. Let`s go!', 'https://lp-cms-production.imgix.net/2023-03/shutterstock_1879262575.jpg', 165),
(4, 'Bergen', 'The city that had 192 days of rain in 2022 is known for the many treassured attractions scattered in and around the city. If your not scared of a little rain, Bergen might be the next bucketlist item for you travels through Norway. As we say in Norway; There is no such thing as bad weather, just bad clothes!', 'https://res.cloudinary.com/simpleview/image/upload/v1574085889/clients/norway/bryggen_wharf_bergen_hordaland_fjord_norway_photo_florian_olbrechts_34ad36ea-f7bc-4150-b48b-af2c2c14628f.jpg', 165);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `attraction_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `edited_at` timestamp NULL DEFAULT NULL,
  `editor_id` int(11) DEFAULT NULL,
  `comment_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `attraction_id`, `user_id`, `created_at`, `edited_at`, `editor_id`, `comment_text`) VALUES
(1, 7, 10, '2023-05-11 10:51:15', NULL, NULL, 'odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis'),
(2, 3, 2, '2023-12-04 20:25:30', NULL, NULL, 'duis mattis'),
(3, 3, 5, '2023-05-26 06:49:02', NULL, NULL, 'dui proin leo odio porttitor id consequat in consequat ut nulla'),
(4, 6, 3, '2023-10-26 11:13:10', NULL, NULL, 'mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula'),
(5, 4, 10, '2024-04-03 18:14:52', NULL, NULL, 'vel dapibus at diam nam tristique tortor eu pede'),
(6, 5, 10, '2023-02-14 02:35:28', NULL, NULL, 'eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu'),
(7, 9, 6, '2023-11-21 13:23:43', NULL, NULL, 'etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque'),
(8, 3, 6, '2023-10-10 20:40:57', NULL, NULL, 'ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus'),
(9, 10, 8, '2023-08-02 20:27:22', NULL, NULL, 'potenti in eleifend quam'),
(10, 9, 4, '2024-04-10 17:05:39', NULL, NULL, 'a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac'),
(11, 9, 7, '2023-02-21 07:33:30', NULL, NULL, 'lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus'),
(12, 8, 2, '2023-05-26 04:34:36', NULL, NULL, 'libero nullam'),
(13, 8, 10, '2023-02-04 18:21:51', NULL, NULL, 'id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean'),
(14, 4, 9, '2023-12-17 08:39:44', NULL, NULL, 'amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo'),
(15, 8, 10, '2024-03-31 19:42:18', NULL, NULL, 'donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque'),
(16, 4, 4, '2023-02-27 19:14:06', NULL, NULL, 'non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi'),
(17, 7, 5, '2023-01-11 18:09:17', NULL, NULL, 'consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque'),
(18, 1, 9, '2024-03-12 10:22:18', NULL, NULL, 'eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo'),
(19, 9, 4, '2023-04-20 08:32:27', NULL, NULL, 'vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam'),
(20, 10, 10, '2023-04-07 10:04:23', NULL, NULL, 'nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum'),
(21, 7, 6, '2024-01-22 07:30:29', NULL, NULL, 'fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque'),
(22, 1, 1, '2023-07-27 02:44:51', NULL, NULL, 'vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec'),
(23, 1, 1, '2023-10-10 02:46:03', NULL, NULL, 'potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi'),
(24, 5, 7, '2023-05-14 00:27:26', NULL, NULL, 'felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar'),
(25, 5, 9, '2023-05-21 09:26:13', NULL, NULL, 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et'),
(26, 10, 4, '2024-02-07 00:05:27', NULL, NULL, 'molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam'),
(27, 3, 4, '2023-11-07 05:54:05', NULL, NULL, 'erat curabitur gravida nisi at nibh in hac'),
(28, 4, 4, '2023-06-29 14:44:56', NULL, NULL, 'duis at velit eu est congue elementum in hac habitasse platea dictumst morbi'),
(29, 7, 6, '2023-12-21 03:12:36', NULL, NULL, 'elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi'),
(30, 9, 6, '2023-10-21 17:12:20', NULL, NULL, 'in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy'),
(31, 5, 2, '2023-06-21 11:02:32', NULL, NULL, 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl'),
(32, 4, 1, '2023-11-18 04:38:01', NULL, NULL, 'fusce consequat nulla nisl nunc nisl'),
(33, 1, 3, '2023-03-19 22:06:28', NULL, NULL, 'quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis'),
(34, 3, 5, '2023-09-29 01:40:17', NULL, NULL, 'libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis'),
(35, 4, 2, '2023-05-19 20:24:02', NULL, NULL, 'non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero'),
(36, 5, 1, '2023-09-11 01:09:55', NULL, NULL, 'rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing'),
(37, 2, 8, '2023-09-06 14:03:31', NULL, NULL, 'maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et'),
(38, 4, 7, '2023-05-25 20:50:36', NULL, NULL, 'nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna'),
(39, 5, 3, '2023-10-29 18:42:44', NULL, NULL, 'cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui'),
(40, 6, 2, '2024-02-09 19:07:00', NULL, NULL, 'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus'),
(41, 2, 8, '2023-10-21 11:29:36', NULL, NULL, 'sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh'),
(42, 5, 8, '2023-10-06 16:40:51', NULL, NULL, 'luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse'),
(43, 10, 1, '2023-07-22 23:50:37', NULL, NULL, 'metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis'),
(44, 3, 7, '2023-03-23 00:56:58', NULL, NULL, 'vestibulum'),
(45, 3, 9, '2024-04-02 11:07:45', NULL, NULL, 'quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget'),
(46, 2, 3, '2023-10-11 03:22:29', NULL, NULL, 'justo aliquam quis turpis eget elit sodales'),
(47, 6, 5, '2023-09-10 17:39:21', NULL, NULL, 'quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras'),
(48, 2, 4, '2023-02-24 01:51:07', NULL, NULL, 'etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi'),
(49, 7, 3, '2023-02-03 08:16:33', NULL, NULL, 'eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc'),
(50, 6, 7, '2023-07-30 21:54:07', NULL, NULL, 'molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in'),
(51, 9, 5, '2023-06-12 02:21:37', NULL, NULL, 'diam nam tristique tortor eu pede'),
(52, 8, 6, '2023-07-14 20:20:00', NULL, NULL, 'sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur'),
(53, 5, 1, '2023-03-08 01:22:20', NULL, NULL, 'viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris'),
(54, 3, 9, '2024-04-19 14:30:22', NULL, NULL, 'justo morbi ut odio cras mi pede malesuada in imperdiet et commodo'),
(55, 10, 1, '2024-02-12 15:27:06', NULL, NULL, 'eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices'),
(56, 7, 8, '2023-12-12 13:24:24', NULL, NULL, 'lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum'),
(57, 8, 5, '2023-02-26 17:48:40', NULL, NULL, 'lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in'),
(58, 6, 3, '2023-11-05 01:23:16', NULL, NULL, 'vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar'),
(59, 2, 6, '2023-12-12 08:09:48', NULL, NULL, 'nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet'),
(60, 8, 4, '2023-08-06 10:15:18', NULL, NULL, 'neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing'),
(61, 1, 4, '2024-01-07 00:48:55', NULL, NULL, 'adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero'),
(62, 8, 10, '2023-05-07 14:38:37', NULL, NULL, 'turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien'),
(63, 2, 4, '2023-07-21 01:13:18', NULL, NULL, 'velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget'),
(64, 7, 6, '2023-03-06 12:39:30', NULL, NULL, 'augue'),
(65, 3, 2, '2023-06-14 19:35:33', NULL, NULL, 'dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at'),
(66, 3, 3, '2024-04-11 11:39:08', NULL, NULL, 'id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur'),
(67, 10, 4, '2023-12-24 19:00:36', NULL, NULL, 'mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia'),
(68, 4, 10, '2023-10-21 12:10:20', NULL, NULL, 'in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec'),
(69, 4, 4, '2023-04-27 14:52:38', NULL, NULL, 'nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum'),
(70, 6, 4, '2023-02-03 03:16:21', NULL, NULL, 'montes nascetur ridiculus mus'),
(71, 10, 5, '2024-01-08 04:12:49', NULL, NULL, 'etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non'),
(72, 4, 5, '2023-01-13 05:48:40', NULL, NULL, 'at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel'),
(73, 9, 6, '2023-05-05 01:34:47', NULL, NULL, 'suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in'),
(74, 6, 8, '2023-07-14 12:57:16', NULL, NULL, 'vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam'),
(75, 5, 2, '2024-01-19 19:12:33', NULL, NULL, 'suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc'),
(76, 10, 2, '2023-01-31 08:33:37', NULL, NULL, 'non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget'),
(77, 10, 3, '2024-02-12 01:35:46', NULL, NULL, 'sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat'),
(78, 5, 1, '2024-02-13 08:27:56', NULL, NULL, 'diam vitae quam suspendisse potenti nullam porttitor lacus at turpis'),
(79, 2, 8, '2023-03-24 08:44:53', NULL, NULL, 'sociis natoque penatibus et magnis dis parturient'),
(80, 6, 3, '2024-01-21 12:54:05', NULL, NULL, 'donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec'),
(81, 9, 9, '2023-10-05 19:22:43', NULL, NULL, 'sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel'),
(82, 7, 2, '2024-02-01 01:32:32', NULL, NULL, 'suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis'),
(83, 9, 2, '2023-01-26 14:19:08', NULL, NULL, 'congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla'),
(84, 9, 8, '2024-02-06 07:42:41', NULL, NULL, 'at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes'),
(85, 3, 9, '2024-01-04 17:31:20', NULL, NULL, 'at diam'),
(86, 3, 7, '2023-07-08 11:17:25', NULL, NULL, 'blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis'),
(87, 4, 10, '2023-06-17 17:27:03', NULL, NULL, 'lorem ipsum dolor sit amet consectetuer adipiscing elit proin risus praesent'),
(88, 1, 9, '2024-01-19 08:31:03', NULL, NULL, 'orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem'),
(89, 1, 3, '2023-06-23 15:05:41', NULL, NULL, 'sapien a libero nam dui proin leo odio porttitor'),
(90, 1, 2, '2023-04-22 20:36:48', NULL, NULL, 'luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien'),
(91, 7, 1, '2023-11-30 00:39:32', NULL, NULL, 'nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus'),
(92, 7, 3, '2023-03-23 09:29:22', NULL, NULL, 'lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices'),
(93, 8, 10, '2023-09-29 18:24:49', NULL, NULL, 'habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus'),
(94, 7, 7, '2023-11-17 05:52:09', NULL, NULL, 'consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum'),
(95, 6, 10, '2024-03-09 03:37:14', NULL, NULL, 'lacus at turpis donec posuere metus vitae ipsum aliquam non'),
(96, 6, 1, '2023-04-08 20:57:29', NULL, NULL, 'ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor'),
(97, 3, 6, '2023-01-30 08:21:46', NULL, NULL, 'leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et'),
(98, 1, 9, '2023-09-25 21:12:21', NULL, NULL, 'imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor'),
(99, 7, 4, '2023-06-12 08:02:17', NULL, NULL, 'vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor'),
(100, 3, 5, '2024-02-21 08:55:21', NULL, NULL, 'duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue'),
(101, 3, 4, '2023-03-19 18:02:10', NULL, NULL, 'blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus'),
(102, 6, 10, '2023-10-01 05:19:36', NULL, NULL, 'id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum'),
(103, 1, 3, '2024-02-16 12:50:12', NULL, NULL, 'natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl'),
(104, 4, 9, '2023-06-21 05:38:53', NULL, NULL, 'cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl'),
(105, 10, 3, '2024-04-26 01:40:09', NULL, NULL, 'nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo'),
(106, 4, 7, '2024-01-01 21:24:26', NULL, NULL, 'parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa'),
(107, 9, 7, '2023-07-03 13:29:51', NULL, NULL, 'dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum'),
(108, 4, 8, '2023-05-20 11:53:33', NULL, NULL, 'risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien'),
(109, 8, 10, '2023-01-24 20:51:48', NULL, NULL, 'mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis'),
(110, 10, 6, '2023-11-04 05:43:24', NULL, NULL, 'amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id'),
(111, 1, 7, '2023-02-04 21:01:54', NULL, NULL, 'odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo'),
(112, 10, 4, '2023-08-06 09:57:58', NULL, NULL, 'vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi'),
(113, 7, 4, '2023-09-29 06:15:09', NULL, NULL, 'viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat'),
(114, 6, 4, '2024-03-04 03:10:16', NULL, NULL, 'in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna'),
(115, 6, 6, '2023-05-26 17:12:50', NULL, NULL, 'et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet'),
(116, 4, 2, '2023-02-10 17:31:42', NULL, NULL, 'mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi'),
(117, 10, 4, '2023-02-16 07:13:10', NULL, NULL, 'tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis'),
(118, 6, 5, '2023-06-26 00:04:38', NULL, NULL, 'donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi'),
(119, 10, 1, '2023-10-23 08:41:13', NULL, NULL, 'nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel'),
(120, 6, 2, '2023-09-09 16:52:54', NULL, NULL, 'rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis'),
(121, 1, 9, '2023-06-22 03:07:16', NULL, NULL, 'sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede'),
(122, 1, 4, '2023-05-01 16:26:23', NULL, NULL, 'luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus'),
(123, 4, 2, '2024-02-23 03:32:42', NULL, NULL, 'montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit'),
(124, 6, 6, '2024-02-19 20:46:44', NULL, NULL, 'nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in'),
(125, 5, 1, '2023-05-25 02:33:14', NULL, NULL, 'aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in'),
(126, 9, 3, '2023-07-09 16:31:36', NULL, NULL, 'habitasse platea dictumst etiam faucibus cursus urna ut'),
(127, 4, 7, '2023-06-03 21:00:42', NULL, NULL, 'id'),
(128, 8, 9, '2023-08-13 07:31:13', NULL, NULL, 'faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non'),
(129, 1, 5, '2023-01-08 22:05:45', NULL, NULL, 'molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum'),
(130, 2, 3, '2024-04-13 19:36:29', NULL, NULL, 'maecenas tincidunt lacus at velit vivamus vel nulla eget eros'),
(131, 9, 8, '2023-12-29 22:36:27', NULL, NULL, 'et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac'),
(132, 7, 6, '2023-03-10 04:37:00', NULL, NULL, 'nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus'),
(133, 4, 7, '2024-02-01 11:44:01', NULL, NULL, 'justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet'),
(134, 9, 4, '2023-05-30 07:42:18', NULL, NULL, 'penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada'),
(135, 5, 2, '2023-10-18 17:00:23', NULL, NULL, 'sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate'),
(136, 2, 5, '2023-12-29 22:14:00', NULL, NULL, 'diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis'),
(137, 5, 1, '2023-05-20 21:59:01', NULL, NULL, 'pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus'),
(138, 4, 1, '2023-04-28 12:27:25', NULL, NULL, 'laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in'),
(139, 9, 5, '2023-06-15 19:42:01', NULL, NULL, 'at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi'),
(140, 7, 7, '2023-02-25 22:50:22', NULL, NULL, 'consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed'),
(141, 2, 1, '2024-03-24 09:57:05', NULL, NULL, 'consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis'),
(142, 8, 2, '2023-04-20 10:44:44', NULL, NULL, 'justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui'),
(143, 5, 4, '2023-10-03 23:49:24', NULL, NULL, 'tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit'),
(144, 2, 6, '2023-05-17 12:45:20', NULL, NULL, 'neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit'),
(145, 1, 7, '2023-05-27 21:23:02', NULL, NULL, 'posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede'),
(146, 6, 9, '2023-09-01 02:07:00', NULL, NULL, 'consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus'),
(147, 2, 3, '2024-01-20 19:29:37', NULL, NULL, 'rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque'),
(148, 7, 8, '2023-08-31 06:49:01', NULL, NULL, 'elementum in hac habitasse platea dictumst morbi vestibulum velit id'),
(149, 5, 4, '2023-09-15 12:23:58', NULL, NULL, 'auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu'),
(150, 1, 7, '2023-11-09 18:05:58', NULL, NULL, 'a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra'),
(151, 9, 2, '2023-02-23 06:17:45', NULL, NULL, 'ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet'),
(152, 5, 10, '2023-09-21 20:16:19', NULL, NULL, 'quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec'),
(153, 10, 10, '2023-07-21 11:57:02', NULL, NULL, 'nec sem duis aliquam convallis'),
(154, 5, 5, '2023-01-23 13:21:25', NULL, NULL, 'donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet'),
(155, 10, 4, '2023-07-29 00:46:42', NULL, NULL, 'maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc'),
(156, 10, 3, '2023-04-09 08:55:51', NULL, NULL, 'vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo'),
(157, 4, 2, '2024-03-24 20:42:30', NULL, NULL, 'nec nisi vulputate nonummy maecenas tincidunt lacus'),
(158, 1, 8, '2023-11-24 10:12:47', NULL, NULL, 'nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis'),
(159, 9, 7, '2023-02-01 03:15:09', NULL, NULL, 'fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat'),
(160, 4, 7, '2023-03-28 09:48:59', NULL, NULL, 'vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus'),
(161, 1, 6, '2023-06-15 10:21:27', NULL, NULL, 'eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris'),
(162, 3, 4, '2023-08-28 02:56:14', NULL, NULL, 'cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio'),
(163, 1, 7, '2023-01-18 08:50:25', NULL, NULL, 'commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa'),
(164, 4, 3, '2023-07-12 10:50:57', NULL, NULL, 'cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra'),
(165, 4, 8, '2023-07-10 22:14:44', NULL, NULL, 'commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede'),
(166, 8, 4, '2023-01-06 15:37:03', NULL, NULL, 'suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet'),
(167, 5, 1, '2023-02-13 10:04:36', NULL, NULL, 'phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis'),
(168, 5, 4, '2024-02-03 02:07:23', NULL, NULL, 'diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis'),
(169, 7, 9, '2024-04-01 11:17:53', NULL, NULL, 'donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam'),
(170, 4, 7, '2023-06-16 07:44:45', NULL, NULL, 'cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet'),
(171, 4, 10, '2023-11-29 19:46:09', NULL, NULL, 'suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis'),
(172, 9, 6, '2024-01-04 23:09:34', NULL, NULL, 'nulla justo aliquam quis turpis eget elit sodales'),
(173, 2, 7, '2023-12-22 11:16:54', NULL, NULL, 'amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus'),
(174, 10, 2, '2024-01-29 19:34:00', NULL, NULL, 'sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique'),
(175, 8, 10, '2023-02-08 00:24:00', NULL, NULL, 'nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra'),
(176, 3, 7, '2023-10-02 17:13:40', NULL, NULL, 'a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu'),
(177, 7, 4, '2024-02-28 01:30:35', NULL, NULL, 'mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing'),
(178, 1, 7, '2024-01-30 02:42:06', NULL, NULL, 'venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis'),
(179, 7, 10, '2023-04-09 08:15:12', NULL, NULL, 'pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien'),
(180, 10, 9, '2023-06-12 05:54:49', NULL, NULL, 'lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus'),
(181, 1, 3, '2023-06-12 03:50:18', NULL, NULL, 'a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque'),
(182, 4, 6, '2023-09-10 14:16:41', NULL, NULL, 'sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi'),
(183, 1, 5, '2023-06-23 08:03:12', NULL, NULL, 'vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam'),
(184, 1, 8, '2024-01-04 02:02:27', NULL, NULL, 'faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo'),
(185, 9, 3, '2024-02-25 05:46:10', NULL, NULL, 'eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor'),
(186, 3, 4, '2023-07-22 10:34:46', NULL, NULL, 'amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien'),
(187, 2, 8, '2023-05-05 01:26:56', NULL, NULL, 'nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor'),
(188, 7, 8, '2023-12-06 00:31:39', NULL, NULL, 'vel lectus in quam fringilla rhoncus mauris enim leo rhoncus'),
(189, 7, 4, '2023-12-10 15:29:22', NULL, NULL, 'tortor sollicitudin mi sit amet lobortis sapien'),
(190, 9, 7, '2023-05-30 08:18:30', NULL, NULL, 'id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque'),
(191, 6, 4, '2024-01-31 20:18:11', NULL, NULL, 'nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla'),
(192, 9, 1, '2023-11-29 20:08:19', NULL, NULL, 'libero quis orci nullam molestie'),
(193, 4, 9, '2023-02-23 00:10:04', NULL, NULL, 'morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel'),
(194, 8, 3, '2023-07-25 03:42:32', NULL, NULL, 'at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante'),
(195, 8, 9, '2023-12-11 02:09:27', NULL, NULL, 'lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum'),
(196, 5, 9, '2024-04-12 16:46:26', NULL, NULL, 'nulla dapibus dolor vel'),
(197, 3, 7, '2024-03-12 03:28:30', NULL, NULL, 'erat tortor sollicitudin mi'),
(198, 5, 10, '2024-01-29 03:34:37', NULL, NULL, 'id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit'),
(199, 7, 5, '2024-02-24 22:30:40', NULL, NULL, 'massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at'),
(200, 2, 6, '2023-11-12 01:00:11', NULL, NULL, 'nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam'),
(201, 5, 1, '2023-04-17 04:55:07', NULL, NULL, 'nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem'),
(202, 2, 2, '2023-07-20 00:50:22', NULL, NULL, 'donec semper sapien a');
INSERT INTO `comment` (`id`, `attraction_id`, `user_id`, `created_at`, `edited_at`, `editor_id`, `comment_text`) VALUES
(203, 6, 5, '2023-12-05 17:01:47', NULL, NULL, 'vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et'),
(204, 10, 6, '2023-07-08 04:16:04', NULL, NULL, 'tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat'),
(205, 6, 7, '2023-03-17 17:06:30', NULL, NULL, 'est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros'),
(206, 1, 9, '2024-01-25 16:14:41', NULL, NULL, 'odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula'),
(207, 6, 8, '2024-01-26 03:53:16', NULL, NULL, 'nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus'),
(208, 8, 4, '2023-01-26 13:10:45', NULL, NULL, 'nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim'),
(209, 7, 10, '2024-03-31 07:49:23', NULL, NULL, 'congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla'),
(210, 3, 5, '2023-07-24 17:57:51', NULL, NULL, 'natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl'),
(211, 2, 7, '2023-06-13 10:10:16', NULL, NULL, 'ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem'),
(212, 10, 3, '2024-03-25 10:29:43', NULL, NULL, 'tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in'),
(213, 4, 6, '2023-06-12 06:06:28', NULL, NULL, 'quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede'),
(214, 10, 1, '2023-05-08 03:25:05', NULL, NULL, 'interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu'),
(215, 9, 5, '2023-12-23 13:07:02', NULL, NULL, 'donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer'),
(216, 3, 6, '2023-11-30 01:02:41', NULL, NULL, 'morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet'),
(217, 3, 1, '2023-12-22 07:06:08', NULL, NULL, 'parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada'),
(218, 5, 8, '2023-12-18 20:47:15', NULL, NULL, 'pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend'),
(219, 6, 10, '2024-03-11 22:52:36', NULL, NULL, 'quam suspendisse potenti nullam porttitor lacus at turpis donec'),
(220, 6, 8, '2024-01-30 02:06:15', NULL, NULL, 'posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros'),
(221, 3, 4, '2023-07-19 23:08:28', NULL, NULL, 'ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac'),
(222, 5, 6, '2023-12-30 19:48:20', NULL, NULL, 'justo sit amet'),
(223, 5, 7, '2024-03-17 10:59:13', NULL, NULL, 'consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum'),
(224, 5, 9, '2023-12-27 14:09:01', NULL, NULL, 'dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla'),
(225, 4, 4, '2024-03-23 11:46:45', NULL, NULL, 'eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum'),
(226, 6, 9, '2024-01-28 09:15:23', NULL, NULL, 'vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum'),
(227, 9, 9, '2023-03-27 18:09:37', NULL, NULL, 'tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus'),
(228, 7, 1, '2023-12-19 12:19:31', NULL, NULL, 'euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae'),
(229, 9, 10, '2024-04-07 04:19:50', NULL, NULL, 'sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia'),
(230, 3, 5, '2023-06-24 07:26:08', NULL, NULL, 'risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas'),
(231, 10, 1, '2023-05-07 15:21:57', NULL, NULL, 'vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante'),
(232, 9, 10, '2023-10-18 10:37:50', NULL, NULL, 'vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim'),
(233, 6, 7, '2024-04-25 11:49:03', NULL, NULL, 'morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc'),
(234, 6, 7, '2024-02-19 07:58:20', NULL, NULL, 'nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim'),
(235, 10, 7, '2024-03-06 20:01:38', NULL, NULL, 'nulla ut erat id mauris vulputate elementum nullam varius'),
(236, 3, 3, '2024-03-24 09:58:49', NULL, NULL, 'enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero'),
(237, 10, 7, '2023-04-17 00:12:42', NULL, NULL, 'et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus'),
(238, 3, 6, '2024-04-24 17:29:39', NULL, NULL, 'nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh'),
(239, 2, 1, '2023-08-21 08:17:40', NULL, NULL, 'et magnis dis parturient montes nascetur ridiculus mus'),
(240, 5, 7, '2023-06-25 11:48:09', NULL, NULL, 'ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst'),
(241, 3, 3, '2023-07-29 07:10:01', NULL, NULL, 'et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec'),
(242, 3, 2, '2024-01-31 02:49:27', NULL, NULL, 'est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus'),
(243, 1, 3, '2023-01-05 02:50:59', NULL, NULL, 'praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor'),
(244, 5, 4, '2023-05-20 14:30:45', NULL, NULL, 'at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue'),
(245, 10, 10, '2023-04-20 13:29:11', NULL, NULL, 'vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis'),
(246, 6, 6, '2023-11-18 13:19:16', NULL, NULL, 'integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis'),
(247, 1, 7, '2023-02-11 15:36:37', NULL, NULL, 'tempor'),
(248, 8, 1, '2023-04-21 05:55:07', NULL, NULL, 'ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia'),
(249, 6, 8, '2023-01-31 18:12:23', NULL, NULL, 'mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo'),
(250, 4, 3, '2024-01-23 03:23:31', NULL, NULL, 'maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non'),
(251, 7, 10, '2023-08-17 09:01:05', NULL, NULL, 'ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper'),
(252, 10, 10, '2023-11-18 18:43:20', NULL, NULL, 'id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus'),
(253, 8, 1, '2024-02-16 22:13:25', NULL, NULL, 'nunc'),
(254, 9, 2, '2023-08-05 22:33:51', NULL, NULL, 'in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam'),
(255, 2, 8, '2023-10-09 13:31:15', NULL, NULL, 'praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet'),
(256, 7, 5, '2023-06-30 16:06:48', NULL, NULL, 'fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue'),
(257, 5, 8, '2023-03-22 17:42:22', NULL, NULL, 'nullam orci pede'),
(258, 3, 6, '2023-01-25 12:09:39', NULL, NULL, 'vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum'),
(259, 6, 3, '2023-05-17 09:43:45', NULL, NULL, 'porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit'),
(260, 4, 5, '2023-12-12 23:06:23', NULL, NULL, 'ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec'),
(261, 8, 1, '2023-01-15 18:56:02', NULL, NULL, 'nam nulla integer pede justo lacinia eget tincidunt'),
(262, 5, 6, '2024-01-04 18:56:14', NULL, NULL, 'turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit'),
(263, 8, 5, '2023-11-24 14:50:02', NULL, NULL, 'ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse'),
(264, 8, 4, '2023-03-30 05:40:43', NULL, NULL, 'donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id'),
(265, 8, 5, '2023-11-14 01:37:23', NULL, NULL, 'pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere'),
(266, 5, 8, '2023-05-08 09:08:34', NULL, NULL, 'vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut'),
(267, 8, 8, '2023-03-16 16:59:57', NULL, NULL, 'elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque'),
(268, 1, 10, '2023-05-01 23:30:38', NULL, NULL, 'mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit'),
(269, 8, 8, '2024-01-17 15:36:07', NULL, NULL, 'duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris'),
(270, 5, 5, '2023-01-27 22:20:38', NULL, NULL, 'id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id'),
(271, 5, 5, '2024-01-10 04:03:21', NULL, NULL, 'mauris lacinia sapien quis libero nullam sit amet'),
(272, 7, 10, '2024-02-01 12:07:40', NULL, NULL, 'porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer'),
(273, 3, 1, '2023-02-07 15:39:40', NULL, NULL, 'ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar'),
(274, 2, 5, '2023-06-03 06:15:00', NULL, NULL, 'ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam tristique'),
(275, 1, 8, '2023-04-21 01:34:55', NULL, NULL, 'volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum'),
(276, 3, 8, '2023-07-20 00:42:45', NULL, NULL, 'pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh'),
(277, 5, 1, '2023-12-17 11:56:34', NULL, NULL, 'vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer'),
(278, 6, 6, '2023-04-19 10:37:02', NULL, NULL, 'at velit'),
(279, 3, 6, '2023-10-13 03:05:37', NULL, NULL, 'nunc vestibulum ante ipsum primis'),
(280, 6, 9, '2024-03-28 01:59:57', NULL, NULL, 'proin eu mi nulla'),
(281, 2, 9, '2024-01-13 05:01:49', NULL, NULL, 'eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus'),
(282, 7, 1, '2023-05-29 01:25:58', NULL, NULL, 'turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor'),
(283, 3, 2, '2023-12-23 14:24:51', NULL, NULL, 'id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi'),
(284, 2, 4, '2023-01-30 16:22:47', NULL, NULL, 'non quam nec dui'),
(285, 3, 6, '2024-04-16 20:59:25', NULL, NULL, 'habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia'),
(286, 10, 3, '2023-04-19 14:53:38', NULL, NULL, 'eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis'),
(287, 8, 5, '2024-01-02 04:56:20', NULL, NULL, 'cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum'),
(288, 2, 4, '2023-02-06 18:11:38', NULL, NULL, 'est quam pharetra magna ac consequat metus sapien'),
(289, 10, 3, '2023-07-29 02:15:40', NULL, NULL, 'tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse'),
(290, 2, 8, '2023-04-19 06:50:34', NULL, NULL, 'cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien'),
(291, 1, 3, '2023-05-16 10:35:12', NULL, NULL, 'venenatis tristique fusce congue'),
(292, 2, 4, '2023-07-14 22:20:11', NULL, NULL, 'fusce consequat nulla nisl nunc nisl'),
(293, 2, 8, '2024-03-26 15:42:47', NULL, NULL, 'sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla'),
(294, 3, 1, '2023-11-02 02:56:12', NULL, NULL, 'dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse'),
(295, 3, 3, '2024-03-03 23:03:58', NULL, NULL, 'amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac'),
(296, 10, 2, '2023-04-12 21:45:08', NULL, NULL, 'neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean'),
(297, 7, 1, '2023-11-22 21:02:48', NULL, NULL, 'interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit'),
(298, 5, 10, '2023-08-24 00:31:51', NULL, NULL, 'placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget'),
(299, 5, 5, '2024-01-19 17:59:12', NULL, NULL, 'habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla'),
(300, 9, 8, '2024-04-22 07:30:49', NULL, NULL, 'ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam'),
(301, 2, 4, '2023-12-10 06:14:42', NULL, NULL, 'ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan'),
(302, 5, 9, '2023-07-26 03:45:03', NULL, NULL, 'convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa'),
(303, 7, 5, '2023-12-29 06:00:41', NULL, NULL, 'nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum'),
(304, 5, 9, '2023-12-19 19:45:50', NULL, NULL, 'etiam faucibus cursus'),
(305, 7, 2, '2024-01-07 10:44:50', NULL, NULL, 'curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus'),
(306, 8, 4, '2023-12-24 20:36:57', NULL, NULL, 'hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla'),
(307, 5, 10, '2023-05-07 05:55:25', NULL, NULL, 'ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci'),
(308, 9, 6, '2023-08-10 01:05:46', NULL, NULL, 'primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at'),
(309, 9, 3, '2023-09-24 16:31:51', NULL, NULL, 'justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis'),
(310, 1, 6, '2023-03-04 03:20:25', NULL, NULL, 'justo sollicitudin ut suscipit a feugiat et eros vestibulum ac'),
(311, 9, 8, '2023-02-04 05:03:11', NULL, NULL, 'morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce'),
(312, 6, 7, '2024-03-09 09:37:35', NULL, NULL, 'natoque penatibus et magnis dis parturient montes nascetur ridiculus'),
(313, 7, 1, '2023-11-22 01:24:17', NULL, NULL, 'duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit'),
(314, 5, 5, '2023-01-01 21:50:06', NULL, NULL, 'auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien'),
(315, 1, 6, '2024-02-11 06:32:10', NULL, NULL, 'vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis'),
(316, 6, 3, '2024-02-25 00:10:33', NULL, NULL, 'nulla justo aliquam quis turpis eget elit sodales scelerisque mauris'),
(317, 1, 3, '2023-03-23 22:04:36', NULL, NULL, 'erat nulla tempus vivamus in felis eu sapien'),
(318, 4, 2, '2024-04-02 21:53:41', NULL, NULL, 'at velit vivamus vel nulla eget eros'),
(319, 8, 2, '2023-05-03 08:10:16', NULL, NULL, 'sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent'),
(320, 8, 7, '2024-03-18 22:26:34', NULL, NULL, 'mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis'),
(321, 3, 2, '2023-01-14 11:33:48', NULL, NULL, 'vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat'),
(322, 7, 3, '2023-06-26 12:05:23', NULL, NULL, 'dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa'),
(323, 5, 9, '2023-12-16 13:26:57', NULL, NULL, 'pretium nisl ut'),
(324, 5, 3, '2024-04-18 04:04:44', NULL, NULL, 'in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit'),
(325, 3, 2, '2023-07-26 03:43:39', NULL, NULL, 'suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in'),
(326, 3, 10, '2024-01-18 12:57:43', NULL, NULL, 'tempus semper est quam pharetra magna ac consequat metus sapien'),
(327, 10, 1, '2024-04-01 17:35:44', NULL, NULL, 'volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus'),
(328, 6, 9, '2023-07-20 09:06:30', NULL, NULL, 'sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut'),
(329, 6, 6, '2023-09-02 23:44:54', NULL, NULL, 'donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla'),
(330, 1, 3, '2023-10-26 07:44:10', NULL, NULL, 'nunc nisl duis bibendum felis sed interdum venenatis turpis'),
(331, 2, 4, '2023-08-30 06:03:02', NULL, NULL, 'in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy'),
(332, 6, 2, '2023-04-28 19:56:44', NULL, NULL, 'condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis'),
(333, 4, 10, '2023-10-03 14:47:30', NULL, NULL, 'rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat'),
(334, 6, 9, '2023-10-05 04:35:39', NULL, NULL, 'dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget'),
(335, 5, 8, '2023-06-28 16:20:14', NULL, NULL, 'nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt'),
(336, 5, 5, '2024-04-09 01:05:00', NULL, NULL, 'platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem'),
(337, 5, 8, '2023-12-09 18:09:15', NULL, NULL, 'aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis'),
(338, 2, 5, '2023-06-17 20:26:26', NULL, NULL, 'dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet'),
(339, 8, 2, '2023-06-23 15:42:29', NULL, NULL, 'sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet'),
(340, 9, 2, '2023-08-06 03:47:56', NULL, NULL, 'fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac'),
(341, 4, 9, '2023-04-06 10:49:20', NULL, NULL, 'praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris'),
(342, 10, 5, '2023-08-07 22:57:23', NULL, NULL, 'dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros'),
(343, 6, 4, '2023-04-04 15:39:54', NULL, NULL, 'egestas metus aenean fermentum donec ut mauris eget'),
(344, 1, 2, '2023-01-06 08:35:35', NULL, NULL, 'felis donec semper sapien a libero nam dui proin leo odio'),
(345, 8, 2, '2024-04-12 16:49:33', NULL, NULL, 'vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque'),
(346, 5, 4, '2023-09-16 19:26:08', NULL, NULL, 'scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices'),
(347, 6, 10, '2023-01-02 01:02:03', NULL, NULL, 'accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu'),
(348, 2, 10, '2023-06-03 13:21:52', NULL, NULL, 'aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo'),
(349, 10, 9, '2023-08-23 13:00:44', NULL, NULL, 'penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada'),
(350, 7, 5, '2024-03-17 00:26:12', NULL, NULL, 'vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed'),
(351, 7, 1, '2023-03-22 03:12:05', NULL, NULL, 'iaculis justo in hac habitasse platea dictumst etiam faucibus'),
(352, 3, 6, '2023-04-25 04:26:37', NULL, NULL, 'augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi'),
(353, 5, 3, '2023-08-21 17:57:32', NULL, NULL, 'nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor'),
(354, 3, 5, '2023-06-01 08:07:36', NULL, NULL, 'dolor sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius'),
(355, 8, 4, '2023-08-28 12:23:36', NULL, NULL, 'eget vulputate ut ultrices vel augue vestibulum'),
(356, 2, 4, '2023-03-23 14:40:04', NULL, NULL, 'orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula'),
(357, 5, 10, '2023-12-08 03:53:57', NULL, NULL, 'eget vulputate ut ultrices vel'),
(358, 3, 5, '2024-03-25 08:53:22', NULL, NULL, 'vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla'),
(359, 10, 2, '2023-07-19 18:43:24', NULL, NULL, 'posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar'),
(360, 2, 1, '2023-08-05 18:29:55', NULL, NULL, 'molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in'),
(361, 9, 1, '2023-11-02 13:24:41', NULL, NULL, 'luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam'),
(362, 5, 4, '2023-10-18 07:16:21', NULL, NULL, 'sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis'),
(363, 8, 4, '2023-05-30 05:03:28', NULL, NULL, 'diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis'),
(364, 6, 1, '2024-01-13 20:23:34', NULL, NULL, 'nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar'),
(365, 9, 6, '2023-06-28 06:43:22', NULL, NULL, 'neque aenean auctor gravida sem praesent id massa id nisl venenatis'),
(366, 1, 7, '2023-06-18 10:20:54', NULL, NULL, 'proin eu mi nulla ac enim in tempor turpis'),
(367, 9, 3, '2024-04-03 12:24:55', NULL, NULL, 'at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl'),
(368, 2, 4, '2024-04-24 07:00:54', NULL, NULL, 'odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum'),
(369, 1, 1, '2023-11-29 22:07:07', NULL, NULL, 'in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar'),
(370, 5, 6, '2024-02-04 03:52:11', NULL, NULL, 'augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent'),
(371, 1, 3, '2024-03-10 08:19:00', NULL, NULL, 'in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus'),
(372, 5, 8, '2024-01-29 03:43:07', NULL, NULL, 'erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien'),
(373, 7, 9, '2023-06-30 22:26:08', NULL, NULL, 'penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus'),
(374, 7, 9, '2024-02-18 18:10:03', NULL, NULL, 'dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et'),
(375, 10, 4, '2023-08-25 10:56:31', NULL, NULL, 'consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu'),
(376, 2, 3, '2023-07-05 16:40:51', NULL, NULL, 'lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed'),
(377, 10, 7, '2023-08-29 13:55:24', NULL, NULL, 'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui'),
(378, 8, 5, '2023-02-18 19:46:46', NULL, NULL, 'eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in'),
(379, 2, 7, '2024-03-21 18:04:53', NULL, NULL, 'massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit'),
(380, 2, 4, '2023-12-29 15:05:32', NULL, NULL, 'nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel'),
(381, 4, 6, '2023-03-03 17:10:25', NULL, NULL, 'in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer'),
(382, 5, 3, '2023-05-31 08:48:46', NULL, NULL, 'ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia'),
(383, 1, 7, '2023-07-19 07:52:09', NULL, NULL, 'id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in'),
(384, 2, 7, '2023-05-23 16:36:39', NULL, NULL, 'sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices'),
(385, 4, 3, '2023-07-04 08:24:17', NULL, NULL, 'ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id'),
(386, 4, 6, '2023-09-04 09:12:15', NULL, NULL, 'tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque'),
(387, 4, 6, '2023-04-22 14:09:27', NULL, NULL, 'sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla'),
(388, 5, 10, '2023-09-13 05:38:08', NULL, NULL, 'in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id'),
(389, 9, 3, '2023-04-08 15:10:52', NULL, NULL, 'ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus'),
(390, 5, 5, '2023-06-24 11:56:50', NULL, NULL, 'id mauris vulputate elementum nullam varius nulla facilisi cras non'),
(391, 7, 10, '2023-04-09 05:37:16', NULL, NULL, 'massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat'),
(392, 8, 7, '2023-05-19 17:31:21', NULL, NULL, 'semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar'),
(393, 1, 7, '2023-03-22 15:22:02', NULL, NULL, 'posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit'),
(394, 1, 4, '2023-06-25 10:50:59', NULL, NULL, 'pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat'),
(395, 2, 10, '2023-11-28 10:47:50', NULL, NULL, 'diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis'),
(396, 3, 7, '2024-04-15 03:13:26', NULL, NULL, 'et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo'),
(397, 8, 3, '2023-08-24 01:36:07', NULL, NULL, 'mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi'),
(398, 6, 2, '2023-12-03 01:49:53', NULL, NULL, 'nullam porttitor lacus at turpis donec'),
(399, 3, 2, '2023-06-03 00:52:42', NULL, NULL, 'a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla'),
(400, 2, 10, '2023-06-17 17:57:27', NULL, NULL, 'imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris'),
(401, 8, 3, '2023-07-23 11:03:40', NULL, NULL, 'lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl'),
(402, 8, 5, '2023-02-24 17:43:06', NULL, NULL, 'sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti'),
(403, 5, 8, '2024-01-15 02:49:54', NULL, NULL, 'donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis');
INSERT INTO `comment` (`id`, `attraction_id`, `user_id`, `created_at`, `edited_at`, `editor_id`, `comment_text`) VALUES
(404, 5, 1, '2024-04-24 14:46:36', NULL, NULL, 'vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede'),
(405, 8, 5, '2023-05-17 05:10:38', NULL, NULL, 'elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut'),
(406, 4, 1, '2024-04-02 05:36:20', NULL, NULL, 'at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices'),
(407, 5, 1, '2024-03-01 01:17:26', NULL, NULL, 'dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis'),
(408, 5, 5, '2023-09-25 08:10:53', NULL, NULL, 'eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio'),
(409, 2, 8, '2023-01-02 04:17:51', NULL, NULL, 'in'),
(410, 4, 9, '2024-01-04 10:29:24', NULL, NULL, 'ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla'),
(411, 7, 10, '2023-12-26 04:13:16', NULL, NULL, 'justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id'),
(412, 1, 2, '2023-09-13 18:49:41', NULL, NULL, 'morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis'),
(413, 6, 8, '2023-05-03 00:50:50', NULL, NULL, 'vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a'),
(414, 10, 7, '2024-01-02 03:27:20', NULL, NULL, 'donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit'),
(415, 1, 2, '2023-09-25 02:40:43', NULL, NULL, 'in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae'),
(416, 6, 3, '2023-10-28 07:31:16', NULL, NULL, 'posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam'),
(417, 6, 7, '2023-11-12 00:35:48', NULL, NULL, 'ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum'),
(418, 4, 4, '2023-01-31 08:00:31', NULL, NULL, 'metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis'),
(419, 6, 6, '2023-05-31 20:07:31', NULL, NULL, 'lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur'),
(420, 1, 9, '2023-07-04 07:29:23', NULL, NULL, 'ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat'),
(421, 9, 6, '2024-02-07 01:36:29', NULL, NULL, 'eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit'),
(422, 4, 8, '2023-08-17 00:24:24', NULL, NULL, 'pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus'),
(423, 1, 3, '2023-05-17 08:01:09', NULL, NULL, 'pellentesque volutpat dui maecenas tristique est et tempus'),
(424, 7, 4, '2023-10-19 22:59:29', NULL, NULL, 'pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget'),
(425, 2, 6, '2023-10-12 05:09:48', NULL, NULL, 'venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque'),
(426, 4, 7, '2023-11-01 14:27:44', NULL, NULL, 'lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis'),
(427, 10, 7, '2024-01-18 11:56:35', NULL, NULL, 'convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum'),
(428, 8, 4, '2023-06-11 05:42:38', NULL, NULL, 'rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis'),
(429, 4, 9, '2023-03-27 07:54:43', NULL, NULL, 'odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit'),
(430, 4, 6, '2023-02-06 19:55:49', NULL, NULL, 'luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel'),
(431, 9, 8, '2023-05-25 03:02:12', NULL, NULL, 'dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue'),
(432, 3, 6, '2023-02-24 18:52:50', NULL, NULL, 'proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla'),
(433, 6, 7, '2024-01-30 22:36:40', NULL, NULL, 'id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in'),
(434, 4, 8, '2023-12-07 02:19:51', NULL, NULL, 'morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies'),
(435, 2, 5, '2023-10-24 01:47:06', NULL, NULL, 'donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend'),
(436, 9, 2, '2023-06-05 17:08:24', NULL, NULL, 'quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit'),
(437, 9, 8, '2023-06-14 00:28:18', NULL, NULL, 'scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit'),
(438, 8, 3, '2023-03-14 14:40:46', NULL, NULL, 'sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices'),
(439, 1, 6, '2023-09-18 15:45:13', NULL, NULL, 'quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus'),
(440, 1, 3, '2023-03-06 12:34:52', NULL, NULL, 'massa'),
(441, 3, 6, '2023-05-25 10:11:24', NULL, NULL, 'sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh'),
(442, 6, 8, '2024-03-20 19:50:47', NULL, NULL, 'consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a'),
(443, 1, 8, '2023-08-28 10:47:27', NULL, NULL, 'est phasellus sit amet erat nulla tempus vivamus in felis eu'),
(444, 5, 10, '2023-07-20 13:01:52', NULL, NULL, 'faucibus accumsan odio curabitur convallis'),
(445, 10, 5, '2024-02-23 05:07:37', NULL, NULL, 'habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt'),
(446, 3, 9, '2023-02-20 16:37:45', NULL, NULL, 'justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue'),
(447, 8, 7, '2023-08-16 02:13:21', NULL, NULL, 'faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac'),
(448, 6, 10, '2023-06-25 23:03:12', NULL, NULL, 'sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac'),
(449, 5, 6, '2023-06-28 04:32:19', NULL, NULL, 'est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam'),
(450, 6, 9, '2023-11-18 06:34:49', NULL, NULL, 'leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque'),
(451, 6, 3, '2024-01-06 23:04:54', NULL, NULL, 'ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc'),
(452, 4, 2, '2023-05-03 12:55:28', NULL, NULL, 'aliquet ultrices erat tortor sollicitudin mi sit amet'),
(453, 3, 1, '2023-02-08 15:16:18', NULL, NULL, 'donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non'),
(454, 4, 6, '2023-08-01 19:08:33', NULL, NULL, 'venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui'),
(455, 8, 1, '2024-03-18 01:39:34', NULL, NULL, 'massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu'),
(456, 5, 3, '2023-05-11 08:42:39', NULL, NULL, 'sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur'),
(457, 2, 5, '2023-03-25 20:02:55', NULL, NULL, 'ligula in lacus curabitur at ipsum ac tellus semper'),
(458, 1, 5, '2024-02-12 02:00:17', NULL, NULL, 'at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac'),
(459, 2, 2, '2023-10-26 01:26:24', NULL, NULL, 'quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non'),
(460, 10, 7, '2023-10-29 21:33:59', NULL, NULL, 'felis sed interdum venenatis turpis enim blandit mi in porttitor pede'),
(461, 10, 8, '2024-02-01 22:33:58', NULL, NULL, 'quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis'),
(462, 7, 3, '2023-11-03 04:23:42', NULL, NULL, 'aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum'),
(463, 6, 6, '2023-01-07 23:47:21', NULL, NULL, 'eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam'),
(464, 3, 4, '2023-02-16 19:45:50', NULL, NULL, 'aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem'),
(465, 5, 1, '2024-01-11 19:25:37', NULL, NULL, 'amet sem fusce consequat nulla'),
(466, 1, 8, '2024-01-24 06:59:46', NULL, NULL, 'amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam'),
(467, 3, 9, '2023-12-06 17:11:47', NULL, NULL, 'est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante'),
(468, 2, 9, '2023-10-28 14:51:58', NULL, NULL, 'quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae'),
(469, 7, 1, '2023-08-24 12:53:41', NULL, NULL, 'risus semper'),
(470, 2, 7, '2023-02-26 21:03:29', NULL, NULL, 'etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut'),
(471, 5, 1, '2023-09-11 06:52:30', NULL, NULL, 'turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum'),
(472, 6, 3, '2023-07-08 07:28:42', NULL, NULL, 'luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus'),
(473, 8, 5, '2023-04-17 02:55:24', NULL, NULL, 'cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget'),
(474, 7, 8, '2024-02-24 03:47:08', NULL, NULL, 'feugiat et eros vestibulum ac est lacinia nisi'),
(475, 1, 8, '2023-04-17 03:33:33', NULL, NULL, 'leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula'),
(476, 6, 9, '2024-03-27 06:35:31', NULL, NULL, 'enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis'),
(477, 2, 4, '2023-09-18 00:26:59', NULL, NULL, 'quam nec dui luctus rutrum nulla'),
(478, 1, 7, '2023-02-14 05:48:05', NULL, NULL, 'congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis'),
(479, 5, 2, '2023-12-30 19:25:06', NULL, NULL, 'tellus nisi eu orci'),
(480, 1, 9, '2024-02-17 12:04:45', NULL, NULL, 'nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum'),
(481, 2, 10, '2024-04-13 04:50:41', NULL, NULL, 'fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis'),
(482, 6, 4, '2023-06-14 05:57:09', NULL, NULL, 'a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat'),
(483, 5, 7, '2023-02-23 07:32:23', NULL, NULL, 'amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam'),
(484, 6, 4, '2023-07-01 18:13:36', NULL, NULL, 'amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur'),
(485, 9, 8, '2023-02-03 18:12:36', NULL, NULL, 'orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi'),
(486, 3, 6, '2023-09-24 15:01:39', NULL, NULL, 'rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique'),
(487, 4, 6, '2023-09-22 16:03:05', NULL, NULL, 'ultrices'),
(488, 1, 5, '2023-10-06 03:28:35', NULL, NULL, 'sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus'),
(489, 9, 7, '2024-02-26 18:10:17', NULL, NULL, 'viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus'),
(490, 5, 8, '2023-09-30 09:44:19', NULL, NULL, 'quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam'),
(491, 5, 2, '2023-03-03 05:18:07', NULL, NULL, 'diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec'),
(492, 1, 9, '2023-09-06 05:06:16', NULL, NULL, 'tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere'),
(493, 1, 9, '2023-07-07 23:37:36', NULL, NULL, 'pellentesque at nulla suspendisse potenti cras in purus eu'),
(494, 4, 1, '2023-07-21 08:52:18', NULL, NULL, 'elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales'),
(495, 6, 10, '2023-05-11 13:49:36', NULL, NULL, 'pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit'),
(496, 6, 7, '2023-12-22 22:42:01', NULL, NULL, 'luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in'),
(497, 4, 5, '2023-05-19 21:05:06', NULL, NULL, 'donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer'),
(498, 9, 6, '2023-04-17 10:29:22', NULL, NULL, 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium'),
(499, 5, 4, '2024-03-05 19:30:07', NULL, NULL, 'ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer'),
(500, 6, 1, '2023-09-08 00:45:30', NULL, NULL, 'sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis');

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
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`, `code`, `flag`) VALUES
(1, 'Afghanistan', 'AF', 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Flag_of_the_Taliban.svg'),
(2, 'Albania', 'AL', 'https://flagcdn.com/al.svg'),
(3, 'Algeria', 'DZ', 'https://flagcdn.com/dz.svg'),
(4, 'American Samoa', 'AS', 'https://flagcdn.com/as.svg'),
(5, 'Andorra', 'AD', 'https://flagcdn.com/ad.svg'),
(6, 'Angola', 'AO', 'https://flagcdn.com/ao.svg'),
(7, 'Anguilla', 'AI', 'https://flagcdn.com/ai.svg'),
(8, 'Antarctica', 'AQ', 'https://flagcdn.com/aq.svg'),
(9, 'Antigua and Barbuda', 'AG', 'https://flagcdn.com/ag.svg'),
(10, 'Argentina', 'AR', 'https://flagcdn.com/ar.svg'),
(11, 'Armenia', 'AM', 'https://flagcdn.com/am.svg'),
(12, 'Aruba', 'AW', 'https://flagcdn.com/aw.svg'),
(13, 'Australia', 'AU', 'https://flagcdn.com/au.svg'),
(14, 'Austria', 'AT', 'https://flagcdn.com/at.svg'),
(15, 'Azerbaijan', 'AZ', 'https://flagcdn.com/az.svg'),
(16, 'Bahamas', 'BS', 'https://flagcdn.com/bs.svg'),
(17, 'Bahrain', 'BH', 'https://flagcdn.com/bh.svg'),
(18, 'Bangladesh', 'BD', 'https://flagcdn.com/bd.svg'),
(19, 'Barbados', 'BB', 'https://flagcdn.com/bb.svg'),
(20, 'Belarus', 'BY', 'https://flagcdn.com/by.svg'),
(21, 'Belgium', 'BE', 'https://flagcdn.com/be.svg'),
(22, 'Belize', 'BZ', 'https://flagcdn.com/bz.svg'),
(23, 'Benin', 'BJ', 'https://flagcdn.com/bj.svg'),
(24, 'Bermuda', 'BM', 'https://flagcdn.com/bm.svg'),
(25, 'Bhutan', 'BT', 'https://flagcdn.com/bt.svg'),
(26, 'Bolivia', 'BO', 'https://flagcdn.com/bo.svg'),
(27, 'Bosnia and Herzegovina', 'BA', 'https://flagcdn.com/ba.svg'),
(28, 'Botswana', 'BW', 'https://flagcdn.com/bw.svg'),
(29, 'Bouvet Island', 'BV', 'https://flagcdn.com/bv.svg'),
(30, 'Brazil', 'BR', 'https://flagcdn.com/br.svg'),
(31, 'British Indian Ocean Territory', 'IO', 'https://flagcdn.com/io.svg'),
(32, 'British Virgin Islands', 'VG', 'https://flagcdn.com/vg.svg'),
(33, 'Brunei', 'BN', 'https://flagcdn.com/bn.svg'),
(34, 'Bulgaria', 'BG', 'https://flagcdn.com/bg.svg'),
(35, 'Burkina Faso', 'BF', 'https://flagcdn.com/bf.svg'),
(36, 'Burundi', 'BI', 'https://flagcdn.com/bi.svg'),
(37, 'Cambodia', 'KH', 'https://flagcdn.com/kh.svg'),
(38, 'Cameroon', 'CM', 'https://flagcdn.com/cm.svg'),
(39, 'Canada', 'CA', 'https://flagcdn.com/ca.svg'),
(40, 'Cape Verde', 'CV', 'https://flagcdn.com/cv.svg'),
(41, 'Caribbean Netherlands', 'BQ', 'https://flagcdn.com/bq.svg'),
(42, 'Cayman Islands', 'KY', 'https://flagcdn.com/ky.svg'),
(43, 'Central African Republic', 'CF', 'https://flagcdn.com/cf.svg'),
(44, 'Chad', 'TD', 'https://flagcdn.com/td.svg'),
(45, 'Chile', 'CL', 'https://flagcdn.com/cl.svg'),
(46, 'China', 'CN', 'https://flagcdn.com/cn.svg'),
(47, 'Christmas Island', 'CX', 'https://flagcdn.com/cx.svg'),
(48, 'Cocos (Keeling) Islands', 'CC', 'https://flagcdn.com/cc.svg'),
(49, 'Colombia', 'CO', 'https://flagcdn.com/co.svg'),
(50, 'Comoros', 'KM', 'https://flagcdn.com/km.svg'),
(51, 'Cook Islands', 'CK', 'https://flagcdn.com/ck.svg'),
(52, 'Costa Rica', 'CR', 'https://flagcdn.com/cr.svg'),
(53, 'Croatia', 'HR', 'https://flagcdn.com/hr.svg'),
(54, 'Cuba', 'CU', 'https://flagcdn.com/cu.svg'),
(55, 'Curaçao', 'CW', 'https://flagcdn.com/cw.svg'),
(56, 'Cyprus', 'CY', 'https://flagcdn.com/cy.svg'),
(57, 'Czechia', 'CZ', 'https://flagcdn.com/cz.svg'),
(58, 'DR Congo', 'CD', 'https://flagcdn.com/cd.svg'),
(59, 'Denmark', 'DK', 'https://flagcdn.com/dk.svg'),
(60, 'Djibouti', 'DJ', 'https://flagcdn.com/dj.svg'),
(61, 'Dominica', 'DM', 'https://flagcdn.com/dm.svg'),
(62, 'Dominican Republic', 'DO', 'https://flagcdn.com/do.svg'),
(63, 'Ecuador', 'EC', 'https://flagcdn.com/ec.svg'),
(64, 'Egypt', 'EG', 'https://flagcdn.com/eg.svg'),
(65, 'El Salvador', 'SV', 'https://flagcdn.com/sv.svg'),
(66, 'Equatorial Guinea', 'GQ', 'https://flagcdn.com/gq.svg'),
(67, 'Eritrea', 'ER', 'https://flagcdn.com/er.svg'),
(68, 'Estonia', 'EE', 'https://flagcdn.com/ee.svg'),
(69, 'Eswatini', 'SZ', 'https://flagcdn.com/sz.svg'),
(70, 'Ethiopia', 'ET', 'https://flagcdn.com/et.svg'),
(71, 'Falkland Islands', 'FK', 'https://flagcdn.com/fk.svg'),
(72, 'Faroe Islands', 'FO', 'https://flagcdn.com/fo.svg'),
(73, 'Fiji', 'FJ', 'https://flagcdn.com/fj.svg'),
(74, 'Finland', 'FI', 'https://flagcdn.com/fi.svg'),
(75, 'France', 'FR', 'https://flagcdn.com/fr.svg'),
(76, 'French Guiana', 'GF', 'https://flagcdn.com/gf.svg'),
(77, 'French Polynesia', 'PF', 'https://flagcdn.com/pf.svg'),
(78, 'French Southern and Antarctic Lands', 'TF', 'https://flagcdn.com/tf.svg'),
(79, 'Gabon', 'GA', 'https://flagcdn.com/ga.svg'),
(80, 'Gambia', 'GM', 'https://flagcdn.com/gm.svg'),
(81, 'Georgia', 'GE', 'https://flagcdn.com/ge.svg'),
(82, 'Germany', 'DE', 'https://flagcdn.com/de.svg'),
(83, 'Ghana', 'GH', 'https://flagcdn.com/gh.svg'),
(84, 'Gibraltar', 'GI', 'https://flagcdn.com/gi.svg'),
(85, 'Greece', 'GR', 'https://flagcdn.com/gr.svg'),
(86, 'Greenland', 'GL', 'https://flagcdn.com/gl.svg'),
(87, 'Grenada', 'GD', 'https://flagcdn.com/gd.svg'),
(88, 'Guadeloupe', 'GP', 'https://flagcdn.com/gp.svg'),
(89, 'Guam', 'GU', 'https://flagcdn.com/gu.svg'),
(90, 'Guatemala', 'GT', 'https://flagcdn.com/gt.svg'),
(91, 'Guernsey', 'GG', 'https://flagcdn.com/gg.svg'),
(92, 'Guinea', 'GN', 'https://flagcdn.com/gn.svg'),
(93, 'Guinea-Bissau', 'GW', 'https://flagcdn.com/gw.svg'),
(94, 'Guyana', 'GY', 'https://flagcdn.com/gy.svg'),
(95, 'Haiti', 'HT', 'https://flagcdn.com/ht.svg'),
(96, 'Heard Island and McDonald Islands', 'HM', 'https://flagcdn.com/hm.svg'),
(97, 'Honduras', 'HN', 'https://flagcdn.com/hn.svg'),
(98, 'Hong Kong', 'HK', 'https://flagcdn.com/hk.svg'),
(99, 'Hungary', 'HU', 'https://flagcdn.com/hu.svg'),
(100, 'Iceland', 'IS', 'https://flagcdn.com/is.svg'),
(101, 'India', 'IN', 'https://flagcdn.com/in.svg'),
(102, 'Indonesia', 'ID', 'https://flagcdn.com/id.svg'),
(103, 'Iran', 'IR', 'https://flagcdn.com/ir.svg'),
(104, 'Iraq', 'IQ', 'https://flagcdn.com/iq.svg'),
(105, 'Ireland', 'IE', 'https://flagcdn.com/ie.svg'),
(106, 'Isle of Man', 'IM', 'https://flagcdn.com/im.svg'),
(107, 'Israel', 'IL', 'https://flagcdn.com/il.svg'),
(108, 'Italy', 'IT', 'https://flagcdn.com/it.svg'),
(109, 'Ivory Coast', 'CI', 'https://flagcdn.com/ci.svg'),
(110, 'Jamaica', 'JM', 'https://flagcdn.com/jm.svg'),
(111, 'Japan', 'JP', 'https://flagcdn.com/jp.svg'),
(112, 'Jersey', 'JE', 'https://flagcdn.com/je.svg'),
(113, 'Jordan', 'JO', 'https://flagcdn.com/jo.svg'),
(114, 'Kazakhstan', 'KZ', 'https://flagcdn.com/kz.svg'),
(115, 'Kenya', 'KE', 'https://flagcdn.com/ke.svg'),
(116, 'Kiribati', 'KI', 'https://flagcdn.com/ki.svg'),
(117, 'Kosovo', 'XK', 'https://flagcdn.com/xk.svg'),
(118, 'Kuwait', 'KW', 'https://flagcdn.com/kw.svg'),
(119, 'Kyrgyzstan', 'KG', 'https://flagcdn.com/kg.svg'),
(120, 'Laos', 'LA', 'https://flagcdn.com/la.svg'),
(121, 'Latvia', 'LV', 'https://flagcdn.com/lv.svg'),
(122, 'Lebanon', 'LB', 'https://flagcdn.com/lb.svg'),
(123, 'Lesotho', 'LS', 'https://flagcdn.com/ls.svg'),
(124, 'Liberia', 'LR', 'https://flagcdn.com/lr.svg'),
(125, 'Libya', 'LY', 'https://flagcdn.com/ly.svg'),
(126, 'Liechtenstein', 'LI', 'https://flagcdn.com/li.svg'),
(127, 'Lithuania', 'LT', 'https://flagcdn.com/lt.svg'),
(128, 'Luxembourg', 'LU', 'https://flagcdn.com/lu.svg'),
(129, 'Macau', 'MO', 'https://flagcdn.com/mo.svg'),
(130, 'Madagascar', 'MG', 'https://flagcdn.com/mg.svg'),
(131, 'Malawi', 'MW', 'https://flagcdn.com/mw.svg'),
(132, 'Malaysia', 'MY', 'https://flagcdn.com/my.svg'),
(133, 'Maldives', 'MV', 'https://flagcdn.com/mv.svg'),
(134, 'Mali', 'ML', 'https://flagcdn.com/ml.svg'),
(135, 'Malta', 'MT', 'https://flagcdn.com/mt.svg'),
(136, 'Marshall Islands', 'MH', 'https://flagcdn.com/mh.svg'),
(137, 'Martinique', 'MQ', 'https://flagcdn.com/mq.svg'),
(138, 'Mauritania', 'MR', 'https://flagcdn.com/mr.svg'),
(139, 'Mauritius', 'MU', 'https://flagcdn.com/mu.svg'),
(140, 'Mayotte', 'YT', 'https://flagcdn.com/yt.svg'),
(141, 'Mexico', 'MX', 'https://flagcdn.com/mx.svg'),
(142, 'Micronesia', 'FM', 'https://flagcdn.com/fm.svg'),
(143, 'Moldova', 'MD', 'https://flagcdn.com/md.svg'),
(144, 'Monaco', 'MC', 'https://flagcdn.com/mc.svg'),
(145, 'Mongolia', 'MN', 'https://flagcdn.com/mn.svg'),
(146, 'Montenegro', 'ME', 'https://flagcdn.com/me.svg'),
(147, 'Montserrat', 'MS', 'https://flagcdn.com/ms.svg'),
(148, 'Morocco', 'MA', 'https://flagcdn.com/ma.svg'),
(149, 'Mozambique', 'MZ', 'https://flagcdn.com/mz.svg'),
(150, 'Myanmar', 'MM', 'https://flagcdn.com/mm.svg'),
(151, 'Namibia', 'NA', 'https://flagcdn.com/na.svg'),
(152, 'Nauru', 'NR', 'https://flagcdn.com/nr.svg'),
(153, 'Nepal', 'NP', 'https://flagcdn.com/np.svg'),
(154, 'Netherlands', 'NL', 'https://flagcdn.com/nl.svg'),
(155, 'New Caledonia', 'NC', 'https://flagcdn.com/nc.svg'),
(156, 'New Zealand', 'NZ', 'https://flagcdn.com/nz.svg'),
(157, 'Nicaragua', 'NI', 'https://flagcdn.com/ni.svg'),
(158, 'Niger', 'NE', 'https://flagcdn.com/ne.svg'),
(159, 'Nigeria', 'NG', 'https://flagcdn.com/ng.svg'),
(160, 'Niue', 'NU', 'https://flagcdn.com/nu.svg'),
(161, 'Norfolk Island', 'NF', 'https://flagcdn.com/nf.svg'),
(162, 'North Korea', 'KP', 'https://flagcdn.com/kp.svg'),
(163, 'North Macedonia', 'MK', 'https://flagcdn.com/mk.svg'),
(164, 'Northern Mariana Islands', 'MP', 'https://flagcdn.com/mp.svg'),
(165, 'Norway', 'NO', 'https://flagcdn.com/no.svg'),
(166, 'Oman', 'OM', 'https://flagcdn.com/om.svg'),
(167, 'Pakistan', 'PK', 'https://flagcdn.com/pk.svg'),
(168, 'Palau', 'PW', 'https://flagcdn.com/pw.svg'),
(169, 'Palestine', 'PS', 'https://flagcdn.com/ps.svg'),
(170, 'Panama', 'PA', 'https://flagcdn.com/pa.svg'),
(171, 'Papua New Guinea', 'PG', 'https://flagcdn.com/pg.svg'),
(172, 'Paraguay', 'PY', 'https://flagcdn.com/py.svg'),
(173, 'Peru', 'PE', 'https://flagcdn.com/pe.svg'),
(174, 'Philippines', 'PH', 'https://flagcdn.com/ph.svg'),
(175, 'Pitcairn Islands', 'PN', 'https://flagcdn.com/pn.svg'),
(176, 'Poland', 'PL', 'https://flagcdn.com/pl.svg'),
(177, 'Portugal', 'PT', 'https://flagcdn.com/pt.svg'),
(178, 'Puerto Rico', 'PR', 'https://flagcdn.com/pr.svg'),
(179, 'Qatar', 'QA', 'https://flagcdn.com/qa.svg'),
(180, 'Republic of the Congo', 'CG', 'https://flagcdn.com/cg.svg'),
(181, 'Romania', 'RO', 'https://flagcdn.com/ro.svg'),
(182, 'Russia', 'RU', 'https://flagcdn.com/ru.svg'),
(183, 'Rwanda', 'RW', 'https://flagcdn.com/rw.svg'),
(184, 'Réunion', 'RE', 'https://flagcdn.com/re.svg'),
(185, 'Saint Barthélemy', 'BL', 'https://flagcdn.com/bl.svg'),
(186, 'Saint Helena, Ascension and Tristan da Cunha', 'SH', 'https://flagcdn.com/sh.svg'),
(187, 'Saint Kitts and Nevis', 'KN', 'https://flagcdn.com/kn.svg'),
(188, 'Saint Lucia', 'LC', 'https://flagcdn.com/lc.svg'),
(189, 'Saint Martin', 'MF', 'https://flagcdn.com/mf.svg'),
(190, 'Saint Pierre and Miquelon', 'PM', 'https://flagcdn.com/pm.svg'),
(191, 'Saint Vincent and the Grenadines', 'VC', 'https://flagcdn.com/vc.svg'),
(192, 'Samoa', 'WS', 'https://flagcdn.com/ws.svg'),
(193, 'San Marino', 'SM', 'https://flagcdn.com/sm.svg'),
(194, 'Saudi Arabia', 'SA', 'https://flagcdn.com/sa.svg'),
(195, 'Senegal', 'SN', 'https://flagcdn.com/sn.svg'),
(196, 'Serbia', 'RS', 'https://flagcdn.com/rs.svg'),
(197, 'Seychelles', 'SC', 'https://flagcdn.com/sc.svg'),
(198, 'Sierra Leone', 'SL', 'https://flagcdn.com/sl.svg'),
(199, 'Singapore', 'SG', 'https://flagcdn.com/sg.svg'),
(200, 'Sint Maarten', 'SX', 'https://flagcdn.com/sx.svg'),
(201, 'Slovakia', 'SK', 'https://flagcdn.com/sk.svg'),
(202, 'Slovenia', 'SI', 'https://flagcdn.com/si.svg'),
(203, 'Solomon Islands', 'SB', 'https://flagcdn.com/sb.svg'),
(204, 'Somalia', 'SO', 'https://flagcdn.com/so.svg'),
(205, 'South Africa', 'ZA', 'https://flagcdn.com/za.svg'),
(206, 'South Georgia', 'GS', 'https://flagcdn.com/gs.svg'),
(207, 'South Korea', 'KR', 'https://flagcdn.com/kr.svg'),
(208, 'South Sudan', 'SS', 'https://flagcdn.com/ss.svg'),
(209, 'Spain', 'ES', 'https://flagcdn.com/es.svg'),
(210, 'Sri Lanka', 'LK', 'https://flagcdn.com/lk.svg'),
(211, 'Sudan', 'SD', 'https://flagcdn.com/sd.svg'),
(212, 'Suriname', 'SR', 'https://flagcdn.com/sr.svg'),
(213, 'Svalbard and Jan Mayen', 'SJ', 'https://flagcdn.com/sj.svg'),
(214, 'Sweden', 'SE', 'https://flagcdn.com/se.svg'),
(215, 'Switzerland', 'CH', 'https://flagcdn.com/ch.svg'),
(216, 'Syria', 'SY', 'https://flagcdn.com/sy.svg'),
(217, 'São Tomé and Príncipe', 'ST', 'https://flagcdn.com/st.svg'),
(218, 'Taiwan', 'TW', 'https://flagcdn.com/tw.svg'),
(219, 'Tajikistan', 'TJ', 'https://flagcdn.com/tj.svg'),
(220, 'Tanzania', 'TZ', 'https://flagcdn.com/tz.svg'),
(221, 'Thailand', 'TH', 'https://flagcdn.com/th.svg'),
(222, 'Timor-Leste', 'TL', 'https://flagcdn.com/tl.svg'),
(223, 'Togo', 'TG', 'https://flagcdn.com/tg.svg'),
(224, 'Tokelau', 'TK', 'https://flagcdn.com/tk.svg'),
(225, 'Tonga', 'TO', 'https://flagcdn.com/to.svg'),
(226, 'Trinidad and Tobago', 'TT', 'https://flagcdn.com/tt.svg'),
(227, 'Tunisia', 'TN', 'https://flagcdn.com/tn.svg'),
(228, 'Turkey', 'TR', 'https://flagcdn.com/tr.svg'),
(229, 'Turkmenistan', 'TM', 'https://flagcdn.com/tm.svg'),
(230, 'Turks and Caicos Islands', 'TC', 'https://flagcdn.com/tc.svg'),
(231, 'Tuvalu', 'TV', 'https://flagcdn.com/tv.svg'),
(232, 'Uganda', 'UG', 'https://flagcdn.com/ug.svg'),
(233, 'Ukraine', 'UA', 'https://flagcdn.com/ua.svg'),
(234, 'United Arab Emirates', 'AE', 'https://flagcdn.com/ae.svg'),
(235, 'United Kingdom', 'GB', 'https://flagcdn.com/gb.svg'),
(236, 'United States Minor Outlying Islands', 'UM', 'https://flagcdn.com/um.svg'),
(237, 'United States Virgin Islands', 'VI', 'https://flagcdn.com/vi.svg'),
(238, 'United States', 'US', 'https://flagcdn.com/us.svg'),
(239, 'Uruguay', 'UY', 'https://flagcdn.com/uy.svg'),
(240, 'Uzbekistan', 'UZ', 'https://flagcdn.com/uz.svg'),
(241, 'Vanuatu', 'VU', 'https://flagcdn.com/vu.svg'),
(242, 'Vatican City', 'VA', 'https://flagcdn.com/va.svg'),
(243, 'Venezuela', 'VE', 'https://flagcdn.com/ve.svg'),
(244, 'Vietnam', 'VN', 'https://flagcdn.com/vn.svg'),
(245, 'Wallis and Futuna', 'WF', 'https://flagcdn.com/wf.svg'),
(246, 'Western Sahara', 'EH', 'https://flagcdn.com/eh.svg'),
(247, 'Yemen', 'YE', 'https://flagcdn.com/ye.svg'),
(248, 'Zambia', 'ZM', 'https://flagcdn.com/zm.svg'),
(249, 'Zimbabwe', 'ZW', 'https://flagcdn.com/zw.svg'),
(250, 'Åland Islands', 'AX', 'https://flagcdn.com/ax.svg');

-- --------------------------------------------------------

--
-- Table structure for table `friendship`
--

CREATE TABLE `friendship` (
  `user_1` int(11) NOT NULL,
  `user_2` int(11) NOT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `friendship`
--

INSERT INTO `friendship` (`user_1`, `user_2`, `status`) VALUES
(4, 10, 'accepted'),
(7, 10, 'pending'),
(10, 2, 'accepted'),
(10, 3, 'accepted'),
(10, 5, 'accepted'),
(10, 6, 'accepted'),
(10, 8, 'accepted'),
(10, 9, 'accepted');

-- --------------------------------------------------------

--
-- Table structure for table `groupedAttraction`
--

CREATE TABLE `groupedAttraction` (
  `group_id` int(11) NOT NULL,
  `attraction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `groupedAttraction`
--

INSERT INTO `groupedAttraction` (`group_id`, `attraction_id`) VALUES
(1, 2),
(1, 4),
(1, 8),
(1, 18),
(1, 19),
(2, 12),
(2, 22),
(2, 27),
(2, 29),
(3, 21),
(3, 22),
(3, 24),
(4, 8),
(4, 16);

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
(17, 'Year-round'),
(18, 'Nightlife');

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
  `role` int(11) DEFAULT 2,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `role`, `created_at`, `country_id`) VALUES
(1, 'superuser', 'Ford', 'Prefect', 'admin@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 1, '2024-03-05 18:13:57', 235),
(2, 'marina2000', 'Marina', 'Petrova', 'marina2000@example.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 1, '2024-03-05 18:13:57', 233),
(3, 'luca85', 'Luca', 'Rossi', 'luca85@mail.com', 'scrypt:32768:8:1$BiOqALuXNVqjVHlH$21b89e4eb1ac8af54f859db24a1e616244ff0312cc55d0f2f38231ac5c57ab2be6adf3def4c9f0f56a30e9be8c85241cd29bd45f3409a11c430f4d7180d33779', 2, '2024-03-06 20:10:12', 108),
(4, 'priya12', 'Priya', 'Patel', 'priya12@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 2, '2024-03-15 15:10:00', 101),
(5, 'johannes92', 'Johannes', 'Karlsen', 'johannes92@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 2, '2024-03-25 17:20:59', 165),
(6, 'annam22', 'Anna', 'Martinez', 'annam22@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 2, '2024-04-01 21:24:51', 209),
(7, 'emre79', 'Emre', 'Yilmaz', 'emre79@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 2, '2024-04-01 19:34:01', 228),
(8, 'pizzaking', 'Christopher', 'Smith', 'christophesmith@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 2, '2024-04-03 18:13:34', 238),
(9, 'tomtom', 'Tom', 'Olsen', 'tomtom@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 2, '2024-04-03 13:12:27', 59),
(10, 'whereismytowel', 'Arthur', 'Dent', 'arthurdent@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 2, '2024-04-04 12:20:50', 235);

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

--
-- Dumping data for table `userAgeGroupPreference`
--

INSERT INTO `userAgeGroupPreference` (`user_id`, `age_group_id`) VALUES
(10, 7),
(10, 8);

-- --------------------------------------------------------

--
-- Table structure for table `userBadge`
--

CREATE TABLE `userBadge` (
  `user_id` int(11) NOT NULL,
  `badge_id` int(11) NOT NULL,
  `date_earned` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userBadge`
--

INSERT INTO `userBadge` (`user_id`, `badge_id`, `date_earned`) VALUES
(3, 2, '2024-05-14 07:52:17'),
(3, 13, '2024-05-14 07:52:17'),
(10, 3, '2024-05-14 07:43:26');

-- --------------------------------------------------------

--
-- Table structure for table `userCategoryPreference`
--

CREATE TABLE `userCategoryPreference` (
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userCategoryPreference`
--

INSERT INTO `userCategoryPreference` (`user_id`, `category_id`) VALUES
(10, 1),
(10, 2);

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
(2, 'User', 0),
(3, 'Moderator', 1);

-- --------------------------------------------------------

--
-- Table structure for table `userTagPreference`
--

CREATE TABLE `userTagPreference` (
  `user_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userTagPreference`
--

INSERT INTO `userTagPreference` (`user_id`, `tag_id`) VALUES
(10, 1),
(10, 2);

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
-- Dumping data for table `visitedAttraction`
--

INSERT INTO `visitedAttraction` (`user_id`, `attraction_id`, `time_visited`) VALUES
(2, 1, '2024-04-06 16:18:53'),
(2, 5, '2024-04-06 16:18:58'),
(3, 4, '2024-04-06 16:30:17'),
(3, 9, '2024-04-06 16:30:21'),
(3, 20, '2024-04-06 11:49:22'),
(3, 22, '2024-05-14 11:52:04'),
(3, 23, '2024-05-14 11:52:09'),
(3, 25, '2024-05-14 11:52:14'),
(4, 2, '2024-04-06 16:30:46'),
(4, 5, '2024-04-06 16:30:48'),
(4, 10, '2024-04-06 16:30:53'),
(5, 7, '2024-04-06 16:31:30'),
(6, 1, '2024-04-06 16:32:00'),
(6, 3, '2024-04-06 16:32:02'),
(6, 6, '2024-04-07 16:31:51'),
(6, 8, '2024-04-07 16:31:55'),
(7, 8, '2024-02-13 16:32:35'),
(7, 9, '2024-02-13 16:32:28'),
(9, 2, '2024-03-25 16:33:34'),
(9, 10, '2024-03-25 16:33:39'),
(10, 1, '2023-08-21 11:38:14'),
(10, 6, '2023-08-20 16:28:31'),
(10, 11, '2023-08-20 11:38:25'),
(10, 12, '2024-05-14 11:43:21'),
(10, 14, '2024-05-14 11:42:56'),
(10, 21, '2023-08-21 11:38:02'),
(10, 23, '2023-08-21 11:38:06');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `attractionGroup`
--
ALTER TABLE `attractionGroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `badge`
--
ALTER TABLE `badge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `fk_city_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_attraction` FOREIGN KEY (`attraction_id`) REFERENCES `attraction` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_comment_edit_user` FOREIGN KEY (`editor_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

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
