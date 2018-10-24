-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mer. 24 oct. 2018 à 13:07
-- Version du serveur :  5.7.17
-- Version de PHP :  7.1.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gsbv2`
--

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE `etat` (
  `id` int(4) NOT NULL,
  `libelle` varchar(30) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
(1, 'Remboursée'),
(2, 'Saisie clôturée'),
(3, 'Fiche créée, saisie en cours'),
(4, 'Validée et mise en paiement');

-- --------------------------------------------------------

--
-- Structure de la table `fichefrais`
--

CREATE TABLE `fichefrais` (
  `idFicheFrais` int(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `nbJustificatifs` int(11) DEFAULT NULL,
  `montantValide` decimal(10,2) DEFAULT NULL,
  `dateModif` date DEFAULT NULL,
  `idEtat` int(4) DEFAULT '3',
  `idVisiteur` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fichefrais`
--

INSERT INTO `fichefrais` (`idFicheFrais`, `mois`, `nbJustificatifs`, `montantValide`, `dateModif`, `idEtat`, `idVisiteur`) VALUES
(1, '201807', NULL, NULL, NULL, 2, 2),
(2, '201806', NULL, NULL, NULL, 3, 2),
(3, '201806', NULL, NULL, NULL, 2, 4),
(4, '201807', NULL, NULL, NULL, 3, 5),
(5, '201808', NULL, NULL, NULL, 2, 6),
(6, '201810', NULL, NULL, NULL, 2, 6),
(7, '201806', NULL, NULL, NULL, 2, 9),
(8, '201807', NULL, NULL, NULL, 2, 11),
(9, '201809', NULL, NULL, NULL, 3, 11),
(10, '201808', NULL, NULL, NULL, 2, 13),
(11, '201810', NULL, NULL, NULL, 2, 13),
(12, '201809', NULL, NULL, NULL, 3, 16),
(13, '201808', NULL, NULL, NULL, 2, 17),
(14, '201806', NULL, NULL, NULL, 2, 18),
(15, '201808', NULL, NULL, NULL, 2, 19),
(16, '201807', NULL, NULL, NULL, 2, 19),
(17, '201807', NULL, NULL, NULL, 2, 23),
(18, '201810', NULL, NULL, NULL, 3, 23),
(19, '201810', NULL, NULL, NULL, 2, 25),
(20, '201806', NULL, NULL, NULL, 3, 27),
(21, '201808', NULL, NULL, NULL, 3, 30),
(22, '201807', NULL, NULL, NULL, 2, 31),
(23, '201806', NULL, NULL, NULL, 2, 31),
(24, '201806', NULL, NULL, NULL, 2, 32),
(25, '201809', NULL, NULL, NULL, 2, 32),
(26, '201810', NULL, NULL, NULL, 2, 38),
(27, '201808', NULL, NULL, NULL, 2, 41),
(28, '201809', NULL, NULL, NULL, 3, 41),
(29, '201807', NULL, NULL, NULL, 3, 43),
(30, '201809', NULL, NULL, NULL, 2, 48),
(31, '201807', NULL, NULL, NULL, 2, 50),
(32, '201808', NULL, NULL, NULL, 2, 53),
(33, '201808', NULL, NULL, NULL, 2, 54),
(34, '201806', NULL, NULL, NULL, 2, 54),
(35, '201808', NULL, NULL, NULL, 2, 55),
(36, '201810', NULL, NULL, NULL, 3, 55),
(37, '201807', NULL, NULL, NULL, 2, 56),
(38, '201809', NULL, NULL, NULL, 2, 57);

-- --------------------------------------------------------

--
-- Structure de la table `fraisforfait`
--

