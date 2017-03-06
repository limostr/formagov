-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1:3308
-- Généré le :  Lun 06 Mars 2017 à 10:57
-- Version du serveur :  10.1.19-MariaDB
-- Version de PHP :  7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `tutorat`
--

-- --------------------------------------------------------

--
-- Structure de la table `activiteelearning`
--

CREATE TABLE `activiteelearning` (
  `idactiviteelearning` varchar(45) NOT NULL,
  `labelactivite` varchar(255) DEFAULT NULL,
  `descactivite` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `activitepratique`
--

CREATE TABLE `activitepratique` (
  `idactivitepratique` varchar(45) NOT NULL,
  `labelactivitepratique` varchar(255) DEFAULT NULL,
  `descactivitepratique` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `activitepratiquemodule`
--

CREATE TABLE `activitepratiquemodule` (
  `idactivitepratique` varchar(45) NOT NULL,
  `idModule` int(11) NOT NULL,
  `idtypevalidation` varchar(25) NOT NULL,
  `volumehoraire` varchar(25) DEFAULT NULL,
  `descactivitepratmodule` text,
  `remarqueactivitepratiquem` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `anneeuniv`
--

CREATE TABLE `anneeuniv` (
  `idanneeuniv` varchar(25) NOT NULL,
  `labelanneeuniv` varchar(45) DEFAULT NULL,
  `descanneeuniv` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `composanteval`
--

CREATE TABLE `composanteval` (
  `idcomposanteval` varchar(25) NOT NULL,
  `labelcompeval` varchar(255) DEFAULT NULL,
  `desceval` text,
  `possederattrapage` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `composantregime`
--

CREATE TABLE `composantregime` (
  `idRegime` varchar(25) NOT NULL,
  `idcomposanteval` varchar(25) NOT NULL,
  `possederattrapagecomp` tinyint(4) DEFAULT NULL,
  `idtypevalidation` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `enseignants`
--

CREATE TABLE `enseignants` (
  `idpersonnes` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `enseignantsmodule`
--

CREATE TABLE `enseignantsmodule` (
  `idpersonnes` varchar(25) NOT NULL,
  `idModule` int(11) NOT NULL,
  `idanneeuniv` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `enseignement`
--

CREATE TABLE `enseignement` (
  `idTypeenseignement` varchar(25) NOT NULL,
  `idModule` int(11) NOT NULL,
  `valumehoraire` varchar(45) DEFAULT NULL,
  `descenseignement` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `enseignementelearning`
--

CREATE TABLE `enseignementelearning` (
  `idactiviteelearning` varchar(45) NOT NULL,
  `idTypeenseignement` varchar(25) NOT NULL,
  `idModule` int(11) NOT NULL,
  `seuileval` decimal(5,2) DEFAULT NULL,
  `descengelearning` text,
  `remarqueee` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `formations`
--

CREATE TABLE `formations` (
  `idformations` int(11) NOT NULL,
  `idpereformations` int(11) DEFAULT NULL,
  `idtypeformation` int(11) NOT NULL,
  `codeformation` varchar(512) DEFAULT NULL,
  `abrev` varchar(512) DEFAULT NULL,
  `Label` text,
  `Labelar` text,
  `description` text,
  `codeformationuvt` varchar(45) DEFAULT NULL,
  `codeformationmis` varchar(45) DEFAULT NULL,
  `siteweb` text,
  `niveau` varchar(45) DEFAULT NULL,
  `modeformation` varchar(45) DEFAULT NULL,
  `prixdeniveau` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `formations`
--

INSERT INTO `formations` (`idformations`, `idpereformations`, `idtypeformation`, `codeformation`, `abrev`, `Label`, `Labelar`, `description`, `codeformationuvt`, `codeformationmis`, `siteweb`, `niveau`, `modeformation`, `prixdeniveau`) VALUES
(18, NULL, 1, NULL, 'Licences', 'Licences', 'Licences', 'Licences', 'Licences', 'Licences', 'www.uvt.rnu.tn', NULL, 'Annuelle', NULL),
(19, 20, 3, NULL, 'Management', 'Management', 'Management', 'Management', 'Management', 'Management', 'www.uvt.rnu.tn', NULL, 'Annuelle', NULL),
(20, 18, 2, NULL, 'Sciences de gestion', 'Sciences de gestion', 'Sciences de gestion', 'Sciences de gestion', 'Sciences de gestion', 'Sciences de gestion', 'www.uvt.rnu.tn', NULL, 'Annuelle', NULL),
(21, 20, 3, NULL, 'Comptabilité', 'Comptabilité', 'Comptabilité', 'Comptabilité', 'Comptabilité', 'Comptabilité', 'www.uvt.rnu.tn', NULL, 'Annuelle', NULL),
(22, 19, 4, NULL, 'LAM-GPME', 'Licence Appliquée en Management ', 'LAM-GPME', 'LAM-GPME', 'LAM-GPME', 'LAM-GPME', 'LAM-GPME', NULL, 'Annuelle', NULL),
(23, 19, 4, NULL, 'LAM-MQSE', 'Licence Appliquée en Management', 'LAM-MQSE', 'LAM-MQSE', 'LAM-MQSE', 'LAM-MQSE', 'www.uvt.rnu.tn', NULL, 'Annuelle', NULL),
(24, 21, 4, NULL, 'LGC', 'Licence Fondamentale en Gestion Comptable', 'LGC', 'LGC', 'LGC', 'LGC', 'www.uvt.rnu.tn', NULL, 'Annuelle', NULL),
(25, 18, 13, NULL, 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', NULL, 'Annuelle', NULL),
(26, 25, 3, NULL, 'S.T.I.C', 'Sciences et Technologies de l''Information et de Communication', 'S.T.I.C', 'S.T.I.C', 'S.T.I.C', 'S.T.I.C', 'www.uvt.rnu.tn', NULL, 'Annuelle', NULL),
(27, 26, 4, NULL, 'LASTIC', 'Licence Appliquée en Sciences et Techniques de l''Information et de Communication ', 'Licence Appliquée en Sciences et Techniques de l''information et de Communication', 'LASTIC', 'LASTIC', 'LASTIC', 'LASTIC', NULL, 'Annuelle', NULL),
(28, 26, 4, NULL, 'EOLES', 'EOLES', 'EOLES', 'EOLES', 'EOLES', 'EOLES', 'EOLES', NULL, 'Annuelle', NULL),
(29, NULL, 12, NULL, 'Mastères', 'Mastères', 'Mastères', 'Mastères', 'Master', 'Master', 'Mastères', NULL, 'Annuelle', NULL),
(30, 29, 13, NULL, 'Télécommunications', 'Télécommunications', 'Télécommunications', 'Télécommunications', 'Télécommunications', 'Télécommunications', 'Télécommunications', NULL, 'Annuelle', NULL),
(31, 29, 13, NULL, 'Génie industriel', 'Génie industriel', 'Génie industriel', 'Génie industriel', 'Génie industriel', 'Génie industriel', 'Génie industriel', NULL, 'Annuelle', NULL),
(32, 29, 13, NULL, 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', NULL, 'Annuelle', NULL),
(33, 29, 13, NULL, 'Sport et Éducation Physique', 'Sport et Éducation Physique', 'Sport et Éducation Physique', 'Sport et Éducation Physique', 'Sport', 'Sport', 'Sport et Éducation Physique', NULL, 'Annuelle', NULL),
(34, 30, 3, NULL, 'T.R.I', 'Télécommunications et Réseaux informatiques', 'Télécommunications et Réseaux informatiques', 'Télécommunications et Réseaux informatiques', 'TRI', 'TRI', 'Télécommunications et Réseaux informatiques', NULL, 'Annuelle', NULL),
(35, 34, 4, NULL, 'N2TR', 'Mastère professionnel en Nouvelles Technologies des Télécommunications et Réseaux', 'N2TR', 'N2TR', 'N2TR', 'N2TR', 'N2TR', NULL, 'Annuelle', NULL),
(36, 31, 3, NULL, 'OIE', 'Optimisation, Innovation de l''Entreprise', 'Optimisation, Innovation de l''Entreprise', 'OIE', 'OIE', 'OIE', 'OIE', NULL, 'Annuelle', NULL),
(37, 36, 4, NULL, 'MOME', 'Mastère professionnel en Optimisation et Modernisation de l’Entreprise ', 'MOME', 'MOME', 'MOME', 'MOME', 'MOME', NULL, 'Annuelle', NULL),
(38, 32, 3, NULL, 'Informatique', 'Informatique', 'Informatique', 'Informatique', 'Informatique', 'Informatique', 'Informatique', NULL, 'Annuelle', NULL),
(39, 38, 3, NULL, 'MP2L', 'Mastère professionnel en Logiciels libres : MP2L', 'MP2L', 'MP2L', 'MP2L', 'MP2L', 'MP2L', NULL, 'Annuelle', NULL),
(40, 33, 3, NULL, 'STATPS', 'STATPS', 'STATPS', 'STATPS', 'STATPS', 'STATPS', 'STATPS', NULL, 'Annuelle', NULL),
(41, 40, 14, NULL, 'MP3', 'Mastère Professionnel en Préparation Physique ', 'Mastère Professionnel en Préparation Physique ', 'MP3', 'MP3', 'MP3', 'MP3', NULL, 'Annuelle', NULL),
(42, 40, 14, NULL, 'M2P2', 'Mastère Professionnel en Préparation Mentale', 'Mastère Professionnel en Préparation Mentale', 'M2P2', 'M2P2', 'M2P2', 'M2P2', NULL, 'Annuelle', NULL),
(43, 20, 3, NULL, 'Gestion', 'Gestion', 'التصرف', 'Gestion', 'Gestion', 'Gestion', 'Gestion', NULL, 'Annuelle', NULL),
(44, 43, 14, NULL, 'LAMESN', 'Licence Appliquée en Marketing Electronique et Stratégies Numériques ', 'Licence Appliquée en Marketing Electronique et Stratégies Numériques ', 'LAMESN', 'LAMESN', 'LAMESN', 'LAMESN', NULL, 'Annuelle', NULL),
(45, NULL, 15, NULL, 'Formations', 'Formation Continues', 'Formation', 'Formation Continues', 'FC-00', 'FC-00', 'Formation', NULL, 'Planifier', NULL),
(46, 47, 16, NULL, 'C2i', 'C2i', 'C2i', 'C2i', 'C2i', 'C2i', 'C2i', NULL, 'Annuelle', NULL),
(47, NULL, 15, NULL, 'test', 'test', 'test', 'test', 'test', 'test', 'test', NULL, 'Planifier', NULL),
(48, 18, 13, NULL, 'Sciences économiques et de gestion', 'Sciences économiques et de gestion', 'Sciences économiques et de gestion', 'Sciences économiques et de gestion', 'SC-G', 'SC-G', 'Sciences économiques et de gestion', NULL, 'Annuelle', NULL),
(49, 48, 3, NULL, 'Administration des affaires', 'Administration des affaires', 'Administration des affaires', 'Administration des affaires', 'AD-AF', 'AD-AF', 'Administration des affaires', NULL, 'Annuelle', NULL),
(50, 49, 14, NULL, 'L3A-PME', 'Licence appliquée en administration des affaires: L3A-PME', 'GPME', 'GPME', 'GPME-3', 'GPME-3', 'GPME', NULL, 'Annuelle', NULL),
(51, 29, 13, NULL, 'Sciences Économiques & Gestion (SEG)', 'Sciences Économiques & Gestion (SEG)', 'SEG', 'Sciences Économiques & Gestion (SEG)', 'SCE-G-M', 'SCE-G-M', 'SEG', NULL, 'Annuelle', NULL),
(52, 51, 3, NULL, 'MI', 'Management Intégré', 'Management Intégré', 'Management intégré', 'MI-M', 'MI-M', 'Management intégré', NULL, 'Annuelle', NULL),
(53, 52, 4, NULL, 'MPQSE', 'Mastère Professionnel en Management Intégré : Qualité-Sécurité et Environnement ', 'Mastère Professionnel en Management Intégré : Qualité-Sécurité et Environnement ', 'Mastère Professionnel en Management intégré : Qualité-Sécurité et environnement ', 'MI-QSE', 'MI-QSE', 'Mastère Professionnel en Management intégré : Qualité-Sécurité et environnement ', NULL, 'Annuelle', NULL),
(54, 49, 14, NULL, 'L3A-QSE', 'Licence appliquée en administration des affaires: L3A-QSE', 'L3A-QSE', 'L3A-QSE', 'LA3-QSE', 'LA3-QSE', 'L3A-QSE', NULL, 'Annuelle', NULL),
(55, 47, 14, NULL, 'C2i', 'C2i', 'C2i', 'C2i', 'C2i-SP', 'C2i-SP', 'C2i', NULL, 'Planifier', NULL),
(56, 45, 15, NULL, 'Formation Continues', 'Formation Continues', 'Formation Continues', 'Formation Continues', 'CERTIF', 'CERTIF', 'Formation Continues', NULL, 'Planifier', NULL),
(57, 56, 14, NULL, 'C2i', 'Certificat Informatique et Internet : C2i', 'C2i', 'C2i', 'C2i', 'C2i', 'C2i', NULL, '', NULL),
(58, 56, 14, NULL, 'Anglais', 'Anglais', 'Anglais', 'Anglais', 'Anglais', 'Anglais', 'Anglais', NULL, 'Annuelle', NULL),
(59, 19, 4, NULL, 'LAM', 'Licence Appliquée en Management', 'Licence Appliquée en Management', 'Licence appliquée en management : MQSE-GPME', 'MQSE-GPME', 'MQSE-GPME', 'Licence appliquée en management : MQSE-GPME', NULL, 'Annuelle', NULL),
(60, 29, 13, NULL, 'Gestion', 'Gestion', 'Gestion', 'Gestion', 'Gestion-MPMP', 'Gestion-MPMP', 'Gestion', NULL, 'Annuelle', NULL),
(61, 60, 3, NULL, 'Management', 'Management', 'Management', 'Management', 'PMPM-MAN', 'PMPM-MAN', 'Management', NULL, 'Annuelle', NULL),
(62, 61, 4, NULL, 'MPMP', 'Management des Projets', 'Management des Projets', 'Management des Projets', 'MPMP-D', 'MPMP-D', 'Management des Projets', NULL, 'Annuelle', NULL),
(63, 47, 14, NULL, 'VAUTM', 'Validation_Anglais_UTM', 'Validation_Anglais_UTM', 'Validation_Anglais_UTM', 'UTM1', 'UTM1', 'wwv', NULL, 'Planifier', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `groupes`
--

CREATE TABLE `groupes` (
  `idgroupes` int(11) NOT NULL,
  `idniveauformation` int(11) NOT NULL,
  `abrevgroupe` varchar(45) DEFAULT NULL,
  `nbrmaxetudiant` int(11) DEFAULT NULL,
  `nbretudiant` int(11) DEFAULT NULL,
  `descgroupe` text,
  `remarquegroupe` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `informationpersonnel`
--

CREATE TABLE `informationpersonnel` (
  `idinformationpersonnel` int(11) NOT NULL,
  `idpersonnes` varchar(25) NOT NULL,
  `idlangue` varchar(10) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `lieudenaissance` varchar(45) DEFAULT NULL,
  `adress` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `langue`
--

CREATE TABLE `langue` (
  `idlangue` varchar(10) NOT NULL,
  `labellangue` varchar(45) DEFAULT NULL,
  `drapeau` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `levelformation`
--

CREATE TABLE `levelformation` (
  `idlevelformation` int(11) NOT NULL,
  `labellevel` varchar(45) DEFAULT NULL,
  `desclevel` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `levelformation`
--

INSERT INTO `levelformation` (`idlevelformation`, `labellevel`, `desclevel`) VALUES
(1, '1ére', NULL),
(2, '2ème', NULL),
(3, '3ème', NULL),
(4, '4ème', NULL),
(5, '5ème', NULL),
(6, '6ème', NULL),
(7, '7ème', NULL),
(8, '8ème', NULL),
(9, '9ème', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `listetypeformation`
--

CREATE TABLE `listetypeformation` (
  `idlistetypeformation` int(11) NOT NULL,
  `idtypeformation` int(11) NOT NULL,
  `labellistform` varchar(512) DEFAULT NULL,
  `abrevlist` varchar(512) DEFAULT NULL,
  `desclisttypeform` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `modelcomposantregime`
--

CREATE TABLE `modelcomposantregime` (
  `idcomposanteval` varchar(25) NOT NULL,
  `idmodelregime` varchar(25) NOT NULL,
  `mpossederattrapagecomp` tinyint(4) DEFAULT NULL,
  `idtypevalidation` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `modelformation`
--

CREATE TABLE `modelformation` (
  `idmodelformation` int(11) NOT NULL,
  `idtypeformation` int(11) NOT NULL,
  `idperemodelformation` int(11) DEFAULT NULL,
  `labelmodelformation` varchar(512) DEFAULT NULL,
  `descmodelform` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `modelregime`
--

CREATE TABLE `modelregime` (
  `idmodelregime` varchar(25) NOT NULL,
  `labelmodelregime` varchar(512) DEFAULT NULL,
  `descmodelregime` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `idModule` int(11) NOT NULL,
  `idue` int(11) DEFAULT NULL,
  `idTypemodule` varchar(25) NOT NULL,
  `idniveauformation` int(11) NOT NULL,
  `idperiode` varchar(25) NOT NULL,
  `credit` int(11) DEFAULT NULL,
  `coefficient` decimal(5,2) DEFAULT NULL,
  `idRegime` varchar(25) NOT NULL,
  `idNature` varchar(25) NOT NULL,
  `Nombredesemaine` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `moduleperiode`
--

CREATE TABLE `moduleperiode` (
  `idmoduleperiode` int(11) NOT NULL,
  `idModule` int(11) NOT NULL,
  `idperiodeformation` int(11) NOT NULL,
  `descmoduleperiode` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `nature`
--

CREATE TABLE `nature` (
  `idNature` varchar(25) NOT NULL,
  `labelnature` varchar(255) DEFAULT NULL,
  `descnature` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `niveauformation`
--

CREATE TABLE `niveauformation` (
  `idniveauformation` int(11) NOT NULL,
  `idformations` int(11) NOT NULL,
  `labelnivformation` varchar(512) DEFAULT NULL,
  `pagesite` text,
  `idlevelformation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `niveauformation`
--

INSERT INTO `niveauformation` (`idniveauformation`, `idformations`, `labelnivformation`, `pagesite`, `idlevelformation`) VALUES
(18, 27, '3ème année', '3ème année', 3),
(19, 28, '3ème année', '3ème année', 3),
(20, 35, '1ère Année', '1ère Année', 1),
(21, 35, '2ème Année', '2ème Année', 2),
(22, 37, '1ère Année', '1500DT', 1),
(23, 37, '2ème Année', '1500DT', 2),
(24, 39, '1ère Année', '1500DT', 1),
(25, 39, '2ème Année', '2ème Année', 2),
(26, 22, '1ère Année', 'www.uvt.rnu.tn', 1),
(27, 22, '2ème Année', 'www.uvt.rnu.tn', 2),
(28, 22, '3ème Année', 'www.uvt.rnu.tn', 3),
(29, 23, '1ère Année', 'www.uvt.rnu.tn', 2),
(31, 23, '3ème Année', 'www.uvt.rnu.tn', 3),
(32, 24, '3ème Année', 'www.uvt.rnu.tn', 3),
(33, 41, '1ère Année', 'www.uvt.rnu.tn', 1),
(34, 41, '2éme Année', 'www.uvt.rnu.tn', 1),
(36, 42, '2ème Année', 'www.uvt.rnu.tn', 2),
(37, 44, '3ème Année', 'LAMSEN', 3),
(38, 45, 'C2i', 'C2i', 1),
(41, 50, '3ème Année', '3ème Année', 3),
(42, 53, '1ère Année', '1ère Année', 1),
(43, 53, '2ème Année', '2ème Année', 2),
(44, 54, '3ème Année', '3ème Année', 3),
(45, 57, 'C2i-1', 'C2i-1', 1),
(46, 58, 'Ongoing training in English : OTE', 'Ongoing training in English', 1),
(47, 59, '1ère Année', '1ère Année', 1),
(48, 58, 'Anglais-UTM', 'uvt', 1),
(49, 62, '2ème Année', '2ème Année', 2),
(52, 58, 'Validation_Anglais_UTM1', 'test', 2),
(53, 58, 'Test_Anglais_UTM2', 'test', 2),
(54, 58, 'Validation_Anglais_OTE13', 'test', 2),
(55, 58, 'Test_Anglais_OTE14', 'test', 3),
(56, 58, 'Validation_Anglais_UTM2', 'www.uvt.rnu.tn', 2),
(57, 58, 'Test Anglais général (OTE15)', 'www.uvt.rnu.tn', 4),
(58, 58, 'Test Anglais des affaires (OTE15)', 'www.uvt.rnu.tn', 4),
(59, 58, 'Test Communication (OTE15)', 'www.uvt.rnu.tn', 4);

-- --------------------------------------------------------

--
-- Structure de la table `periode`
--

CREATE TABLE `periode` (
  `idperiode` varchar(25) NOT NULL,
  `idlevelformation` int(11) NOT NULL,
  `labelperiode` varchar(512) DEFAULT NULL,
  `descperiode` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `periode`
--

INSERT INTO `periode` (`idperiode`, `idlevelformation`, `labelperiode`, `descperiode`) VALUES
('S1', 1, 'Semestre 1', NULL),
('S2', 1, 'Semestre 2', NULL),
('S3', 2, 'Semestre 3', NULL),
('S4', 2, 'Semestre 4', NULL),
('S5', 3, 'Semestre 5', NULL),
('S6', 3, 'Semestre 6', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `periodeformation`
--

CREATE TABLE `periodeformation` (
  `idperiodeformation` int(11) NOT NULL,
  `idformations` int(11) NOT NULL,
  `idperiode` varchar(25) NOT NULL,
  `debutsemaine` int(11) DEFAULT NULL,
  `finsemaine` int(11) DEFAULT NULL,
  `descperiodeforma` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `permissionformationrole`
--

CREATE TABLE `permissionformationrole` (
  `idpermissionformationrole` varchar(45) NOT NULL,
  `labelpermission` varchar(255) DEFAULT NULL,
  `descpermission` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `permissionsurformation`
--

CREATE TABLE `permissionsurformation` (
  `idroleresponsable` varchar(45) NOT NULL,
  `idpermissionformationrole` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `personnes`
--

CREATE TABLE `personnes` (
  `idpersonnes` varchar(25) NOT NULL,
  `matricule` varchar(45) DEFAULT NULL,
  `rib` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `regime`
--

CREATE TABLE `regime` (
  `idRegime` varchar(25) NOT NULL,
  `labelregime` varchar(255) DEFAULT NULL,
  `descregime` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `roleresponsable`
--

CREATE TABLE `roleresponsable` (
  `idroleresponsable` varchar(45) NOT NULL,
  `labelroleresponsable` varchar(255) DEFAULT NULL,
  `descroleresponsable` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `roleutilisateursurformation`
--

CREATE TABLE `roleutilisateursurformation` (
  `idniveauformation` int(11) NOT NULL,
  `idroleresponsable` varchar(45) NOT NULL,
  `idpersonnes` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `typeenseignement`
--

CREATE TABLE `typeenseignement` (
  `idTypeenseignement` varchar(25) NOT NULL COMMENT 'Type enseignement : TP, TD, Cour Intégré CI,...',
  `labeltypeenseignement` varchar(255) DEFAULT NULL,
  `desctypeenseignement` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `typeformation`
--

CREATE TABLE `typeformation` (
  `idtypeformation` int(11) NOT NULL,
  `desctype` varchar(45) DEFAULT NULL,
  `labeltype` varchar(45) DEFAULT NULL,
  `labeltypear` varchar(45) DEFAULT NULL,
  `labetypean` varchar(45) DEFAULT NULL,
  `idpertypeformation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `typeformation`
--

INSERT INTO `typeformation` (`idtypeformation`, `desctype`, `labeltype`, `labeltypear`, `labetypean`, `idpertypeformation`) VALUES
(1, NULL, 'Licence Appliquée', 'Licence Appliquée', 'Licence Appliquée', NULL),
(2, NULL, 'Domaine', 'Domaine', 'Domaine', 1),
(3, NULL, 'Mention', 'Mention', 'Mention', 2),
(4, NULL, 'Parcours', 'Parcours', 'Parcours', 3),
(5, NULL, 'Licence Fondamentale', 'Licence Fondamentale', 'Licence Fondamentale', NULL),
(6, NULL, 'Domaine', 'Domaine', 'Domaine', 5),
(7, NULL, 'Mention', 'Mention', 'Mention', 6),
(8, NULL, 'Parcours', 'Parcours', 'Parcours', 7),
(9, NULL, 'Cours Libres', 'Cours Libres', 'Cours Libres', NULL),
(10, NULL, 'Domaine', 'Domaine', 'Domaine', 9),
(11, NULL, 'Spécialité', 'Spécialité', 'Spécialité', 10),
(12, NULL, 'Master', 'Master', 'Master', NULL),
(13, NULL, 'Domaine', 'Domaine', 'Domaine', 12),
(14, NULL, 'specialite', 'specialite', 'specialite', 13),
(15, NULL, 'Formation', 'Formation', 'Formation', NULL),
(16, NULL, 'certificat', 'certificat', 'certificat', 15);

-- --------------------------------------------------------

--
-- Structure de la table `typemodule`
--

CREATE TABLE `typemodule` (
  `idTypemodule` varchar(25) NOT NULL,
  `labeltypemodule` varchar(255) DEFAULT NULL,
  `desctypemodule` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `typevalidation`
--

CREATE TABLE `typevalidation` (
  `idtypevalidation` varchar(25) NOT NULL,
  `labeltypevalidation` varchar(512) DEFAULT NULL,
  `desctypevalidation` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `typevalidation`
--

INSERT INTO `typevalidation` (`idtypevalidation`, `labeltypevalidation`, `desctypevalidation`) VALUES
('Alphanumerique', 'Alphanumerique', NULL),
('Note', 'Note', NULL),
('Validation', 'Validation', NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `activiteelearning`
--
ALTER TABLE `activiteelearning`
  ADD PRIMARY KEY (`idactiviteelearning`);

--
-- Index pour la table `activitepratique`
--
ALTER TABLE `activitepratique`
  ADD PRIMARY KEY (`idactivitepratique`);

--
-- Index pour la table `activitepratiquemodule`
--
ALTER TABLE `activitepratiquemodule`
  ADD PRIMARY KEY (`idactivitepratique`,`idModule`),
  ADD KEY `fk_activitepratique_has_Module_Module1_idx` (`idModule`),
  ADD KEY `fk_activitepratique_has_Module_activitepratique1_idx` (`idactivitepratique`),
  ADD KEY `fk_activitepratiquemodule_typevalidation1_idx` (`idtypevalidation`);

--
-- Index pour la table `anneeuniv`
--
ALTER TABLE `anneeuniv`
  ADD PRIMARY KEY (`idanneeuniv`);

--
-- Index pour la table `composanteval`
--
ALTER TABLE `composanteval`
  ADD PRIMARY KEY (`idcomposanteval`);

--
-- Index pour la table `composantregime`
--
ALTER TABLE `composantregime`
  ADD PRIMARY KEY (`idRegime`,`idcomposanteval`),
  ADD KEY `fk_Regime_has_composanteval_composanteval1_idx` (`idcomposanteval`),
  ADD KEY `fk_Regime_has_composanteval_Regime1_idx` (`idRegime`),
  ADD KEY `fk_composantregime_typevalidation1_idx` (`idtypevalidation`);

--
-- Index pour la table `enseignants`
--
ALTER TABLE `enseignants`
  ADD PRIMARY KEY (`idpersonnes`);

--
-- Index pour la table `enseignantsmodule`
--
ALTER TABLE `enseignantsmodule`
  ADD PRIMARY KEY (`idpersonnes`,`idModule`,`idanneeuniv`),
  ADD KEY `fk_enseignants_has_Module_Module1_idx` (`idModule`),
  ADD KEY `fk_enseignants_has_Module_enseignants1_idx` (`idpersonnes`),
  ADD KEY `fk_enseignantsmodule_anneeuniv1_idx` (`idanneeuniv`);

--
-- Index pour la table `enseignement`
--
ALTER TABLE `enseignement`
  ADD PRIMARY KEY (`idTypeenseignement`,`idModule`),
  ADD KEY `fk_Typeenseignement_has_Module_Module1_idx` (`idModule`),
  ADD KEY `fk_Typeenseignement_has_Module_Typeenseignement1_idx` (`idTypeenseignement`);

--
-- Index pour la table `enseignementelearning`
--
ALTER TABLE `enseignementelearning`
  ADD PRIMARY KEY (`idactiviteelearning`,`idTypeenseignement`,`idModule`),
  ADD KEY `fk_activiteelearning_has_enseignement_enseignement1_idx` (`idTypeenseignement`,`idModule`),
  ADD KEY `fk_activiteelearning_has_enseignement_activiteelearning1_idx` (`idactiviteelearning`);

--
-- Index pour la table `formations`
--
ALTER TABLE `formations`
  ADD PRIMARY KEY (`idformations`),
  ADD KEY `fk_formations_formations1_idx` (`idpereformations`),
  ADD KEY `fk_formations_typeformation1_idx` (`idtypeformation`);

--
-- Index pour la table `groupes`
--
ALTER TABLE `groupes`
  ADD PRIMARY KEY (`idgroupes`),
  ADD KEY `fk_groupes_niveauformation1_idx` (`idniveauformation`);

--
-- Index pour la table `informationpersonnel`
--
ALTER TABLE `informationpersonnel`
  ADD PRIMARY KEY (`idinformationpersonnel`),
  ADD KEY `fk_informationpersonnel_personnes1_idx` (`idpersonnes`),
  ADD KEY `fk_informationpersonnel_langue1_idx` (`idlangue`);

--
-- Index pour la table `langue`
--
ALTER TABLE `langue`
  ADD PRIMARY KEY (`idlangue`);

--
-- Index pour la table `levelformation`
--
ALTER TABLE `levelformation`
  ADD PRIMARY KEY (`idlevelformation`);

--
-- Index pour la table `listetypeformation`
--
ALTER TABLE `listetypeformation`
  ADD PRIMARY KEY (`idlistetypeformation`),
  ADD KEY `fk_listetypeformation_typeformation1_idx` (`idtypeformation`);

--
-- Index pour la table `modelcomposantregime`
--
ALTER TABLE `modelcomposantregime`
  ADD PRIMARY KEY (`idcomposanteval`,`idmodelregime`),
  ADD KEY `fk_composanteval_has_modelregime_modelregime1_idx` (`idmodelregime`),
  ADD KEY `fk_composanteval_has_modelregime_composanteval1_idx` (`idcomposanteval`),
  ADD KEY `fk_modelcomposantregime_typevalidation1_idx` (`idtypevalidation`);

--
-- Index pour la table `modelformation`
--
ALTER TABLE `modelformation`
  ADD PRIMARY KEY (`idmodelformation`),
  ADD KEY `fk_modelformation_modelformation1_idx` (`idperemodelformation`),
  ADD KEY `fk_modelformation_typeformation1_idx` (`idtypeformation`);

--
-- Index pour la table `modelregime`
--
ALTER TABLE `modelregime`
  ADD PRIMARY KEY (`idmodelregime`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`idModule`),
  ADD KEY `fk_Module_Module_idx` (`idue`),
  ADD KEY `fk_Module_Typemodule1_idx` (`idTypemodule`),
  ADD KEY `fk_Module_Regime1_idx` (`idRegime`),
  ADD KEY `fk_Module_Nature1_idx` (`idNature`),
  ADD KEY `fk_Module_niveauformation1_idx` (`idniveauformation`),
  ADD KEY `fk_Module_periode1_idx` (`idperiode`);

--
-- Index pour la table `moduleperiode`
--
ALTER TABLE `moduleperiode`
  ADD PRIMARY KEY (`idmoduleperiode`),
  ADD KEY `fk_moduleperiode_module1_idx` (`idModule`),
  ADD KEY `fk_moduleperiode_periodeformation1_idx` (`idperiodeformation`);

--
-- Index pour la table `nature`
--
ALTER TABLE `nature`
  ADD PRIMARY KEY (`idNature`);

--
-- Index pour la table `niveauformation`
--
ALTER TABLE `niveauformation`
  ADD PRIMARY KEY (`idniveauformation`),
  ADD KEY `fk_niveauformation_formations1_idx` (`idformations`),
  ADD KEY `fk_niveauformation_levelformation1_idx` (`idlevelformation`);

--
-- Index pour la table `periode`
--
ALTER TABLE `periode`
  ADD PRIMARY KEY (`idperiode`),
  ADD KEY `fk_periode_levelformation1_idx` (`idlevelformation`);

--
-- Index pour la table `periodeformation`
--
ALTER TABLE `periodeformation`
  ADD PRIMARY KEY (`idperiodeformation`),
  ADD KEY `fk_periodeformation_formations1_idx` (`idformations`),
  ADD KEY `fk_periodeformation_periode1_idx` (`idperiode`);

--
-- Index pour la table `permissionformationrole`
--
ALTER TABLE `permissionformationrole`
  ADD PRIMARY KEY (`idpermissionformationrole`);

--
-- Index pour la table `permissionsurformation`
--
ALTER TABLE `permissionsurformation`
  ADD PRIMARY KEY (`idroleresponsable`,`idpermissionformationrole`),
  ADD KEY `fk_roleresponsable_has_permissionformationrole_permissionfo_idx` (`idpermissionformationrole`),
  ADD KEY `fk_roleresponsable_has_permissionformationrole_roleresponsa_idx` (`idroleresponsable`);

--
-- Index pour la table `personnes`
--
ALTER TABLE `personnes`
  ADD PRIMARY KEY (`idpersonnes`);

--
-- Index pour la table `regime`
--
ALTER TABLE `regime`
  ADD PRIMARY KEY (`idRegime`);

--
-- Index pour la table `roleresponsable`
--
ALTER TABLE `roleresponsable`
  ADD PRIMARY KEY (`idroleresponsable`);

--
-- Index pour la table `roleutilisateursurformation`
--
ALTER TABLE `roleutilisateursurformation`
  ADD PRIMARY KEY (`idniveauformation`,`idroleresponsable`,`idpersonnes`),
  ADD KEY `fk_niveauformation_has_roleresponsable_roleresponsable1_idx` (`idroleresponsable`),
  ADD KEY `fk_niveauformation_has_roleresponsable_niveauformation1_idx` (`idniveauformation`),
  ADD KEY `fk_niveauformation_has_roleresponsable_personnes1_idx` (`idpersonnes`);

--
-- Index pour la table `typeenseignement`
--
ALTER TABLE `typeenseignement`
  ADD PRIMARY KEY (`idTypeenseignement`);

--
-- Index pour la table `typeformation`
--
ALTER TABLE `typeformation`
  ADD PRIMARY KEY (`idtypeformation`),
  ADD KEY `fk_typeformation_typeformation1_idx` (`idpertypeformation`);

--
-- Index pour la table `typemodule`
--
ALTER TABLE `typemodule`
  ADD PRIMARY KEY (`idTypemodule`);

--
-- Index pour la table `typevalidation`
--
ALTER TABLE `typevalidation`
  ADD PRIMARY KEY (`idtypevalidation`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `formations`
--
ALTER TABLE `formations`
  MODIFY `idformations` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT pour la table `groupes`
--
ALTER TABLE `groupes`
  MODIFY `idgroupes` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `listetypeformation`
--
ALTER TABLE `listetypeformation`
  MODIFY `idlistetypeformation` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `modelformation`
--
ALTER TABLE `modelformation`
  MODIFY `idmodelformation` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `module`
--
ALTER TABLE `module`
  MODIFY `idModule` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `moduleperiode`
--
ALTER TABLE `moduleperiode`
  MODIFY `idmoduleperiode` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `niveauformation`
--
ALTER TABLE `niveauformation`
  MODIFY `idniveauformation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT pour la table `periodeformation`
--
ALTER TABLE `periodeformation`
  MODIFY `idperiodeformation` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `typeformation`
--
ALTER TABLE `typeformation`
  MODIFY `idtypeformation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `activitepratiquemodule`
--
ALTER TABLE `activitepratiquemodule`
  ADD CONSTRAINT `fk_activitepratique_has_Module_Module1` FOREIGN KEY (`idModule`) REFERENCES `module` (`idModule`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_activitepratique_has_Module_activitepratique1` FOREIGN KEY (`idactivitepratique`) REFERENCES `activitepratique` (`idactivitepratique`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_activitepratiquemodule_typevalidation1` FOREIGN KEY (`idtypevalidation`) REFERENCES `typevalidation` (`idtypevalidation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `composantregime`
--
ALTER TABLE `composantregime`
  ADD CONSTRAINT `fk_Regime_has_composanteval_Regime1` FOREIGN KEY (`idRegime`) REFERENCES `regime` (`idRegime`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Regime_has_composanteval_composanteval1` FOREIGN KEY (`idcomposanteval`) REFERENCES `composanteval` (`idcomposanteval`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_composantregime_typevalidation1` FOREIGN KEY (`idtypevalidation`) REFERENCES `typevalidation` (`idtypevalidation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `enseignants`
--
ALTER TABLE `enseignants`
  ADD CONSTRAINT `fk_enseignants_personnes1` FOREIGN KEY (`idpersonnes`) REFERENCES `personnes` (`idpersonnes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `enseignantsmodule`
--
ALTER TABLE `enseignantsmodule`
  ADD CONSTRAINT `fk_enseignants_has_Module_Module1` FOREIGN KEY (`idModule`) REFERENCES `module` (`idModule`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_enseignants_has_Module_enseignants1` FOREIGN KEY (`idpersonnes`) REFERENCES `enseignants` (`idpersonnes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_enseignantsmodule_anneeuniv1` FOREIGN KEY (`idanneeuniv`) REFERENCES `anneeuniv` (`idanneeuniv`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `enseignement`
--
ALTER TABLE `enseignement`
  ADD CONSTRAINT `fk_Typeenseignement_has_Module_Module1` FOREIGN KEY (`idModule`) REFERENCES `module` (`idModule`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Typeenseignement_has_Module_Typeenseignement1` FOREIGN KEY (`idTypeenseignement`) REFERENCES `typeenseignement` (`idTypeenseignement`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `enseignementelearning`
--
ALTER TABLE `enseignementelearning`
  ADD CONSTRAINT `fk_activiteelearning_has_enseignement_activiteelearning1` FOREIGN KEY (`idactiviteelearning`) REFERENCES `activiteelearning` (`idactiviteelearning`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_activiteelearning_has_enseignement_enseignement1` FOREIGN KEY (`idTypeenseignement`,`idModule`) REFERENCES `enseignement` (`idTypeenseignement`, `idModule`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `formations`
--
ALTER TABLE `formations`
  ADD CONSTRAINT `fk_formations_formations1` FOREIGN KEY (`idpereformations`) REFERENCES `formations` (`idformations`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_formations_typeformation1` FOREIGN KEY (`idtypeformation`) REFERENCES `typeformation` (`idtypeformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `groupes`
--
ALTER TABLE `groupes`
  ADD CONSTRAINT `fk_groupes_niveauformation1` FOREIGN KEY (`idniveauformation`) REFERENCES `niveauformation` (`idniveauformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `informationpersonnel`
--
ALTER TABLE `informationpersonnel`
  ADD CONSTRAINT `fk_informationpersonnel_langue1` FOREIGN KEY (`idlangue`) REFERENCES `langue` (`idlangue`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_informationpersonnel_personnes1` FOREIGN KEY (`idpersonnes`) REFERENCES `personnes` (`idpersonnes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `listetypeformation`
--
ALTER TABLE `listetypeformation`
  ADD CONSTRAINT `fk_listetypeformation_typeformation1` FOREIGN KEY (`idtypeformation`) REFERENCES `typeformation` (`idtypeformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `modelcomposantregime`
--
ALTER TABLE `modelcomposantregime`
  ADD CONSTRAINT `fk_composanteval_has_modelregime_composanteval1` FOREIGN KEY (`idcomposanteval`) REFERENCES `composanteval` (`idcomposanteval`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_composanteval_has_modelregime_modelregime1` FOREIGN KEY (`idmodelregime`) REFERENCES `modelregime` (`idmodelregime`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_modelcomposantregime_typevalidation1` FOREIGN KEY (`idtypevalidation`) REFERENCES `typevalidation` (`idtypevalidation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `modelformation`
--
ALTER TABLE `modelformation`
  ADD CONSTRAINT `fk_modelformation_modelformation1` FOREIGN KEY (`idperemodelformation`) REFERENCES `modelformation` (`idmodelformation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_modelformation_typeformation1` FOREIGN KEY (`idtypeformation`) REFERENCES `typeformation` (`idtypeformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `fk_Module_Module` FOREIGN KEY (`idue`) REFERENCES `module` (`idModule`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Module_Nature1` FOREIGN KEY (`idNature`) REFERENCES `nature` (`idNature`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Module_Regime1` FOREIGN KEY (`idRegime`) REFERENCES `regime` (`idRegime`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Module_Typemodule1` FOREIGN KEY (`idTypemodule`) REFERENCES `typemodule` (`idTypemodule`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Module_niveauformation1` FOREIGN KEY (`idniveauformation`) REFERENCES `niveauformation` (`idniveauformation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Module_periode1` FOREIGN KEY (`idperiode`) REFERENCES `periode` (`idperiode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `moduleperiode`
--
ALTER TABLE `moduleperiode`
  ADD CONSTRAINT `fk_moduleperiode_module1` FOREIGN KEY (`idModule`) REFERENCES `module` (`idModule`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_moduleperiode_periodeformation1` FOREIGN KEY (`idperiodeformation`) REFERENCES `periodeformation` (`idperiodeformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `niveauformation`
--
ALTER TABLE `niveauformation`
  ADD CONSTRAINT `fk_niveauformation_formations1` FOREIGN KEY (`idformations`) REFERENCES `formations` (`idformations`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_niveauformation_levelformation1` FOREIGN KEY (`idlevelformation`) REFERENCES `levelformation` (`idlevelformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `periode`
--
ALTER TABLE `periode`
  ADD CONSTRAINT `fk_periode_levelformation1` FOREIGN KEY (`idlevelformation`) REFERENCES `levelformation` (`idlevelformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `periodeformation`
--
ALTER TABLE `periodeformation`
  ADD CONSTRAINT `fk_periodeformation_formations1` FOREIGN KEY (`idformations`) REFERENCES `formations` (`idformations`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_periodeformation_periode1` FOREIGN KEY (`idperiode`) REFERENCES `periode` (`idperiode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `permissionsurformation`
--
ALTER TABLE `permissionsurformation`
  ADD CONSTRAINT `fk_roleresponsable_has_permissionformationrole_permissionform1` FOREIGN KEY (`idpermissionformationrole`) REFERENCES `permissionformationrole` (`idpermissionformationrole`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_roleresponsable_has_permissionformationrole_roleresponsable1` FOREIGN KEY (`idroleresponsable`) REFERENCES `roleresponsable` (`idroleresponsable`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `roleutilisateursurformation`
--
ALTER TABLE `roleutilisateursurformation`
  ADD CONSTRAINT `fk_niveauformation_has_roleresponsable_niveauformation1` FOREIGN KEY (`idniveauformation`) REFERENCES `niveauformation` (`idniveauformation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_niveauformation_has_roleresponsable_personnes1` FOREIGN KEY (`idpersonnes`) REFERENCES `personnes` (`idpersonnes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_niveauformation_has_roleresponsable_roleresponsable1` FOREIGN KEY (`idroleresponsable`) REFERENCES `roleresponsable` (`idroleresponsable`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `typeformation`
--
ALTER TABLE `typeformation`
  ADD CONSTRAINT `fk_typeformation_typeformation1` FOREIGN KEY (`idpertypeformation`) REFERENCES `typeformation` (`idtypeformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
