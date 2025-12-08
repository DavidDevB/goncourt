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
-- Structure de la table `editors`
--

DROP TABLE IF EXISTS `editors`;
CREATE TABLE IF NOT EXISTS `editors` (
  `editor_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`editor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `editors`
--

INSERT INTO `editors` (`editor_id`, `name`) VALUES
(1, 'Gallimard'),
(2, 'P.O.L'),
(3, 'Le Seuil'),
(4, 'Les Editions de Minuit'),
(5, 'Sabine Wespieser'),
(6, 'Stock'),
(7, 'Robert Laffont'),
(8, 'Marchialy'),
(9, 'Julliard'),
(10, 'Albin Michel'),
(11, 'Verdier'),
(12, 'Verticales'),
(13, 'L\'Olivier');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
