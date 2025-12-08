-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 08 déc. 2025 à 10:30
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
-- Structure de la table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parution_date` date NOT NULL,
  `pages` int NOT NULL,
  `isbn` int NOT NULL,
  `price` float NOT NULL,
  `fk_author_id` int NOT NULL,
  `fk_editor_id` int NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `books`
--

INSERT INTO `books` (`book_id`, `title`, `summary`, `parution_date`, `pages`, `isbn`, `price`, `fk_author_id`, `fk_editor_id`) VALUES
(1, 'La Maison vide ', 'Fresque familiale et méditation sur la mémoire, l’ouvrage retrace cent cinquante ans d’histoire à travers les silences, les blessures et les transmissions d’une lignée rurale française. Le récit s’ouvre en 1976, lorsque le père du narrateur rouvre une maison longtemps abandonnée, révélant les traces d’un passé enfoui : un piano, une Légion d’honneur et des photographies mutilées. Trois figures féminines dominent la saga : Marie-Ernestine, musicienne contrariée ; Marguerite, tondue à la Libératio', '2025-08-28', 744, 2147483647, 25, 11, 0),
(2, 'Le Bel Obscur', 'Alors qu\'elle tente d\'élucider le destin d\'un ancêtre banni par sa famille, une femme reprend l\'histoire de sa propre vie. Des années auparavant, son mari, son premier et grand amour, lui a révélé être homosexuel. Du bouleversement que ce fut dans leur existence comme des péripéties de leur émancipation respective,, rien n\'est tu. Ce roman lumineux nous offre une leçon de courage, de tolérance, de curiosité aussi. Car jamais cette femme libre n\'aura cessé de se réinventer, d\'affirmer la puissanc', '2025-08-22', 240, 2147483647, 20, 8, 0),
(3, 'Kolkhoze', 'Au lendemain de la Seconde Guerre mondiale, un jeune bourgeois bordelais rencontre Hélène Zourabichbvili, la fille d\'une aristocrate germano-russe ruinée et d\'un Géorgien bipolaire disparu à la Libération. Après le mariage, la jeune femme prend le nom de Carrère d\'Encausse puis devient une spécialiste internationalement reconnue de la Russie et secrétaire perpétuelle de l\'Académie française.', '2025-09-04', 560, 2147483647, 24, 2, 0),
(4, 'La Nuit au coeur', 'De ces nuits et de ces vies, de ces femmes qui courent, de ces cœurs qui luttent, de ces instants qui sont si accablants qu’ils ne rentrent pas dans la mesure du temps, il a fallu faire quelque chose. Il y a l’impossibilité de la vérité entière à chaque page mais la quête désespérée d’une justesse au plus près de la vie, de la nuit, du cœur, du corps, de l’esprit.\r\nDe ces trois femmes, il a fallu commencer par la première, celle qui vient d’avoir vingt-cinq ans quand elle court et qui est la seu', '2025-08-14', 283, 2147483647, 21, 1, 0),
(5, 'La Collision', 'En 2012, en plein centre-ville de Lyon, une femme décède brutalement, percutée par un jeune garçon en moto cross qui fait du rodéo urbain à 80 km/h.\r\nDix ans plus tard, son fils, qui n’a cessé d’être hanté par le drame, est devenu journaliste. Il observe la façon dont ce genre de catastrophe est utilisé quotidiennement pour fracturer la société et dresser une partie de l’opinion contre l’autre. Il décide de se replonger dans la complexité de cet accident, et de se lancer sur les traces du motard', '2025-08-14', 161, 2073101224, 19, 6, 0),
(6, 'Passagères de nuit', 'Élizabeth Dubreuil naît en 1820 à la Nouvelle Orléans. Venue d’Haïti, sa grand-mère, esclave affranchie, tient un atelier de couture que les femmes de la Ville Haute aiment à fréquenter. Las, à dix-huit ans, Élizabeth doit fuir la ville et la concupiscence d’un ami de son père. Une génération plus tard, Régina, petite mulâtresse donnée comme domestique à une femme haîneuse, prend, elle aussi son destin en main et s’enfuit pour rencontrer, quelques années plus tard, dans le chaos d’un coup d’état', '2025-08-28', 224, 2147483647, 20, 7, 0),
(7, 'Le Nom des rois', 'Et d’un seul coup, le monde qui servait de décor à tout cela s’écroula. J’en avais été un témoin distrait, mais le bruit qu’il provoqua en s’effondrant me fit lever la tête et ce que je vis alors n’était plus qu’un univers de violence et de mort. C’est de celui-là que je suis devenu contemporain. J’avais été, durant des années, dispensé d’intérêt pour ce qui se passait autour de moi par ma passion des atlas, par les royautés anciennes et inutiles et par les terres lointaines et isolées, les berc', '2025-08-20', 216, 2147483647, 20, 10, 0),
(8, 'Le Crépuscule des hommes', 'Chacun connaît les images du procès de Nuremberg, où Göring et vingt autres nazis sont jugés à partir du 20 novembre 1945. Mais que se passe-t-il hors de la salle d\'audience ?\r\nIls sont là : Joseph Kessel, Elsa Triolet, Martha Gellhorn ou encore John Dos Passos, venus assister à ces dix mois où doit oeuvrer la justice. Des dortoirs de l\'étrange château Faber-Castell, qui loge la presse internationale, aux box des accusés, tous partagent la frénésie des reportages, les frictions entre alliés occi', '2025-08-28', 384, 2147483647, 22, 38, 0),
(9, 'L’Adieu au visage', 'Mars 2020. La France se confine. Dans tous les hôpitaux du pays, il faut prendre des décisions et agir vite. En première ligne, un psychiatre partage son temps entre son équipe mobile qui maraude dans une ville fantôme à la recherche de marginaux à protéger, et les unités Covid où les malades meurent  seuls, privés de tout rite. Entre obéissance à la loi et refus de l’horreur, que  ce soit à l’hôpital ou dehors, chacun à son niveau cherche des solutions  et improvise.', '2025-08-20', 256, 2147483647, 21, 39, 0),
(10, 'Où s’adosse le ciel', 'À la fin du XIXe siècle, Bilal Seck achève un pèlerinage à La Mecque où il s’est rendu avec son meilleur ami et s’apprête à rentrer à Saint-Louis du Sénégal. Une épidémie de choléra décime alors la région, mais Bilal en réchappe miraculeusement, sous le regard incrédule d’un médecin français qui tente de le convaincre de lui prélever un échantillon de sang afin de percer les secrets de son immunité. En pure perte. Déjà, Bilal est ailleurs, porté par une autre histoire, celle qu’il ne cesse de ps', '2025-08-14', 368, 2147483647, 22, 40, 0),
(11, 'Un amour infini', 'Elle est descendue en retard, elle voulait encore fumer une cigarette, fumer seule, une fois de plus. Pour sentir le temps qui passe, ne plus savoir qui elle est, ni ce qu\'on peut vouloir d\'elle', '2025-08-20', 176, 2147483647, 20, 41, 0),
(12, 'Tambora', 'Une mère évoque ses deux filles, comparées à des villes en expansion. La première est née, la seconde naît après une fausse couche tardive. Le récit est rythmé par les grossesses compliquées, les hospitalisations et les soins. Parallèlement, elle parle de l\'édition de son premier livre, des confinements et de la catastrophe environnementale, symbolisée par l\'éruption du volcan Tambora en 1815.', '0000-00-00', 192, 2147483647, 18, 42, 0),
(13, 'Perpétuité', '18h45. Une maison d\'arrêt du sud de la France. Pierre, Houda, Laurent, Maëva et d\'autres surveillants prennent leur service de nuit. Captifs d\'une routine qui menace à chaque instant de déraper, ces agents de la pénitentiaire vont traverser ensemble une série d\'incidents plus éprouvants qu\'à l\'ordinaire.', '2025-08-21', 336, 2073105459, 22, 43, 0),
(14, 'Tressaillir', '« J’ai coupé un lien avec quelque chose d’aussi étouffant que vital et je ne suis désormais plus branchée sur rien. Ni amour, ni foi, ni médecine. »\r\nUne femme est partie. Elle a quitté la maison, défait sa vie. Elle pensait découvrir une liberté neuve mais elle éprouve, prostrée dans une chambre d’hôtel, l’élémentaire supplice de l’arrachement. Et si rompre n’était pas à sa portée ? Si la seule issue au chagrin, c’était revenir ? Car sans un homme à ses côtés, cette femme a peur. Depuis toujour', '2025-08-20', 336, 2147483647, 21, 44, 0),
(15, 'Un frère', '« Pendant presque quarante ans, il aura été là sans plus vraiment être là. Lui, mais plus lui. Un autre. »\r\nDavid Thomas raconte le combat de son frère contre cette tyrannie intérieure qu’est la schizophrénie. Sa dureté, sa noirceur, ses ravages. Depuis la mort brutale d’Édouard jusqu’aux années heureuses, il remonte à la source du lien qu’il a eu avec son aîné et grâce auquel il s’est construit. Lors de ce cheminement, il s’interroge : comment écrire cette histoire sans trahir, sans enjoliver ?', '2025-08-22', 144, 282362337, 19, 45, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
