USE `arcticSprintSolutionsDB`;

--
-- Dumping data for table `language`
--
INSERT INTO `language` (`id`, `name`) VALUES
(1, 'English');

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
INSERT INTO `city` (`id`, `name`, `description`, `image`, `country_id`) VALUES
(1, 'Tromsø', 'Tromsø, a vibrant city surrounded by majestic mountains and the Arctic landscape, is known as the \'Gateway to the Arctic Sea.\' The city offers a unique blend of culture, history, and nature, with attractions such as the Arctic Cathedral, Polaria, and opportunities for Northern Lights safaris and outdoor activities', 'https://images.unsplash.com/photo-1609538205185-40f2701cf7d6?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 165),
(2, 'Oslo','Oslo of Norway is known as a hub for every explorers dream - Attractions. And lots of them, too. We have cherry picked the best locations for our users, and believe we have the perfect recipe for any time spent in the capital. What are you waiting for? Go explore Oslo!' , 'https://lp-cms-production.imgix.net/2023-03/shutterstock_1879262575.jpg', 165),
(3, 'Kristiansand','Some locations are just hidden gems - Kristiansand is one of them. Within Norway, Kristiansund is known for its great attractions and in particular, the Kristiansand Animal Park, a fun and interesting spot for the entire family for a chillout day at the zoo. Let`s go!' , 'https://lp-cms-production.imgix.net/2023-03/shutterstock_1879262575.jpg', 165),
(4, 'Bergen','The city that had 192 days of rain in 2022 is known for the many treassured attractions scattered in and around the city. If your not scared of a little rain, Bergen might be the next bucketlist item for you travels through Norway. As we say in Norway; There is no such thing as bad weather, just bad clothes!' , 'https://res.cloudinary.com/simpleview/image/upload/v1574085889/clients/norway/bryggen_wharf_bergen_hordaland_fjord_norway_photo_florian_olbrechts_34ad36ea-f7bc-4150-b48b-af2c2c14628f.jpg', 165);
 


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
(10, 'Galleri Nord', 1, 'Sjøgata 7, 9259 Tromsø', 'At Galleri Nord you will find a variety of pictorial art, sculptures, handicrafts and design products from Tromsø and Northern Norway. They sell photographs of Northern Norway taken by award-winning photographers, art cards and gift articles. In addition, the gallery provides ateliers for local artist – you are welcome to visit and watch the artists at work.', 'https://images.citybreakcdn.com/image.aspx?ImageId=6323760&height=560&width=1440&crop=1', 15),
(11, 'The Oslo Operahouse', 2, 'Sjøgata 7, 9259 Tromsø', 'The Norwegian nature is free for everyone to walk in, and The Oslo Opera House, which opened in 2008, was built as an extension to this idea. Usually, you are likely to be arrested if you walk on rooftops. This new building in the very epicentre of the capital of Norway feels like the complete opposite of the usual “Please don’t touch” culture tourists are often met with worldwide. The subtle variations in the structure of the marble-embellished roof is signed by Norwegian artists Kristian Blystad, Kalle Grude and Jorunn Sannes, and is truly a beautiful surface meant to be stepped on. Please keep in mind that under your feet there are three highly differently designed scenes, a myriad of public rooms and halls to explore, and a vibrant workplace for more than 600 opera and ballet professionals. If this sounds like your cup of tea, you should explore the Operahouse of Oslo.', 'https://res.cloudinary.com/simpleview/image/upload/v1634555140/clients/norway/Oslo_operahus_2_447c01a6-7d1c-4cd6-a87a-0c38e552a893.jpg', 15),
(12, 'Akershus Fortress', 2, '0150 Oslo', 'Welcome to Norways national arena and 700 years of Norwegian history. The facility was originally built at the end of the 13th century as a medieval royal castle with a seat for the kings representatives. Today, the fortress serves as Norways national arena. With us you will find Akershus Castle, the Defense Museum and Norways Home Front Museum. You will also find the concert and theater stage Karpedammen stage, as well as cultural institutions and restaurants. Throughout its more than 700-year history, the fortress has survived several sieges, but has never been taken by force by a hostile, foreign army. Today it lies like a pearl in the center of Oslo, surrounded by green oak trees in the summer. As well as being a popular tourist destination and recreation area, the area is still a military fortress under Akershus command.','https://tellusdmsmedia.newmindmedia.com/wsimgs/Akershus-festning_kveld__c_VisitOSLO_Thomas-Johannessen_880943739.jpg[ProductImage]', 10),
(13, 'Viking Times Museum', 2, 'Huk Aveny 35, 0287 Oslo', 'The Viking Times Museum on Bygdøy houses the world’s best-preserved Viking ships and artifacts from Viking tombs around the Oslo fjord. The museum’s displays include ships such as the Oseberg, Gokstad, and Tune, which were used as burial sites for prominent figures from the Viking Age. The museum provides a deep insight into Viking ship construction, voyages, and the historical context of their era, revealing a rich narrative of Viking maritime prowess and daily life. The Viking Ship House is currently closed, and will open its doors after its rebranding, in 2027.', 'https://tellusdmsmedia.newmindmedia.com/wsimgs/Vikingskipshuset_vogn__c_VisitOSLO_Didrick-Stenersen_491360458.jpg[ProductImage][4C167B0DBADE28D2418DEA6C4A1BEA43]', 10),
(14, 'Frognerparken', 2, 'Kirkeveien, 0268 Oslo', 'Frognerparken is not only the largest park in Oslo but also a cultural heritage site, featuring Gustav Vigeland’s famous sculpture installation, Vigelandsparken. The park is a hub for outdoor activities with vast lawns, a large collection of roses, and Norway’s biggest playground. It hosts Frogner Manor and is a beloved space for relaxation, offering sculptures that explore human emotions and experiences, integrated into a beautifully designed landscape.', 'https://www.aktivioslo.no/wp-content/uploads/2011/08/shutterstock_543816478-768x512.jpg', 20),
(15, 'The Fram Museum', 2, 'Bygdøynesveien 39, 0286 Oslo', 'Frammuseet, located on the Bygdøy peninsula, is dedicated to showcasing the historical Norwegian polar expeditions. It features the polar ship Fram, which is renowned for its extensive voyages into the Arctic and Antarctic. The museum is interactive, making it engaging for both children and adults, and includes exhibits on various explorers and expeditions alongside multimedia presentations and historical artifacts.', 'https://www.nyebilder.no/wp-content/uploads/2019/03/Flyfoto-Bygd%C3%B8y-Fram-museet.jpg', 15),
(16, 'Kristiansand Animal Park', 3, 'Dyreparkveien, 4609 Kristiansand', 'Norway’s most frequently visited attraction, Kristiansand Animal Park is a vibrant blend of a zoo and amusement park. Spanning 150 acres, it hosts a myriad of animals and themed areas like Cardamom Town and Captain Sabertooth’s World. It’s an enchanting place for family fun, offering close encounters with both Nordic and exotic animals.', 'https://www.dyreparken.no/content/uploads/2021/06/SC_Felles_013-1920x1230-1.jpg', 20),
(17, 'Kristiansand Cannon Museum', 3, 'Movik Fort, 4520 Kristiansand', 'Home to one of the world’s largest land-based cannons, the Kristiansand Cannon Museum offers a historical glimpse into World War II defenses. The museum features detailed exhibits on the fort’s strategic importance and the daily life of soldiers stationed here.', 'https://assets.simpleviewcms.com/simpleview/image/fetch/c_limit,h_1200,q_75,w_1200/https://media.newmindmedia.com/TellUs/image/%3Ffile%3DKristiansand_Kanonmuseum_-_Foto_Steinar_Furu_3__1091314706.jpg%26dh%3D493%26dw%3D800%26t%3D4', 10),
(18, 'Agder Natural History Museum', 3, 'Gimleveien 23, 4686 Kristiansand', 'This museum and botanical garden offers extensive displays of the natural history of southern Norway. The botanical garden features a variety of plant species both native and from around the world, while the museum houses significant geological and zoological collections.', 'https://assets.simpleviewcms.com/simpleview/image/fetch/c_fill,h_1080,w_1920/f_jpg/q_65/https://media.newmindmedia.com/TellUs/image/%3Ffile%3D0CA4563281ADB452F7E7EAAB97D34C12890EF618.jpg&dh%3D600&dw%3D800&t%3D4', 15),
(19, 'Bergen Aquarium', 4, 'Nordnesbakken 4, 5005 Bergen', 'Bergen Aquarium, located on the Nordnes peninsula, is Norway’s largest aquarium and a prominent Bergen attraction. It showcases over 300 species in more than 60 tanks and three outdoor ponds, featuring diverse marine and tropical fauna, including sea lions, penguins, and crocodiles. Engaging and educational, the aquarium offers daily feedings and film screenings, providing insights into both local and exotic marine ecosystems.', 'https://i.ytimg.com/vi/bj0L9PjX2Cw/maxresdefault.jpg', 15),
(20, 'Edvard Grieg Museum', 4, 'Troldhaugvegen 65, 5232 Bergen', 'Troldhaugen, the home of composer Edvard Grieg, is a museum located in Bergen. This historic site offers a glimpse into the life of Norway’s most famous composer, with his well-preserved villa, composer’s cabin, and gravesite. The museum not only celebrates Grieg’s musical achievements but also his inspirations drawn from the scenic surroundings. Visitors can explore the house, enjoy concerts, and view exhibitions dedicated to his life and work.', 'https://upload.wikimedia.org/wikipedia/commons/6/64/1885_bis_1907_lebte_hier_der_Komponist_Edvard_Grieg._02.jpg', 10);


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
(10, 11),
(11, 2),
(11, 1),
(12, 8),
(12, 9),
(12, 10),
(12, 11),
(13, 1), 
(13, 2), 
(13, 3),
(14, 1), 
(14, 2), 
(14, 3),
(15, 1), 
(15, 2), 
(15, 3),
(16, 1), 
(16, 2), 
(16, 3),
(17, 2), 
(17, 3),
(18, 2), 
(18, 3),
(19, 1), 
(19, 2), 
(19, 3),
(20, 2), 
(20, 3);



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
(2, 10),
(2, 11),
(1, 11),
(1, 12),
(4, 12),
(1, 13), 
(2, 13),
(2, 14), 
(3, 14),
(2, 15), 
(8, 15),
(7, 16),
(1, 17),
(2, 18),
(8, 19),
(2, 20);


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
(17, 10),
(17, 11),
(2, 11),
(3, 11),
(2, 12),
(5, 12),
(17, 12),
(2, 13), 
(5, 13), 
(12, 13), 
(17, 13),
(1, 14), 
(3, 14), 
(8, 14), 
(9, 14), 
(10, 14), 
(17, 14),
(2, 15),
(6, 15),
(8, 15), 
(12, 15), 
(17, 15),
(3, 16),
(10, 16), 
(17, 16),
(2, 17), 
(17, 17),
(14, 18),
(3, 19), 
(6, 19), 
(7, 19), 
(9, 19), 
(17, 19),
(2, 20), 
(5, 20), 
(17, 20);


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
INSERT INTO `user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `role`, `created_at`, `country_id`) VALUES
(1, 'superuser', 'Ford', 'Prefect', 'admin@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 1, '2024-03-05 18:13:57', 235),
(2, 'marina2000', 'Marina', 'Petrova', 'marina2000@example.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 1, '2024-03-05 18:13:57', 233),
(3, 'luca85', 'Luca', 'Rossi', 'luca85@mail.com', 'scrypt:32768:8:1$OxyzQQ8AceRk3Y8u$a83d4a612646d53d895fbd45513cf902c279a3908dedab0839e1b4d9ccc5ceac42a16ac8c0b260aeaf6b15959263b3d926ea30df59ab1b1326dffc9500cf6ba6', 2, '2024-03-06 20:10:12', 108),
(4, 'priya12', 'Priya', 'Patel', 'priya12@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 2, '2024-03-15 15:10:00', 101),
(5, 'johannes92', 'Johannes', 'Karlsen', 'johannes92@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 2, '2024-03-25 17:20:59', 165),
(6, 'annam22', 'Anna', 'Martinez', 'annam22@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 2, '2024-04-01 21:24:51', 209),
(7, 'emre79', 'Emre', 'Yilmaz', 'emre79@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 2, '2024-04-01 19:34:01', 228),
(8, 'pizzaking', 'Christopher', 'Smith', 'christophesmith@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 2, '2024-04-03 18:13:34', 238),
(9, 'tomtom', 'Tom', 'Olsen', 'tomtom@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 2, '2024-04-03 13:12:27', 59),
(10, 'whereismytowel', 'Arthur', 'Dent', 'arthurdent@mail.com', 'scrypt:32768:8:1$bfcAMyr9DEPRSxwK$20d93afdb473b205d458a6106d86a935600a61f9685f8912df601f8b66f11fc376a13d860d876ef0c8a92cb15ddd33daf01cc264da390fe93c03b5969464a96a', 2, '2024-04-04 12:20:50', 235);


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

insert into comment (id, created_at, user_id, comment_text, attraction_id) values (1, '2023-05-11 10:51:15', 10, 'odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (2, '2023-12-04 20:25:30', 2, 'duis mattis', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (3, '2023-05-26 06:49:02', 5, 'dui proin leo odio porttitor id consequat in consequat ut nulla', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (4, '2023-10-26 11:13:10', 3, 'mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (5, '2024-04-03 18:14:52', 10, 'vel dapibus at diam nam tristique tortor eu pede', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (6, '2023-02-14 02:35:28', 10, 'eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (7, '2023-11-21 13:23:43', 6, 'etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (8, '2023-10-10 20:40:57', 6, 'ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (9, '2023-08-02 20:27:22', 8, 'potenti in eleifend quam', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (10, '2024-04-10 17:05:39', 4, 'a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (11, '2023-02-21 07:33:30', 7, 'lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (12, '2023-05-26 04:34:36', 2, 'libero nullam', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (13, '2023-02-04 18:21:51', 10, 'id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (14, '2023-12-17 08:39:44', 9, 'amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (15, '2024-03-31 19:42:18', 10, 'donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (16, '2023-02-27 19:14:06', 4, 'non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (17, '2023-01-11 18:09:17', 5, 'consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (18, '2024-03-12 10:22:18', 9, 'eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (19, '2023-04-20 08:32:27', 4, 'vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (20, '2023-04-07 10:04:23', 10, 'nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (21, '2024-01-22 07:30:29', 6, 'fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (22, '2023-07-27 02:44:51', 1, 'vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (23, '2023-10-10 02:46:03', 1, 'potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (24, '2023-05-14 00:27:26', 7, 'felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (25, '2023-05-21 09:26:13', 9, 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (26, '2024-02-07 00:05:27', 4, 'molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (27, '2023-11-07 05:54:05', 4, 'erat curabitur gravida nisi at nibh in hac', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (28, '2023-06-29 14:44:56', 4, 'duis at velit eu est congue elementum in hac habitasse platea dictumst morbi', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (29, '2023-12-21 03:12:36', 6, 'elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (30, '2023-10-21 17:12:20', 6, 'in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (31, '2023-06-21 11:02:32', 2, 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (32, '2023-11-18 04:38:01', 1, 'fusce consequat nulla nisl nunc nisl', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (33, '2023-03-19 22:06:28', 3, 'quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (34, '2023-09-29 01:40:17', 5, 'libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (35, '2023-05-19 20:24:02', 2, 'non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (36, '2023-09-11 01:09:55', 1, 'rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (37, '2023-09-06 14:03:31', 8, 'maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (38, '2023-05-25 20:50:36', 7, 'nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (39, '2023-10-29 18:42:44', 3, 'cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (40, '2024-02-09 19:07:00', 2, 'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (41, '2023-10-21 11:29:36', 8, 'sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (42, '2023-10-06 16:40:51', 8, 'luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (43, '2023-07-22 23:50:37', 1, 'metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (44, '2023-03-23 00:56:58', 7, 'vestibulum', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (45, '2024-04-02 11:07:45', 9, 'quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (46, '2023-10-11 03:22:29', 3, 'justo aliquam quis turpis eget elit sodales', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (47, '2023-09-10 17:39:21', 5, 'quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (48, '2023-02-24 01:51:07', 4, 'etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (49, '2023-02-03 08:16:33', 3, 'eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (50, '2023-07-30 21:54:07', 7, 'molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (51, '2023-06-12 02:21:37', 5, 'diam nam tristique tortor eu pede', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (52, '2023-07-14 20:20:00', 6, 'sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (53, '2023-03-08 01:22:20', 1, 'viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (54, '2024-04-19 14:30:22', 9, 'justo morbi ut odio cras mi pede malesuada in imperdiet et commodo', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (55, '2024-02-12 15:27:06', 1, 'eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (56, '2023-12-12 13:24:24', 8, 'lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (57, '2023-02-26 17:48:40', 5, 'lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (58, '2023-11-05 01:23:16', 3, 'vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (59, '2023-12-12 08:09:48', 6, 'nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (60, '2023-08-06 10:15:18', 4, 'neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (61, '2024-01-07 00:48:55', 4, 'adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (62, '2023-05-07 14:38:37', 10, 'turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (63, '2023-07-21 01:13:18', 4, 'velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (64, '2023-03-06 12:39:30', 6, 'augue', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (65, '2023-06-14 19:35:33', 2, 'dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (66, '2024-04-11 11:39:08', 3, 'id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (67, '2023-12-24 19:00:36', 4, 'mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (68, '2023-10-21 12:10:20', 10, 'in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (69, '2023-04-27 14:52:38', 4, 'nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (70, '2023-02-03 03:16:21', 4, 'montes nascetur ridiculus mus', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (71, '2024-01-08 04:12:49', 5, 'etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (72, '2023-01-13 05:48:40', 5, 'at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (73, '2023-05-05 01:34:47', 6, 'suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (74, '2023-07-14 12:57:16', 8, 'vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (75, '2024-01-19 19:12:33', 2, 'suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (76, '2023-01-31 08:33:37', 2, 'non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (77, '2024-02-12 01:35:46', 3, 'sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (78, '2024-02-13 08:27:56', 1, 'diam vitae quam suspendisse potenti nullam porttitor lacus at turpis', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (79, '2023-03-24 08:44:53', 8, 'sociis natoque penatibus et magnis dis parturient', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (80, '2024-01-21 12:54:05', 3, 'donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (81, '2023-10-05 19:22:43', 9, 'sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (82, '2024-02-01 01:32:32', 2, 'suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (83, '2023-01-26 14:19:08', 2, 'congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (84, '2024-02-06 07:42:41', 8, 'at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (85, '2024-01-04 17:31:20', 9, 'at diam', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (86, '2023-07-08 11:17:25', 7, 'blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (87, '2023-06-17 17:27:03', 10, 'lorem ipsum dolor sit amet consectetuer adipiscing elit proin risus praesent', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (88, '2024-01-19 08:31:03', 9, 'orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (89, '2023-06-23 15:05:41', 3, 'sapien a libero nam dui proin leo odio porttitor', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (90, '2023-04-22 20:36:48', 2, 'luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (91, '2023-11-30 00:39:32', 1, 'nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (92, '2023-03-23 09:29:22', 3, 'lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (93, '2023-09-29 18:24:49', 10, 'habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (94, '2023-11-17 05:52:09', 7, 'consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (95, '2024-03-09 03:37:14', 10, 'lacus at turpis donec posuere metus vitae ipsum aliquam non', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (96, '2023-04-08 20:57:29', 1, 'ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (97, '2023-01-30 08:21:46', 6, 'leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (98, '2023-09-25 21:12:21', 9, 'imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (99, '2023-06-12 08:02:17', 4, 'vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (100, '2024-02-21 08:55:21', 5, 'duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (101, '2023-03-19 18:02:10', 4, 'blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (102, '2023-10-01 05:19:36', 10, 'id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (103, '2024-02-16 12:50:12', 3, 'natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (104, '2023-06-21 05:38:53', 9, 'cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (105, '2024-04-26 01:40:09', 3, 'nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (106, '2024-01-01 21:24:26', 7, 'parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (107, '2023-07-03 13:29:51', 7, 'dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (108, '2023-05-20 11:53:33', 8, 'risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (109, '2023-01-24 20:51:48', 10, 'mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (110, '2023-11-04 05:43:24', 6, 'amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (111, '2023-02-04 21:01:54', 7, 'odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (112, '2023-08-06 09:57:58', 4, 'vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (113, '2023-09-29 06:15:09', 4, 'viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (114, '2024-03-04 03:10:16', 4, 'in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (115, '2023-05-26 17:12:50', 6, 'et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (116, '2023-02-10 17:31:42', 2, 'mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (117, '2023-02-16 07:13:10', 4, 'tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (118, '2023-06-26 00:04:38', 5, 'donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (119, '2023-10-23 08:41:13', 1, 'nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (120, '2023-09-09 16:52:54', 2, 'rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (121, '2023-06-22 03:07:16', 9, 'sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (122, '2023-05-01 16:26:23', 4, 'luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (123, '2024-02-23 03:32:42', 2, 'montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (124, '2024-02-19 20:46:44', 6, 'nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (125, '2023-05-25 02:33:14', 1, 'aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (126, '2023-07-09 16:31:36', 3, 'habitasse platea dictumst etiam faucibus cursus urna ut', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (127, '2023-06-03 21:00:42', 7, 'id', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (128, '2023-08-13 07:31:13', 9, 'faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (129, '2023-01-08 22:05:45', 5, 'molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (130, '2024-04-13 19:36:29', 3, 'maecenas tincidunt lacus at velit vivamus vel nulla eget eros', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (131, '2023-12-29 22:36:27', 8, 'et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (132, '2023-03-10 04:37:00', 6, 'nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (133, '2024-02-01 11:44:01', 7, 'justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (134, '2023-05-30 07:42:18', 4, 'penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (135, '2023-10-18 17:00:23', 2, 'sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (136, '2023-12-29 22:14:00', 5, 'diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (137, '2023-05-20 21:59:01', 1, 'pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (138, '2023-04-28 12:27:25', 1, 'laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (139, '2023-06-15 19:42:01', 5, 'at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (140, '2023-02-25 22:50:22', 7, 'consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (141, '2024-03-24 09:57:05', 1, 'consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (142, '2023-04-20 10:44:44', 2, 'justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (143, '2023-10-03 23:49:24', 4, 'tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (144, '2023-05-17 12:45:20', 6, 'neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (145, '2023-05-27 21:23:02', 7, 'posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (146, '2023-09-01 02:07:00', 9, 'consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (147, '2024-01-20 19:29:37', 3, 'rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (148, '2023-08-31 06:49:01', 8, 'elementum in hac habitasse platea dictumst morbi vestibulum velit id', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (149, '2023-09-15 12:23:58', 4, 'auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (150, '2023-11-09 18:05:58', 7, 'a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (151, '2023-02-23 06:17:45', 2, 'ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (152, '2023-09-21 20:16:19', 10, 'quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (153, '2023-07-21 11:57:02', 10, 'nec sem duis aliquam convallis', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (154, '2023-01-23 13:21:25', 5, 'donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (155, '2023-07-29 00:46:42', 4, 'maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (156, '2023-04-09 08:55:51', 3, 'vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (157, '2024-03-24 20:42:30', 2, 'nec nisi vulputate nonummy maecenas tincidunt lacus', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (158, '2023-11-24 10:12:47', 8, 'nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (159, '2023-02-01 03:15:09', 7, 'fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (160, '2023-03-28 09:48:59', 7, 'vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (161, '2023-06-15 10:21:27', 6, 'eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (162, '2023-08-28 02:56:14', 4, 'cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (163, '2023-01-18 08:50:25', 7, 'commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (164, '2023-07-12 10:50:57', 3, 'cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (165, '2023-07-10 22:14:44', 8, 'commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (166, '2023-01-06 15:37:03', 4, 'suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (167, '2023-02-13 10:04:36', 1, 'phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (168, '2024-02-03 02:07:23', 4, 'diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (169, '2024-04-01 11:17:53', 9, 'donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (170, '2023-06-16 07:44:45', 7, 'cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (171, '2023-11-29 19:46:09', 10, 'suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (172, '2024-01-04 23:09:34', 6, 'nulla justo aliquam quis turpis eget elit sodales', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (173, '2023-12-22 11:16:54', 7, 'amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (174, '2024-01-29 19:34:00', 2, 'sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (175, '2023-02-08 00:24:00', 10, 'nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (176, '2023-10-02 17:13:40', 7, 'a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (177, '2024-02-28 01:30:35', 4, 'mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (178, '2024-01-30 02:42:06', 7, 'venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (179, '2023-04-09 08:15:12', 10, 'pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (180, '2023-06-12 05:54:49', 9, 'lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (181, '2023-06-12 03:50:18', 3, 'a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (182, '2023-09-10 14:16:41', 6, 'sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (183, '2023-06-23 08:03:12', 5, 'vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (184, '2024-01-04 02:02:27', 8, 'faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (185, '2024-02-25 05:46:10', 3, 'eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (186, '2023-07-22 10:34:46', 4, 'amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (187, '2023-05-05 01:26:56', 8, 'nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (188, '2023-12-06 00:31:39', 8, 'vel lectus in quam fringilla rhoncus mauris enim leo rhoncus', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (189, '2023-12-10 15:29:22', 4, 'tortor sollicitudin mi sit amet lobortis sapien', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (190, '2023-05-30 08:18:30', 7, 'id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (191, '2024-01-31 20:18:11', 4, 'nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (192, '2023-11-29 20:08:19', 1, 'libero quis orci nullam molestie', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (193, '2023-02-23 00:10:04', 9, 'morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (194, '2023-07-25 03:42:32', 3, 'at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (195, '2023-12-11 02:09:27', 9, 'lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (196, '2024-04-12 16:46:26', 9, 'nulla dapibus dolor vel', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (197, '2024-03-12 03:28:30', 7, 'erat tortor sollicitudin mi', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (198, '2024-01-29 03:34:37', 10, 'id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (199, '2024-02-24 22:30:40', 5, 'massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (200, '2023-11-12 01:00:11', 6, 'nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (201, '2023-04-17 04:55:07', 1, 'nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (202, '2023-07-20 00:50:22', 2, 'donec semper sapien a', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (203, '2023-12-05 17:01:47', 5, 'vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (204, '2023-07-08 04:16:04', 6, 'tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (205, '2023-03-17 17:06:30', 7, 'est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (206, '2024-01-25 16:14:41', 9, 'odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (207, '2024-01-26 03:53:16', 8, 'nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (208, '2023-01-26 13:10:45', 4, 'nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (209, '2024-03-31 07:49:23', 10, 'congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (210, '2023-07-24 17:57:51', 5, 'natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (211, '2023-06-13 10:10:16', 7, 'ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (212, '2024-03-25 10:29:43', 3, 'tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (213, '2023-06-12 06:06:28', 6, 'quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (214, '2023-05-08 03:25:05', 1, 'interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (215, '2023-12-23 13:07:02', 5, 'donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (216, '2023-11-30 01:02:41', 6, 'morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (217, '2023-12-22 07:06:08', 1, 'parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (218, '2023-12-18 20:47:15', 8, 'pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (219, '2024-03-11 22:52:36', 10, 'quam suspendisse potenti nullam porttitor lacus at turpis donec', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (220, '2024-01-30 02:06:15', 8, 'posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (221, '2023-07-19 23:08:28', 4, 'ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (222, '2023-12-30 19:48:20', 6, 'justo sit amet', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (223, '2024-03-17 10:59:13', 7, 'consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (224, '2023-12-27 14:09:01', 9, 'dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (225, '2024-03-23 11:46:45', 4, 'eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (226, '2024-01-28 09:15:23', 9, 'vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (227, '2023-03-27 18:09:37', 9, 'tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (228, '2023-12-19 12:19:31', 1, 'euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (229, '2024-04-07 04:19:50', 10, 'sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (230, '2023-06-24 07:26:08', 5, 'risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (231, '2023-05-07 15:21:57', 1, 'vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (232, '2023-10-18 10:37:50', 10, 'vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (233, '2024-04-25 11:49:03', 7, 'morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (234, '2024-02-19 07:58:20', 7, 'nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (235, '2024-03-06 20:01:38', 7, 'nulla ut erat id mauris vulputate elementum nullam varius', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (236, '2024-03-24 09:58:49', 3, 'enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (237, '2023-04-17 00:12:42', 7, 'et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (238, '2024-04-24 17:29:39', 6, 'nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (239, '2023-08-21 08:17:40', 1, 'et magnis dis parturient montes nascetur ridiculus mus', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (240, '2023-06-25 11:48:09', 7, 'ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (241, '2023-07-29 07:10:01', 3, 'et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (242, '2024-01-31 02:49:27', 2, 'est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (243, '2023-01-05 02:50:59', 3, 'praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (244, '2023-05-20 14:30:45', 4, 'at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (245, '2023-04-20 13:29:11', 10, 'vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (246, '2023-11-18 13:19:16', 6, 'integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (247, '2023-02-11 15:36:37', 7, 'tempor', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (248, '2023-04-21 05:55:07', 1, 'ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (249, '2023-01-31 18:12:23', 8, 'mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (250, '2024-01-23 03:23:31', 3, 'maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (251, '2023-08-17 09:01:05', 10, 'ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (252, '2023-11-18 18:43:20', 10, 'id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (253, '2024-02-16 22:13:25', 1, 'nunc', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (254, '2023-08-05 22:33:51', 2, 'in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (255, '2023-10-09 13:31:15', 8, 'praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (256, '2023-06-30 16:06:48', 5, 'fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (257, '2023-03-22 17:42:22', 8, 'nullam orci pede', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (258, '2023-01-25 12:09:39', 6, 'vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (259, '2023-05-17 09:43:45', 3, 'porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (260, '2023-12-12 23:06:23', 5, 'ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (261, '2023-01-15 18:56:02', 1, 'nam nulla integer pede justo lacinia eget tincidunt', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (262, '2024-01-04 18:56:14', 6, 'turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (263, '2023-11-24 14:50:02', 5, 'ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (264, '2023-03-30 05:40:43', 4, 'donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (265, '2023-11-14 01:37:23', 5, 'pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (266, '2023-05-08 09:08:34', 8, 'vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (267, '2023-03-16 16:59:57', 8, 'elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (268, '2023-05-01 23:30:38', 10, 'mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (269, '2024-01-17 15:36:07', 8, 'duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (270, '2023-01-27 22:20:38', 5, 'id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (271, '2024-01-10 04:03:21', 5, 'mauris lacinia sapien quis libero nullam sit amet', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (272, '2024-02-01 12:07:40', 10, 'porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (273, '2023-02-07 15:39:40', 1, 'ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (274, '2023-06-03 06:15:00', 5, 'ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam tristique', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (275, '2023-04-21 01:34:55', 8, 'volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (276, '2023-07-20 00:42:45', 8, 'pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (277, '2023-12-17 11:56:34', 1, 'vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (278, '2023-04-19 10:37:02', 6, 'at velit', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (279, '2023-10-13 03:05:37', 6, 'nunc vestibulum ante ipsum primis', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (280, '2024-03-28 01:59:57', 9, 'proin eu mi nulla', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (281, '2024-01-13 05:01:49', 9, 'eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (282, '2023-05-29 01:25:58', 1, 'turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (283, '2023-12-23 14:24:51', 2, 'id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (284, '2023-01-30 16:22:47', 4, 'non quam nec dui', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (285, '2024-04-16 20:59:25', 6, 'habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (286, '2023-04-19 14:53:38', 3, 'eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (287, '2024-01-02 04:56:20', 5, 'cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (288, '2023-02-06 18:11:38', 4, 'est quam pharetra magna ac consequat metus sapien', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (289, '2023-07-29 02:15:40', 3, 'tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (290, '2023-04-19 06:50:34', 8, 'cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (291, '2023-05-16 10:35:12', 3, 'venenatis tristique fusce congue', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (292, '2023-07-14 22:20:11', 4, 'fusce consequat nulla nisl nunc nisl', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (293, '2024-03-26 15:42:47', 8, 'sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (294, '2023-11-02 02:56:12', 1, 'dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (295, '2024-03-03 23:03:58', 3, 'amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (296, '2023-04-12 21:45:08', 2, 'neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (297, '2023-11-22 21:02:48', 1, 'interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (298, '2023-08-24 00:31:51', 10, 'placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (299, '2024-01-19 17:59:12', 5, 'habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (300, '2024-04-22 07:30:49', 8, 'ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (301, '2023-12-10 06:14:42', 4, 'ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (302, '2023-07-26 03:45:03', 9, 'convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (303, '2023-12-29 06:00:41', 5, 'nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (304, '2023-12-19 19:45:50', 9, 'etiam faucibus cursus', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (305, '2024-01-07 10:44:50', 2, 'curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (306, '2023-12-24 20:36:57', 4, 'hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (307, '2023-05-07 05:55:25', 10, 'ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (308, '2023-08-10 01:05:46', 6, 'primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (309, '2023-09-24 16:31:51', 3, 'justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (310, '2023-03-04 03:20:25', 6, 'justo sollicitudin ut suscipit a feugiat et eros vestibulum ac', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (311, '2023-02-04 05:03:11', 8, 'morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (312, '2024-03-09 09:37:35', 7, 'natoque penatibus et magnis dis parturient montes nascetur ridiculus', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (313, '2023-11-22 01:24:17', 1, 'duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (314, '2023-01-01 21:50:06', 5, 'auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (315, '2024-02-11 06:32:10', 6, 'vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (316, '2024-02-25 00:10:33', 3, 'nulla justo aliquam quis turpis eget elit sodales scelerisque mauris', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (317, '2023-03-23 22:04:36', 3, 'erat nulla tempus vivamus in felis eu sapien', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (318, '2024-04-02 21:53:41', 2, 'at velit vivamus vel nulla eget eros', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (319, '2023-05-03 08:10:16', 2, 'sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (320, '2024-03-18 22:26:34', 7, 'mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (321, '2023-01-14 11:33:48', 2, 'vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (322, '2023-06-26 12:05:23', 3, 'dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (323, '2023-12-16 13:26:57', 9, 'pretium nisl ut', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (324, '2024-04-18 04:04:44', 3, 'in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (325, '2023-07-26 03:43:39', 2, 'suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (326, '2024-01-18 12:57:43', 10, 'tempus semper est quam pharetra magna ac consequat metus sapien', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (327, '2024-04-01 17:35:44', 1, 'volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (328, '2023-07-20 09:06:30', 9, 'sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (329, '2023-09-02 23:44:54', 6, 'donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (330, '2023-10-26 07:44:10', 3, 'nunc nisl duis bibendum felis sed interdum venenatis turpis', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (331, '2023-08-30 06:03:02', 4, 'in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (332, '2023-04-28 19:56:44', 2, 'condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (333, '2023-10-03 14:47:30', 10, 'rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (334, '2023-10-05 04:35:39', 9, 'dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (335, '2023-06-28 16:20:14', 8, 'nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (336, '2024-04-09 01:05:00', 5, 'platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (337, '2023-12-09 18:09:15', 8, 'aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (338, '2023-06-17 20:26:26', 5, 'dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (339, '2023-06-23 15:42:29', 2, 'sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (340, '2023-08-06 03:47:56', 2, 'fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (341, '2023-04-06 10:49:20', 9, 'praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (342, '2023-08-07 22:57:23', 5, 'dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (343, '2023-04-04 15:39:54', 4, 'egestas metus aenean fermentum donec ut mauris eget', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (344, '2023-01-06 08:35:35', 2, 'felis donec semper sapien a libero nam dui proin leo odio', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (345, '2024-04-12 16:49:33', 2, 'vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (346, '2023-09-16 19:26:08', 4, 'scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (347, '2023-01-02 01:02:03', 10, 'accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (348, '2023-06-03 13:21:52', 10, 'aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (349, '2023-08-23 13:00:44', 9, 'penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (350, '2024-03-17 00:26:12', 5, 'vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (351, '2023-03-22 03:12:05', 1, 'iaculis justo in hac habitasse platea dictumst etiam faucibus', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (352, '2023-04-25 04:26:37', 6, 'augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (353, '2023-08-21 17:57:32', 3, 'nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (354, '2023-06-01 08:07:36', 5, 'dolor sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (355, '2023-08-28 12:23:36', 4, 'eget vulputate ut ultrices vel augue vestibulum', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (356, '2023-03-23 14:40:04', 4, 'orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (357, '2023-12-08 03:53:57', 10, 'eget vulputate ut ultrices vel', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (358, '2024-03-25 08:53:22', 5, 'vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (359, '2023-07-19 18:43:24', 2, 'posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (360, '2023-08-05 18:29:55', 1, 'molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (361, '2023-11-02 13:24:41', 1, 'luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (362, '2023-10-18 07:16:21', 4, 'sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (363, '2023-05-30 05:03:28', 4, 'diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (364, '2024-01-13 20:23:34', 1, 'nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (365, '2023-06-28 06:43:22', 6, 'neque aenean auctor gravida sem praesent id massa id nisl venenatis', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (366, '2023-06-18 10:20:54', 7, 'proin eu mi nulla ac enim in tempor turpis', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (367, '2024-04-03 12:24:55', 3, 'at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (368, '2024-04-24 07:00:54', 4, 'odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (369, '2023-11-29 22:07:07', 1, 'in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (370, '2024-02-04 03:52:11', 6, 'augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (371, '2024-03-10 08:19:00', 3, 'in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (372, '2024-01-29 03:43:07', 8, 'erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (373, '2023-06-30 22:26:08', 9, 'penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (374, '2024-02-18 18:10:03', 9, 'dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (375, '2023-08-25 10:56:31', 4, 'consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (376, '2023-07-05 16:40:51', 3, 'lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (377, '2023-08-29 13:55:24', 7, 'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (378, '2023-02-18 19:46:46', 5, 'eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (379, '2024-03-21 18:04:53', 7, 'massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (380, '2023-12-29 15:05:32', 4, 'nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (381, '2023-03-03 17:10:25', 6, 'in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (382, '2023-05-31 08:48:46', 3, 'ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (383, '2023-07-19 07:52:09', 7, 'id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (384, '2023-05-23 16:36:39', 7, 'sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (385, '2023-07-04 08:24:17', 3, 'ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (386, '2023-09-04 09:12:15', 6, 'tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (387, '2023-04-22 14:09:27', 6, 'sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (388, '2023-09-13 05:38:08', 10, 'in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (389, '2023-04-08 15:10:52', 3, 'ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (390, '2023-06-24 11:56:50', 5, 'id mauris vulputate elementum nullam varius nulla facilisi cras non', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (391, '2023-04-09 05:37:16', 10, 'massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (392, '2023-05-19 17:31:21', 7, 'semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (393, '2023-03-22 15:22:02', 7, 'posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (394, '2023-06-25 10:50:59', 4, 'pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (395, '2023-11-28 10:47:50', 10, 'diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (396, '2024-04-15 03:13:26', 7, 'et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (397, '2023-08-24 01:36:07', 3, 'mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (398, '2023-12-03 01:49:53', 2, 'nullam porttitor lacus at turpis donec', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (399, '2023-06-03 00:52:42', 2, 'a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (400, '2023-06-17 17:57:27', 10, 'imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (401, '2023-07-23 11:03:40', 3, 'lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (402, '2023-02-24 17:43:06', 5, 'sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (403, '2024-01-15 02:49:54', 8, 'donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (404, '2024-04-24 14:46:36', 1, 'vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (405, '2023-05-17 05:10:38', 5, 'elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (406, '2024-04-02 05:36:20', 1, 'at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (407, '2024-03-01 01:17:26', 1, 'dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (408, '2023-09-25 08:10:53', 5, 'eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (409, '2023-01-02 04:17:51', 8, 'in', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (410, '2024-01-04 10:29:24', 9, 'ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (411, '2023-12-26 04:13:16', 10, 'justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (412, '2023-09-13 18:49:41', 2, 'morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (413, '2023-05-03 00:50:50', 8, 'vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (414, '2024-01-02 03:27:20', 7, 'donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (415, '2023-09-25 02:40:43', 2, 'in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (416, '2023-10-28 07:31:16', 3, 'posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (417, '2023-11-12 00:35:48', 7, 'ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (418, '2023-01-31 08:00:31', 4, 'metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (419, '2023-05-31 20:07:31', 6, 'lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (420, '2023-07-04 07:29:23', 9, 'ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (421, '2024-02-07 01:36:29', 6, 'eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (422, '2023-08-17 00:24:24', 8, 'pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (423, '2023-05-17 08:01:09', 3, 'pellentesque volutpat dui maecenas tristique est et tempus', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (424, '2023-10-19 22:59:29', 4, 'pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (425, '2023-10-12 05:09:48', 6, 'venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (426, '2023-11-01 14:27:44', 7, 'lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (427, '2024-01-18 11:56:35', 7, 'convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (428, '2023-06-11 05:42:38', 4, 'rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (429, '2023-03-27 07:54:43', 9, 'odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (430, '2023-02-06 19:55:49', 6, 'luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (431, '2023-05-25 03:02:12', 8, 'dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (432, '2023-02-24 18:52:50', 6, 'proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (433, '2024-01-30 22:36:40', 7, 'id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (434, '2023-12-07 02:19:51', 8, 'morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (435, '2023-10-24 01:47:06', 5, 'donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (436, '2023-06-05 17:08:24', 2, 'quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (437, '2023-06-14 00:28:18', 8, 'scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (438, '2023-03-14 14:40:46', 3, 'sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (439, '2023-09-18 15:45:13', 6, 'quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (440, '2023-03-06 12:34:52', 3, 'massa', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (441, '2023-05-25 10:11:24', 6, 'sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (442, '2024-03-20 19:50:47', 8, 'consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (443, '2023-08-28 10:47:27', 8, 'est phasellus sit amet erat nulla tempus vivamus in felis eu', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (444, '2023-07-20 13:01:52', 10, 'faucibus accumsan odio curabitur convallis', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (445, '2024-02-23 05:07:37', 5, 'habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (446, '2023-02-20 16:37:45', 9, 'justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (447, '2023-08-16 02:13:21', 7, 'faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (448, '2023-06-25 23:03:12', 10, 'sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (449, '2023-06-28 04:32:19', 6, 'est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (450, '2023-11-18 06:34:49', 9, 'leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (451, '2024-01-06 23:04:54', 3, 'ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (452, '2023-05-03 12:55:28', 2, 'aliquet ultrices erat tortor sollicitudin mi sit amet', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (453, '2023-02-08 15:16:18', 1, 'donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (454, '2023-08-01 19:08:33', 6, 'venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (455, '2024-03-18 01:39:34', 1, 'massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (456, '2023-05-11 08:42:39', 3, 'sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (457, '2023-03-25 20:02:55', 5, 'ligula in lacus curabitur at ipsum ac tellus semper', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (458, '2024-02-12 02:00:17', 5, 'at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (459, '2023-10-26 01:26:24', 2, 'quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (460, '2023-10-29 21:33:59', 7, 'felis sed interdum venenatis turpis enim blandit mi in porttitor pede', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (461, '2024-02-01 22:33:58', 8, 'quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis', 10);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (462, '2023-11-03 04:23:42', 3, 'aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (463, '2023-01-07 23:47:21', 6, 'eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (464, '2023-02-16 19:45:50', 4, 'aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (465, '2024-01-11 19:25:37', 1, 'amet sem fusce consequat nulla', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (466, '2024-01-24 06:59:46', 8, 'amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (467, '2023-12-06 17:11:47', 9, 'est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (468, '2023-10-28 14:51:58', 9, 'quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (469, '2023-08-24 12:53:41', 1, 'risus semper', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (470, '2023-02-26 21:03:29', 7, 'etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (471, '2023-09-11 06:52:30', 1, 'turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (472, '2023-07-08 07:28:42', 3, 'luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (473, '2023-04-17 02:55:24', 5, 'cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget', 8);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (474, '2024-02-24 03:47:08', 8, 'feugiat et eros vestibulum ac est lacinia nisi', 7);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (475, '2023-04-17 03:33:33', 8, 'leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (476, '2024-03-27 06:35:31', 9, 'enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (477, '2023-09-18 00:26:59', 4, 'quam nec dui luctus rutrum nulla', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (478, '2023-02-14 05:48:05', 7, 'congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (479, '2023-12-30 19:25:06', 2, 'tellus nisi eu orci', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (480, '2024-02-17 12:04:45', 9, 'nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (481, '2024-04-13 04:50:41', 10, 'fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis', 2);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (482, '2023-06-14 05:57:09', 4, 'a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (483, '2023-02-23 07:32:23', 7, 'amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (484, '2023-07-01 18:13:36', 4, 'amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (485, '2023-02-03 18:12:36', 8, 'orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (486, '2023-09-24 15:01:39', 6, 'rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique', 3);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (487, '2023-09-22 16:03:05', 6, 'ultrices', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (488, '2023-10-06 03:28:35', 5, 'sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (489, '2024-02-26 18:10:17', 7, 'viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (490, '2023-09-30 09:44:19', 8, 'quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (491, '2023-03-03 05:18:07', 2, 'diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (492, '2023-09-06 05:06:16', 9, 'tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (493, '2023-07-07 23:37:36', 9, 'pellentesque at nulla suspendisse potenti cras in purus eu', 1);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (494, '2023-07-21 08:52:18', 1, 'elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (495, '2023-05-11 13:49:36', 10, 'pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (496, '2023-12-22 22:42:01', 7, 'luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in', 6);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (497, '2023-05-19 21:05:06', 5, 'donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer', 4);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (498, '2023-04-17 10:29:22', 6, 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium', 9);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (499, '2024-03-05 19:30:07', 4, 'ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer', 5);
insert into comment (id, created_at, user_id, comment_text, attraction_id) values (500, '2023-09-08 00:45:30', 1, 'sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis', 6);
