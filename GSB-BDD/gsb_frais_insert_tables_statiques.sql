
INSERT INTO `FraisForfait` (libelle, montant) VALUES
('Forfait Etape', 110.00),
('Frais Kilométrique', 0.62),
('Nuitée Hôtel', 80.00),
('Repas Restaurant', 25.00);

--
-- Contenu de la table `Etat`
--

INSERT INTO `Etat` (libelle) VALUES
('Remboursée'),
('Saisie clôturée'),
('Fiche créée, saisie en cours'),
('Validée et mise en paiement');


--
-- Contenu de la table `TypeVisiteur`
--
INSERT INTO `TypeVisiteur` (libelle) VALUES
('Visiteur'),
('Comptable');


-- --------------------------------------------------------

--
-- Contenu de la table `Visiteur`
--

INSERT INTO Visiteur (nom, prenom, login, mdp, adresse, cp, ville, dateEmbauche, idTypeVisiteur) VALUES
('Villechalane', 'Louis', 'lvillachane', '2y0qPXDreZiPw', '8 rue des Charmes', '46000', 'Cahors', '2005-12-21', 1),
('Andre', 'David', 'dandre', '2yWoOqAhpR8ow', '1 rue Petit', '46200', 'Lalbenque', '1998-11-23', 1),
('Bedos', 'Christian', 'cbedos', '2ynHz1Mw/QsjE', '1 rue Peranud', '46250', 'Montcuq', '1995-01-12', 1),
('Tusseau', 'Louis', 'ltusseau', '2y4sOh1yviZw2', '22 rue des Ternes', '46123', 'Gramat', '2000-05-01', 1),
('Bentot', 'Pascal', 'pbentot', '2yVVKy4RTqKys', '11 allée des Cerises', '46512', 'Bessines', '1992-07-09', 1),
('Bioret', 'Luc', 'lbioret', '2y2v9SnEXHv6g', '1 Avenue gambetta', '46000', 'Cahors', '1998-05-11', 1),
('Bunisset', 'Francis', 'fbunisset', '2yarnegK2Fbkk', '10 rue des Perles', '93100', 'Montreuil', '1987-10-21', 1),
('Bunisset', 'Denise', 'dbunisset', '2yKdjJcm0ThSk', '23 rue Manin', '75019', 'paris', '2010-12-05', 1),
('Cacheux', 'Bernard', 'bcacheux', '2y0wBZm./QV5Q', '114 rue Blanche', '75017', 'Paris', '2009-11-12', 1),
('Cadic', 'Eric', 'ecadic', '2yLiir5fKD9hs', '123 avenue de la République', '75011', 'Paris', '2008-09-23', 1),
('Charoze', 'Catherine', 'ccharoze', '2ynMhlCfGnKgE', '100 rue Petit', '75019', 'Paris', '2005-11-12', 1),
('Clepkens', 'Christophe', 'cclepkens', '2yc6P4lbJLJi.', '12 allée des Anges', '93230', 'Romainville', '2003-08-11', 1),
('Cottin', 'Vincenne', 'vcottin', '2yydbGDVFYDZI', '36 rue Des Roches', '93100', 'Monteuil', '2001-11-18', 1),
('Daburon', 'François', 'fdaburon', '2yryieNUbQhAA', '13 rue de Chanzy', '94000', 'Créteil', '2002-02-11', 1),
('De', 'Philippe', 'pde', '2yBfNvNXjjJR6', '13 rue Barthes', '94000', 'Créteil', '2010-12-14', 1),
('Debelle', 'Michel', 'mdebelle', '2ys23CtezptZY', '181 avenue Barbusse', '93210', 'Rosny', '2006-11-23', 1),
('Debelle', 'Jeanne', 'jdebelle', '2yqer6n7m8SWY', '134 allée des Joncs', '44000', 'Nantes', '2000-05-11', 1),
('Debroise', 'Michel', 'mdebroise', '2yz24xSArLhmM', '2 Bld Jourdain', '44000', 'Nantes', '2001-04-17', 1),
('Desmarquest', 'Nathalie', 'ndesmarquest', '2yFpwtwKsAa2k', '14 Place d Arc', '45000', 'Orléans', '2005-11-12', 1),
('Desnost', 'Pierre', 'pdesnost', '2yPgbmy/SxrEk', '16 avenue des Cèdres', '23200', 'Guéret', '2001-02-05', 1),
('Dudouit', 'Frédéric', 'fdudouit', '2yc7U.TP18GYg', '18 rue de l église', '23120', 'GrandBourg', '2000-08-01', 1),
('Duncombe', 'Claude', 'cduncombe', '2yeIte3LqoflQ', '19 rue de la tour', '23100', 'La souteraine', '1987-10-10', 1),
('Enault-Pascreau', 'Céline', 'cenault', '2yXsCOkKoMkVQ', '25 place de la gare', '23200', 'Gueret', '1995-09-01', 1),
('Eynde', 'Valérie', 'veynde', '2yddPHD6CM/uw', '3 Grand Place', '13015', 'Marseille', '1999-11-01', 1),
('Finck', 'Jacques', 'jfinck', '2yf1PoJQ4CilM', '10 avenue du Prado', '13002', 'Marseille', '2001-11-10', 1),
('Frémont', 'Fernande', 'ffremont', '2yJOrYUU.EX1o', '4 route de la mer', '13012', 'Allauh', '1998-10-01', 1),
('Gest', 'Alain', 'agest', '2yTccQPanKxjg', '30 avenue de la mer', '13025', 'Berre', '1985-11-01', 1),
('Admin', 'Admin', 'admin', '2yn.4fvaTgedM', 'rue des admins', '91170', 'Viry Zoo', '2018-07-01', 1),
('Admin', 'Admin', 'admin2', '2yj.4c7I9P99k', 'rue des admins', '91170', 'Viry Zoo', '2018-07-01', 2);

-- --------------------------------------------------------

--
-- Contenu de la table `FicheFrais`
--
INSERT INTO FicheFrais (mois, nbJustificatifs, montantValide, dateModif, idEtat, idVisiteur) VALUES
('201809',DEFAULT,DEFAULT,'2018-05-15',DEFAULT,28),
('201808',DEFAULT,DEFAULT,'2018-05-15',DEFAULT,28);

--
-- Contenu de la table `LigneFraisForfait`
--
INSERT INTO LigneFraisForfait (idFicheFrais, idFraisForfait) VALUES
(1,1),
(1,2),
(1,3),
(1,4);

--
-- Contenu de la table `LigneFraisHorsForfait`
--
INSERT INTO LigneFraisHorsForfait (libelle, date, montant, idFicheFrais) VALUES
('Restaurant Indien','2018-09-08',120,1),
('Voyage Liban','2018-08-08',180,2);