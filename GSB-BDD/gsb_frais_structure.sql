-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Lun 04 Juillet 2011 à 14:08
-- Version du serveur: 5.5.8
-- Version de PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `gsb_frais`
--

-- --------------------------------------------------------

--
-- Structure de la table `FraisForfait`
--

CREATE TABLE IF NOT EXISTS `FraisForfait` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `libelle` char(20) DEFAULT NULL,
  `montant` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;


-- --------------------------------------------------------

--
-- Structure de la table `Etat`
-- id = 2 => id = 'CR'
--

CREATE TABLE IF NOT EXISTS `Etat` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

--
-- Structure de la table `TypeVisiteur`
--

CREATE TABLE IF NOT EXISTS `TypeVisiteur` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Structure de la table `Visiteur`
--

CREATE TABLE IF NOT EXISTS `Visiteur` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nom` char(30) DEFAULT NULL,
  `prenom` char(30)  DEFAULT NULL,
  `login` char(20) DEFAULT NULL,
  `mdp` varchar(255) DEFAULT NULL,
  `adresse` char(30) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `ville` char(30) DEFAULT NULL,
  `dateEmbauche` date DEFAULT NULL,
  `idTypeVisiteur` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`idTypeVisiteur`) REFERENCES TypeVisiteur(`id`)
) ENGINE=InnoDB;


-- --------------------------------------------------------

--
-- Structure de la table `FicheFrais`
--

CREATE TABLE IF NOT EXISTS `fichefrais` (
  `idFicheFrais` int(4) NOT NULL AUTO_INCREMENT,
  `mois` char(6) NOT NULL,
  `nbJustificatifs` int(11) DEFAULT NULL,
  `montantValide` decimal(10,2) DEFAULT NULL,
  `dateModif` date DEFAULT NULL,
  `idEtat` int(4) DEFAULT 2,
  `idVisiteur` int(4) NOT NULL,
  PRIMARY KEY (`idFicheFrais`),
  FOREIGN KEY (`idEtat`) REFERENCES Etat(`id`),
  FOREIGN KEY (`idVisiteur`) REFERENCES Visiteur(`id`)
) ENGINE=InnoDB;


-- --------------------------------------------------------

--
-- Structure de la table `LigneFraisForfait`
--

CREATE TABLE IF NOT EXISTS `LigneFraisForfait` (
  `idFicheFrais` int(4) NOT NULL,
  `idFraisForfait` int(4) NOT NULL,
  `quantite` int(2) DEFAULT 0,
  PRIMARY KEY (`idFicheFrais`,`idFraisForfait`),
  FOREIGN KEY (`idFicheFrais`) REFERENCES FicheFrais(`idFicheFrais`),
  FOREIGN KEY (`idFraisForfait`) REFERENCES FraisForfait(`id`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Structure de la table `LigneFraisHorsForfait`
--

CREATE TABLE IF NOT EXISTS `LigneFraisHorsForfait` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  `invalider` boolean DEFAULT False,
  `reporter` boolean DEFAULT False,
  `idFicheFrais` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`idFicheFrais`) REFERENCES FicheFrais(`idFicheFrais`)
) ENGINE=InnoDB;