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
-- Structure de la table `authors`
--

DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `biography` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `authors`
--

INSERT INTO `authors` (`author_id`, `first_name`, `last_name`, `biography`) VALUES
(1, 'Nathacha', 'Appanah', 'La journaliste et écrivaine Nathacha Appanah, née en mai 1973 à Mahébourg, est la fille d\'un père ingénieur et d\'une mère institutrice. Elle a un frère cadet. Elle a le créole mauricien comme langue maternelle, Nathacha Devi Pathareddy Appanah, dont la famille descend d\'engagés indiens immigrés à Maurice de langue telougou, écrit en français.'),
(2, 'Emmanuel', 'Carrère', 'Emmanuel Carrère est le fils de l\'assureur Louis Carrère (1928-2023) et de la femme politique, historienne et académicienne Hélène Carrère dite Hélène Carrère d\'Encausse (1929-2023). Il est le frère de Nathalie Carrère et de Marina Carrère dite Marina Carrère d\'Encausse, et le cousin du philosophe François Zourabichvili. Son grand-père maternel est un immigré géorgien.'),
(3, 'David', 'Deneufgermain', 'David Deneufgermain est psychiatre et écrivain. Il étudie au lycée-collège Saint Jean Lacroix jusqu’en 1992, puis au lycée Henri Martin à Saint-Quentin en 1993-1994. Il se forme ensuite à la médecine et se spécialise en psychiatrie. Il exerce dans des contextes variés : en milieu carcéral, en hôpital psychiatrique, dans la rue avec une unité mobile, et dans son cabinet. Depuis des années, il prend en charge des personnes sans domicile fixe, leur apportant soins et soutien dans des conditions sou'),
(4, 'David', 'Diop', 'Né à Paris en 1966, David Diop a grandi au Sénégal. Maître de conférences à l’université de Pau, il a reçu le Goncourt des Lycéens 2018 et le 2021 International Booker Prize pour son ouvrage Frères d’âme. Il signe avec La Porte du voyage sans retour son troisième roman.'),
(5, 'Ghislaine', 'Dunant', 'Ghislaine Dunant est née à Paris en 1950 d’une mère française et d’un père suisse. Après une enfance et une adolescence à Paris, New York et Bâle, elle fait des études de lettres, d’abord en classes préparatoires au lycée Fénelon (Paris) puis à la Sorbonne. Parallèlement, elle travaille la danse classique puis contemporaine au cours de Peter Goss, le théâtre chez Tania Balachova, puis à l’École internationale de Théâtre de Jacques Lecoq.'),
(6, 'Paul', 'Gasnier', 'Paul Gasnier est un journaliste et écrivain français, diplômé de Sciences Po. Il débute sa carrière dans le journalisme d’investigation. Son expérience dans les médias nourrit une réflexion profonde sur les mécanismes de pouvoir, les fractures sociales et les récits collectifs, qu’il transpose avec force dans son travail littéraire.'),
(7, 'Yanick', 'Lahens', 'Née en 1953, Yanick Lahens grandit à Port-au-Prince au sein d’une famille bourgeoise, élargie, cohabitant avec une arrière-grand-mère, ses grands-parents dont une grand-mère qu’elle considère comme la garante dans la maison d’une culture venue de la province[ et un oncle maternel. Son père a étudié le droit à Paris. Sa mère, pianiste[6] et cordon-bleu amateure, était dessinatrice avant d\'ouvrir une boutique de pâtissier-traiteur qui contribua à la revalorisation de la cuisine paysanne locale et '),
(8, 'Caroline', 'Lamarche', 'Caroline Lamarche naît le 3 mars 1955 à Liège. Elle passe sa petite enfance dans les Asturies en Espagne et son enfance en région parisienne. Elle revient en Belgique à dix-huit ans, elle étudie la philologie romane. Elle a enseigné le français à Liège et au Nigeria et vit actuellement à la périphérie de Bruxelles, à Overijse.'),
(9, 'Hélène', 'Laurain', 'Hélène Laurain naît à Metz en 1988. Elle y fréquente le lycée Fabert. Elle étudie ensuite les sciences politiques ainsi que l’arabe en France et en Allemagne, puis la création littéraire à Paris-VIII.'),
(10, 'Charif', 'Majdalani', 'Charif Majdalani est né à Beyrouth en 1960. Après une scolarité au Grand Lycée franco-libanais de la capitale libanaise, il quitte son pays en 1980 pour suivre des études de lettres modernes à l\'université d\'Aix-en-Provence. Il revient au Liban en 1993 après avoir soutenu sa thèse sur Antonin Artaud. Dans un premier temps, il occupe un poste d\'enseignant à l\'université de Balamand puis devient maître de conférences et enfin professeur à l\'université Saint-Joseph de Beyrouth où il est élu directe'),
(11, 'Laurent', 'Mauvignier', 'Laurent Mauvignier vient d\'une famille ouvrière de cinq enfants installée à Descartes en Touraine. Il est le frère du réalisateur Thierry Mauvignier et de l\'écrivain psychanalyste Frédéric Mauvignier. À l\'âge de dix-sept ans, il entre à l\'École des Beaux-Arts de Tours dont il sort diplômé en arts plastiques en 1991. Laurent Mauvignier publie son premier roman Loin d\'eux en 1999 aux éditions de Minuit, qui restera sa principale maison d\'édition durant toute sa carrière. Le roman reçoit le prix Fé'),
(12, 'Alfred', 'de Montesquiou', 'Il grandit entre les États-Unis, l’Angleterre et la France. Changeant fréquemment d’école et de langue, il se réfugie dans la lecture et dévore les classiques dès son plus jeune âge, avant de devenir un assidu de Joseph Kessel. Il effectue ses études secondaires au lycée Montaigne, une hypokhâgne au lycee Molière, puis étudie l’histoire et la philosophie à la Sorbonne, où il obtient une maîtrise en philosophie.'),
(13, 'Guillaume', 'Poix', 'Guillaume Poix grandit près de Lyon. Il entre à l\'École normale supérieure en 2007 puis fait des études théâtrales de 2011 à 2014 à l\'École nationale supérieure des arts et techniques du théâtre dans la section « écrivain dramaturge ».'),
(14, 'Maria', 'Pourchet', 'Maria Pourchet naît le 5 mars 1980 à Épinal (Vosges). Elle grandit sans télévision (mais avec la chanson française et la bibliothèque municipale). Elle est titulaire d\'un doctorat en sciences sociales (section sociologie des médias). Sa thèse, intitulée « Faces et envers des écrans de la littérature : archéologie d\'un monde du discours (1953-2007) », soutenue sous la direction de Jacques Walter (Centre de recherche sur les médiations) en 2007 à l\'université Paul Verlaine-Metz (depuis devenue uni'),
(15, 'David', 'Thomas', 'David Thomas est né en 1966 à Boulogne-Billancourt. Après un baccalauréat littéraire, il obtient un DEUG d’histoire à l’Université de Nanterre. Il entame une carrière de journaliste qui s’étend sur près de vingt ans, collaborant avec des titres comme Technikart, Elle, Voyager Magazine, Mer & Océan.');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
