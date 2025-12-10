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

-- --------------------------------------------------------

--
-- Structure de la table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `characters` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parution_date` date NOT NULL,
  `pages` int NOT NULL,
  `isbn` int NOT NULL,
  `price` float NOT NULL,
  `fk_author_id` int NOT NULL,
  `fk_editor_id` int NOT NULL,
  PRIMARY KEY (`book_id`),
  KEY `fk_author_id` (`fk_author_id`),
  KEY `fk_editor_id` (`fk_editor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `books`
--

INSERT INTO `books` (`book_id`, `title`, `summary`, `characters`, `parution_date`, `pages`, `isbn`, `price`, `fk_author_id`, `fk_editor_id`) VALUES
(1, 'La Maison vide ', 'Fresque familiale et méditation sur la mémoire, l’ouvrage retrace cent cinquante ans d’histoire à travers les silences, les blessures et les transmissions d’une lignée rurale française. Le récit s’ouvre en 1976, lorsque le père du narrateur rouvre une maison longtemps abandonnée, révélant les traces d’un passé enfoui : un piano, une Légion d’honneur et des photographies mutilées. Trois figures féminines dominent la saga : Marie-Ernestine, musicienne contrariée ; Marguerite, tondue à la Libératio', 'Marie-Ernestine, Marguerite, Jeanne-Marie', '2025-08-28', 744, 2147483647, 25, 11, 4),
(2, 'Le Bel Obscur', 'Alors qu\'elle tente d\'élucider le destin d\'un ancêtre banni par sa famille, une femme reprend l\'histoire de sa propre vie. Des années auparavant, son mari, son premier et grand amour, lui a révélé être homosexuel. Du bouleversement que ce fut dans leur existence comme des péripéties de leur émancipation respective,, rien n\'est tu. Ce roman lumineux nous offre une leçon de courage, de tolérance, de curiosité aussi. Car jamais cette femme libre n\'aura cessé de se réinventer, d\'affirmer la puissanc', 'Narratrice, Vincent, Edmond', '2025-08-22', 240, 2147483647, 20, 8, 3),
(3, 'Kolkhoze', 'Au lendemain de la Seconde Guerre mondiale, un jeune bourgeois bordelais rencontre Hélène Zourabichbvili, la fille d\'une aristocrate germano-russe ruinée et d\'un Géorgien bipolaire disparu à la Libération. Après le mariage, la jeune femme prend le nom de Carrère d\'Encausse puis devient une spécialiste internationalement reconnue de la Russie et secrétaire perpétuelle de l\'Académie française.', 'Hélène Carrère d\'Encausse, Louis Carrère d\'Encausse, Emmanuel Carrère, Nathalie Carrère, Marine Carrère', '2025-09-04', 560, 2147483647, 24, 2, 2),
(4, 'La Nuit au coeur', 'De ces nuits et de ces vies, de ces femmes qui courent, de ces cœurs qui luttent, de ces instants qui sont si accablants qu’ils ne rentrent pas dans la mesure du temps, il a fallu faire quelque chose. Il y a l’impossibilité de la vérité entière à chaque page mais la quête désespérée d’une justesse au plus près de la vie, de la nuit, du cœur, du corps, de l’esprit.\r\nDe ces trois femmes, il a fallu commencer par la première, celle qui vient d’avoir vingt-cinq ans quand elle court et qui est la seu', 'Natacha, Emma, Chahinez', '2025-08-14', 283, 2147483647, 21, 1, 1),
(5, 'La Collision', 'En 2012, en plein centre-ville de Lyon, une femme décède brutalement, percutée par un jeune garçon en moto cross qui fait du rodéo urbain à 80 km/h.\r\nDix ans plus tard, son fils, qui n’a cessé d’être hanté par le drame, est devenu journaliste. Il observe la façon dont ce genre de catastrophe est utilisé quotidiennement pour fracturer la société et dresser une partie de l’opinion contre l’autre. Il décide de se replonger dans la complexité de cet accident, et de se lancer sur les traces du motard', 'Paul Gasnier, Le motard, la famille de Said, les témoins', '2025-08-14', 161, 2073101224, 19, 6, 1),
(6, 'Passagères de nuit', 'Élizabeth Dubreuil naît en 1820 à la Nouvelle Orléans. Venue d’Haïti, sa grand-mère, esclave affranchie, tient un atelier de couture que les femmes de la Ville Haute aiment à fréquenter. Las, à dix-huit ans, Élizabeth doit fuir la ville et la concupiscence d’un ami de son père. Une génération plus tard, Régina, petite mulâtresse donnée comme domestique à une femme haîneuse, prend, elle aussi son destin en main et s’enfuit pour rencontrer, quelques années plus tard, dans le chaos d’un coup d’état', 'Elizabeth Dubreuil, Régina', '2025-08-28', 224, 2147483647, 20, 7, 5),
(7, 'Le Nom des rois', 'Et d’un seul coup, le monde qui servait de décor à tout cela s’écroula. J’en avais été un témoin distrait, mais le bruit qu’il provoqua en s’effondrant me fit lever la tête et ce que je vis alors n’était plus qu’un univers de violence et de mort. C’est de celui-là que je suis devenu contemporain. J’avais été, durant des années, dispensé d’intérêt pour ce qui se passait autour de moi par ma passion des atlas, par les royautés anciennes et inutiles et par les terres lointaines et isolées, les berc', 'le narrateur, le père du narrateur', '2025-08-20', 216, 2147483647, 20, 10, 6),
(8, 'Le Crépuscule des hommes', 'Chacun connaît les images du procès de Nuremberg, où Göring et vingt autres nazis sont jugés à partir du 20 novembre 1945. Mais que se passe-t-il hors de la salle d\'audience ?\r\nIls sont là : Joseph Kessel, Elsa Triolet, Martha Gellhorn ou encore John Dos Passos, venus assister à ces dix mois où doit oeuvrer la justice. Des dortoirs de l\'étrange château Faber-Castell, qui loge la presse internationale, aux box des accusés, tous partagent la frénésie des reportages, les frictions entre alliés occi', 'Ray d\'Addario, Joseph Kessel, Elsa Triolet, Martha Gellhorn, John Dos Passos', '2025-08-28', 384, 2147483647, 22, 12, 7),
(9, 'L’Adieu au visage', 'Mars 2020. La France se confine. Dans tous les hôpitaux du pays, il faut prendre des décisions et agir vite. En première ligne, un psychiatre partage son temps entre son équipe mobile qui maraude dans une ville fantôme à la recherche de marginaux à protéger, et les unités Covid où les malades meurent  seuls, privés de tout rite. Entre obéissance à la loi et refus de l’horreur, que  ce soit à l’hôpital ou dehors, chacun à son niveau cherche des solutions  et improvise.', 'Narrateur, psychiatre, équipe', '2025-08-20', 256, 2147483647, 21, 3, 8),
(10, 'Où s’adosse le ciel', 'À la fin du XIXe siècle, Bilal Seck achève un pèlerinage à La Mecque où il s’est rendu avec son meilleur ami et s’apprête à rentrer à Saint-Louis du Sénégal. Une épidémie de choléra décime alors la région, mais Bilal en réchappe miraculeusement, sous le regard incrédule d’un médecin français qui tente de le convaincre de lui prélever un échantillon de sang afin de percer les secrets de son immunité. En pure perte. Déjà, Bilal est ailleurs, porté par une autre histoire, celle qu’il ne cesse de ps', 'Bilal Seck, Ounifer, Yérim Thiaw, Kémi, Ptahhotep', '2025-08-14', 368, 2147483647, 22, 4, 9),
(11, 'Un amour infini', 'Elle est descendue en retard, elle voulait encore fumer une cigarette, fumer seule, une fois de plus. Pour sentir le temps qui passe, ne plus savoir qui elle est, ni ce qu\'on peut vouloir d\'elle', 'Louise, Nathan', '2025-08-20', 176, 2147483647, 20, 5, 10),
(12, 'Tambora', 'Une mère évoque ses deux filles, comparées à des villes en expansion. La première est née, la seconde naît après une fausse couche tardive. Le récit est rythmé par les grossesses compliquées, les hospitalisations et les soins. Parallèlement, elle parle de l\'édition de son premier livre, des confinements et de la catastrophe environnementale, symbolisée par l\'éruption du volcan Tambora en 1815.', 'Mère, deux filles, enfant perdu', '0000-00-00', 192, 2147483647, 18, 9, 11),
(13, 'Perpétuité', '18h45. Une maison d\'arrêt du sud de la France. Pierre, Houda, Laurent, Maëva et d\'autres surveillants prennent leur service de nuit. Captifs d\'une routine qui menace à chaque instant de déraper, ces agents de la pénitentiaire vont traverser ensemble une série d\'incidents plus éprouvants qu\'à l\'ordinaire.', 'Mère, deux filles, enfant perdu', '2025-08-21', 336, 2073105459, 22, 13, 12),
(14, 'Tressaillir', '« J’ai coupé un lien avec quelque chose d’aussi étouffant que vital et je ne suis désormais plus branchée sur rien. Ni amour, ni foi, ni médecine. »\r\nUne femme est partie. Elle a quitté la maison, défait sa vie. Elle pensait découvrir une liberté neuve mais elle éprouve, prostrée dans une chambre d’hôtel, l’élémentaire supplice de l’arrachement. Et si rompre n’était pas à sa portée ? Si la seule issue au chagrin, c’était revenir ? Car sans un homme à ses côtés, cette femme a peur. Depuis toujour', 'Michelle, Lou, Sirius', '2025-08-20', 336, 2147483647, 21, 14, 6),
(15, 'Un frère', '« Pendant presque quarante ans, il aura été là sans plus vraiment être là. Lui, mais plus lui. Un autre. »\r\nDavid Thomas raconte le combat de son frère contre cette tyrannie intérieure qu’est la schizophrénie. Sa dureté, sa noirceur, ses ravages. Depuis la mort brutale d’Édouard jusqu’aux années heureuses, il remonte à la source du lien qu’il a eu avec son aîné et grâce auquel il s’est construit. Lors de ce cheminement, il s’interroge : comment écrire cette histoire sans trahir, sans enjoliver ?', 'Narrateur, Edouard Thomas', '2025-08-22', 144, 282362337, 19, 15, 13);

-- --------------------------------------------------------

--
-- Structure de la table `editors`
--

DROP TABLE IF EXISTS `editors`;
CREATE TABLE IF NOT EXISTS `editors` (
  `editor_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`editor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Contraintes pour la table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `fk_author_id` FOREIGN KEY (`fk_author_id`) REFERENCES `authors` (`author_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_editor_id` FOREIGN KEY (`fk_editor_id`) REFERENCES `editors` (`editor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `first_selection`
--
ALTER TABLE `first_selection`
  ADD CONSTRAINT `fk_book_id` FOREIGN KEY (`fk_book_id`) REFERENCES `books` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `second_selection`
--
ALTER TABLE `second_selection`
  ADD CONSTRAINT `fk_book_id_2` FOREIGN KEY (`fk_book_id`) REFERENCES `books` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `third_selection`
--
ALTER TABLE `third_selection`
  ADD CONSTRAINT `fk_book_id_3` FOREIGN KEY (`fk_book_id`) REFERENCES `books` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
