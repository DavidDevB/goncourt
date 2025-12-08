-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 08 déc. 2025 à 10:50
-- Version du serveur : 8.4.7
-- Version de PHP : 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `goncourt`
--

-- --------------------------------------------------------

--
-- Structure de la table `juries`
--

DROP TABLE IF EXISTS `juries`;
CREATE TABLE IF NOT EXISTS `juries` (
  `jury_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`jury_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `juries`
--

INSERT INTO `juries` (`jury_id`, `first_name`, `last_name`) VALUES
(1, 'Didier', 'Decoin'),
(2, 'Françoise', 'Chandernagor'),
(3, 'Tahar', 'Ben Jelloun'),
(4, 'Paule', 'Constant'),
(5, 'Philippe', 'Claudel'),
(6, 'Pierre', 'Assouline'),
(7, 'Eric-Emmanuel', 'Schmitt'),
(8, 'Camille', 'Laurens'),
(9, 'Pascal', 'Bruckner');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