CREATE TABLE `fraisforfait` (
  `id` int(4) NOT NULL,
  `libelle` char(20) COLLATE utf8_bin DEFAULT NULL,
  `montant` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `fraisforfait`
--

INSERT INTO `fraisforfait` (`id`, `libelle`, `montant`) VALUES
(1, 'Forfait Etape', '110.00'),
(2, 'Frais Kilométrique', '0.62'),
(3, 'Nuitée Hôtel', '80.00'),
(4, 'Repas Restaurant', '25.00');

-- --------------------------------------------------------

--
-- Structure de la table `lignefraisforfait`
--

CREATE TABLE `lignefraisforfait` (
  `idFicheFrais` int(4) NOT NULL,
  `idFraisForfait` int(4) NOT NULL,
  `quantite` int(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lignefraisforfait`
--

INSERT INTO `lignefraisforfait` (`idFicheFrais`, `idFraisForfait`, `quantite`) VALUES
(1, 1, 9),
(1, 2, 44),
(1, 3, 1),
(1, 4, 1),
(2, 1, 5),
(2, 2, 46),
(2, 3, 3),
(2, 4, 17),
(3, 1, 4),
(3, 2, 14),
(3, 3, 8),
(3, 4, 33),
(4, 1, 3),
(4, 2, 23),
(4, 3, 4),
(4, 4, 15),
(5, 1, 10),
(5, 2, 31),
(5, 3, 17),
(5, 4, 19),
(6, 1, 7),
(6, 2, 14),
(6, 3, 12),
(6, 4, 10),
(7, 1, 8),
(7, 2, 35),
(7, 3, 10),
(7, 4, 35),
(8, 1, 6),
(8, 2, 8),
(8, 3, 10),
(8, 4, 5),
(9, 1, 14),
(9, 2, 0),
(9, 3, 2),
(9, 4, 32),
(10, 1, 3),
(10, 2, 19),
(10, 3, 9),
(10, 4, 21),
(11, 1, 13),
(11, 2, 5),
(11, 3, 12),
(11, 4, 32),
(12, 1, 15),
(12, 2, 45),
(12, 3, 22),
(12, 4, 25),
(13, 1, 0),
(13, 2, 37),
(13, 3, 13),
(13, 4, 33),
(14, 1, 11),
(14, 2, 8),
(14, 3, 21),
(14, 4, 29),
(15, 1, 12),
(15, 2, 9),
(15, 3, 2),
(15, 4, 25),
(16, 1, 15),
(16, 2, 36),
(16, 3, 5),
(16, 4, 2),
(17, 1, 4),
(17, 2, 21),
(17, 3, 22),
(17, 4, 24),
(18, 1, 7),
(18, 2, 21),
(18, 3, 8),
(18, 4, 5),
(19, 1, 11),
(19, 2, 19),
(19, 3, 10),
(19, 4, 35),
(20, 1, 3),
(20, 2, 38),
(20, 3, 23),
(20, 4, 6),
(21, 1, 7),
(21, 2, 46),
(21, 3, 21),
(21, 4, 23),
(22, 1, 11),
(22, 2, 3),
(22, 3, 3),
(22, 4, 5),
(23, 1, 2),
(23, 2, 31),
(23, 3, 24),
(23, 4, 18),
(24, 1, 0),
(24, 2, 19),
(24, 3, 19),
(24, 4, 29),
(25, 1, 7),
(25, 2, 43),
(25, 3, 7),
(25, 4, 22),
(26, 1, 13),
(26, 2, 15),
(26, 3, 9),
(26, 4, 28),
(27, 1, 1),
(27, 2, 27),
(27, 3, 20),
(27, 4, 5),
(28, 1, 2),
(28, 2, 17),
(28, 3, 6),
(28, 4, 7),
(29, 1, 0),
(29, 2, 12),
(29, 3, 8),
(29, 4, 4),
(30, 1, 15),
(30, 2, 46),
(30, 3, 20),
(30, 4, 24),
(31, 1, 8),
(31, 2, 15),
(31, 3, 6),
(31, 4, 7),
(32, 1, 11),
(32, 2, 36),
(32, 3, 18),
(32, 4, 20),
(33, 1, 4),
(33, 2, 44),
(33, 3, 23),
(33, 4, 22),
(34, 1, 12),
(34, 2, 12),
(34, 3, 20),
(34, 4, 34),
(35, 1, 12),
(35, 2, 1),
(35, 3, 0),
(35, 4, 23),
(36, 1, 10),
(36, 2, 27),
(36, 3, 16),
(36, 4, 9),
(37, 1, 5),
(37, 2, 10),
(37, 3, 8),
(37, 4, 25),
(38, 1, 4),
(38, 2, 34),
(38, 3, 21),
(38, 4, 24);

-- --------------------------------------------------------

--
-- Structure de la table `lignefraishorsforfait`
--

CREATE TABLE `lignefraishorsforfait` (
  `id` int(11) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  `invalider` tinyint(1) DEFAULT '0',
  `reporter` tinyint(1) DEFAULT '0',
  `idFicheFrais` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lignefraishorsforfait`
--

INSERT INTO `lignefraishorsforfait` (`id`, `libelle`, `date`, `montant`, `invalider`, `reporter`, `idFicheFrais`) VALUES
(1, 'RDV important', '2019-10-10', '250.00', 0, 0, 1),
(2, 'Voyage scolaire', '2018-10-17', '774.00', 0, 0, 2),
(3, 'Restaurant Chinois', '2018-10-17', '49.00', 0, 0, 3),
(4, 'Thêatre', '2018-10-12', '167.00', 0, 0, 4),
(5, 'RDV important', '2018-10-20', '385.00', 0, 0, 5),
(6, 'Spectacle de poupées', '2018-10-20', '772.00', 0, 0, 6),
(7, 'Cinéma', '2018-10-20', '686.00', 0, 0, 7),
(8, 'Cinéma', '2018-05-25', '165.00', 0, 0, 8),
(9, 'Suite royale', '2018-10-05', '733.00', 0, 0, 9),
(10, 'Restaurant Chinois', '2018-09-30', '128.00', 0, 0, 10),
(11, 'RDV galant', '2018-10-20', '354.00', 0, 0, 11),
(12, 'Cinéma', '2018-10-17', '72.00', 0, 0, 12),
(13, 'RDV Pharmacie', '2018-05-25', '454.00', 0, 0, 13),
(14, 'RDV important', '2018-05-15', '225.00', 0, 0, 14),
(15, 'Restaurant Chinois', '2018-09-27', '210.00', 0, 0, 15),
(16, 'Voyage scolaire', '2018-05-15', '40.00', 0, 0, 16),
(17, 'RDV important', '2018-09-12', '92.00', 0, 0, 17),
(18, 'Restaurant Chinois', '2018-09-30', '629.00', 0, 0, 18),
(19, 'Suite royale', '2018-10-23', '498.00', 0, 0, 19),
(20, 'Spectacle de poupées', '2018-10-20', '187.00', 0, 0, 20),
(21, 'RDV important', '2018-10-12', '359.00', 0, 0, 21),
(22, 'Cinéma', '2018-10-09', '742.00', 0, 0, 22),
(23, 'Cinéma', '2018-10-05', '216.00', 0, 0, 23),
(24, 'Suite royale', '2018-10-17', '374.00', 0, 0, 24),
(25, 'Thêatre', '2018-10-09', '698.00', 0, 0, 25),
(26, 'Voyage scolaire', '2018-10-20', '333.00', 0, 0, 26),
(27, 'Suite royale', '2019-10-10', '535.00', 0, 0, 27),
(28, 'Voyage scolaire', '2018-09-30', '284.00', 0, 0, 28),
(29, 'RDV important', '2018-10-05', '377.00', 0, 0, 29),
(30, 'Achat de matériel', '2018-05-15', '397.00', 0, 0, 30),
(31, 'Spectacle de poupées', '2018-09-12', '705.00', 0, 0, 31),
(32, 'RDV important', '2018-10-02', '718.00', 0, 0, 32),
(33, 'Thêatre', '2018-05-25', '59.00', 0, 0, 33),
(34, 'RDV galant', '2018-05-25', '432.00', 0, 0, 34),
(35, 'RDV important', '2018-09-25', '301.00', 0, 0, 35),
(36, 'Cinéma', '2018-09-12', '338.00', 0, 0, 36),
(37, 'Thêatre', '2018-09-30', '116.00', 0, 0, 37),
(38, 'Spectacle de poupées', '2018-10-05', '580.00', 0, 0, 38);

-- --------------------------------------------------------

--
-- Structure de la table `typevisiteur`
--

CREATE TABLE `typevisiteur` (
  `id` int(4) NOT NULL,
  `libelle` varchar(30) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `typevisiteur`
--

INSERT INTO `typevisiteur` (`id`, `libelle`) VALUES
(1, 'Visiteur'),
(2, 'Comptable');

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

CREATE TABLE `visiteur` (
  `id` int(4) NOT NULL,
  `nom` char(30) COLLATE utf8_bin DEFAULT NULL,
  `prenom` char(30) COLLATE utf8_bin DEFAULT NULL,
  `login` char(20) COLLATE utf8_bin DEFAULT NULL,
  `mdp` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `adresse` char(30) COLLATE utf8_bin DEFAULT NULL,
  `cp` char(5) COLLATE utf8_bin DEFAULT NULL,
  `ville` char(45) COLLATE utf8_bin DEFAULT NULL,
  `dateEmbauche` date DEFAULT NULL,
  `idTypeVisiteur` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `visiteur`
--

INSERT INTO `visiteur` (`id`, `nom`, `prenom`, `login`, `mdp`, `adresse`, `cp`, `ville`, `dateEmbauche`, `idTypeVisiteur`) VALUES
(1, 'Villechalane', 'Louis', 'lvillachane', 'jux7g', '8 rue des Charmes', '46000', 'Cahors', '2005-12-21', 1),
(2, 'Andre', 'David', 'dandre', 'oppg5', '1 rue Petit', '46200', 'Lalbenque', '1998-11-23', 1),
(3, 'Bedos', 'Christian', 'cbedos', 'gmhxd', '1 rue Peranud', '46250', 'Montcuq', '1995-01-12', 1),
(4, 'Tusseau', 'Louis', 'ltusseau', 'ktp3s', '22 rue des Ternes', '46123', 'Gramat', '2000-05-01', 1),
(5, 'Bentot', 'Pascal', 'pbentot', 'doyw1', '11 allée des Cerises', '46512', 'Bessines', '1992-07-09', 1),
(6, 'Bioret', 'Luc', 'lbioret', 'hrjfs', '1 Avenue gambetta', '46000', 'Cahors', '1998-05-11', 1),
(7, 'Bunisset', 'Francis', 'fbunisset', '4vbnd', '10 rue des Perles', '93100', 'Montreuil', '1987-10-21', 1),
(8, 'Bunisset', 'Denise', 'dbunisset', 's1y1r', '23 rue Manin', '75019', 'paris', '2010-12-05', 1),
(9, 'Cacheux', 'Bernard', 'bcacheux', 'uf7r3', '114 rue Blanche', '75017', 'Paris', '2009-11-12', 1),
(10, 'Cadic', 'Eric', 'ecadic', '6u8dc', '123 avenue de la République', '75011', 'Paris', '2008-09-23', 1),
(11, 'Charoze', 'Catherine', 'ccharoze', 'u817o', '100 rue Petit', '75019', 'Paris', '2005-11-12', 1),
(12, 'Clepkens', 'Christophe', 'cclepkens', 'bw1us', '12 allée des Anges', '93230', 'Romainville', '2003-08-11', 1),
(13, 'Cottin', 'Vincenne', 'vcottin', '2hoh9', '36 rue Des Roches', '93100', 'Monteuil', '2001-11-18', 1),
(14, 'Daburon', 'François', 'fdaburon', '7oqpv', '13 rue de Chanzy', '94000', 'Créteil', '2002-02-11', 1),
(15, 'De', 'Philippe', 'pde', 'gk9kx', '13 rue Barthes', '94000', 'Créteil', '2010-12-14', 1),
(16, 'Debelle', 'Michel', 'mdebelle', 'od5rt', '181 avenue Barbusse', '93210', 'Rosny', '2006-11-23', 1),
(17, 'Debelle', 'Jeanne', 'jdebelle', 'nvwqq', '134 allée des Joncs', '44000', 'Nantes', '2000-05-11', 1),
(18, 'Debroise', 'Michel', 'mdebroise', 'sghkb', '2 Bld Jourdain', '44000', 'Nantes', '2001-04-17', 1),
(19, 'Desmarquest', 'Nathalie', 'ndesmarquest', 'f1fob', '14 Place d Arc', '45000', 'Orléans', '2005-11-12', 1),
(20, 'Desnost', 'Pierre', 'pdesnost', '4k2o5', '16 avenue des Cèdres', '23200', 'Guéret', '2001-02-05', 1),
(21, 'Dudouit', 'Frédéric', 'fdudouit', '44im8', '18 rue de l église', '23120', 'GrandBourg', '2000-08-01', 1),
(22, 'Duncombe', 'Claude', 'cduncombe', 'qf77j', '19 rue de la tour', '23100', 'La souteraine', '1987-10-10', 1),
(23, 'Enault-Pascreau', 'Céline', 'cenault', 'y2qdu', '25 place de la gare', '23200', 'Gueret', '1995-09-01', 1),
(24, 'Eynde', 'Valérie', 'veynde', 'i7sn3', '3 Grand Place', '13015', 'Marseille', '1999-11-01', 1),
(25, 'Finck', 'Jacques', 'jfinck', 'mpb3t', '10 avenue du Prado', '13002', 'Marseille', '2001-11-10', 1),
(26, 'Frémont', 'Fernande', 'ffremont', 'xs5tq', '4 route de la mer', '13012', 'Allauh', '1998-10-01', 1),
(27, 'Gest', 'Alain', 'agest', 'dywvt', '30 avenue de la mer', '13025', 'Berre', '1985-11-01', 1),
(28, 'Admin', 'Admin', 'admin', 'admin', 'rue des admins', '91170', 'Viry Zoo', '2018-07-01', 1),
(29, 'Admin', 'Admin', 'admin2', 'admin2', 'rue des admins', '91170', 'Viry Zoo', '2018-07-01', 2),
(30, 'Villechalane', 'Louis', 'lvillachane', 'jux7g', '8 rue des Charmes', '46000', 'Cahors', '2005-12-21', 1),
(31, 'Andre', 'David', 'dandre', 'oppg5', '1 rue Petit', '46200', 'Lalbenque', '1998-11-23', 1),
(32, 'Bedos', 'Christian', 'cbedos', 'gmhxd', '1 rue Peranud', '46250', 'Montcuq', '1995-01-12', 1),
(33, 'Tusseau', 'Louis', 'ltusseau', 'ktp3s', '22 rue des Ternes', '46123', 'Gramat', '2000-05-01', 1),
(34, 'Bentot', 'Pascal', 'pbentot', 'doyw1', '11 allée des Cerises', '46512', 'Bessines', '1992-07-09', 1),
(35, 'Bioret', 'Luc', 'lbioret', 'hrjfs', '1 Avenue gambetta', '46000', 'Cahors', '1998-05-11', 1),
(36, 'Bunisset', 'Francis', 'fbunisset', '4vbnd', '10 rue des Perles', '93100', 'Montreuil', '1987-10-21', 1),
(37, 'Bunisset', 'Denise', 'dbunisset', 's1y1r', '23 rue Manin', '75019', 'paris', '2010-12-05', 1),
(38, 'Cacheux', 'Bernard', 'bcacheux', 'uf7r3', '114 rue Blanche', '75017', 'Paris', '2009-11-12', 1),
(39, 'Cadic', 'Eric', 'ecadic', '6u8dc', '123 avenue de la République', '75011', 'Paris', '2008-09-23', 1),
(40, 'Charoze', 'Catherine', 'ccharoze', 'u817o', '100 rue Petit', '75019', 'Paris', '2005-11-12', 1),
(41, 'Clepkens', 'Christophe', 'cclepkens', 'bw1us', '12 allée des Anges', '93230', 'Romainville', '2003-08-11', 1),
(42, 'Cottin', 'Vincenne', 'vcottin', '2hoh9', '36 rue Des Roches', '93100', 'Monteuil', '2001-11-18', 1),
(43, 'Daburon', 'François', 'fdaburon', '7oqpv', '13 rue de Chanzy', '94000', 'Créteil', '2002-02-11', 1),
(44, 'De', 'Philippe', 'pde', 'gk9kx', '13 rue Barthes', '94000', 'Créteil', '2010-12-14', 1),
(45, 'Debelle', 'Michel', 'mdebelle', 'od5rt', '181 avenue Barbusse', '93210', 'Rosny', '2006-11-23', 1),
(46, 'Debelle', 'Jeanne', 'jdebelle', 'nvwqq', '134 allée des Joncs', '44000', 'Nantes', '2000-05-11', 1),
(47, 'Debroise', 'Michel', 'mdebroise', 'sghkb', '2 Bld Jourdain', '44000', 'Nantes', '2001-04-17', 1),
(48, 'Desmarquest', 'Nathalie', 'ndesmarquest', 'f1fob', '14 Place d Arc', '45000', 'Orléans', '2005-11-12', 1),
(49, 'Desnost', 'Pierre', 'pdesnost', '4k2o5', '16 avenue des Cèdres', '23200', 'Guéret', '2001-02-05', 1),
(50, 'Dudouit', 'Frédéric', 'fdudouit', '44im8', '18 rue de l église', '23120', 'GrandBourg', '2000-08-01', 1),
(51, 'Duncombe', 'Claude', 'cduncombe', 'qf77j', '19 rue de la tour', '23100', 'La souteraine', '1987-10-10', 1),
(52, 'Enault-Pascreau', 'Céline', 'cenault', 'y2qdu', '25 place de la gare', '23200', 'Gueret', '1995-09-01', 1),
(53, 'Eynde', 'Valérie', 'veynde', 'i7sn3', '3 Grand Place', '13015', 'Marseille', '1999-11-01', 1),
(54, 'Finck', 'Jacques', 'jfinck', 'mpb3t', '10 avenue du Prado', '13002', 'Marseille', '2001-11-10', 1),
(55, 'Frémont', 'Fernande', 'ffremont', 'xs5tq', '4 route de la mer', '13012', 'Allauh', '1998-10-01', 1),
(56, 'Gest', 'Alain', 'agest', 'dywvt', '30 avenue de la mer', '13025', 'Berre', '1985-11-01', 1),
(57, 'Admin', 'Admin', 'admin', 'admin', 'rue des admins', '91170', 'Viry Zoo', '2018-07-01', 1),
(58, 'Admin', 'Admin', 'admin2', 'admin2', 'rue des admins', '91170', 'Viry Zoo', '2018-07-01', 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD PRIMARY KEY (`idFicheFrais`),
  ADD KEY `idEtat` (`idEtat`),
  ADD KEY `idVisiteur` (`idVisiteur`);

--
-- Index pour la table `fraisforfait`
--
ALTER TABLE `fraisforfait`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD PRIMARY KEY (`idFicheFrais`,`idFraisForfait`),
  ADD KEY `idFraisForfait` (`idFraisForfait`);

--
-- Index pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idFicheFrais` (`idFicheFrais`);

--
-- Index pour la table `typevisiteur`
--
ALTER TABLE `typevisiteur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_visiteur_typeVisiteur` (`idTypeVisiteur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `etat`
--
ALTER TABLE `etat`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  MODIFY `idFicheFrais` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT pour la table `fraisforfait`
--
ALTER TABLE `fraisforfait`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT pour la table `typevisiteur`
--
ALTER TABLE `typevisiteur`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `visiteur`
--
ALTER TABLE `visiteur`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD CONSTRAINT `fichefrais_ibfk_1` FOREIGN KEY (`idEtat`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `fichefrais_ibfk_2` FOREIGN KEY (`idVisiteur`) REFERENCES `visiteur` (`id`);

--
-- Contraintes pour la table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD CONSTRAINT `lignefraisforfait_ibfk_1` FOREIGN KEY (`idFicheFrais`) REFERENCES `fichefrais` (`idFicheFrais`),
  ADD CONSTRAINT `lignefraisforfait_ibfk_2` FOREIGN KEY (`idFraisForfait`) REFERENCES `fraisforfait` (`id`);

--
-- Contraintes pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD CONSTRAINT `lignefraishorsforfait_ibfk_1` FOREIGN KEY (`idFicheFrais`) REFERENCES `fichefrais` (`idFicheFrais`);

--
-- Contraintes pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD CONSTRAINT `fk_visiteur_typeVisiteur` FOREIGN KEY (`idTypeVisiteur`) REFERENCES `typevisiteur` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
