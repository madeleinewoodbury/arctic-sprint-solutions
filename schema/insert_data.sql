USE `arcticSprintSolutionsDB`;

--
-- Dumping data for table `language`
--
INSERT INTO `language` (`id`, `name`) VALUES
(1, 'English');


--
-- Dumping data for table `achievement`
--
INSERT INTO `achievement` (`id`, `title`, `description`, `points_needed`) VALUES
(1, 'Explorer', 'Visited 10 different attractions', 100),
(2, 'Globetrotetr', 'Visited 20 different attractions', 200);


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


--
-- Dumping data for table `city`
--
INSERT INTO `city` (`id`, `name`, `description`, `image`) VALUES
(1, 'Tromsø', 'Tromsø, a vibrant city surrounded by majestic mountains and the Arctic landscape, is known as the \'Gateway to the Arctic Sea.\' The city offers a unique blend of culture, history, and nature, with attractions such as the Arctic Cathedral, Polaria, and opportunities for Northern Lights safaris and outdoor activities', 'https://images.unsplash.com/photo-1609538205185-40f2701cf7d6?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');


--
-- Dumping data for table `attraction`
--
INSERT INTO `attraction` (`id`, `name`, `city`, `location`, `description`, `image`, `points`) VALUES
(1, 'Ishavskatedralen', 1, 'Hans Nilsens veg 41', 'An iconic church with unique architecture and stunning views of the fjord.', 'https://www.ishavskatedralen.no/wp-content/uploads/2013/06/testfoto1.jpg', 10),
(2, 'Fjellheisen Tromsø', 1, 'Sollivegen 12', 'The Cable Car is Tromsø’s most popular tourist destination. It runs from Solliveien in Tromsdalen up to the mountain ledge Storsteinen. The lower station is located on Tromsø’s mainland, 50 m above sea level, while the upper station, Fjellstua, is situated at an altitude of 421 m above sea level. The trip up takes just four minutes. From the large outdoor terrace, you can enjoy the spectacular panoramic view of Tromsø and the virtually endless sight of islands, fjords, mountains and the open sea. Fjellheisen was built in 1961 by Brød­rene Jakob­sens Rederi, a local shipping company that was a major player in arctic hunting/trapping, fishing and expeditions to the arc­tic and Antarctic. The gondolas proudly convey this tradition by bearing the shipping company’s symbols: the polar bear and the seal.', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/9d/14/38/yellow-gondola-fjellheisen.jpg?w=1200&h=-1&s=1', 10),
(3, 'Polaria', 1, 'Hjalmar Johansens Gate 12', 'Polaria is an Arctic Experience Centre and Aquarium located in the heart of Tromsø. Learn about Climate Change through our brand-new interactive exhibitions, reflect over how all life in the Arctic is connected, and discover how you can make a difference. In our aquarium you will find unique species of fish and crustations from the northern regions, as well as our five seals. Join in on the daily feeding and training sessions of the seals at 10:30, 12:30 and 15:30. Sit down and enjoy our three Panoramic films about the nature and wildlife at Svalbard, the magical Northern Lights, and a behind the scenes documentary showing how we work with our animals. Polaria is suitable for all ages, and the perfect place for those who are interested in diving beneath the surface to explore the Arctic in a unique way.\n\n', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2b/57/e0/7a/meet-the-bearded-seals.jpg?w=1200&h=-1&s=1', 10),
(4, 'The Polar Museum', 1, 'Søndre Tollbodgate 11B', 'Expeditions, everyday life and adventures in the Arctic from the 17th century up to the present.\r\nIn our historic buildings, which are the former Customs premises in Tromsø, we communicate polar history with national and local roots. Our permanent exhibitions deal with sealing, overwintering, polar expeditions and the cultural history of Svalbard. The former boathouse houses temporary exhibitions based on new polar research.', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/7c/72/d9/polarmuseet-2017.jpg?w=1200&h=-1&s=1', 25),
(5, 'Ølhallen Brewpub', 1, 'Storgata 4', 'Ølhallen opened in 1928 and is the oldest pub in Tromsø. It is a place where townspeople of all ages meet and taste the best beers from Mack as well as other Norwegian breweries. We have one of the largest tap selections in Europe serving Norwegian quality beer from 72 different taps! All beers are possible to buy in tasting size glass. We also have tasting trays', 'https://images.citybreakcdn.com/image.aspx?ImageId=7267566&height=560&width=1440&crop=1', 15),
(6, 'Tromsø Villmarkssenter', 1, 'Straumsvegen 601, 9105 Kvaløya', '30 years ago, the renowned dog sled racer Tove Sørensen opened her home to guests from all over the world. Since then, she and her family have dedicated their life to educating visitors about Alaskan huskies, dog sledding and the arctic nature through sustainable outdoor activities.', 'https://images.citybreakcdn.com/image.aspx?ImageId=6689293&height=800&width=1200&crop=1', 30),
(7, 'Storgata Camping', 1, 'Storgata 5, 9008 Tromsø', 'Storgata Camping\r\nStorgata Camping has the biggest indoor minigolfcourse in Norway! With 18 different challenges to conquer.', 'https://images.citybreakcdn.com/image.aspx?ImageId=8859233&height=560&width=1440&crop=1', 10),
(8, 'Fiskekompaniet Sjøsiden', 1, 'Killengreens gate, 9007 Tromsø', 'n a stressful society dominated by kiosks and fast-food chains, we would like to offer you some of the genuine and healthy food we harvest from the ocean.', 'https://images.citybreakcdn.com/image.aspx?ImageId=7207348&height=560&width=1440&crop=1', 10),
(9, 'Northern Light Safari', 1, NULL, 'This tour is conducted by Northern Yachting. If you want to see the experience the Northern Lights, there is no better way to experience it than to join us on a trip. On board our beautiful catamaran, our guests can lie on the well-known catamaran net, to look straight up at the sky while the sea sculpts smoothly below.', 'https://images.citybreakcdn.com/image.aspx?ImageId=7094166&height=800&width=1200&crop=1', 42),
(10, 'Galleri Nord', 1, 'Sjøgata 7, 9259 Tromsø', 'At Galleri Nord you will find a variety of pictorial art, sculptures, handicrafts and design products from Tromsø and Northern Norway. They sell photographs of Northern Norway taken by award-winning photographers, art cards and gift articles. In addition, the gallery provides ateliers for local artist – you are welcome to visit and watch the artists at work.', 'https://images.citybreakcdn.com/image.aspx?ImageId=6323760&height=560&width=1440&crop=1', 15);


--
-- Dumping data for table `attractionAgeGroup`
--
INSERT INTO `attractionAgeGroup` (`attraction_id`, `age_group_id`) VALUES
(1, 1),
(4, 1),
(6, 1),
(8, 1),
(9, 1),
(1, 2),
(1, 3),
(5, 6),
(7, 6),
(10, 6),
(7, 7),
(10, 7),
(5, 8),
(7, 8),
(5, 9),
(10, 9),
(5, 10),
(10, 10),
(5, 11),
(10, 11);


--
-- Dumping data for table `attractionCategory`
--
INSERT INTO `attractionCategory` (`category_id`, `attraction_id`) VALUES
(9, 1),
(3, 2),
(7, 3),
(8, 3),
(1, 4),
(2, 4),
(6, 5),
(3, 6),
(5, 6),
(6, 6),
(7, 6),
(6, 7),
(6, 8),
(3, 9),
(5, 9),
(2, 10);


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
(17, 3),
(2, 4),
(3, 4),
(9, 4),
(17, 4),
(6, 5),
(17, 5),
(1, 6),
(3, 6),
(7, 6),
(9, 6),
(14, 6),
(9, 7),
(17, 7),
(6, 8),
(17, 8),
(1, 9),
(8, 9),
(13, 9),
(17, 10);


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


--
-- Dumping data for table `userRole`
--
INSERT INTO `userRole` (`id`, `title`, `is_admin`) VALUES
(1, 'Administrator', 1),
(2, 'Bruker', 0),
(3, 'Moderator', 1);


--
-- Dumping data for table `user`
--
INSERT INTO `user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'superuser', 'Ford', 'Prefect', 'admin@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 1, '2024-03-05 18:13:57'),
(2, 'marina2000', 'Marina', 'Petrova', 'marina2000@example.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 1, '2024-03-05 18:13:57'),
(3, 'luca85', 'Luca', 'Rossi', 'luca85@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 2, '2024-03-06 20:10:12'),
(4, 'priya12', 'Priya', 'Patel', 'priya12@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 2, '2024-03-15 15:10:00'),
(5, 'johannes92', 'Johannes', 'Karlsen', 'johannes92@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 2, '2024-03-25 17:20:59'),
(6, 'annam22', 'Anna', 'Martinez', 'annam22@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 2, '2024-04-01 21:24:51'),
(7, 'emre79', 'Emre', 'Yilmaz', 'emre79@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 2, '2024-04-01 19:34:01'),
(8, 'pizzaking', 'Christopher', 'Smith', 'christophesmith@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 2, '2024-04-03 18:13:34'),
(9, 'tomtom', 'Tom', 'Olsen', 'tomtom@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 2, '2024-04-03 13:12:27'),
(10, 'whereismytowel', 'Arthur', 'Dent', 'arthurdent@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 2, '2024-04-04 12:20:50');


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


--
-- Dumping data for table `visitedAttraction`
--
INSERT INTO `visitedAttraction` (`user_id`, `attraction_id`, `time_visited`) VALUES
(2, 1, '2024-04-06 16:18:53'),
(2, 5, '2024-04-06 16:18:58'),
(3, 4, '2024-04-06 16:30:17'),
(3, 9, '2024-04-06 16:30:21'),
(4, 2, '2024-04-06 16:30:46'),
(4, 5, '2024-04-06 16:30:48'),
(4, 10, '2024-04-06 16:30:53'),
(5, 7, '2024-04-06 16:31:30'),
(6, 1, '2024-04-06 16:32:00'),
(6, 3, '2024-04-06 16:32:02'),
(6, 6, '2024-04-06 16:31:51'),
(6, 8, '2024-04-06 16:31:55'),
(7, 8, '2024-04-06 16:32:35'),
(7, 9, '2024-04-06 16:32:28'),
(9, 2, '2024-04-06 16:33:34'),
(9, 10, '2024-04-06 16:33:39'),
(10, 2, '2024-04-06 16:28:34'),
(10, 6, '2024-04-06 16:28:31'),
(10, 8, '2024-04-06 16:28:39');