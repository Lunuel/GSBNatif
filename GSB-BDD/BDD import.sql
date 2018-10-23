-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 21 oct. 2018 à 22:04
-- Version du serveur :  5.7.17
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gsb_frais`
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
  `mois` char(6) COLLATE utf8_bin NOT NULL,
  `nbJustificatifs` int(11) DEFAULT NULL,
  `montantValide` decimal(10,2) DEFAULT NULL,
  `dateModif` date DEFAULT NULL,
  `idEtat` int(4) DEFAULT '2',
  `idVisiteur` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `fichefrais`
--

INSERT INTO `fichefrais` (`idFicheFrais`, `mois`, `nbJustificatifs`, `montantValide`, `dateModif`, `idEtat`, `idVisiteur`) VALUES
(15, '201810', 3, '1911.20', NULL, 2, 28),
(21, '201811', NULL, NULL, NULL, 3, 28),
(22, '201810', 1, '807.48', '2018-10-21', 4, 1),
(23, '201809', 3, '1911.20', NULL, 2, 28),
(24, '201810', NULL, NULL, NULL, 3, 5),
(25, '201810', NULL, NULL, '2018-10-21', 3, 8);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `lignefraisforfait`
--

INSERT INTO `lignefraisforfait` (`idFicheFrais`, `idFraisForfait`, `quantite`) VALUES
(15, 1, 5),
(15, 2, 10),
(15, 3, 15),
(15, 4, 1),
(21, 1, 0),
(21, 2, 0),
(21, 3, 0),
(21, 4, 0),
(22, 1, 5),
(22, 2, 4),
(22, 3, 1),
(22, 4, 5),
(24, 1, 0),
(24, 2, 0),
(24, 3, 0),
(24, 4, 0),
(25, 1, 10),
(25, 2, 5),
(25, 3, 4),
(25, 4, 1);

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
(1, 'REPORTÉ RDV Important', '2018-07-05', '300.00', 0, 1, 15),
(2, 'REFUSÉ RDV avec le christ Cosmique', '2018-07-05', '200.00', 1, 0, 15),
(3, 'REFUSÉ \r\nRestaurant chinois', '2018-09-01', '20.00', 1, 0, 15),
(4, 'REPORTÉ Vacances Espagne', '2018-09-08', '500.00', 0, 1, 15),
(5, 'Restaurant chinois', '2018-12-01', '55.00', 0, 0, 15),
(6, '\r\nRestaurant chinois', '2018-07-05', '20.00', 0, 0, 15),
(7, '\r\nRestaurant chinois', '2018-11-01', '55.00', 0, 0, 15),
(18, 'RDV Important', '2018-07-05', '300.00', 0, 0, 21),
(19, 'REFUSE RDV avec le christ Cosmique', '2018-07-05', '200.00', 0, 0, 21),
(20, 'RDV Important', '2018-07-05', '300.00', 0, 0, 21),
(21, 'Vacances Espagne', '2018-09-08', '500.00', 0, 0, 21),
(22, 'RDV avec le christ Cosmique', '2018-09-04', '50.00', 0, 0, 22),
(23, 'Restaurant chinois', '2018-09-01', '200.00', 0, 0, 25);

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
(1, 'Villechalane', 'Louis', 'lvillachane', '2y0qPXDreZiPw', '8 rue des Charmes', '46000', 'Cahors', '2005-12-21', 1),
(2, 'Andre', 'David', 'dandre', '2yWoOqAhpR8ow', '1 rue Petit', '46200', 'Lalbenque', '1998-11-23', 1),
(3, 'Bedos', 'Christian', 'cbedos', '2ynHz1Mw/QsjE', '1 rue Peranud', '46250', 'Montcuq', '1995-01-12', 1),
(4, 'Tusseau', 'Louis', 'ltusseau', '2y4sOh1yviZw2', '22 rue des Ternes', '46123', 'Gramat', '2000-05-01', 1),
(5, 'Bentot', 'Pascal', 'pbentot', '2yVVKy4RTqKys', '11 allée des Cerises', '46512', 'Bessines', '1992-07-09', 1),
(6, 'Bioret', 'Luc', 'lbioret', '2y2v9SnEXHv6g', '1 Avenue gambetta', '46000', 'Cahors', '1998-05-11', 1),
(7, 'Bunisset', 'Francis', 'fbunisset', '2yarnegK2Fbkk', '10 rue des Perles', '93100', 'Montreuil', '1987-10-21', 1),
(8, 'Bunisset', 'Denise', 'dbunisset', '2yKdjJcm0ThSk', '23 rue Manin', '75019', 'paris', '2010-12-05', 1),
(9, 'Cacheux', 'Bernard', 'bcacheux', '2y0wBZm./QV5Q', '114 rue Blanche', '75017', 'Paris', '2009-11-12', 1),
(10, 'Cadic', 'Eric', 'ecadic', '2yLiir5fKD9hs', '123 avenue de la République', '75011', 'Paris', '2008-09-23', 1),
(11, 'Charoze', 'Catherine', 'ccharoze', '2ynMhlCfGnKgE', '100 rue Petit', '75019', 'Paris', '2005-11-12', 1),
(12, 'Clepkens', 'Christophe', 'cclepkens', '2yc6P4lbJLJi.', '12 allée des Anges', '93230', 'Romainville', '2003-08-11', 1),
(13, 'Cottin', 'Vincenne', 'vcottin', '2yydbGDVFYDZI', '36 rue Des Roches', '93100', 'Monteuil', '2001-11-18', 1),
(14, 'Daburon', 'François', 'fdaburon', '2yryieNUbQhAA', '13 rue de Chanzy', '94000', 'Créteil', '2002-02-11', 1),
(15, 'De', 'Philippe', 'pde', '2yBfNvNXjjJR6', '13 rue Barthes', '94000', 'Créteil', '2010-12-14', 1),
(16, 'Debelle', 'Michel', 'mdebelle', '2ys23CtezptZY', '181 avenue Barbusse', '93210', 'Rosny', '2006-11-23', 1),
(17, 'Debelle', 'Jeanne', 'jdebelle', '2yqer6n7m8SWY', '134 allée des Joncs', '44000', 'Nantes', '2000-05-11', 1),
(18, 'Debroise', 'Michel', 'mdebroise', '2yz24xSArLhmM', '2 Bld Jourdain', '44000', 'Nantes', '2001-04-17', 1),
(19, 'Desmarquest', 'Nathalie', 'ndesmarquest', '2yFpwtwKsAa2k', '14 Place d Arc', '45000', 'Orléans', '2005-11-12', 1),
(20, 'Desnost', 'Pierre', 'pdesnost', '2yPgbmy/SxrEk', '16 avenue des Cèdres', '23200', 'Guéret', '2001-02-05', 1),
(21, 'Dudouit', 'Frédéric', 'fdudouit', '2yc7U.TP18GYg', '18 rue de l église', '23120', 'GrandBourg', '2000-08-01', 1),
(22, 'Duncombe', 'Claude', 'cduncombe', '2yeIte3LqoflQ', '19 rue de la tour', '23100', 'La souteraine', '1987-10-10', 1),
(23, 'Enault-Pascreau', 'Céline', 'cenault', '2yXsCOkKoMkVQ', '25 place de la gare', '23200', 'Gueret', '1995-09-01', 1),
(24, 'Eynde', 'Valérie', 'veynde', '2yddPHD6CM/uw', '3 Grand Place', '13015', 'Marseille', '1999-11-01', 1),
(25, 'Finck', 'Jacques', 'jfinck', '2yf1PoJQ4CilM', '10 avenue du Prado', '13002', 'Marseille', '2001-11-10', 1),
(26, 'Frémont', 'Fernande', 'ffremont', '2yJOrYUU.EX1o', '4 route de la mer', '13012', 'Allauh', '1998-10-01', 1),
(27, 'Gest', 'Alain', 'agest', '2yTccQPanKxjg', '30 avenue de la mer', '13025', 'Berre', '1985-11-01', 1),
(28, 'Admin', 'Admin', 'admin', '2yn.4fvaTgedM', 'rue des admins', '91170', 'Viry Zoo', '2018-07-01', 1),
(29, 'Admin', 'Admin', 'admin2', '2yj.4c7I9P99k', 'rue des admins', '91170', 'Viry Zoo', '2018-07-01', 2);

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
  ADD KEY `fk_ficheFrais_etat` (`idEtat`),
  ADD KEY `fk_ficheFrais_visiteur` (`idVisiteur`);

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
  ADD KEY `fk_ligneFraisForfait_fraisForfait` (`idFraisForfait`);

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
  MODIFY `idFicheFrais` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT pour la table `fraisforfait`
--
ALTER TABLE `fraisforfait`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT pour la table `typevisiteur`
--
ALTER TABLE `typevisiteur`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `visiteur`
--
ALTER TABLE `visiteur`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD CONSTRAINT `fk_ficheFrais_etat` FOREIGN KEY (`idEtat`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `fk_ficheFrais_visiteur` FOREIGN KEY (`idVisiteur`) REFERENCES `visiteur` (`id`);

--
-- Contraintes pour la table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD CONSTRAINT `fk_ligneFraisForfait_ficheFrais` FOREIGN KEY (`idFicheFrais`) REFERENCES `fichefrais` (`idFicheFrais`),
  ADD CONSTRAINT `fk_ligneFraisForfait_fraisForfait` FOREIGN KEY (`idFraisForfait`) REFERENCES `fraisforfait` (`id`);

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
