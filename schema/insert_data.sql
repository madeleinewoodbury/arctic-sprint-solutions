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
(1, 'Tromsø', 'Tromsø, a vibrant city surrounded by majestic mountains and the Arctic landscape, is known as the \'Gateway to the Arctic Sea.\' The city offers a unique blend of culture, history, and nature, with attractions such as the Arctic Cathedral, Polaria, and opportunities for Northern Lights safaris and outdoor activities', 'https://images.unsplash.com/photo-1609538205185-40f2701cf7d6?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 165);


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