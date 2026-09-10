-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 10, 2026 at 01:19 PM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pinboard_mariam_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20260910074315', '2026-09-10 07:49:53', 13),
('DoctrineMigrations\\Version20260910075701', '2026-09-10 07:59:24', 17),
('DoctrineMigrations\\Version20260910082252', '2026-09-10 08:25:30', 64),
('DoctrineMigrations\\Version20260910100646', '2026-09-10 10:08:14', 43),
('DoctrineMigrations\\Version20260910120726', '2026-09-10 12:08:44', 43);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0E3BD61CE16BA31DBBF396750` (`queue_name`,`available_at`,`delivered_at`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `messenger_messages`
--

INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(1, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:161:\\\"https://127.0.0.1:8000/verify/email?expires=1789039670&signature=wvP7hrcTP4aA9n8uJiSQZsTQNIszaxMSNesD_CNsHTc&token=9EZLTYr4MfeMDXNwThxPpHeXnR8lx9TA1IRbCaXtV5c%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:19:\\\"noreply@pinboard.be\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:8:\\\"Pinboard\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:14:\\\"mary@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2026-09-10 10:27:50', '2026-09-10 10:27:50', NULL),
(2, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:165:\\\"https://127.0.0.1:8000/verify/email?expires=1789048839&signature=NFMmCPGt8R4yqKTHx31wvVVWfTq_AeQB-_J0ICfS0g8&token=0w96fpwzHetyGe9Q5dpSLHY9o8xjEYsir%2FIAA%2BCKzOQ%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:19:\\\"noreply@pinboard.be\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:8:\\\"Pinboard\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:12:\\\"ciao@ciao.be\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2026-09-10 13:00:39', '2026-09-10 13:00:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pins`
--

DROP TABLE IF EXISTS `pins`;
CREATE TABLE IF NOT EXISTS `pins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` longtext,
  `image_name` varchar(500) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3F0FE980A76ED395` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pins`
--

INSERT INTO `pins` (`id`, `title`, `description`, `image_name`, `created_at`, `updated_at`, `user_id`) VALUES
(2, 'Sunset over the mountains', 'A beautiful sunset captured in the Alps.', 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=600', '2026-09-10 11:59:19', '2026-09-10 11:59:19', 2),
(3, 'Minimalist workspace', 'A clean and simple desk setup.', 'https://images.unsplash.com/photo-1497215728101-856f4ea42174?w=600', '2026-09-10 11:59:19', '2026-09-10 11:59:19', 3),
(4, 'Fresh pasta recipe', 'Homemade pasta with tomato sauce.', 'https://images.unsplash.com/photo-1551183053-bf91a1d81141?w=600', '2026-09-10 11:59:19', '2026-09-10 11:59:19', 4),
(5, 'Cozy reading corner', 'A warm spot to enjoy a good book.', 'https://images.unsplash.com/photo-1521587760476-6c12a4b040da?w=600', '2026-09-10 11:59:19', '2026-09-10 11:59:19', 2),
(6, 'City skyline at night', 'Lights of the city after dark.', 'https://images.unsplash.com/photo-1480714378408-67cf0d13bc1b?w=600', '2026-09-10 11:59:19', '2026-09-10 11:59:19', 3),
(7, 'Autumn forest path', 'Walking through fallen leaves.', 'https://images.unsplash.com/photo-1476820865390-c52aeebb9891?w=600', '2026-09-10 11:59:19', '2026-09-10 11:59:19', 4),
(8, 'Modern living room', 'Interior design inspiration.', 'https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=600', '2026-09-10 11:59:19', '2026-09-10 11:59:19', 2),
(9, 'Beach vacation vibes', 'Crystal clear water and white sand.', 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=600', '2026-09-10 11:59:19', '2026-09-10 11:59:19', 3),
(10, 'DIY plant shelf', 'A simple project for plant lovers.', 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=600', '2026-09-10 11:59:19', '2026-09-10 11:59:19', 4),
(11, 'Street style outfit', 'Casual fashion inspiration.', 'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=600', '2026-09-10 11:59:19', '2026-09-10 11:59:19', 2),
(12, 'Homemade latte art', 'Practicing coffee art at home.', 'https://images.unsplash.com/photo-1541167760496-1628856ab772?w=600', '2026-09-10 11:59:19', '2026-09-10 11:59:19', 3),
(13, 'Hiking trail views', 'The reward after a long climb.', 'https://images.unsplash.com/photo-1551632811-561732d1e306?w=600', '2026-09-10 11:59:19', '2026-09-10 11:59:19', 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `image_name` varchar(500) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_verified` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`, `image_name`, `created_at`, `updated_at`, `is_verified`) VALUES
(1, 'mary@pinboard.be', '[\"ROLE_ADMIN\"]', '$2y$13$uymux5hcqES1AIjng6t2Ne7ltdVw0WK8lZwNoThObC3CAVcU1LTd.', 'Mariam', 'Omri', 'https://img.magnific.com/premium-vector/silver-membership-icon-default-avatar-profile-icon-membership-icon-social-media-user-image-vector-illustration_561158-4215.jpg?semt=ais_hybrid&w=740&q=80/200x200', '2026-09-10 10:27:49', '2026-09-10 10:27:49', 1),
(2, 'alice@pinboard.be', '[]', '$2y$13$3AwE7be2rtSPnF9An8.aCeyJ75OkI40zcaGtDb7QVflQ97oaNwtSe', 'Alice', 'Martin', 'https://img.magnific.com/premium-vector/silver-membership-icon-default-avatar-profile-icon-membership-icon-social-media-user-image-vector-illustration_561158-4215.jpg?semt=ais_hybrid&w=740&q=80/200x200', '2026-09-10 11:59:17', '2026-09-10 11:59:17', 1),
(3, 'bruno@pinboard.be', '[]', '$2y$13$q5VbAz0XEinpHS1x3ToTJ.TFJ9zPjldCXkLW/pZl1ClYyeVDRR8OO', 'Bruno', 'Dupont', 'https://img.magnific.com/premium-vector/silver-membership-icon-default-avatar-profile-icon-membership-icon-social-media-user-image-vector-illustration_561158-4215.jpg?semt=ais_hybrid&w=740&q=80/200x200', '2026-09-10 11:59:18', '2026-09-10 11:59:18', 1),
(4, 'clara@pinboard.be', '[]', '$2y$13$by7XZ2.KxCzDfwZcV4pZeuyUdCo53tMExtbb9wg4G9hoXBOSB1flS', 'Clara', 'Lefevre', 'https://img.magnific.com/premium-vector/silver-membership-icon-default-avatar-profile-icon-membership-icon-social-media-user-image-vector-illustration_561158-4215.jpg?semt=ais_hybrid&w=740&q=80/200x200', '2026-09-10 11:59:18', '2026-09-10 11:59:18', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
