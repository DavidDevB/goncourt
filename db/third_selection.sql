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
-- Structure de la table `third_selection`
--

DROP TABLE IF EXISTS `third_selection`;
CREATE TABLE IF NOT EXISTS `third_selection` (
  `third_selection_id` int NOT NULL AUTO_INCREMENT,
  `fk_book_id` int NOT NULL,
  PRIMARY KEY (`third_selection_id`),
  KEY `fk_book_id_3` (`fk_book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `third_selection`
--

INSERT INTO `third_selection` (`third_selection_id`, `fk_book_id`) VALUES
(9, 1),
(13, 1),
(10, 2),
(14, 2),
(11, 3),
(15, 3),
(12, 4),
(16, 4);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `third_selection`
--
ALTER TABLE `third_selection`
  ADD CONSTRAINT `fk_book_id_3` FOREIGN KEY (`fk_book_id`) REFERENCES `books` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
