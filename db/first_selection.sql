-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 10 déc. 2025 à 13:27
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
-- Structure de la table `first_selection`
--

DROP TABLE IF EXISTS `first_selection`;
CREATE TABLE IF NOT EXISTS `first_selection` (
  `first_selection_id` int NOT NULL AUTO_INCREMENT,
  `fk_book_id` int NOT NULL,
  PRIMARY KEY (`first_selection_id`),
  KEY `fk_book_id` (`fk_book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `first_selection`
--

INSERT INTO `first_selection` (`first_selection_id`, `fk_book_id`) VALUES
(181, 1),
(182, 2),
(183, 3),
(184, 4),
(185, 5),
(186, 6),
(187, 7),
(188, 8),
(189, 9),
(190, 10),
(191, 11),
(192, 12),
(193, 13),
(194, 14),
(195, 15);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `first_selection`
--
ALTER TABLE `first_selection`
  ADD CONSTRAINT `fk_book_id` FOREIGN KEY (`fk_book_id`) REFERENCES `books` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
