-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 10 déc. 2025 à 13:28
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
-- Structure de la table `second_selection`
--

DROP TABLE IF EXISTS `second_selection`;
CREATE TABLE IF NOT EXISTS `second_selection` (
  `second_selection_id` int NOT NULL AUTO_INCREMENT,
  `fk_book_id` int NOT NULL,
  PRIMARY KEY (`second_selection_id`),
  KEY `fk_book_id_2` (`fk_book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `second_selection`
--

INSERT INTO `second_selection` (`second_selection_id`, `fk_book_id`) VALUES
(49, 1),
(57, 1),
(50, 2),
(58, 2),
(51, 3),
(59, 3),
(52, 4),
(60, 4),
(53, 5),
(61, 5),
(54, 6),
(62, 6),
(55, 7),
(63, 7),
(56, 8),
(64, 8);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `second_selection`
--
ALTER TABLE `second_selection`
  ADD CONSTRAINT `fk_book_id_2` FOREIGN KEY (`fk_book_id`) REFERENCES `books` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
