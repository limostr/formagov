-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 16 Mai 2018 à 13:05
-- Version du serveur :  10.1.16-MariaDB
-- Version de PHP :  7.0.9

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

--
-- Contenu de la table `activitepratique`
--

INSERT INTO `activitepratique` (`idactivitepratique`, `labelactivitepratique`, `descactivitepratique`) VALUES
('1', 'Travaux sur terrain', 'Travaux sur terrain'),
('2', 'Projets', 'Projets'),
('3', 'Stages', 'Stages'),
('4', 'Autres', 'Autres');

-- --------------------------------------------------------

--
-- Structure de la table `activitepratiquemodule`
--

CREATE TABLE `activitepratiquemodule` (
  `idactivitepratique` varchar(45) NOT NULL,
  `idModule` int(11) NOT NULL,
  `idtypevalidation` varchar(25) DEFAULT NULL,
  `volumehoraire` varchar(25) DEFAULT NULL,
  `descactivitepratmodule` text,
  `remarqueactivitepratiquem` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `activiter`
--

CREATE TABLE `activiter` (
  `idactiviter` int(11) NOT NULL,
  `idpereactiviter` int(11) DEFAULT NULL,
  `idcompetence` int(11) NOT NULL,
  `titreactivite` text,
  `descactivite` text,
  `obligatoireactivite` tinyint(4) DEFAULT NULL,
  `poidsobjective` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `anneeuniv`
--

CREATE TABLE `anneeuniv` (
  `idanneeuniv` varchar(25) NOT NULL,
  `labelanneeuniv` varchar(45) DEFAULT NULL,
  `descanneeuniv` text,
  `activeannee` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `anneeuniv`
--

INSERT INTO `anneeuniv` (`idanneeuniv`, `labelanneeuniv`, `descanneeuniv`, `activeannee`) VALUES
('2017-2018', '2017-2018', '2017-2018', 1);

-- --------------------------------------------------------

--
-- Structure de la table `appparams`
--

CREATE TABLE `appparams` (
  `idappparams` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `labelparams` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `valueparams` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `descparams` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `appparams`
--

INSERT INTO `appparams` (`idappparams`, `labelparams`, `valueparams`, `descparams`) VALUES
('MaxModule', 'Nombre Max Module tutoré', '2', ''),
('NombreNotification', 'Max Nombre de message Notifier', '8', '');

-- --------------------------------------------------------

--
-- Structure de la table `assurerformation`
--

CREATE TABLE `assurerformation` (
  `idassurerformation` int(11) NOT NULL,
  `idpersonnes` varchar(25) NOT NULL,
  `idniveauformation` int(11) DEFAULT NULL,
  `themformation` varchar(45) DEFAULT NULL,
  `sessionformation` text,
  `pays` varchar(45) DEFAULT NULL,
  `publiccible` text,
  `lierelearning` tinyint(4) DEFAULT NULL,
  `fournisseurformation` varchar(512) DEFAULT NULL,
  `autrinfoassurformation` text,
  `datesession` date DEFAULT NULL,
  `nmbredejour` varchar(45) DEFAULT NULL,
  `lieravecluvt` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `competence`
--

CREATE TABLE `competence` (
  `idcompetence` int(11) NOT NULL,
  `idperecompetence` int(11) DEFAULT NULL,
  `idobjective` int(11) NOT NULL,
  `titrecompetence` text,
  `desccompetence` text,
  `obligatoireobj` tinyint(4) DEFAULT NULL,
  `poidscompetence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `competenceens`
--

CREATE TABLE `competenceens` (
  `idcompetenceens` bigint(20) NOT NULL,
  `idpersonnes` varchar(25) NOT NULL,
  `domaine` varchar(512) DEFAULT NULL,
  `titrecompetence` text
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
  `idtypevalidation` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `concepteurs`
--

CREATE TABLE `concepteurs` (
  `conceptions_idconceptions` int(11) NOT NULL,
  `enseignants_idpersonnes` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `conceptions`
--

CREATE TABLE `conceptions` (
  `idconceptions` int(11) NOT NULL,
  `idModule` int(11) DEFAULT NULL,
  `datecreation` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `coordination`
--

CREATE TABLE `coordination` (
  `idcoordination` bigint(20) NOT NULL,
  `idnaturecoordinateur` varchar(55) NOT NULL,
  `idniveauformation` int(11) DEFAULT NULL,
  `idformations` int(11) DEFAULT NULL,
  `idpersonnes` varchar(25) NOT NULL,
  `idanneeuniv` varchar(25) NOT NULL,
  `suspondu` tinyint(4) DEFAULT '0',
  `datesuspond` date DEFAULT NULL,
  `causesuspond` text,
  `docupload` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `coordination`
--

INSERT INTO `coordination` (`idcoordination`, `idnaturecoordinateur`, `idniveauformation`, `idformations`, `idpersonnes`, `idanneeuniv`, `suspondu`, `datesuspond`, `causesuspond`, `docupload`) VALUES
(1, 'coordinateur', 29, 23, '08340460', '2017-2018', 0, NULL, NULL, NULL),
(2, 'coordinateur', 31, 23, '08340460', '2017-2018', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `depotdocens`
--

CREATE TABLE `depotdocens` (
  `idpersonnes` varchar(25) NOT NULL,
  `iddocumentofficiel` int(11) NOT NULL,
  `datedepot` date DEFAULT NULL,
  `validate` tinyint(4) DEFAULT NULL,
  `remarquedoc` text,
  `autreinfodepot` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `diplomeens`
--

CREATE TABLE `diplomeens` (
  `iddiplomeens` int(11) NOT NULL,
  `idpersonnes` varchar(25) NOT NULL,
  `titrediplome` varchar(512) DEFAULT NULL,
  `pays` varchar(512) DEFAULT NULL,
  `etablissement` varchar(512) DEFAULT NULL,
  `dateobtention` varchar(512) DEFAULT NULL,
  `mentiondip` varchar(512) DEFAULT NULL,
  `autreinfodiplome` text,
  `titrediplomear` varchar(512) DEFAULT NULL,
  `etablissementar` varchar(512) DEFAULT NULL,
  `paysar` varchar(512) DEFAULT NULL,
  `mentiondipar` varchar(512) DEFAULT NULL,
  `specialiterdiplome` varchar(512) DEFAULT NULL,
  `specialiterdiplomear` varchar(512) DEFAULT NULL,
  `dernierdiplome` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `diplomeensegnier`
--

CREATE TABLE `diplomeensegnier` (
  `iddiplomeensegnier` int(11) NOT NULL,
  `idetabenseignement` int(11) NOT NULL,
  `titreparcour` text,
  `domaineparcens` varchar(512) DEFAULT NULL,
  `specialiterparcens` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `documentofficiel`
--

CREATE TABLE `documentofficiel` (
  `iddocumentofficiel` int(11) NOT NULL,
  `idtypedocofficiel` varchar(55) NOT NULL,
  `titredoc` varchar(512) DEFAULT NULL,
  `descdoc` varchar(512) DEFAULT NULL,
  `docobligatoire` tinyint(4) DEFAULT NULL,
  `autreinfodocoff` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `documentofficiel`
--

INSERT INTO `documentofficiel` (`iddocumentofficiel`, `idtypedocofficiel`, `titredoc`, `descdoc`, `docobligatoire`, `autreinfodocoff`) VALUES
(3, 'dossiertuteur', 'CIN', NULL, 1, NULL),
(4, 'dossiertuteur', 'Autorisation', NULL, 1, NULL),
(5, 'dossiertuteur', 'Attestation de travail', NULL, 1, NULL),
(6, 'dossiertuteur', 'Diplôme', NULL, 1, NULL),
(7, 'dossiertuteur', 'Charte tuteur', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `droits`
--

CREATE TABLE `droits` (
  `iddroits` bigint(20) NOT NULL,
  `idroles` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `idservices` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `droits`
--

INSERT INTO `droits` (`iddroits`, `idroles`, `idservices`) VALUES
(1, 'AdminPedagogie', 'ens-cr-01'),
(2, 'AdminPedagogie', 'ens-cr-02'),
(3, 'AdminPedagogie', 'ens-cr-03'),
(4, 'AdminPedagogie', 'ens-cr-04'),
(5, 'AdminPedagogie', 'ens-cr-05'),
(6, 'AdminPedagogie', 'ens-cr-06'),
(7, 'AdminPedagogie', 'ens-cr-07'),
(8, 'AdminPedagogie', 'ens-cr-08'),
(9, 'AdminPedagogie', 'ens-cr-09'),
(10, 'AdminPedagogie', 'ens-cr-10'),
(11, 'AdminPedagogie', 'ens-cr-11'),
(12, 'AdminPedagogie', 'ens-cr-12'),
(13, 'AdminPedagogie', 'ens-cr-13'),
(14, 'AdminPedagogie', 'ens-cr-14'),
(15, 'AdminPedagogie', 'ens-cr-15'),
(16, 'AdminPedagogie', 'ens-cr-16'),
(17, 'AdminPedagogie', 'ens-cr-17'),
(18, 'AdminPedagogie', 'ens-cr-18'),
(19, 'AdminPedagogie', 'ens-cr-19'),
(20, 'AdminPedagogie', 'ens-sh-01'),
(21, 'AdminPedagogie', 'ens-sh-02'),
(22, 'AdminPedagogie', 'ens-sh-03'),
(23, 'AdminPedagogie', 'ens-sh-04'),
(24, 'AdminPedagogie', 'ens-sh-05'),
(25, 'AdminPedagogie', 'ens-sh-06'),
(26, 'AdminPedagogie', 'ens-sh-07'),
(27, 'AdminPedagogie', 'ens-sh-08'),
(28, 'AdminPedagogie', 'ens-sh-09'),
(29, 'AdminPedagogie', 'ens-sh-10'),
(30, 'AdminPedagogie', 'ens-sh-11'),
(31, 'AdminPedagogie', 'ens-sh-12'),
(32, 'AdminPedagogie', 'ens-sh-13'),
(33, 'AdminPedagogie', 'ens-inv-01'),
(34, 'AdminPedagogie', 'ens-inv-02'),
(35, 'AdminPedagogie', 'ens-inv-03'),
(36, 'AdminPedagogie', 'ens-inv-04'),
(37, 'AdminPedagogie', 'ens-mn-cmp-01'),
(38, 'AdminPedagogie', 'ens-mn-cmp-02'),
(39, 'AdminPedagogie', 'ens-mn-cmp-03'),
(40, 'AdminPedagogie', 'ens-mn-cmp-04'),
(41, 'AdminPedagogie', 'ens-mn-cmp-05'),
(42, 'AdminPedagogie', 'ens-mn-cmp-06'),
(43, 'AdminPedagogie', 'ens-mn-cmp-07'),
(44, 'AdminPedagogie', 'ens-sav-01'),
(45, 'AdminPedagogie', 'ens-sav-02'),
(46, 'AdminPedagogie', 'ens-sav-03'),
(47, 'AdminPedagogie', 'ens-sav-04'),
(48, 'coordinateur', 'ens-cr-01'),
(49, 'coordinateur', 'ens-cr-02'),
(50, 'coordinateur', 'ens-cr-03'),
(51, 'coordinateur', 'ens-cr-04'),
(52, 'coordinateur', 'ens-cr-05'),
(53, 'coordinateur', 'ens-cr-06'),
(54, 'coordinateur', 'ens-cr-07'),
(55, 'coordinateur', 'ens-cr-08'),
(56, 'coordinateur', 'ens-cr-09'),
(57, 'coordinateur', 'ens-cr-10'),
(58, 'coordinateur', 'ens-cr-11'),
(59, 'coordinateur', 'ens-cr-12'),
(60, 'coordinateur', 'ens-cr-13'),
(61, 'coordinateur', 'ens-cr-14'),
(62, 'coordinateur', 'ens-cr-15'),
(63, 'coordinateur', 'ens-cr-16'),
(64, 'coordinateur', 'ens-cr-17'),
(65, 'coordinateur', 'ens-cr-18'),
(66, 'coordinateur', 'ens-cr-19'),
(67, 'coordinateur', 'ens-sh-01'),
(68, 'coordinateur', 'ens-sh-02'),
(69, 'coordinateur', 'ens-sh-03'),
(70, 'coordinateur', 'ens-sh-04'),
(71, 'coordinateur', 'ens-sh-05'),
(72, 'coordinateur', 'ens-sh-06'),
(73, 'coordinateur', 'ens-sh-07'),
(74, 'coordinateur', 'ens-sh-08'),
(75, 'coordinateur', 'ens-sh-09'),
(76, 'coordinateur', 'ens-sh-10'),
(77, 'coordinateur', 'ens-sh-11'),
(78, 'coordinateur', 'ens-sh-12'),
(79, 'coordinateur', 'ens-sh-13'),
(80, 'coordinateur', 'ens-inv-01'),
(81, 'coordinateur', 'ens-inv-02'),
(82, 'coordinateur', 'ens-inv-03'),
(83, 'coordinateur', 'ens-inv-04'),
(84, 'coordinateur', 'ens-mn-cmp-01'),
(85, 'coordinateur', 'ens-mn-cmp-02'),
(86, 'coordinateur', 'ens-mn-cmp-03'),
(87, 'coordinateur', 'ens-mn-cmp-04'),
(88, 'coordinateur', 'ens-mn-cmp-05'),
(89, 'coordinateur', 'ens-mn-cmp-06'),
(90, 'coordinateur', 'ens-mn-cmp-07'),
(91, 'coordinateur', 'ens-sav-01'),
(92, 'coordinateur', 'ens-sav-02'),
(93, 'coordinateur', 'ens-sav-03'),
(94, 'coordinateur', 'ens-sav-04'),
(189, 'tuteur', 'ens-cr-01'),
(190, 'tuteur', 'ens-cr-02'),
(191, 'tuteur', 'ens-cr-03'),
(192, 'tuteur', 'ens-cr-04'),
(193, 'tuteur', 'ens-cr-05'),
(194, 'tuteur', 'ens-cr-06'),
(195, 'tuteur', 'ens-cr-07'),
(196, 'tuteur', 'ens-cr-08'),
(197, 'tuteur', 'ens-cr-09'),
(198, 'tuteur', 'ens-cr-10'),
(199, 'tuteur', 'ens-cr-11'),
(200, 'tuteur', 'ens-cr-12'),
(201, 'tuteur', 'ens-cr-13'),
(202, 'tuteur', 'ens-cr-14'),
(203, 'tuteur', 'ens-cr-15'),
(204, 'tuteur', 'ens-cr-16'),
(205, 'tuteur', 'ens-cr-17'),
(206, 'tuteur', 'ens-cr-18'),
(207, 'tuteur', 'ens-cr-19'),
(208, 'tuteur', 'ens-sh-01'),
(209, 'tuteur', 'ens-sh-02'),
(210, 'tuteur', 'ens-sh-03'),
(211, 'tuteur', 'ens-sh-04'),
(212, 'tuteur', 'ens-sh-05'),
(213, 'tuteur', 'ens-sh-06'),
(214, 'tuteur', 'ens-sh-07'),
(215, 'tuteur', 'ens-sh-08'),
(216, 'tuteur', 'ens-sh-09'),
(217, 'tuteur', 'ens-sh-10'),
(218, 'tuteur', 'ens-sh-11'),
(219, 'tuteur', 'ens-sh-12'),
(220, 'tuteur', 'ens-sh-13'),
(221, 'tuteur', 'ens-inv-01'),
(222, 'tuteur', 'ens-inv-02'),
(223, 'tuteur', 'ens-inv-03'),
(224, 'tuteur', 'ens-inv-04'),
(225, 'tuteur', 'ens-mn-cmp-01'),
(226, 'tuteur', 'ens-mn-cmp-02'),
(227, 'tuteur', 'ens-mn-cmp-03'),
(228, 'tuteur', 'ens-mn-cmp-04'),
(229, 'tuteur', 'ens-mn-cmp-05'),
(230, 'tuteur', 'ens-mn-cmp-06'),
(231, 'tuteur', 'ens-mn-cmp-07'),
(232, 'tuteur', 'ens-sav-01'),
(233, 'tuteur', 'ens-sav-02'),
(234, 'tuteur', 'ens-sav-03'),
(235, 'tuteur', 'ens-sav-04'),
(236, 'root', 'ens-cr-01'),
(237, 'root', 'ens-cr-02'),
(238, 'root', 'ens-cr-03'),
(239, 'root', 'ens-cr-04'),
(240, 'root', 'ens-cr-05'),
(241, 'root', 'ens-cr-06'),
(242, 'root', 'ens-cr-07'),
(243, 'root', 'ens-cr-08'),
(244, 'root', 'ens-cr-09'),
(245, 'root', 'ens-cr-10'),
(246, 'root', 'ens-cr-11'),
(247, 'root', 'ens-cr-12'),
(248, 'root', 'ens-cr-13'),
(249, 'root', 'ens-cr-14'),
(250, 'root', 'ens-cr-15'),
(251, 'root', 'ens-cr-16'),
(252, 'root', 'ens-cr-17'),
(253, 'root', 'ens-cr-18'),
(254, 'root', 'ens-cr-19'),
(255, 'root', 'ens-sh-01'),
(256, 'root', 'ens-sh-02'),
(257, 'root', 'ens-sh-03'),
(258, 'root', 'ens-sh-04'),
(259, 'root', 'ens-sh-05'),
(260, 'root', 'ens-sh-06'),
(261, 'root', 'ens-sh-07'),
(262, 'root', 'ens-sh-08'),
(263, 'root', 'ens-sh-09'),
(264, 'root', 'ens-sh-10'),
(265, 'root', 'ens-sh-11'),
(266, 'root', 'ens-sh-12'),
(267, 'root', 'ens-sh-13'),
(268, 'root', 'ens-inv-01'),
(269, 'root', 'ens-inv-02'),
(270, 'root', 'ens-inv-03'),
(271, 'root', 'ens-inv-04'),
(272, 'root', 'ens-mn-cmp-01'),
(273, 'root', 'ens-mn-cmp-02'),
(274, 'root', 'ens-mn-cmp-03'),
(275, 'root', 'ens-mn-cmp-04'),
(276, 'root', 'ens-mn-cmp-05'),
(277, 'root', 'ens-mn-cmp-06'),
(278, 'root', 'ens-mn-cmp-07'),
(279, 'root', 'ens-sav-01'),
(280, 'root', 'ens-sav-02'),
(281, 'root', 'ens-sav-03'),
(282, 'root', 'ens-sav-04'),
(287, 'tuteur', 'ens-cr'),
(288, 'tuteur', 'ens-sh'),
(289, 'tuteur', 'ens-inv'),
(290, 'tuteur', 'ens-mn-cmp'),
(291, 'tuteur', 'ens-sav'),
(292, 'inviter', 'ens-inv'),
(293, 'inviter', 'ens-inv-01'),
(294, 'inviter', 'ens-inv-02'),
(295, 'inviter', 'ens-inv-03'),
(296, 'inviter', 'ens-inv-04'),
(297, 'inviter', 'ens-mn-cmp'),
(298, 'inviter', 'ens-mn-cmp-01'),
(299, 'inviter', 'ens-mn-cmp-02'),
(300, 'inviter', 'ens-mn-cmp-03'),
(301, 'inviter', 'ens-mn-cmp-04'),
(302, 'inviter', 'ens-mn-cmp-05'),
(303, 'inviter', 'ens-mn-cmp-06'),
(304, 'inviter', 'ens-mn-cmp-07'),
(305, 'coordinateur', 'ens-inv-05'),
(306, 'tuteur', 'ens-inv-05'),
(307, 'root', 'ens-inv-05'),
(308, 'inviter', 'ens-inv-05');

-- --------------------------------------------------------

--
-- Structure de la table `ensactiviter`
--

CREATE TABLE `ensactiviter` (
  `idensactiviter` int(11) NOT NULL,
  `idpersonnes` varchar(25) NOT NULL,
  `idlisteactiviterens` int(11) DEFAULT NULL,
  `autreactiviter` text,
  `datedebut` date DEFAULT NULL,
  `datefin` date DEFAULT NULL,
  `descactivens` text,
  `lieuactiviter` text,
  `relationelearning` text,
  `autreinfoactiviter` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `enseignants`
--

CREATE TABLE `enseignants` (
  `idpersonnes` varchar(25) NOT NULL,
  `rib` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `enseignants`
--

INSERT INTO `enseignants` (`idpersonnes`, `rib`) VALUES
('08340453', '36237717'),
('08340460', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `enseignantsmodule`
--

CREATE TABLE `enseignantsmodule` (
  `idpersonnes` varchar(25) NOT NULL,
  `idModule` int(11) NOT NULL,
  `idanneeuniv` varchar(25) NOT NULL,
  `validationadmin` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `enseignantsmodule`
--

INSERT INTO `enseignantsmodule` (`idpersonnes`, `idModule`, `idanneeuniv`, `validationadmin`) VALUES
('08340453', 2, '2017-2018', 0),
('08340453', 7, '2017-2018', 0),
('08340453', 10, '2017-2018', 0);

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
-- Structure de la table `ensinfopro`
--

CREATE TABLE `ensinfopro` (
  `idensinfopro` bigint(20) NOT NULL,
  `idpersonnes` varchar(25) NOT NULL,
  `poste` varchar(512) DEFAULT NULL,
  `fonction` varchar(512) DEFAULT NULL,
  `societer` varchar(512) DEFAULT NULL,
  `daterecrutement` date DEFAULT NULL,
  `datefin` date DEFAULT NULL,
  `descposte` text,
  `adresspro` text,
  `codepostal` varchar(45) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  `pays` varchar(45) DEFAULT NULL,
  `telephonepro` text,
  `autroinfoproens` text,
  `societerar` varchar(512) DEFAULT NULL,
  `postear` varchar(512) DEFAULT NULL,
  `fonctionar` varchar(512) DEFAULT NULL,
  `gradedeposte` varchar(512) DEFAULT NULL,
  `gradedepostear` varchar(512) DEFAULT NULL,
  `profisionofficiel` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `etabenseignement`
--

CREATE TABLE `etabenseignement` (
  `idetabenseignement` int(11) NOT NULL,
  `idpersonnes` varchar(25) NOT NULL,
  `etabnom` varchar(45) DEFAULT NULL,
  `univnom` varchar(45) DEFAULT NULL,
  `pays` varchar(45) DEFAULT NULL,
  `adressetabens` text,
  `anneeunivens` varchar(45) DEFAULT NULL,
  `status` varchar(512) DEFAULT NULL,
  `autrinfoetabenseignant` text,
  `etabnomar` varchar(512) DEFAULT NULL,
  `univnomar` varchar(512) DEFAULT NULL
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
  `prixdeniveau` varchar(45) DEFAULT NULL,
  `idprojethabilitation` int(11) DEFAULT NULL,
  `datefinhabilitation` varchar(12) DEFAULT NULL,
  `debuthabilitation` varchar(12) DEFAULT NULL,
  `rehabiliter` tinyint(4) DEFAULT '0',
  `autreinfoformation` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `formations`
--

INSERT INTO `formations` (`idformations`, `idpereformations`, `idtypeformation`, `codeformation`, `abrev`, `Label`, `Labelar`, `description`, `codeformationuvt`, `codeformationmis`, `siteweb`, `niveau`, `modeformation`, `prixdeniveau`, `idprojethabilitation`, `datefinhabilitation`, `debuthabilitation`, `rehabiliter`, `autreinfoformation`) VALUES
(18, NULL, 1, NULL, 'LA', 'Licence Appliquée', 'Licence Appliquée', 'Licence Appliquée', 'LA', 'LA', 'www.uvt.rnu.tn', NULL, 'Annuelle', NULL, NULL, NULL, NULL, 0, NULL),
(19, 20, 3, NULL, 'Management', 'Management', 'Management', 'Management', 'Management', 'Management', 'www.uvt.rnu.tn', NULL, 'Annuelle', NULL, NULL, NULL, NULL, 0, NULL),
(20, 18, 2, NULL, 'Sciences de gestion', 'Sciences de gestion', 'Sciences de gestion', 'Sciences de gestion', 'Sciences de gestion', 'Sciences de gestion', 'www.uvt.rnu.tn', NULL, 'Annuelle', NULL, NULL, NULL, NULL, 0, NULL),
(22, 19, 4, NULL, 'LAM-GPME', 'Management: gestion des petites et moyennes entreprises ', 'LAM-GPME', 'LAM-GPME', 'LAM-GPME', 'LAM-GPME', 'LAM-GPME', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(23, 19, 4, NULL, 'LAM-MQSE', 'Management: management de la qualité et sécurité environnementale', 'LAM-MQSE', 'LAM-MQSE', 'LAM-MQSE', 'LAM-MQSE', 'www.uvt.rnu.tn', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(24, 66, 4, NULL, 'LGC', 'Licence Fondamentale en Gestion Comptable', 'LGC', 'LGC', 'LGC', 'LGC', 'www.uvt.rnu.tn', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(25, 18, 2, NULL, 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', NULL, 'Annuelle', NULL, NULL, NULL, NULL, 0, NULL),
(26, 25, 3, NULL, 'S.T.I.C', 'Sciences et Technologies de l''Information et de Communication', 'S.T.I.C', 'S.T.I.C', 'S.T.I.C', 'S.T.I.C', 'www.uvt.rnu.tn', NULL, 'Annuelle', NULL, NULL, NULL, NULL, 0, NULL),
(27, 26, 4, NULL, 'LASTIC', 'Licence Appliquée en Sciences et Techniques de l''Information et de Communication ', 'Licence Appliquée en Sciences et Techniques de l''information et de Communication', 'LASTIC', 'LASTIC', 'LASTIC', 'LASTIC', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(28, 26, 4, NULL, 'EOLES', 'EOLES', 'EOLES', 'EOLES', 'EOLES', 'EOLES', 'EOLES', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(29, NULL, 12, NULL, 'Mastères', 'Mastères', 'Mastères', 'Mastères', 'Master', 'Master', 'Mastères', NULL, 'Annuelle', NULL, NULL, NULL, NULL, 0, NULL),
(30, 29, 13, NULL, 'Télécommunications', 'Télécommunications', 'Télécommunications', 'Télécommunications', 'Télécommunications', 'Télécommunications', 'Télécommunications', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(31, 29, 13, NULL, 'Génie industriel', 'Génie industriel', 'Génie industriel', 'Génie industriel', 'Génie industriel', 'Génie industriel', 'Génie industriel', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(32, 18, 13, NULL, 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(33, 29, 13, NULL, 'Sport et Éducation Physique', 'Sport et Éducation Physique', 'Sport et Éducation Physique', 'Sport et Éducation Physique', 'Sport', 'Sport', 'Sport et Éducation Physique', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(34, 30, 3, NULL, 'T.R.I', 'Télécommunications et Réseaux informatiques', 'Télécommunications et Réseaux informatiques', 'Télécommunications et Réseaux informatiques', 'TRI', 'TRI', 'Télécommunications et Réseaux informatiques', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(35, 34, 4, NULL, 'N2TR', 'Mastère professionnel en Nouvelles Technologies des Télécommunications et Réseaux', 'N2TR', 'N2TR', 'N2TR', 'N2TR', 'N2TR', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(36, 31, 3, NULL, 'OIE', 'Optimisation, Innovation de l''Entreprise', 'Optimisation, Innovation de l''Entreprise', 'OIE', 'OIE', 'OIE', 'OIE', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(37, 36, 4, NULL, 'MOME', 'Mastère professionnel en Optimisation et Modernisation de l’Entreprise ', 'MOME', 'MOME', 'MOME', 'MOME', 'MOME', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(38, 32, 3, NULL, 'Informatique', 'Informatique', 'Informatique', 'Informatique', 'Informatique', 'Informatique', 'Informatique', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(39, 38, 3, NULL, 'MP2L', 'Mastère professionnel en Logiciels libres : MP2L', 'MP2L', 'MP2L', 'MP2L', 'MP2L', 'MP2L', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(40, 33, 3, NULL, 'STATPS', 'STATPS', 'STATPS', 'STATPS', 'STATPS', 'STATPS', 'STATPS', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(41, 40, 14, NULL, 'MP3', 'Mastère Professionnel en Préparation Physique ', 'Mastère Professionnel en Préparation Physique ', 'MP3', 'MP3', 'MP3', 'MP3', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(42, 40, 14, NULL, 'M2P2', 'Mastère Professionnel en Préparation Mentale', 'Mastère Professionnel en Préparation Mentale', 'M2P2', 'M2P2', 'M2P2', 'M2P2', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(43, 20, 3, NULL, 'Gestion', 'Gestion', 'التصرف', 'Gestion', 'Gestion', 'Gestion', 'Gestion', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(44, 43, 4, NULL, 'LAMESN', 'Licence Appliquée en Marketing Electronique et Stratégies Numériques ', 'Licence Appliquée en Marketing Electronique et Stratégies Numériques ', 'LAMESN', 'LAMESN', 'LAMESN', 'LAMESN', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(45, NULL, 15, NULL, 'Formations', 'Formation Continues', 'Formation', 'Formation Continues', 'FC-00', 'FC-00', 'Formation', NULL, 'Planifier', NULL, NULL, '2018-2019', NULL, 0, NULL),
(47, NULL, 15, NULL, 'test', 'test', 'test', 'test', 'test', 'test', 'test', NULL, 'Planifier', NULL, NULL, '2018-2019', NULL, 0, NULL),
(48, 18, 2, NULL, 'Sciences économiques et de gestion', 'Sciences économiques et de gestion', 'Sciences économiques et de gestion', 'Sciences économiques et de gestion', 'SC-G', 'SC-G', 'Sciences économiques et de gestion', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(49, 48, 3, NULL, 'Administration des affaires', 'Administration des affaires', 'Administration des affaires', 'Administration des affaires', 'AD-AF', 'AD-AF', 'Administration des affaires', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(50, 49, 4, NULL, 'L3A-PME', 'Licence appliquée en administration des affaires: L3A-PME', 'GPME', 'GPME', 'GPME-3', 'GPME-3', 'GPME', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(51, 29, 13, NULL, 'Sciences Économiques & Gestion (SEG)', 'Sciences Économiques & Gestion (SEG)', 'SEG', 'Sciences Économiques & Gestion (SEG)', 'SCE-G-M', 'SCE-G-M', 'SEG', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(52, 51, 3, NULL, 'MI', 'Management Intégré', 'Management Intégré', 'Management intégré', 'MI-M', 'MI-M', 'Management intégré', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(53, 52, 4, NULL, 'MPQSE', 'Mastère Professionnel en Management Intégré : Qualité-Sécurité et Environnement ', 'Mastère Professionnel en Management Intégré : Qualité-Sécurité et Environnement ', 'Mastère Professionnel en Management intégré : Qualité-Sécurité et environnement ', 'MI-QSE', 'MI-QSE', 'Mastère Professionnel en Management intégré : Qualité-Sécurité et environnement ', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(54, 49, 4, NULL, 'L3A-QSE', 'Licence appliquée en administration des affaires: L3A-QSE', 'L3A-QSE', 'L3A-QSE', 'LA3-QSE', 'LA3-QSE', 'L3A-QSE', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(56, 45, 15, NULL, 'Formation Continues', 'Formation Continues', 'Formation Continues', 'Formation Continues', 'CERTIF', 'CERTIF', 'Formation Continues', NULL, 'Planifier', NULL, NULL, '2018-2019', NULL, 0, NULL),
(59, 19, 4, NULL, 'LAM', 'Licence Appliquée en Management: Tronc commun', 'Licence Appliquée en Management', 'Licence appliquée en management : MQSE-GPME', 'MQSE-GPME', 'MQSE-GPME', 'Licence appliquée en management : MQSE-GPME', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(60, 29, 13, NULL, 'Gestion', 'Gestion', 'Gestion', 'Gestion', 'Gestion-MPMP', 'Gestion-MPMP', 'Gestion', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(61, 60, 3, NULL, 'Management', 'Management', 'Management', 'Management', 'PMPM-MAN', 'PMPM-MAN', 'Management', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(62, 61, 4, NULL, 'MPMP', 'Management des Projets', 'Management des Projets', 'Management des Projets', 'MPMP-D', 'MPMP-D', 'Management des Projets', NULL, 'Annuelle', NULL, NULL, '2018-2019', NULL, 0, NULL),
(64, NULL, 5, NULL, 'LF', 'Licence Fondamentale', 'Licence Fondamentale', 'Licence Fondamentale', 'LF', 'LF', 'www.uvt.rnu.tn', '3', 'Annuelle', '600', NULL, '2018-2019', NULL, 0, NULL),
(65, 64, 13, NULL, NULL, 'Sciences économiques et de gestion', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-2019', NULL, 0, NULL),
(66, 65, 3, 'Gestion', 'Gestion', 'Gestion', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-2019', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `formationsuiviense`
--

CREATE TABLE `formationsuiviense` (
  `idformationsuiviense` int(11) NOT NULL,
  `idpersonnes` varchar(25) NOT NULL,
  `idniveauformation` int(11) DEFAULT NULL,
  `labelformens` varchar(512) DEFAULT NULL,
  `sessionformationsevi` text,
  `dateformationens` date DEFAULT NULL,
  `attestation` text,
  `scoreformsuivi` varchar(45) DEFAULT NULL,
  `autreinfoformsuiviuvt` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `grades`
--

CREATE TABLE `grades` (
  `idgrades` varchar(45) NOT NULL,
  `labelgrade` text,
  `descgrade` text,
  `abrevgrade` varchar(45) DEFAULT NULL,
  `poidsgrade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `grades`
--

INSERT INTO `grades` (`idgrades`, `labelgrade`, `descgrade`, `abrevgrade`, `poidsgrade`) VALUES
('A', 'Assistant ', NULL, NULL, 5),
('AC', 'Assistant Contractuel ', NULL, NULL, 6),
('AT', 'Assistant Technologue', NULL, NULL, 4),
('EA', 'Enseignant Associé', NULL, NULL, 9),
('EV', 'Enseignant  Visiteur', NULL, NULL, 8),
('MA', 'Maître Assistant ', NULL, NULL, 4),
('MC', 'Maître de Conférence ', NULL, NULL, 3),
('MT', 'Maître Technologue', NULL, NULL, 3),
('P', 'Professeur', NULL, NULL, 2),
('PE', 'Professeur Emérite', NULL, NULL, 1),
('PES', 'Professeur de l’Enseignement Secondaire ', NULL, NULL, 7),
('PT', 'Professeur Technologue', NULL, NULL, 2),
('T', 'Technologue ', NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Structure de la table `gradesenseignants`
--

CREATE TABLE `gradesenseignants` (
  `idgradesenseignants` int(11) NOT NULL,
  `idpersonnes` varchar(25) NOT NULL,
  `idgrades` varchar(45) NOT NULL,
  `dateobtentiongrade` date DEFAULT NULL,
  `susponsiongrade` tinyint(4) DEFAULT NULL,
  `causesusponsiongrade` text,
  `labelpersonaliser` varchar(512) DEFAULT NULL,
  `descgradeens` text,
  `titregradear` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Structure de la table `infopersonne`
--

CREATE TABLE `infopersonne` (
  `idinfopersonne` bigint(20) NOT NULL,
  `idpersonnes` varchar(25) NOT NULL,
  `idlangue` varchar(10) NOT NULL,
  `nom` varchar(512) DEFAULT NULL,
  `prenom` varchar(512) DEFAULT NULL,
  `adress` text NOT NULL,
  `ville` varchar(512) DEFAULT NULL,
  `pays` varchar(512) DEFAULT NULL,
  `lieudenaissance` varchar(512) DEFAULT NULL,
  `autreinfo` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `infopersonne`
--

INSERT INTO `infopersonne` (`idinfopersonne`, `idpersonnes`, `idlangue`, `nom`, `prenom`, `adress`, `ville`, `pays`, `lieudenaissance`, `autreinfo`) VALUES
(20, '08340453', 'fr', 'Limam', 'Oussama', 'tunis', 'Kélibia', 'Tunis', 'Tunis', NULL),
(24, '08340460', 'fr', 'Limam', 'Oussama', '', NULL, NULL, NULL, NULL),
(25, '08340453', 'ar', 'أسامة', 'الإمام', 'تونس', 'قليبيا', 'تونس', 'تونس', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `invitations`
--

CREATE TABLE `invitations` (
  `idinvitations` int(11) NOT NULL,
  `idanneeuniv` varchar(25) NOT NULL,
  `idperiode` varchar(25) DEFAULT NULL,
  `codeinvitation` varchar(45) DEFAULT NULL,
  `textinvitation` longtext,
  `email` text,
  `nominviter` varchar(45) DEFAULT NULL,
  `prenominviter` varchar(45) DEFAULT NULL,
  `datesenvois` text,
  `typeinvitation` varchar(512) NOT NULL,
  `infosuplimentaire` longtext NOT NULL,
  `idnaturecoordinateur` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `invitations`
--

INSERT INTO `invitations` (`idinvitations`, `idanneeuniv`, `idperiode`, `codeinvitation`, `textinvitation`, `email`, `nominviter`, `prenominviter`, `datesenvois`, `typeinvitation`, `infosuplimentaire`, `idnaturecoordinateur`) VALUES
(35, '2017-2018', 'S1', '363830376133663661616333633766623737636264383', '&amp;lt;!DOCTYPE html PUBLIC &amp;quot;-//W3C//DTD XHTML 1.0 Transitional//EN&amp;quot; &amp;quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&amp;quot;&amp;gt;\r\n&amp;lt;html xmlns=&amp;quot;http://www.w3.org/1999/xhtml&amp;quot;&amp;gt;\r\n&amp;lt;head&amp;gt;\r\n    &amp;lt;!-- If you delete this meta tag, Half Life 3 will never be released. --&amp;gt;\r\n    &amp;lt;meta name=&amp;quot;viewport&amp;quot; content=&amp;quot;width=device-width&amp;quot; /&amp;gt;\r\n\r\n    &amp;lt;meta http-equiv=&amp;quot;Content-Type&amp;quot; content=&amp;quot;text/html; charset=UTF-8&amp;quot; /&amp;gt;\r\n    &amp;lt;title&amp;gt;ZURBemails&amp;lt;/title&amp;gt;\r\n\r\n    &amp;lt;style&amp;gt;\r\n        /*\r\n        Max width before this PARTICULAR table gets nasty\r\n        This query will take effect for any screen smaller than 760px\r\n        and also iPads specifically.\r\n        */\r\n        /*\r\nGeneric Styling, for Desktops/Laptops\r\n*/\r\n        table.tableContent {\r\n            width: 100%;\r\n            border-collapse: collapse;\r\n        }\r\n        /* Zebra striping */\r\n        table.tableContent tr:nth-of-type(odd) {\r\n            background: #eee;\r\n        }\r\n        table.tableContent th {\r\n            background: #333;\r\n            color: white;\r\n            font-weight: bold;\r\n        }\r\n        table.tableContent td, th {\r\n            padding: 6px;\r\n            border: 1px solid #ccc;\r\n            text-align: left;\r\n        }\r\n        @media\r\n        only screen and (max-width: 760px),\r\n        (min-device-width: 768px) and (max-device-width: 1024px)  {\r\n\r\n            /* Force table to not be like tables anymore */\r\n            table.tableContent , thead, tbody, th, td, tr {\r\n                display: block;\r\n            }\r\n\r\n            /* Hide table headers (but not display: none;, for accessibility) */\r\n            table.tableContent thead tr {\r\n                position: absolute;\r\n                top: -9999px;\r\n                left: -9999px;\r\n            }\r\n\r\n            table.tableContent tr { border: 1px solid #ccc; }\r\n\r\n            table.tableContent td {\r\n                /* Behave  like a &amp;quot;row&amp;quot; */\r\n                border: none;\r\n                border-bottom: 1px solid #eee;\r\n                position: relative;\r\n                padding-left: 50%;\r\n            }\r\n\r\n            table.tableContent td:before {\r\n                /* Now like a table header */\r\n                position: absolute;\r\n                /* Top/left values mimic padding */\r\n                top: 6px;\r\n                left: 6px;\r\n                width: 45%;\r\n                padding-right: 10px;\r\n                white-space: nowrap;\r\n            }\r\n\r\n            /*\r\n            Label the data\r\n            */\r\n            /* table.tableContent td:nth-of-type(1):before { content: &amp;quot;Dipl&ocirc;me&amp;quot;; }\r\n             table.tableContent td:nth-of-type(2):before { content: &amp;quot;Last Name&amp;quot;; }\r\n             table.tableContent td:nth-of-type(3):before { content: &amp;quot;Job Title&amp;quot;; }\r\n             table.tableContent td:nth-of-type(4):before { content: &amp;quot;Favorite Color&amp;quot;; }\r\n             table.tableContent td:nth-of-type(5):before { content: &amp;quot;Wars of Trek?&amp;quot;; }\r\n            table.tableContent td:nth-of-type(6):before { content: &amp;quot;Porn Name&amp;quot;; }\r\n             table.tableContent td:nth-of-type(7):before { content: &amp;quot;Date of Birth&amp;quot;; }\r\n             table.tableContent td:nth-of-type(8):before { content: &amp;quot;Dream Vacation City&amp;quot;; }\r\n             table.tableContent td:nth-of-type(9):before { content: &amp;quot;GPA&amp;quot;; }\r\n             table.tableContent td:nth-of-type(10):before { content: &amp;quot;Arbitrary Data&amp;quot;; }\r\n             */\r\n        }\r\n        /* -------------------------------------\r\n                GLOBAL\r\n        ------------------------------------- */\r\n        * {\r\n            margin:0;\r\n            padding:0;\r\n        }\r\n        * { font-family: &amp;quot;Helvetica Neue&amp;quot;, &amp;quot;Helvetica&amp;quot;, Helvetica, Arial, sans-serif; }\r\n\r\n        img.boxMail {\r\n            max-width: 100%;\r\n        }\r\n        .collapse {\r\n            margin:0;\r\n            padding:0;\r\n        }\r\n        body.BoxMail {\r\n            -webkit-font-smoothing:antialiased;\r\n            -webkit-text-size-adjust:none;\r\n            width: 100%!important;\r\n            height: 100%;\r\n        }\r\n\r\n\r\n        /* -------------------------------------\r\n                ELEMENTS\r\n        ------------------------------------- */\r\n        a.BoxMail { color: #2BA6CB;}\r\n\r\n        .btnBoxMail {\r\n            text-decoration:none;\r\n            color: #FFF;\r\n            background-color: #666;\r\n            padding:10px 16px;\r\n            font-weight:bold;\r\n            margin-right:10px;\r\n            text-align:center;\r\n            cursor:pointer;\r\n            display: inline-block;\r\n        }\r\n\r\n        p.callout {\r\n            padding:15px;\r\n            background-color:#ECF8FF;\r\n            margin-bottom: 15px;\r\n        }\r\n        .callout a {\r\n            font-weight:bold;\r\n            color: #2BA6CB;\r\n        }\r\n\r\n        table.social {\r\n            /* 	padding:15px; */\r\n            background-color: #ebebeb;\r\n\r\n        }\r\n        .social .soc-btnBoxMail {\r\n            padding: 3px 7px;\r\n            font-size:12px;\r\n            margin-bottom:10px;\r\n            text-decoration:none;\r\n            color: #FFF;font-weight:bold;\r\n            display:block;\r\n            text-align:center;\r\n        }\r\n        a.fb { background-color: #3B5998!important; }\r\n        a.tw { background-color: #1daced!important; }\r\n        a.gp { background-color: #DB4A39!important; }\r\n        a.ms { background-color: #000!important; }\r\n\r\n        .sidebar .soc-btnBoxMail {\r\n            display:block;\r\n            width:100%;\r\n        }\r\n\r\n        /* -------------------------------------\r\n                HEADER\r\n        ------------------------------------- */\r\n        table.headBoxMail-wrap { width: 100%;}\r\n\r\n        .headerBoxMail.containerBoxMail table.BoxMail td.logo { padding: 15px; }\r\n        .headerBoxMail.containerBoxMail table.BoxMail td.label { padding: 15px; padding-left:0px;}\r\n\r\n\r\n        /* -------------------------------------\r\n                BODY\r\n        ------------------------------------- */\r\n        table.bodyBoxMail-wrap { width: 100%;}\r\n\r\n\r\n        /* -------------------------------------\r\n                FOOTER\r\n        ------------------------------------- */\r\n        table.footerBoxMail-wrap { width: 100%;	clear:both!important;\r\n        }\r\n        .footerBoxMail-wrap .containerBoxMail td.contentBoxMail  p { border-top: 1px solid rgb(215,215,215); padding-top:15px;}\r\n        .footerBoxMail-wrap .containerBoxMail td.contentBoxMail p {\r\n            font-size:10px;\r\n            font-weight: bold;\r\n\r\n        }\r\n\r\n\r\n        /* -------------------------------------\r\n                TYPOGRAPHY\r\n        ------------------------------------- */\r\n        h1.BoxMail,h2.BoxMail,h3.BoxMail,h4.BoxMail,h5.BoxMail,h6.BoxMail {\r\n            font-family: &amp;quot;HelveticaNeue-Light&amp;quot;, &amp;quot;Helvetica Neue Light&amp;quot;, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Lucida Grande&amp;quot;, sans-serif; line-height: 1.1; margin-bottom:15px; color:#000;\r\n        }\r\n        h1.BoxMail small, h2.BoxMail small, h3.BoxMail small, h4.BoxMail small, h5.BoxMail small, h6.BoxMail small { font-size: 60%; color: #6f6f6f; line-height: 0; text-transform: none; }\r\n\r\n        h1.BoxMail { font-weight:200; font-size: 44px;}\r\n        h2.BoxMail { font-weight:200; font-size: 37px;}\r\n        h3.BoxMail { font-weight:500; font-size: 27px;}\r\n        h4.BoxMail { font-weight:500; font-size: 23px;}\r\n        h5.BoxMail { font-weight:900; font-size: 17px;}\r\n        h6.BoxMail { font-weight:900; font-size: 14px; text-transform: uppercase; color:#444;}\r\n\r\n        .collapse { margin:0!important;}\r\n\r\n        p.BoxMail, ul.BoxMail {\r\n            margin-bottom: 10px;\r\n            font-weight: normal;\r\n            font-size:14px;\r\n            line-height:1.6;\r\n        }\r\n        p.lead { font-size:17px; }\r\n        p.last { margin-bottom:0px;}\r\n\r\n        ul.BoxMail li {\r\n            margin-left:5px;\r\n            list-style-position: inside;\r\n        }\r\n\r\n        /* -------------------------------------\r\n                SIDEBAR\r\n        ------------------------------------- */\r\n        ul.sidebarBoxMail {\r\n            background:#ebebeb;\r\n            display:block;\r\n            list-style-type: none;\r\n        }\r\n        ul.sidebarBoxMail li { display: block; margin:0;}\r\n        ul.sidebarBoxMail li a {\r\n            text-decoration:none;\r\n            color: #666;\r\n            padding:10px 16px;\r\n            /* 	font-weight:bold; */\r\n            margin-right:10px;\r\n            /* 	text-align:center; */\r\n            cursor:pointer;\r\n            border-bottom: 1px solid #777777;\r\n            border-top: 1px solid #FFFFFF;\r\n            display:block;\r\n            margin:0;\r\n        }\r\n        ul.sidebarBoxMail li a.last { border-bottom-width:0px;}\r\n        ul.sidebarBoxMail li a h1,ul.sidebarBoxMail li a h2,ul.sidebarBoxMail li a h3,ul.sidebarBoxMail li a h4,ul.sidebarBoxMail li a h5,ul.sidebarBoxMail li a h6.BoxMail,ul.sidebarBoxMail li a p { margin-bottom:0!important;}\r\n\r\n\r\n\r\n        /* ---------------------------------------------------\r\n                RESPONSIVENESS\r\n                Nuke it from orbit. It''s the only way to be sure.\r\n        ------------------------------------------------------ */\r\n\r\n        /* Set a max-width, and make it display as block so it will automatically stretch to that width, but will also shrink down on a phone or something */\r\n        .containerBoxMail {\r\n            display:block!important;\r\n            max-width:600px!important;\r\n            margin:0 auto!important; /* makes it centered */\r\n            clear:both!important;\r\n        }\r\n\r\n        /* This should also be a block element, so that it will fill 100% of the .container */\r\n        .contentBoxMail {\r\n            padding:15px;\r\n            max-width:600px;\r\n            margin:0 auto;\r\n            display:block;\r\n        }\r\n\r\n        /* Let''s make sure tables in the content area are 100% wide */\r\n        .contentBoxMail table { width: 100%; }\r\n\r\n\r\n        /* Odds and ends */\r\n        .columnBoxMail {\r\n            width: 300px;\r\n            float:left;\r\n        }\r\n        .columnBoxMail tr td { padding: 15px; }\r\n        .columnBoxMail-wrap {\r\n            padding:0!important;\r\n            margin:0 auto;\r\n            max-width:600px!important;\r\n        }\r\n        .columnBoxMail table { width:100%;}\r\n        .socialBoxMail .columnBoxMail {\r\n            width: 280px;\r\n            min-width: 279px;\r\n            float:left;\r\n        }\r\n\r\n        /* Be sure to place a .clear element after each set of columns, just to be safe */\r\n        .clearBoxMail { display: block; clear: both; }\r\n\r\n\r\n        /* -------------------------------------------\r\n                PHONE\r\n                For clients that support media queries.\r\n                Nothing fancy.\r\n        -------------------------------------------- */\r\n        @media only screen and (max-width: 600px) {\r\n\r\n            a[class=&amp;quot;btnBoxMail&amp;quot;] { display:block!important; margin-bottom:10px!important; background-image:none!important; margin-right:0!important;}\r\n\r\n            div[class=&amp;quot;columnBoxMail&amp;quot;] { width: auto!important; float:none!important;}\r\n\r\n            table.social div[class=&amp;quot;columnBoxMail&amp;quot;] {\r\n                width:auto!important;\r\n            }\r\n\r\n        }\r\n    &amp;lt;/style&amp;gt;\r\n\r\n&amp;lt;/head&amp;gt;\r\n\r\n&amp;lt;body bgcolor=&amp;quot;#FFFFFF&amp;quot; class=&amp;quot;boxMail&amp;quot;&amp;gt;\r\n\r\n&amp;lt;!-- HEADER --&amp;gt;\r\n&amp;lt;table class=&amp;quot;headBoxMail-wrap&amp;quot; bgcolor=&amp;quot;#FFFFFF&amp;quot;&amp;gt;\r\n    &amp;lt;tr&amp;gt;\r\n        &amp;lt;td&amp;gt;&amp;lt;/td&amp;gt;\r\n        &amp;lt;td class=&amp;quot;headerBoxMail  containerBoxMail&amp;quot; &amp;gt;\r\n\r\n            &amp;lt;div class=&amp;quot;contentBoxMail&amp;quot;&amp;gt;\r\n                &amp;lt;table bgcolor=&amp;quot;#FFFFFF&amp;quot;&amp;gt;\r\n                    &amp;lt;tr&amp;gt;\r\n                        &amp;lt;td&amp;gt;\r\n                            &amp;lt;object type=&amp;quot;image/svg+xml&amp;quot;&amp;gt;\r\n                                &amp;lt;svg xmlns=&amp;quot;http://www.w3.org/2000/svg&amp;quot; xmlns:xlink=&amp;quot;http://www.w3.org/1999/xlink&amp;quot; version=&amp;quot;1.1&amp;quot; id=&amp;quot;Calque_1&amp;quot; x=&amp;quot;0px&amp;quot; y=&amp;quot;0px&amp;quot; width=&amp;quot;168.194px&amp;quot; height=&amp;quot;24.094px&amp;quot; viewBox=&amp;quot;0 0 168.194 24.094&amp;quot; enable-background=&amp;quot;new 0 0 168.194 24.094&amp;quot; xml:space=&amp;quot;preserve&amp;quot;&amp;gt;\r\n                                    &amp;lt;pattern x=&amp;quot;-337.828&amp;quot; y=&amp;quot;308.479&amp;quot; width=&amp;quot;69&amp;quot; height=&amp;quot;69&amp;quot; patternUnits=&amp;quot;userSpaceOnUse&amp;quot; id=&amp;quot;Unnamed_Pattern&amp;quot; viewBox=&amp;quot;2.125 -70.896 69 69&amp;quot; overflow=&amp;quot;visible&amp;quot;&amp;gt;\r\n                                        &amp;lt;g&amp;gt;\r\n                                            &amp;lt;polygon fill=&amp;quot;none&amp;quot; points=&amp;quot;71.125,-1.896 2.125,-1.896 2.125,-70.896 71.125,-70.896   &amp;quot;/&amp;gt;\r\n                                            &amp;lt;polygon fill=&amp;quot;#F7C158&amp;quot; points=&amp;quot;71.125,-1.896 2.125,-1.896 2.125,-70.896 71.125,-70.896   &amp;quot;/&amp;gt;\r\n                                            &amp;lt;g&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#c31924&amp;quot; d=&amp;quot;M61.772-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.105-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.439-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.772-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.105-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.439-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.772-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.105-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.439-71.653c0.018,0.072,0.008,0.127-0.026,0.19C0.361-71.362,0.3-71.4,0.248-71.335     c-0.051,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.07,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.038-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.051-0.12-0.064-0.187c-0.021-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.215,0.124-0.215,0.224c0.002,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                            &amp;lt;/g&amp;gt;\r\n                                            &amp;lt;g&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-71.653c0.018,0.072,0.008,0.127-0.026,0.19c-0.052,0.101-0.113,0.063-0.165,0.128     c-0.051,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.07,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.038-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.051-0.12-0.064-0.187c-0.021-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.215,0.124-0.215,0.224c0.002,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                            &amp;lt;/g&amp;gt;\r\n                                            &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-71.653c0.018,0.072,0.008,0.127-0.026,0.19c-0.052,0.101-0.113,0.063-0.165,0.128    c-0.051,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161    c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631    c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45    c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.07,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221    c0.038-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.051-0.12-0.064-0.187c-0.021-0.114,0.002-0.224,0-0.337    c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207    c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.215,0.124-0.215,0.224C0.5-71.68,0.503-71.744,0.51-71.626    c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                            &amp;lt;g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143C2-61.45,2.217-61.397,2.391-61.46c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224C0.5-56.374,0.503-56.438,0.51-56.32      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      C8.15-41.004,8.149-41.02,8.14-41.04&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224C0.5-33.416,0.503-33.48,0.51-33.362      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224C0.5-18.11,0.503-18.175,0.51-18.057      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362C69-9.692,69.159-9.523,69.154-9.4c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053C17.933-7.969,17.839-8.227,18-8.34      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      C7.915-10.05,7.866-9.836,7.886-9.75C7.717-9.692,7.876-9.523,7.871-9.4C7.868-9.351,7.83-9.295,7.826-9.239      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      C9.114-7.652,9.321-7.799,9.48-7.837c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      C0.254-10.05,0.205-9.836,0.225-9.75C0.056-9.692,0.215-9.523,0.21-9.4c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37C0.33-8.671,0.501-8.456,0.668-8.325c0.19,0.148,0.365,0.572,0.608,0.631      C1.454-7.652,1.66-7.799,1.819-7.837C2-7.88,2.217-7.827,2.391-7.89c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46C3.477-8.933,3.471-8.995,3.5-9.071      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                            &amp;lt;/g&amp;gt;\r\n                                            &amp;lt;g&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-2.778c0.018,0.072,0.008,0.127-0.026,0.19C69.361-2.487,69.3-2.525,69.248-2.46     c-0.051,0.063-0.099,0.276-0.079,0.362C69-2.04,69.159-1.871,69.154-1.748c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C70.397,0,70.604-0.146,70.763-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.07,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.038-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.051-0.12-0.064-0.187c-0.021-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.215,0.124-0.215,0.224c0.002,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-2.778c0.018,0.072,0.007,0.127-0.026,0.19C61.7-2.487,61.64-2.525,61.587-2.46     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C62.737,0,62.943-0.146,63.103-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224C61.915-3.117,61.78-3.02,61.781-2.92c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-2.778c0.018,0.072,0.007,0.127-0.026,0.19C54.04-2.487,53.98-2.525,53.927-2.46     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C55.077,0,55.283-0.146,55.442-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224C54.255-3.117,54.12-3.02,54.121-2.92c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-2.778c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C47.416,0,47.623-0.146,47.782-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224C46.594-3.117,46.459-3.02,46.46-2.92c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-2.778c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C39.756,0,39.962-0.146,40.122-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224C38.934-3.117,38.799-3.02,38.8-2.92c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-2.778c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C32.095,0,32.302-0.146,32.461-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224C31.273-3.117,31.139-3.02,31.14-2.92c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-2.778c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C24.435,0,24.642-0.146,24.801-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-2.778c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C16.774,0,16.981-0.146,17.14-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     C15.81-2.74,15.809-2.756,15.8-2.776&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-2.778c0.018,0.072,0.007,0.127-0.026,0.19C8.077-2.487,8.018-2.525,7.965-2.46     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35C7.868-1.698,7.83-1.643,7.826-1.587     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C9.114,0,9.321-0.146,9.48-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789C8.954-3.54,8.847-3.448,8.692-3.367     c-0.17,0.088-0.139,0.166-0.318,0.224C8.292-3.117,8.158-3.02,8.159-2.92C8.16-2.805,8.164-2.869,8.17-2.751     C8.15-2.74,8.149-2.756,8.14-2.776&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-2.778c0.018,0.072,0.008,0.127-0.026,0.19C0.417-2.487,0.356-2.525,0.304-2.46     C0.253-2.397,0.205-2.184,0.225-2.098C0.056-2.04,0.215-1.871,0.21-1.748c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37C0.33-1.019,0.501-0.804,0.668-0.673c0.19,0.148,0.365,0.572,0.608,0.631     C1.454,0,1.66-0.146,1.819-0.185C2-0.228,2.217-0.175,2.391-0.237c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.07,0.339-0.263,0.376-0.46C3.477-1.28,3.471-1.343,3.5-1.419     c0.038-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.051-0.12-0.064-0.187c-0.021-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789C1.293-3.54,1.187-3.448,1.031-3.367     c-0.17,0.088-0.139,0.166-0.318,0.224C0.632-3.117,0.498-3.02,0.498-2.92C0.5-2.805,0.503-2.869,0.51-2.751     C0.489-2.74,0.488-2.756,0.479-2.776&amp;quot;/&amp;gt;\r\n                                            &amp;lt;/g&amp;gt;\r\n                                        &amp;lt;/g&amp;gt;\r\n                                    &amp;lt;/pattern&amp;gt;\r\n                                    &amp;lt;g&amp;gt;\r\n                                        &amp;lt;path fill=&amp;quot;#C31924&amp;quot; d=&amp;quot;M18.546,22.494l-4.455-6.834l-1.724,0.002l5.575,8.365h1.152l5.523-8.377h-1.676L18.546,22.494   L18.546,22.494z M8.841,21.895c0.003,0.604-0.467,0.906-1.401,0.906l-4.45,0.006c-0.936,0.002-1.404-0.309-1.404-0.926   l-0.005-6.209L0,15.674l0.005,6.207c0,1.443,0.996,2.166,2.988,2.164l4.447-0.002c1.99-0.008,2.984-0.721,2.984-2.148l-0.007-6.232   l-1.582,0.002L8.841,21.895L8.841,21.895z M34.219,16.65c-3.799,0.002-7.317-0.799-10.185-2.16   c1.824,1.148,4.015,2.021,6.442,2.537l0.006,6.992l1.581-0.006l-0.006-6.711c1.073,0.148,2.183,0.23,3.32,0.234l-0.001-0.916   C34.992,16.639,34.605,16.65,34.219,16.65L34.219,16.65z&amp;quot;/&amp;gt;\r\n                                        &amp;lt;g&amp;gt;\r\n                                            &amp;lt;path fill=&amp;quot;#8697AC&amp;quot; d=&amp;quot;M167.12,23.99l-2.52,0.008l-0.004-0.523h2.523c0.159,0,0.436-0.016,0.436-0.143v-0.516    c0-0.127-0.237-0.15-0.441-0.15h-1.538c-0.721,0-1.079-0.227-1.079-0.674v-0.316c0-0.443,0.356-0.67,1.074-0.674h2.438v0.521    h-2.438c-0.199,0-0.439,0.029-0.439,0.15v0.318c0,0.129,0.24,0.154,0.439,0.154l1.54-0.002c0.72,0,1.083,0.227,1.083,0.672v0.516    C168.196,23.77,167.831,23.99,167.12,23.99L167.12,23.99L167.12,23.99z M163.666,23.998h-0.638l-0.006-2.992h0.637L163.666,23.998    L163.666,23.998z M162.161,23.998h-0.489l-2.83-2.158l0.004,2.16l-0.608,0.002l-0.002-2.99h0.486l2.837,2.176l-0.007-2.182h0.608    L162.161,23.998L162.161,23.998z M156.302,24.002h-1.541c-0.713,0.006-1.078-0.264-1.078-0.791l-0.002-2.191l0.638-0.004    l0.003,2.195c0,0.068,0,0.283,0.439,0.281l1.541-0.008c0.446,0,0.446-0.199,0.446-0.264l-0.007-2.209h0.636l0.002,2.209    C157.381,23.738,157.019,24.002,156.302,24.002L156.302,24.002L156.302,24.002z M151.523,24.008l-0.637,0.002l-0.005-2.475    l-1.519,0.002v-0.516l3.636-0.002v0.516h-1.476V24.008L151.523,24.008z M146.252,24.012l-3.073,0.008l-0.005-2.994h3.074v0.52    h-2.438v0.633h2.315v0.518l-2.315,0.004v0.799l2.441-0.004V24.012L146.252,24.012z M141.22,24.02l-2.576,0.002l-0.005-2.99    l2.579-0.006c0.825,0,1.244,0.287,1.244,0.84v1.324C142.462,23.738,142.044,24.02,141.22,24.02L141.22,24.02L141.22,24.02z     M139.279,23.504h1.938c0.604,0,0.604-0.232,0.604-0.314v-1.324c0-0.078,0-0.318-0.604-0.318l-1.939,0.006L139.279,23.504    L139.279,23.504z M135.353,24.027h-3.073v-2.986l3.073-0.004v0.516h-2.437v0.637l2.311-0.006v0.523l-2.306,0.006v0.797    l2.432-0.002V24.027L135.353,24.027z M131.521,24.027l-2.991,0.004l-0.001-2.99h0.637l0.003,2.475l2.353-0.006V24.027    L131.521,24.027z M127.852,24.031l-2.99,0.004v-2.992h0.635l0.004,2.475l2.352-0.002V24.031L127.852,24.031z M124.122,24.035    l-3.071,0.008l-0.005-2.994l3.076-0.002v0.52h-2.438l0.003,0.633h2.31v0.52h-2.31v0.801l2.435-0.002V24.035L124.122,24.035z     M119.118,24.043l-1.543,0.002c-0.717,0-1.077-0.268-1.077-0.797l-0.005-2.195l0.637-0.002l0.004,2.197    c0,0.068,0,0.279,0.441,0.279l1.543-0.006c0.44-0.002,0.44-0.201,0.44-0.266l-0.003-2.205h0.64v2.205    C120.195,23.777,119.832,24.043,119.118,24.043L119.118,24.043L119.118,24.043z M114.336,24.047H113.7l-0.008-2.477l-1.52,0.006    v-0.516l3.64-0.008v0.518h-1.48L114.336,24.047L114.336,24.047z M111.519,24.049h-0.688l-0.681-1.295l-1.415,0.006l0.005,1.289    h-0.639l-0.004-2.988h2.34c0.717,0,1.077,0.221,1.081,0.672v0.352c0,0.355-0.233,0.572-0.694,0.646L111.519,24.049L111.519,24.049    z M108.735,22.238h1.703c0.203,0,0.441-0.027,0.441-0.154v-0.352c0-0.131-0.238-0.156-0.442-0.156h-1.702V22.238L108.735,22.238z     M107.227,24.051l-0.639,0.004l-0.004-2.994h0.637L107.227,24.051L107.227,24.051z M104.062,24.057h-0.445l-1.992-2.988h0.706    l1.519,2.326l1.495-2.328l0.692-0.006L104.062,24.057L104.062,24.057z M98.646,24.059l-3.074,0.008l-0.002-2.994l3.072-0.004v0.52    l-2.434,0.004v0.633l2.313-0.002v0.521h-2.313l0.003,0.805l2.435-0.008V24.059L98.646,24.059z M93.401,24.066h-0.637v-2.473    L91.246,21.6v-0.523l3.634-0.004v0.521h-1.479V24.066L93.401,24.066z M90.547,24.07l-0.643,0.004v-2.998h0.636L90.547,24.07    L90.547,24.07z M88.012,24.074h-2.52v-0.518l2.52-0.004c0.166,0,0.44-0.021,0.44-0.143v-0.516c0-0.129-0.24-0.154-0.442-0.154    l-1.543,0.004c-0.711,0-1.075-0.225-1.078-0.672v-0.318c0-0.441,0.364-0.668,1.078-0.668l2.439-0.01V21.6h-2.439    c-0.197,0-0.438,0.029-0.438,0.154v0.318c0,0.127,0.24,0.152,0.438,0.152l1.543-0.006c0.716,0,1.08,0.227,1.08,0.676v0.516    C89.09,23.848,88.727,24.074,88.012,24.074L88.012,24.074L88.012,24.074z M84.676,24.074l-0.688,0.004l-0.68-1.295h-1.412v1.295    h-0.638l-0.003-2.99l2.339-0.002c0.718,0,1.078,0.227,1.078,0.668v0.355c0,0.359-0.23,0.572-0.69,0.645L84.676,24.074    L84.676,24.074z M81.896,22.266h1.698c0.199,0,0.441-0.027,0.439-0.156v-0.354c0-0.127-0.241-0.156-0.439-0.154l-1.698,0.002    V22.266L81.896,22.266z M80.439,24.078l-3.07,0.004l-0.003-2.992l3.071-0.002v0.52H78v0.637h2.311l0.002,0.52H78l0.002,0.799    l2.437-0.006V24.078L80.439,24.078z M74.839,24.082h-0.446l-1.991-2.986l0.704-0.002l1.523,2.332l1.495-2.332l0.688-0.004    L74.839,24.082L74.839,24.082z M71.838,24.082L71.2,24.09l-0.003-2.994h0.637L71.838,24.082L71.838,24.082z M70.335,24.09h-0.49    l-2.83-2.158v2.16l-0.606,0.002l-0.004-2.996h0.492l2.832,2.18l-0.004-2.182h0.61V24.09L70.335,24.09z M64.479,24.094h-1.543    c-0.715,0.002-1.079-0.264-1.079-0.791l-0.003-2.193h0.636l0.001,2.193c0,0.066,0,0.277,0.443,0.273h1.541    c0.44,0,0.44-0.205,0.44-0.271l-0.002-2.197h0.642v2.197C65.554,23.83,65.191,24.094,64.479,24.094L64.479,24.094L64.479,24.094z     M96.303,20.58l1.555-0.559v0.553L96.303,20.58L96.303,20.58z&amp;quot;/&amp;gt;\r\n                                            &amp;lt;path fill=&amp;quot;#8697AC&amp;quot; d=&amp;quot;M63.893,14.697H63.28v0.484h0.615L63.893,14.697L63.893,14.697z M63.009,14.697h-0.616v0.484h0.618    L63.009,14.697L63.009,14.697z M72.358,18.607h0.611v-0.488h-0.611V18.607L72.358,18.607z M73.24,18.607l0.618-0.004v-0.488    l-0.618,0.004V18.607L73.24,18.607z M80.278,14.678l-0.617,0.002v0.49h0.617V14.678L80.278,14.678z M79.064,15.494    c-0.045,0.008-0.088,0.02-0.132,0.041c-0.038,0.025-0.073,0.061-0.113,0.105c-0.036,0.049-0.069,0.105-0.101,0.186    c-0.026-0.066-0.05-0.119-0.081-0.16c-0.028-0.043-0.058-0.074-0.088-0.096c-0.031-0.021-0.063-0.035-0.095-0.045    c-0.034-0.008-0.065-0.018-0.098-0.02c-0.035-0.012-0.117-0.016-0.236-0.016v1.686h-4.234v0.012l-0.272,0.004    c-0.066-0.025-0.112-0.059-0.147-0.107c-0.029-0.047-0.045-0.109-0.045-0.189v-1.4H72.81v1.396c0,0.076-0.016,0.139-0.042,0.184    c-0.028,0.045-0.07,0.076-0.136,0.1l-0.386,0.014l-7.955,0.006v-1.691h-1.696c-0.092,0.004-0.168,0.004-0.233,0.004    c-0.063,0.012-0.112,0.02-0.152,0.029c-0.131,0.021-0.226,0.082-0.279,0.174c-0.054,0.104-0.081,0.246-0.086,0.447l0.005,0.967    c0,0.102,0.008,0.188,0.019,0.26c0.016,0.072,0.036,0.135,0.068,0.186c0.031,0.049,0.074,0.092,0.117,0.125    c0.048,0.033,0.108,0.049,0.176,0.066l-0.003-0.006c0.083,0.014,0.206,0.018,0.368,0.018l9.826-0.008c0.099,0,0.174,0,0.23,0    c0.061,0,0.099-0.004,0.111-0.01c0.04-0.006,0.07-0.014,0.109-0.025c0.032-0.016,0.066-0.033,0.098-0.057    c0.033-0.025,0.06-0.061,0.092-0.105c0.028-0.045,0.051-0.096,0.076-0.166c0.031,0.074,0.061,0.129,0.091,0.178    c0.035,0.039,0.072,0.076,0.109,0.102c0.038,0.027,0.075,0.041,0.117,0.057c0.042,0.006,0.083,0.018,0.128,0.023h0.304v0.004    l3.89-0.004c0.538,0,1.074,0,1.61,0c0.532,0,1.069,0,1.615,0c0.084,0,0.161,0,0.225-0.01c0.063-0.008,0.119-0.01,0.16-0.02    c0.131-0.023,0.226-0.084,0.28-0.182c0.059-0.094,0.083-0.238,0.082-0.441V15.48l-2.54,0.002    C79.161,15.482,79.113,15.49,79.064,15.494L79.064,15.494z M63.669,17.201h-0.817c-0.1,0-0.179-0.006-0.229-0.025    c-0.057-0.01-0.094-0.035-0.116-0.074c-0.024-0.025-0.034-0.047-0.036-0.08c-0.002-0.029-0.006-0.061-0.006-0.109v-0.541    c0-0.074,0.004-0.135,0.008-0.172c0.003-0.039,0.02-0.066,0.043-0.086c0.024-0.016,0.056-0.027,0.103-0.027    c0.041-0.002,0.099-0.012,0.174-0.012h0.876V17.201L63.669,17.201z M81.132,16.822c0,0.143-0.042,0.24-0.136,0.305    c-0.026,0.02-0.063,0.029-0.103,0.039c-0.041,0.008-0.09,0.008-0.151,0.008l-2,0.002v-0.813c0-0.082,0.013-0.141,0.042-0.193    c0.027-0.047,0.079-0.078,0.148-0.1l2.201-0.002V16.822L81.132,16.822z M82.465,17.754h0.616v-3.01h-0.616V17.754L82.465,17.754z     M89.701,14.674l-0.618,0.002v0.48h0.618V14.674L89.701,14.674z M90.582,14.674h-0.613v0.48h0.613V14.674L90.582,14.674z     M95.339,15.479c-0.065,0.004-0.118,0.016-0.164,0.023c-0.13,0.023-0.219,0.08-0.274,0.18c-0.056,0.098-0.081,0.244-0.081,0.441    v1.039l-4.174,0.004v0.008h-0.272c-0.069-0.023-0.114-0.064-0.151-0.104c-0.027-0.049-0.044-0.109-0.044-0.191v-1.402h-0.611    v1.396c0,0.08-0.017,0.141-0.041,0.184c-0.03,0.045-0.07,0.076-0.137,0.098L89,17.166l-4.146,0.004v-1.455h-0.614l0.001,2.293    c0,0.086-0.01,0.148-0.033,0.197c-0.019,0.043-0.055,0.07-0.108,0.078c-0.015,0.008-0.043,0.008-0.089,0.014    c-0.046,0-0.095,0-0.158,0h-0.101l0.003,0.574h0.356c0.092,0,0.171,0,0.237-0.008c0.065-0.002,0.124-0.016,0.172-0.018    l-0.009-0.002c0.063-0.016,0.113-0.033,0.159-0.066c0.043-0.029,0.08-0.063,0.109-0.113c0.022-0.055,0.045-0.113,0.06-0.182    c0.013-0.074,0.019-0.16,0.015-0.26V17.75l4.322-0.002c0.097,0,0.176-0.006,0.232-0.006s0.096,0,0.114-0.002    c0.036-0.01,0.07-0.02,0.102-0.031c0.038-0.008,0.07-0.029,0.101-0.055c0.034-0.023,0.06-0.061,0.089-0.105    c0.03-0.041,0.057-0.096,0.078-0.168c0.026,0.072,0.063,0.137,0.092,0.176c0.037,0.047,0.073,0.082,0.11,0.107    s0.076,0.043,0.115,0.051c0.045,0.016,0.083,0.021,0.129,0.027h0.308l0,0l5.855-0.002c0.088,0,0.164,0,0.229-0.004    c0.067,0,0.117-0.008,0.159-0.021l-0.008-0.002c0.065-0.01,0.118-0.033,0.169-0.063c0.048-0.033,0.085-0.066,0.115-0.119    c0.028-0.053,0.052-0.109,0.063-0.18c0.013-0.072,0.023-0.16,0.023-0.266v-1.613h-1.691    C95.479,15.473,95.401,15.475,95.339,15.479L95.339,15.479z M95.812,16.045h0.824l0.004,0.834c0,0.039-0.004,0.066-0.009,0.088    c-0.002,0.025-0.011,0.047-0.015,0.061c-0.022,0.051-0.063,0.082-0.126,0.105c-0.059,0.021-0.137,0.033-0.239,0.033h-0.569    c-0.051,0-0.093-0.01-0.128-0.016c-0.032-0.012-0.059-0.023-0.075-0.045c-0.02-0.021-0.035-0.047-0.04-0.084    c-0.003-0.035-0.008-0.082-0.008-0.139V16.34c0-0.078,0.013-0.137,0.037-0.184s0.054-0.082,0.094-0.092    c0.022-0.002,0.055-0.008,0.096-0.012C95.7,16.049,95.751,16.047,95.812,16.045L95.812,16.045z M96.311,14.664H95.7v0.488h0.61    V14.664L96.311,14.664z M98.455,18.252h-0.223c-0.03,0-0.046,0-0.046,0c-0.01-0.008-0.015-0.027-0.019-0.055    c0-0.021,0.012-0.035,0.028-0.037h0.371v-0.193h-0.391c-0.047,0-0.08,0-0.112,0.006c-0.039,0.006-0.063,0.025-0.086,0.051    c-0.016,0.023-0.025,0.066-0.025,0.127v0.133c0,0.061,0.025,0.104,0.08,0.127c0.039,0.025,0.08,0.033,0.132,0.033h0.232    c0.015,0,0.024,0.004,0.029,0.016c0.002,0.006,0.005,0.023,0.002,0.045c0,0.021-0.011,0.035-0.027,0.035h-0.448v0.191h0.474    c0.045,0,0.079-0.002,0.104-0.002c0.041-0.012,0.069-0.027,0.087-0.053c0.015-0.027,0.023-0.068,0.023-0.127v-0.113    c0-0.064-0.023-0.109-0.061-0.145C98.546,18.266,98.506,18.252,98.455,18.252L98.455,18.252z M103.054,16.871    c0.003,0.156-0.062,0.254-0.194,0.281l-4.092,0.004c-0.129-0.029-0.195-0.123-0.195-0.283v-2.145h-0.609v2.352    c0,0.191,0.022,0.34,0.078,0.438c0.049,0.094,0.136,0.154,0.25,0.186c0.106,0.025,0.245,0.037,0.418,0.037l4.203-0.004    c0.186,0,0.322-0.016,0.427-0.041c0.114-0.031,0.2-0.092,0.252-0.189c0.048-0.098,0.07-0.238,0.07-0.43v-2.352h-0.609    L103.054,16.871L103.054,16.871z M104.51,17.73h0.617v-3.006h-0.62L104.51,17.73L104.51,17.73z M125.818,14.637h-0.617v0.488    h0.617V14.637L125.818,14.637z M125.213,16.846c0,0.16-0.064,0.256-0.195,0.287l-8.11,0.006v0.008h-0.121    c-0.128-0.041-0.189-0.141-0.189-0.291l-0.007-1.402h-0.617l0.002,1.395c0,0.072-0.011,0.139-0.039,0.182    c-0.024,0.043-0.067,0.076-0.128,0.098c-0.013,0.002-0.034,0.006-0.066,0.012c-0.029,0-0.063,0-0.094,0.002    c-0.036,0.006-0.066,0.006-0.103,0.006c-0.037,0-0.057,0-0.075,0h-0.2c-0.124-0.041-0.187-0.135-0.187-0.291l-0.002-1.402h-0.616    v1.396c0,0.148-0.055,0.244-0.175,0.283c-0.011,0-0.023,0.006-0.047,0.006c-0.023,0.006-0.056,0.006-0.104,0.008h-0.548v-1.699    h-0.615l0.003,2.26c0,0.158-0.065,0.248-0.193,0.287h-0.908c-0.128-0.033-0.194-0.127-0.194-0.287v-2.252h-0.619l0.005,3.117    h1.776c0.171,0,0.308-0.016,0.419-0.037c0.115-0.027,0.201-0.092,0.254-0.189c0.048-0.094,0.077-0.238,0.077-0.432v-0.188h0.486    c0.199-0.006,0.317-0.008,0.349-0.014c0.034-0.006,0.069-0.012,0.105-0.027c0.039-0.008,0.071-0.031,0.097-0.053    c0.031-0.029,0.063-0.064,0.092-0.107c0.028-0.045,0.052-0.1,0.078-0.168c0.03,0.076,0.068,0.143,0.108,0.191    c0.034,0.049,0.073,0.084,0.115,0.111c0.04,0.025,0.084,0.043,0.131,0.049c0.046,0.01,0.094,0.012,0.147,0.012h0.203    c0.067-0.002,0.132-0.002,0.192-0.002c0.06,0,0.112,0,0.156-0.004c0.049,0,0.074,0,0.076-0.002    c0.034-0.006,0.073-0.018,0.108-0.027c0.037-0.014,0.063-0.031,0.1-0.055c0.03-0.027,0.063-0.063,0.086-0.105    c0.032-0.047,0.059-0.1,0.08-0.168c0.03,0.07,0.061,0.129,0.095,0.174c0.035,0.047,0.071,0.082,0.105,0.107    c0.04,0.023,0.077,0.041,0.122,0.055c0.038,0.01,0.075,0.02,0.124,0.021h0.156l-0.002,0.004l8.163-0.006    c0.177,0,0.316-0.012,0.426-0.035c0.117-0.027,0.2-0.092,0.248-0.191c0.055-0.094,0.077-0.238,0.077-0.432v-1.611h-0.608V16.846    L125.213,16.846z M133.771,14.629h-0.618v0.484h0.618V14.629L133.771,14.629z M134.035,16.838c0,0.16-0.06,0.256-0.195,0.285    l-4.93,0.004v-1.688l-1.694,0.004c-0.085,0-0.159,0-0.225,0.004c-0.065,0.006-0.118,0.014-0.161,0.025    c-0.127,0.021-0.218,0.084-0.275,0.176c-0.058,0.098-0.081,0.246-0.081,0.441v0.965c0,0.102,0.007,0.189,0.023,0.26    c0.01,0.072,0.027,0.139,0.058,0.186c0.032,0.049,0.07,0.09,0.118,0.117c0.044,0.033,0.102,0.055,0.166,0.068h-0.005    c0.04,0.01,0.096,0.018,0.157,0.021c0.066,0.002,0.14,0.002,0.225,0.002h1.078v0.258c0,0.082-0.015,0.148-0.043,0.195    c-0.035,0.045-0.088,0.074-0.154,0.092H127.7v0.574h0.463c0.177,0,0.31-0.008,0.385-0.018h-0.007    c0.071-0.016,0.126-0.041,0.173-0.066c0.048-0.029,0.085-0.072,0.113-0.123c0.03-0.045,0.048-0.109,0.065-0.182    c0.013-0.07,0.018-0.16,0.018-0.26v-0.471l4.988-0.006c0.172,0,0.314-0.01,0.422-0.039c0.116-0.025,0.196-0.086,0.248-0.188    c0.055-0.094,0.079-0.234,0.079-0.428v-1.617h-0.612V16.838L134.035,16.838z M128.294,17.127l-0.962,0.002    c-0.159,0-0.244-0.096-0.244-0.285v-0.537c0-0.074,0.014-0.139,0.04-0.184c0.022-0.049,0.056-0.076,0.094-0.09    c0.016-0.006,0.048-0.006,0.09-0.01c0.045-0.006,0.095-0.008,0.16-0.008h0.822V17.127L128.294,17.127z M134.037,15.113h0.616    v-0.484h-0.618L134.037,15.113L134.037,15.113z M140.093,14.617h-0.621v0.49h0.621V14.617L140.093,14.617z M140.974,14.617h-0.616    l0.003,0.49h0.613V14.617L140.974,14.617z M159.188,15.439c-0.048-0.01-0.105-0.014-0.165-0.023    c-0.062-0.002-0.126-0.006-0.209-0.006h-1.026c-0.089,0-0.167,0.004-0.229,0.006c-0.069,0.01-0.122,0.014-0.168,0.027    c-0.124,0.018-0.213,0.082-0.27,0.178c-0.055,0.094-0.084,0.248-0.084,0.441l0.004,0.748c0,0.143-0.063,0.242-0.184,0.275    c0,0-0.023-0.006-0.079-0.006c-0.055,0.004-0.118,0.004-0.179,0.006v0.016l-4.429,0.004l0.279-1.07v0.006    c0.02-0.078,0.03-0.133,0.04-0.186c0.008-0.057,0.014-0.107,0.014-0.146c0-0.08-0.023-0.145-0.068-0.186    c-0.045-0.045-0.117-0.07-0.21-0.09c-0.028-0.004-0.066-0.008-0.122-0.014c-0.061-0.004-0.132-0.004-0.208-0.006l-1.688,0.006    c-0.077,0-0.145,0-0.204,0.006c-0.061,0-0.1,0.004-0.127,0.008c-0.093,0.021-0.159,0.047-0.208,0.092    c-0.042,0.039-0.067,0.104-0.067,0.184c0,0.045,0.007,0.094,0.016,0.146c0.01,0.053,0.021,0.115,0.036,0.186l0,0    c0.023,0.072,0.045,0.158,0.068,0.244c0.022,0.094,0.047,0.186,0.072,0.283c0.026,0.096,0.048,0.197,0.074,0.287    c0.022,0.09,0.044,0.178,0.064,0.25l-8.563,0.008V15.43h-1.693c-0.088,0-0.167,0-0.229,0.004c-0.065,0.01-0.12,0.02-0.156,0.025    c-0.132,0.021-0.229,0.084-0.278,0.18c-0.058,0.096-0.083,0.244-0.083,0.436l0.002,0.975c0,0.102,0.006,0.189,0.02,0.262    c0.015,0.072,0.038,0.137,0.069,0.186c0.029,0.049,0.068,0.09,0.118,0.119c0.047,0.031,0.107,0.055,0.177,0.066l-0.007-0.002    c0.082,0.014,0.208,0.021,0.375,0.021l16.97-0.021c0.078,0,0.146,0,0.198,0c0.059,0,0.093,0,0.107-0.008    c0.037-0.008,0.072-0.018,0.11-0.025c0.033-0.014,0.066-0.033,0.097-0.061c0.035-0.02,0.064-0.057,0.091-0.102    c0.03-0.045,0.058-0.102,0.081-0.17c0.032,0.078,0.065,0.141,0.103,0.191c0.038,0.051,0.076,0.088,0.118,0.111    c0.038,0.029,0.08,0.043,0.127,0.053c0.048,0.01,0.095,0.01,0.144,0.01h0.992c0.086,0,0.164,0,0.223-0.002    c0.068-0.006,0.12-0.014,0.165-0.023H159.2c0.065-0.01,0.124-0.037,0.172-0.068c0.045-0.029,0.081-0.064,0.117-0.115    c0.023-0.049,0.047-0.113,0.059-0.184c0.013-0.07,0.02-0.158,0.02-0.26v-0.971c0-0.195-0.031-0.348-0.092-0.439    C159.42,15.523,159.324,15.461,159.188,15.439L159.188,15.439z M140.748,17.125h-0.814c-0.097,0-0.176-0.006-0.228-0.02    c-0.057-0.012-0.098-0.043-0.118-0.078c-0.02-0.023-0.036-0.049-0.038-0.082c-0.004-0.027-0.004-0.063-0.004-0.107v-0.541    c0-0.074,0.004-0.133,0.006-0.174c0.006-0.037,0.024-0.066,0.045-0.082c0.026-0.021,0.058-0.037,0.103-0.037    c0.046-0.002,0.103-0.002,0.176-0.002h0.873V17.125L140.748,17.125z M151.768,16.32l-0.117,0.459l0,0    c-0.035,0.133-0.103,0.227-0.199,0.283c-0.029,0.014-0.063,0.031-0.104,0.035c-0.039,0.004-0.085,0.008-0.142,0.008h-0.305    c-0.059,0-0.104-0.004-0.15-0.008c-0.039-0.004-0.071-0.02-0.101-0.035c-0.048-0.029-0.084-0.064-0.118-0.109    c-0.027-0.041-0.054-0.098-0.073-0.174v0.006c-0.018-0.078-0.04-0.158-0.059-0.232c-0.022-0.082-0.042-0.158-0.065-0.23    c-0.046-0.225,0.019-0.328,0.197-0.328h1.036C151.754,15.994,151.819,16.098,151.768,16.32L151.768,16.32z M158.946,16.818    c0,0.072-0.005,0.123-0.019,0.16l0.004-0.004c-0.02,0.047-0.059,0.082-0.121,0.102c-0.055,0.021-0.137,0.029-0.242,0.029h-0.729    c-0.123-0.043-0.183-0.139-0.19-0.293v-0.537c0-0.086,0.026-0.154,0.067-0.205s0.1-0.076,0.188-0.084h0.861    c0.061,0.023,0.105,0.057,0.137,0.105c0.029,0.047,0.044,0.111,0.044,0.184V16.818L158.946,16.818z M167.922,17.09l-0.252-1.006    c-0.048-0.209-0.114-0.371-0.196-0.467c-0.084-0.104-0.197-0.164-0.344-0.188c-0.05-0.01-0.099-0.02-0.163-0.023    c-0.065-0.002-0.142-0.006-0.224-0.006h-1.39v0.586h1.325c0.058,0,0.103,0,0.143,0.008c0.041,0.008,0.08,0.021,0.107,0.033    c0.047,0.029,0.087,0.07,0.118,0.115s0.055,0.098,0.073,0.164v-0.002c0.01,0.059,0.025,0.115,0.042,0.182    c0.014,0.068,0.036,0.141,0.053,0.211c0.018,0.07,0.038,0.146,0.056,0.215c0.015,0.07,0.032,0.125,0.045,0.182l-6.271,0.004    c-0.126-0.027-0.191-0.123-0.191-0.285l-0.007-2.139h-0.606l0.002,2.348c0,0.189,0.027,0.336,0.076,0.432    c0.05,0.092,0.137,0.158,0.256,0.191c0.106,0.02,0.245,0.035,0.415,0.035l7.201-0.01v-0.58H167.922L167.922,17.09z     M166.125,18.516h0.618v-0.492h-0.618V18.516L166.125,18.516z&amp;quot;/&amp;gt;\r\n                                        &amp;lt;/g&amp;gt;\r\n                                        &amp;lt;path fill=&amp;quot;#8697AC&amp;quot; d=&amp;quot;M47.016,22.387h-0.693c-1.093,0.004-2.034,0.67-2.435,1.617L49.458,24   C49.052,23.049,48.113,22.387,47.016,22.387L47.016,22.387z M55.507,17.539v0.639c0,0.627-0.509,1.135-1.133,1.137L38.962,19.33   c-0.624,0-1.133-0.51-1.133-1.133l-0.012-8.51c-0.001-0.625,0.509-1.137,1.136-1.137h0.871c0-0.018-0.005-0.033-0.002-0.049   c-0.003-0.496,0.037-0.984,0.103-1.465L38.95,7.041c-1.461,0-2.646,1.186-2.646,2.646l0.009,8.51   c0.002,1.465,1.19,2.645,2.651,2.645l15.41-0.016c1.461-0.002,2.647-1.186,2.645-2.648v-1.707   C56.548,16.871,56.042,17.227,55.507,17.539L55.507,17.539z&amp;quot;/&amp;gt;\r\n                                        &amp;lt;path fill=&amp;quot;#C2CAD7&amp;quot; d=&amp;quot;M49.181,9.254c-0.017-0.084-0.03-0.168-0.037-0.25c-0.527,0.164-1.043,0.396-1.535,0.697   c-0.607,0.375-1.141,0.824-1.588,1.338c0.372-0.357,0.787-0.684,1.244-0.963C47.877,9.701,48.523,9.428,49.181,9.254L49.181,9.254z    M55.02,9.828c-0.46-0.303-0.952-0.547-1.463-0.732c-0.016,0.115-0.041,0.229-0.071,0.334c0.469,0.168,0.92,0.383,1.348,0.643   C54.887,9.986,54.949,9.902,55.02,9.828L55.02,9.828z M57.1,11.984c-0.059-0.096-0.122-0.191-0.184-0.285   c-0.044,0.043-0.09,0.08-0.136,0.117c0.164,0.209,0.313,0.426,0.455,0.656c0.282,0.459,0.503,0.938,0.671,1.428   C57.738,13.242,57.471,12.596,57.1,11.984L57.1,11.984z M54.831,13.16c0.317-0.336,0.596-0.707,0.836-1.107   c-0.047-0.014-0.092-0.023-0.134-0.039C55.337,12.424,55.104,12.809,54.831,13.16L54.831,13.16z M50.333,3.016   c0-0.088,0.013-0.172,0.032-0.252c-0.923-0.002-1.808,0.205-2.611,0.58C48.558,3.063,49.433,2.941,50.333,3.016L50.333,3.016z    M52.965,3.344c-0.03,0.141-0.083,0.279-0.156,0.398c2.057,1.105,3.379,3.299,3.327,5.697c0.123,0.01,0.243,0.045,0.352,0.092   C56.751,6.891,55.288,4.426,52.965,3.344L52.965,3.344z M51.295,1.791C50.957,1.166,50.542,0.568,50.061,0   c0.423,0.594,0.772,1.217,1.043,1.863C51.165,1.834,51.229,1.811,51.295,1.791L51.295,1.791z M46.676,14.602   c1.669-1.023,3.044-2.27,4.022-3.672c-0.354-0.111-0.672-0.307-0.926-0.566c-0.953,1.217-2.217,2.309-3.726,3.23   C46.394,13.807,46.636,14.172,46.676,14.602L46.676,14.602z M52.313,6.807c0.036-0.313,0.053-0.623,0.053-0.936   c0-0.537-0.054-1.068-0.156-1.586c-0.15,0.066-0.317,0.107-0.488,0.115c0.013,0.191,0.022,0.387,0.022,0.58   c0,0.549-0.056,1.09-0.167,1.617C51.84,6.625,52.085,6.695,52.313,6.807L52.313,6.807z M44.016,14.727   c0-0.023,0.003-0.047,0.006-0.072c-1.611,0.725-3.412,1.275-5.342,1.615v1.057c2.099-0.281,4.062-0.826,5.804-1.586   C44.198,15.49,44.016,15.131,44.016,14.727L44.016,14.727z M42.374,5.191c-0.267,0.859-0.411,1.781-0.411,2.734   c0.003,2.318,0.865,4.434,2.287,6.053c0.084-0.129,0.192-0.238,0.315-0.328c-1.501-1.699-2.416-3.93-2.418-6.379   C42.147,6.557,42.228,5.861,42.374,5.191L42.374,5.191z M46.526,15.348c-0.069,0.131-0.159,0.248-0.265,0.348   c1.417,0.891,3.098,1.412,4.901,1.41c0.951,0,1.871-0.145,2.735-0.42c-0.671,0.15-1.369,0.23-2.085,0.234   C49.861,16.92,48.047,16.342,46.526,15.348L46.526,15.348z&amp;quot;/&amp;gt;\r\n                                        &amp;lt;path fill=&amp;quot;#c31924&amp;quot; d=&amp;quot;M56.414,10.047c-0.092-0.057-0.195-0.094-0.31-0.113c-0.041-0.008-0.086-0.012-0.13-0.012   c-0.208,0-0.398,0.074-0.544,0.201c-0.073,0.064-0.135,0.139-0.182,0.219c-0.069,0.125-0.11,0.266-0.11,0.416   c0,0.377,0.247,0.695,0.589,0.799c0.058,0.02,0.123,0.029,0.184,0.037c0.023,0,0.042,0,0.063,0c0.184,0,0.353-0.059,0.49-0.156   c0.056-0.043,0.107-0.09,0.15-0.143c0.123-0.145,0.195-0.332,0.195-0.539C56.81,10.457,56.653,10.195,56.414,10.047L56.414,10.047z    M45.348,13.889c-0.462,0-0.834,0.375-0.834,0.836c0,0.465,0.375,0.84,0.839,0.84c0.46,0,0.833-0.375,0.833-0.84   C46.185,14.264,45.81,13.889,45.348,13.889L45.348,13.889z M52.166,7.676c-0.226-0.16-0.505-0.258-0.804-0.264c0,0-0.006,0-0.01,0   c-0.766,0-1.387,0.623-1.39,1.387l-0.003,0.01c0,0.094,0.011,0.189,0.03,0.277c0.044,0.221,0.142,0.424,0.274,0.59   c0.221,0.277,0.546,0.465,0.907,0.516c0.063,0.006,0.123,0.01,0.185,0.01c0.635,0,1.168-0.422,1.339-1.006   c0.029-0.104,0.045-0.217,0.052-0.338c0-0.016,0.001-0.031,0.001-0.051C52.748,8.34,52.518,7.928,52.166,7.676L52.166,7.676z    M51.659,3.908c0.004,0,0.009,0,0.009,0c0.156-0.004,0.304-0.045,0.428-0.123c0.107-0.064,0.199-0.152,0.267-0.26   c0.072-0.111,0.118-0.236,0.13-0.379c0.003-0.025,0.005-0.049,0.005-0.078c0-0.459-0.377-0.832-0.839-0.832   c-0.043,0-0.086,0.006-0.13,0.01C51.44,2.26,51.36,2.287,51.282,2.328c-0.187,0.096-0.333,0.258-0.406,0.457   c-0.033,0.092-0.051,0.186-0.051,0.283v0.006C50.825,3.535,51.2,3.908,51.659,3.908L51.659,3.908z&amp;quot;/&amp;gt;\r\n                                    &amp;lt;/g&amp;gt;\r\n                                    &amp;lt;/svg&amp;gt;\r\n                            &amp;lt;/object&amp;gt;\r\n\r\n\r\n                        &amp;lt;/td&amp;gt;\r\n                        &amp;lt;td align=&amp;quot;right&amp;quot;&amp;gt;&amp;lt;h6 class=&amp;quot;collapse&amp;quot;&amp;gt;Invitation&amp;lt;/h6&amp;gt;&amp;lt;/td&amp;gt;\r\n                    &amp;lt;/tr&amp;gt;\r\n                &amp;lt;/table&amp;gt;\r\n            &amp;lt;/div&amp;gt;\r\n\r\n        &amp;lt;/td&amp;gt;\r\n        &amp;lt;td&amp;gt;&amp;lt;/td&amp;gt;\r\n    &amp;lt;/tr&amp;gt;\r\n&amp;lt;/table&amp;gt;&amp;lt;!-- /HEADER --&amp;gt;\r\n\r\n\r\n&amp;lt;!-- BODY --&amp;gt;\r\n&amp;lt;table class=&amp;quot;bodyBoxMail-wrap&amp;quot;&amp;gt;\r\n    &amp;lt;tr&amp;gt;\r\n        &amp;lt;td&amp;gt;&amp;lt;/td&amp;gt;\r\n        &amp;lt;td class=&amp;quot;containerBoxMail&amp;quot; bgcolor=&amp;quot;#FFFFFF&amp;quot;&amp;gt;\r\n\r\n            &amp;lt;div class=&amp;quot;contentBoxMail&amp;quot;&amp;gt;\r\n                &amp;lt;table&amp;gt;\r\n                    &amp;lt;tr&amp;gt;\r\n                        &amp;lt;td&amp;gt;\r\n                            &amp;lt;h3&amp;gt;Bonjour, Limam Oussama&amp;lt;/h3&amp;gt;\r\n                            &amp;lt;p class=&amp;quot;lead&amp;quot;&amp;gt;\r\n                                Invitation pour tutorat                            &amp;lt;/p&amp;gt;\r\n                            &amp;lt;p&amp;gt;\r\n        Vous ete inviter &agrave; effetuer la validation des modules sit&eacute; dans ce mail pour enseigner ....\r\n    &amp;lt;/p&amp;gt;\r\n                            &amp;lt;!-- Callout Panel --&amp;gt;\r\n                            &amp;lt;p class=&amp;quot;callout&amp;quot;&amp;gt;\r\n                                Suivre ce lien :  &amp;lt;a href=&amp;quot;/enseignant/mon-compte/index/35?__token=3638303761336636616163336337666237376362643832353538306431363361393739626335353738613238316637343961626631646434623532373630366251554e474e445532526a67784d45464351305246526d32523558583952392b6c394e454c39784f456355435257424b2f3565446e57537a764c54672f5a686a584e356c56465a6f484e4a4255647437725066454f4c584c314b352f6e64417a734378447563476d64617862544d5656697a454869544a3475687333435733764f4a6858396e733966744c51372b7163373570426c746d6d41636f694642326744612b4b55543731624956383d&amp;quot;&amp;gt;Cliquer ICI! &amp;amp;raquo;&amp;lt;/a&amp;gt;\r\n                            &amp;lt;/p&amp;gt;&amp;lt;!-- /Callout Panel --&amp;gt;\r\n\r\n                            &amp;lt;!--Formation---&amp;gt;\r\n\r\n                        &amp;lt;table class=&amp;quot;tableContent&amp;quot;&amp;gt;\r\n                            &amp;lt;tr&amp;gt;\r\n                                &amp;lt;th&amp;gt;Formation&amp;lt;/th&amp;gt;\r\n                                &amp;lt;th&amp;gt;Niveau&amp;lt;/th&amp;gt;\r\n                                &amp;lt;th&amp;gt;P&eacute;riode&amp;lt;/th&amp;gt;\r\n                                &amp;lt;th&amp;gt;Module&amp;lt;/th&amp;gt;\r\n                            &amp;lt;/tr&amp;gt;\r\n                                                            &amp;lt;tr&amp;gt;\r\n                                    &amp;lt;td rowspan=&amp;quot;7&amp;quot;&amp;gt;\r\n                                        &amp;lt;!--Formation--&amp;gt;\r\n                                        &amp;lt;table class=&amp;quot;tableContent&amp;quot;&amp;gt;\r\n                                                                                            &amp;lt;tr&amp;gt;\r\n                                                    &amp;lt;th&amp;gt;Dipl&ocirc;me&amp;lt;/th&amp;gt;\r\n                                                    &amp;lt;td&amp;gt;Licence Appliqu&eacute;e&amp;lt;/td&amp;gt;\r\n                                                &amp;lt;/tr&amp;gt;\r\n                                                                                            &amp;lt;tr&amp;gt;\r\n                                                    &amp;lt;th&amp;gt;Domaine&amp;lt;/th&amp;gt;\r\n                                                    &amp;lt;td&amp;gt;Sciences de gestion&amp;lt;/td&amp;gt;\r\n                                                &amp;lt;/tr&amp;gt;\r\n                                                                                            &amp;lt;tr&amp;gt;\r\n                                                    &amp;lt;th&amp;gt;Mention&amp;lt;/th&amp;gt;\r\n                                                    &amp;lt;td&amp;gt;Management&amp;lt;/td&amp;gt;\r\n                                                &amp;lt;/tr&amp;gt;\r\n                                                                                            &amp;lt;tr&amp;gt;\r\n                                                    &amp;lt;th&amp;gt;Parcours&amp;lt;/th&amp;gt;\r\n                                                    &amp;lt;td&amp;gt;Licence Appliqu&eacute;e en Management&amp;lt;/td&amp;gt;\r\n                                                &amp;lt;/tr&amp;gt;\r\n                                                                                    &amp;lt;/table&amp;gt;\r\n                                        &amp;lt;!--Fin Formation--&amp;gt;\r\n                                    &amp;lt;/td&amp;gt;\r\n                                &amp;lt;/tr&amp;gt;\r\n                                                                    &amp;lt;tr&amp;gt;\r\n                                        &amp;lt;th rowspan=&amp;quot;5&amp;quot;&amp;gt;1&egrave;re Ann&eacute;e&amp;lt;/th&amp;gt;\r\n                                    &amp;lt;/tr&amp;gt;\r\n                                                                            &amp;lt;tr&amp;gt;\r\n                                            &amp;lt;td rowspan=&amp;quot;2&amp;quot;&amp;gt;P&eacute;riode 1&amp;lt;/td&amp;gt;\r\n                                        &amp;lt;/tr&amp;gt;\r\n                                                                                    &amp;lt;tr&amp;gt;\r\n                                                &amp;lt;td&amp;gt;\r\n                                                    &amp;lt;table class=&amp;quot;tableContent&amp;quot;&amp;gt;\r\n                                                        &amp;lt;tr&amp;gt;\r\n                                                            &amp;lt;td&amp;gt; comptabilit&eacute; financi&eacute;re 1&amp;lt;/td&amp;gt;\r\n                                                        &amp;lt;/tr&amp;gt;\r\n                                                        &amp;lt;tr&amp;gt;\r\n                                                            &amp;lt;th&amp;gt; Coef. :&amp;lt;/th&amp;gt;&amp;lt;td&amp;gt; 3.00&amp;lt;/td&amp;gt;\r\n                                                        &amp;lt;/tr&amp;gt;\r\n                                                        &amp;lt;tr&amp;gt;\r\n                                                            &amp;lt;th&amp;gt; Noture. :&amp;lt;/th&amp;gt;&amp;lt;td&amp;gt;  Fond&amp;lt;/td&amp;gt;\r\n                                                        &amp;lt;/tr&amp;gt;\r\n                                                        &amp;lt;tr&amp;gt;\r\n                                                            &amp;lt;th&amp;gt; R&eacute;gime. :&amp;lt;/th&amp;gt;&amp;lt;td&amp;gt;  MX&amp;lt;/td&amp;gt;\r\n                                                        &amp;lt;/tr&amp;gt;\r\n\r\n                                                    &amp;lt;/table&amp;gt;\r\n\r\n\r\n\r\n                                                &amp;lt;/td&amp;gt;\r\n                                            &amp;lt;/tr&amp;gt;\r\n                                        \r\n                                                                            &amp;lt;tr&amp;gt;\r\n                                            &amp;lt;td rowspan=&amp;quot;2&amp;quot;&amp;gt;Semestre 1&amp;lt;/td&amp;gt;\r\n                                        &amp;lt;/tr&amp;gt;\r\n                                                                                    &amp;lt;tr&amp;gt;\r\n                                                &amp;lt;td&amp;gt;\r\n                                                    &amp;lt;table class=&amp;quot;tableContent&amp;quot;&amp;gt;\r\n                                                        &amp;lt;tr&amp;gt;\r\n                                                            &amp;lt;td&amp;gt; math&eacute;matiques 1:analyse&amp;lt;/td&amp;gt;\r\n                                                        &amp;lt;/tr&amp;gt;\r\n                                                        &amp;lt;tr&amp;gt;\r\n                                                            &amp;lt;th&amp;gt; Coef. :&amp;lt;/th&amp;gt;&amp;lt;td&amp;gt; 2.00&amp;lt;/td&amp;gt;\r\n                                                        &amp;lt;/tr&amp;gt;\r\n                                                        &amp;lt;tr&amp;gt;\r\n                                                            &amp;lt;th&amp;gt; Noture. :&amp;lt;/th&amp;gt;&amp;lt;td&amp;gt;  Fond&amp;lt;/td&amp;gt;\r\n                                                        &amp;lt;/tr&amp;gt;\r\n                                                        &amp;lt;tr&amp;gt;\r\n                                                            &amp;lt;th&amp;gt; R&eacute;gime. :&amp;lt;/th&amp;gt;&amp;lt;td&amp;gt;  MX&amp;lt;/td&amp;gt;\r\n                                                        &amp;lt;/tr&amp;gt;\r\n\r\n                                                    &amp;lt;/table&amp;gt;\r\n\r\n\r\n\r\n                                                &amp;lt;/td&amp;gt;\r\n                                            &amp;lt;/tr&amp;gt;\r\n                                        \r\n                                    \r\n                                \r\n                            \r\n                            &amp;lt;/tr&amp;gt;\r\n                        &amp;lt;/table&amp;gt;\r\n\r\n\r\n\r\n                            &amp;lt;!--End Formation--&amp;gt;\r\n\r\n\r\n                            &amp;lt;!-- social &amp;amp; contact --&amp;gt;\r\n                            &amp;lt;table class=&amp;quot;social&amp;quot; width=&amp;quot;100%&amp;quot;&amp;gt;\r\n                                &amp;lt;tr&amp;gt;\r\n                                    &amp;lt;td&amp;gt;\r\n\r\n                                        &amp;lt;!-- column 1 --&amp;gt;\r\n                                        &amp;lt;table align=&amp;quot;left&amp;quot; class=&amp;quot;columnBoxMail&amp;quot;&amp;gt;\r\n                                            &amp;lt;tr&amp;gt;\r\n                                                &amp;lt;td&amp;gt;\r\n\r\n                                                    &amp;lt;h5 class=&amp;quot;&amp;quot;&amp;gt;Contacter nous:&amp;lt;/h5&amp;gt;\r\n                                                    &amp;lt;p class=&amp;quot;&amp;quot;&amp;gt;&amp;lt;a href=&amp;quot;#&amp;quot; class=&amp;quot;soc-btnBoxMail fb&amp;quot;&amp;gt;Facebook&amp;lt;/a&amp;gt; &amp;lt;a href=&amp;quot;#&amp;quot; class=&amp;quot;soc-btnBoxMail tw&amp;quot;&amp;gt;Twitter&amp;lt;/a&amp;gt; &amp;lt;a href=&amp;quot;#&amp;quot; class=&amp;quot;soc-btnBoxMail gp&amp;quot;&amp;gt;Google+&amp;lt;/a&amp;gt;&amp;lt;/p&amp;gt;\r\n\r\n                                                &amp;lt;/td&amp;gt;\r\n                                            &amp;lt;/tr&amp;gt;\r\n                                        &amp;lt;/table&amp;gt;&amp;lt;!-- /column 1 --&amp;gt;\r\n\r\n                                        &amp;lt;!-- column 2 --&amp;gt;\r\n                                        &amp;lt;table align=&amp;quot;left&amp;quot; class=&amp;quot;columnBoxMail&amp;quot;&amp;gt;\r\n                                            &amp;lt;tr&amp;gt;\r\n                                                &amp;lt;td&amp;gt;\r\n\r\n                                                    &amp;lt;h5 class=&amp;quot;&amp;quot;&amp;gt;Contact Info:&amp;lt;/h5&amp;gt;\r\n                                                    &amp;lt;p&amp;gt;\r\n\r\n                                                            T&eacute;l&eacute;phone:\r\n                                                        &amp;lt;strong&amp;gt;+216 71 90 52 48 &amp;lt;/strong&amp;gt; &amp;lt;b&amp;gt;/&amp;lt;/b&amp;gt; &amp;lt;strong&amp;gt;+216 71 90 52&amp;lt;/strong&amp;gt; &amp;lt;b&amp;gt;/&amp;lt;/b&amp;gt; &amp;lt;strong&amp;gt;+216 71 90 52 54 &amp;lt;/strong&amp;gt;  &amp;lt;br&amp;gt;\r\n                                                            Fax:\r\n                                                             &amp;lt;strong&amp;gt;+216 71 90 36 03&amp;lt;/strong&amp;gt; &amp;lt;br&amp;gt;\r\n\r\n                                                    &amp;lt;/p&amp;gt;\r\n\r\n                                                &amp;lt;/td&amp;gt;\r\n                                                &amp;lt;td&amp;gt;\r\n\r\n                                                    Email: &amp;lt;strong&amp;gt;&amp;lt;a href=&amp;quot;emailto:contact@uvt.tn&amp;quot;&amp;gt;contact@uvt.tn&amp;lt;/a&amp;gt;&amp;lt;/strong&amp;gt;&amp;lt;br&amp;gt;\r\n                                                    Site Web :  &amp;lt;strong&amp;gt;&amp;lt;a href=&amp;quot;www.uvt.rnu.tn&amp;quot;&amp;gt;www.uvt.rnu.tn&amp;lt;/a&amp;gt;&amp;lt;/strong&amp;gt;\r\n\r\n                                                &amp;lt;/td&amp;gt;\r\n                                            &amp;lt;/tr&amp;gt;\r\n                                        &amp;lt;/table&amp;gt;&amp;lt;!-- /column 2 --&amp;gt;\r\n\r\n                                        &amp;lt;span class=&amp;quot;clearBoxMail&amp;quot;&amp;gt;&amp;lt;/span&amp;gt;\r\n\r\n                                    &amp;lt;/td&amp;gt;\r\n                                &amp;lt;/tr&amp;gt;\r\n                            &amp;lt;/table&amp;gt;&amp;lt;!-- /social &amp;amp; contact --&amp;gt;\r\n\r\n                        &amp;lt;/td&amp;gt;\r\n                    &amp;lt;/tr&amp;gt;\r\n\r\n                &amp;lt;/table&amp;gt;\r\n            &amp;lt;/div&amp;gt;&amp;lt;!-- /content --&amp;gt;\r\n\r\n        &amp;lt;/td&amp;gt;\r\n        &amp;lt;td&amp;gt;&amp;lt;/td&amp;gt;\r\n    &amp;lt;/tr&amp;gt;\r\n&amp;lt;/table&amp;gt;&amp;lt;!-- /BODY --&amp;gt;\r\n\r\n&amp;lt;!-- FOOTER --&amp;gt;\r\n&amp;lt;table class=&amp;quot;footerBoxMail-wrap&amp;quot;&amp;gt;\r\n    &amp;lt;tr&amp;gt;\r\n        &amp;lt;td&amp;gt;&amp;lt;/td&amp;gt;\r\n        &amp;lt;td class=&amp;quot;containerBoxMail&amp;quot;&amp;gt;\r\n\r\n            &amp;lt;!-- content --&amp;gt;\r\n            &amp;lt;div class=&amp;quot;contentBoxMail&amp;quot;&amp;gt;\r\n                &amp;lt;table&amp;gt;\r\n                    &amp;lt;tr&amp;gt;\r\n                        &amp;lt;td align=&amp;quot;center&amp;quot;&amp;gt;\r\n                            &amp;lt;p&amp;gt;\r\n                                &amp;lt;a href=&amp;quot;#&amp;quot;&amp;gt;Aide&amp;lt;/a&amp;gt; |\r\n                                &amp;lt;a href=&amp;quot;#&amp;quot;&amp;gt;Information&amp;lt;/a&amp;gt; |\r\n                                &amp;lt;a href=&amp;quot;#&amp;quot;&amp;gt;&amp;lt;unsubscribe&amp;gt;D&eacute;inscrire&amp;lt;/unsubscribe&amp;gt;&amp;lt;/a&amp;gt;\r\n                            &amp;lt;/p&amp;gt;\r\n                        &amp;lt;/td&amp;gt;\r\n                    &amp;lt;/tr&amp;gt;\r\n                &amp;lt;/table&amp;gt;\r\n            &amp;lt;/div&amp;gt;&amp;lt;!-- /content --&amp;gt;\r\n\r\n        &amp;lt;/td&amp;gt;\r\n        &amp;lt;td&amp;gt;&amp;lt;/td&amp;gt;\r\n    &amp;lt;/tr&amp;gt;\r\n&amp;lt;/table&amp;gt;&amp;lt;!-- /FOOTER --&amp;gt;\r\n\r\n&amp;lt;/body&amp;gt;\r\n&amp;lt;/html&amp;gt;', 'oussama.limam@gmail.com', 'Limam', 'Oussama', '[{"date":"2018-04-03 13:51:05","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-03 14:59:51","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-03 15:13:51","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-03 15:14:39","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-04 10:10:46","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-04 10:11:11","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-04 10:14:00","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-04 10:15:13","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-04 10:15:31","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-04 10:16:37","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-04 10:17:31","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-04 10:18:38","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-04 10:19:24","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-04 10:20:16","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-10 08:11:37","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-10 08:26:06","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-10 08:28:08","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-10 08:37:14","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-10 08:38:23","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-10 08:39:47","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-10 08:41:53","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-10 08:48:49","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Oui"},{"date":"2018-04-23 11:23:38","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com"}]', 'Tutorat', '', '');
INSERT INTO `invitations` (`idinvitations`, `idanneeuniv`, `idperiode`, `codeinvitation`, `textinvitation`, `email`, `nominviter`, `prenominviter`, `datesenvois`, `typeinvitation`, `infosuplimentaire`, `idnaturecoordinateur`) VALUES
(36, '2017-2018', 'S1', '656131306661633933383132663033343830653166396', '&amp;lt;!DOCTYPE html PUBLIC &amp;quot;-//W3C//DTD XHTML 1.0 Transitional//EN&amp;quot; &amp;quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&amp;quot;&amp;gt;\r\n&amp;lt;html xmlns=&amp;quot;http://www.w3.org/1999/xhtml&amp;quot;&amp;gt;\r\n&amp;lt;head&amp;gt;\r\n    &amp;lt;!-- If you delete this meta tag, Half Life 3 will never be released. --&amp;gt;\r\n    &amp;lt;meta name=&amp;quot;viewport&amp;quot; content=&amp;quot;width=device-width&amp;quot; /&amp;gt;\r\n\r\n    &amp;lt;meta http-equiv=&amp;quot;Content-Type&amp;quot; content=&amp;quot;text/html; charset=UTF-8&amp;quot; /&amp;gt;\r\n    &amp;lt;title&amp;gt;ZURBemails&amp;lt;/title&amp;gt;\r\n\r\n    &amp;lt;style&amp;gt;\r\n        /*\r\n        Max width before this PARTICULAR table gets nasty\r\n        This query will take effect for any screen smaller than 760px\r\n        and also iPads specifically.\r\n        */\r\n        /*\r\nGeneric Styling, for Desktops/Laptops\r\n*/\r\n        table.tableContent {\r\n            width: 100%;\r\n            border-collapse: collapse;\r\n        }\r\n        /* Zebra striping */\r\n        table.tableContent tr:nth-of-type(odd) {\r\n            background: #eee;\r\n        }\r\n        table.tableContent th {\r\n            background: #333;\r\n            color: white;\r\n            font-weight: bold;\r\n        }\r\n        table.tableContent td, th {\r\n            padding: 6px;\r\n            border: 1px solid #ccc;\r\n            text-align: left;\r\n        }\r\n        @media\r\n        only screen and (max-width: 760px),\r\n        (min-device-width: 768px) and (max-device-width: 1024px)  {\r\n\r\n            /* Force table to not be like tables anymore */\r\n            table.tableContent , thead, tbody, th, td, tr {\r\n                display: block;\r\n            }\r\n\r\n            /* Hide table headers (but not display: none;, for accessibility) */\r\n            table.tableContent thead tr {\r\n                position: absolute;\r\n                top: -9999px;\r\n                left: -9999px;\r\n            }\r\n\r\n            table.tableContent tr { border: 1px solid #ccc; }\r\n\r\n            table.tableContent td {\r\n                /* Behave  like a &amp;quot;row&amp;quot; */\r\n                border: none;\r\n                border-bottom: 1px solid #eee;\r\n                position: relative;\r\n                padding-left: 50%;\r\n            }\r\n\r\n            table.tableContent td:before {\r\n                /* Now like a table header */\r\n                position: absolute;\r\n                /* Top/left values mimic padding */\r\n                top: 6px;\r\n                left: 6px;\r\n                width: 45%;\r\n                padding-right: 10px;\r\n                white-space: nowrap;\r\n            }\r\n\r\n            /*\r\n            Label the data\r\n            */\r\n            /* table.tableContent td:nth-of-type(1):before { content: &amp;quot;Dipl&ocirc;me&amp;quot;; }\r\n             table.tableContent td:nth-of-type(2):before { content: &amp;quot;Last Name&amp;quot;; }\r\n             table.tableContent td:nth-of-type(3):before { content: &amp;quot;Job Title&amp;quot;; }\r\n             table.tableContent td:nth-of-type(4):before { content: &amp;quot;Favorite Color&amp;quot;; }\r\n             table.tableContent td:nth-of-type(5):before { content: &amp;quot;Wars of Trek?&amp;quot;; }\r\n            table.tableContent td:nth-of-type(6):before { content: &amp;quot;Porn Name&amp;quot;; }\r\n             table.tableContent td:nth-of-type(7):before { content: &amp;quot;Date of Birth&amp;quot;; }\r\n             table.tableContent td:nth-of-type(8):before { content: &amp;quot;Dream Vacation City&amp;quot;; }\r\n             table.tableContent td:nth-of-type(9):before { content: &amp;quot;GPA&amp;quot;; }\r\n             table.tableContent td:nth-of-type(10):before { content: &amp;quot;Arbitrary Data&amp;quot;; }\r\n             */\r\n        }\r\n        /* -------------------------------------\r\n                GLOBAL\r\n        ------------------------------------- */\r\n        * {\r\n            margin:0;\r\n            padding:0;\r\n        }\r\n        * { font-family: &amp;quot;Helvetica Neue&amp;quot;, &amp;quot;Helvetica&amp;quot;, Helvetica, Arial, sans-serif; }\r\n\r\n        img.boxMail {\r\n            max-width: 100%;\r\n        }\r\n        .collapse {\r\n            margin:0;\r\n            padding:0;\r\n        }\r\n        body.BoxMail {\r\n            -webkit-font-smoothing:antialiased;\r\n            -webkit-text-size-adjust:none;\r\n            width: 100%!important;\r\n            height: 100%;\r\n        }\r\n\r\n\r\n        /* -------------------------------------\r\n                ELEMENTS\r\n        ------------------------------------- */\r\n        a.BoxMail { color: #2BA6CB;}\r\n\r\n        .btnBoxMail {\r\n            text-decoration:none;\r\n            color: #FFF;\r\n            background-color: #666;\r\n            padding:10px 16px;\r\n            font-weight:bold;\r\n            margin-right:10px;\r\n            text-align:center;\r\n            cursor:pointer;\r\n            display: inline-block;\r\n        }\r\n\r\n        p.callout {\r\n            padding:15px;\r\n            background-color:#ECF8FF;\r\n            margin-bottom: 15px;\r\n        }\r\n        .callout a {\r\n            font-weight:bold;\r\n            color: #2BA6CB;\r\n        }\r\n\r\n        table.social {\r\n            /* 	padding:15px; */\r\n            background-color: #ebebeb;\r\n\r\n        }\r\n        .social .soc-btnBoxMail {\r\n            padding: 3px 7px;\r\n            font-size:12px;\r\n            margin-bottom:10px;\r\n            text-decoration:none;\r\n            color: #FFF;font-weight:bold;\r\n            display:block;\r\n            text-align:center;\r\n        }\r\n        a.fb { background-color: #3B5998!important; }\r\n        a.tw { background-color: #1daced!important; }\r\n        a.gp { background-color: #DB4A39!important; }\r\n        a.ms { background-color: #000!important; }\r\n\r\n        .sidebar .soc-btnBoxMail {\r\n            display:block;\r\n            width:100%;\r\n        }\r\n\r\n        /* -------------------------------------\r\n                HEADER\r\n        ------------------------------------- */\r\n        table.headBoxMail-wrap { width: 100%;}\r\n\r\n        .headerBoxMail.containerBoxMail table.BoxMail td.logo { padding: 15px; }\r\n        .headerBoxMail.containerBoxMail table.BoxMail td.label { padding: 15px; padding-left:0px;}\r\n\r\n\r\n        /* -------------------------------------\r\n                BODY\r\n        ------------------------------------- */\r\n        table.bodyBoxMail-wrap { width: 100%;}\r\n\r\n\r\n        /* -------------------------------------\r\n                FOOTER\r\n        ------------------------------------- */\r\n        table.footerBoxMail-wrap { width: 100%;	clear:both!important;\r\n        }\r\n        .footerBoxMail-wrap .containerBoxMail td.contentBoxMail  p { border-top: 1px solid rgb(215,215,215); padding-top:15px;}\r\n        .footerBoxMail-wrap .containerBoxMail td.contentBoxMail p {\r\n            font-size:10px;\r\n            font-weight: bold;\r\n\r\n        }\r\n\r\n\r\n        /* -------------------------------------\r\n                TYPOGRAPHY\r\n        ------------------------------------- */\r\n        h1.BoxMail,h2.BoxMail,h3.BoxMail,h4.BoxMail,h5.BoxMail,h6.BoxMail {\r\n            font-family: &amp;quot;HelveticaNeue-Light&amp;quot;, &amp;quot;Helvetica Neue Light&amp;quot;, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Lucida Grande&amp;quot;, sans-serif; line-height: 1.1; margin-bottom:15px; color:#000;\r\n        }\r\n        h1.BoxMail small, h2.BoxMail small, h3.BoxMail small, h4.BoxMail small, h5.BoxMail small, h6.BoxMail small { font-size: 60%; color: #6f6f6f; line-height: 0; text-transform: none; }\r\n\r\n        h1.BoxMail { font-weight:200; font-size: 44px;}\r\n        h2.BoxMail { font-weight:200; font-size: 37px;}\r\n        h3.BoxMail { font-weight:500; font-size: 27px;}\r\n        h4.BoxMail { font-weight:500; font-size: 23px;}\r\n        h5.BoxMail { font-weight:900; font-size: 17px;}\r\n        h6.BoxMail { font-weight:900; font-size: 14px; text-transform: uppercase; color:#444;}\r\n\r\n        .collapse { margin:0!important;}\r\n\r\n        p.BoxMail, ul.BoxMail {\r\n            margin-bottom: 10px;\r\n            font-weight: normal;\r\n            font-size:14px;\r\n            line-height:1.6;\r\n        }\r\n        p.lead { font-size:17px; }\r\n        p.last { margin-bottom:0px;}\r\n\r\n        ul.BoxMail li {\r\n            margin-left:5px;\r\n            list-style-position: inside;\r\n        }\r\n\r\n        /* -------------------------------------\r\n                SIDEBAR\r\n        ------------------------------------- */\r\n        ul.sidebarBoxMail {\r\n            background:#ebebeb;\r\n            display:block;\r\n            list-style-type: none;\r\n        }\r\n        ul.sidebarBoxMail li { display: block; margin:0;}\r\n        ul.sidebarBoxMail li a {\r\n            text-decoration:none;\r\n            color: #666;\r\n            padding:10px 16px;\r\n            /* 	font-weight:bold; */\r\n            margin-right:10px;\r\n            /* 	text-align:center; */\r\n            cursor:pointer;\r\n            border-bottom: 1px solid #777777;\r\n            border-top: 1px solid #FFFFFF;\r\n            display:block;\r\n            margin:0;\r\n        }\r\n        ul.sidebarBoxMail li a.last { border-bottom-width:0px;}\r\n        ul.sidebarBoxMail li a h1,ul.sidebarBoxMail li a h2,ul.sidebarBoxMail li a h3,ul.sidebarBoxMail li a h4,ul.sidebarBoxMail li a h5,ul.sidebarBoxMail li a h6.BoxMail,ul.sidebarBoxMail li a p { margin-bottom:0!important;}\r\n\r\n\r\n\r\n        /* ---------------------------------------------------\r\n                RESPONSIVENESS\r\n                Nuke it from orbit. It''s the only way to be sure.\r\n        ------------------------------------------------------ */\r\n\r\n        /* Set a max-width, and make it display as block so it will automatically stretch to that width, but will also shrink down on a phone or something */\r\n        .containerBoxMail {\r\n            display:block!important;\r\n            max-width:600px!important;\r\n            margin:0 auto!important; /* makes it centered */\r\n            clear:both!important;\r\n        }\r\n\r\n        /* This should also be a block element, so that it will fill 100% of the .container */\r\n        .contentBoxMail {\r\n            padding:15px;\r\n            max-width:600px;\r\n            margin:0 auto;\r\n            display:block;\r\n        }\r\n\r\n        /* Let''s make sure tables in the content area are 100% wide */\r\n        .contentBoxMail table { width: 100%; }\r\n\r\n\r\n        /* Odds and ends */\r\n        .columnBoxMail {\r\n            width: 300px;\r\n            float:left;\r\n        }\r\n        .columnBoxMail tr td { padding: 15px; }\r\n        .columnBoxMail-wrap {\r\n            padding:0!important;\r\n            margin:0 auto;\r\n            max-width:600px!important;\r\n        }\r\n        .columnBoxMail table { width:100%;}\r\n        .socialBoxMail .columnBoxMail {\r\n            width: 280px;\r\n            min-width: 279px;\r\n            float:left;\r\n        }\r\n\r\n        /* Be sure to place a .clear element after each set of columns, just to be safe */\r\n        .clearBoxMail { display: block; clear: both; }\r\n\r\n\r\n        /* -------------------------------------------\r\n                PHONE\r\n                For clients that support media queries.\r\n                Nothing fancy.\r\n        -------------------------------------------- */\r\n        @media only screen and (max-width: 600px) {\r\n\r\n            a[class=&amp;quot;btnBoxMail&amp;quot;] { display:block!important; margin-bottom:10px!important; background-image:none!important; margin-right:0!important;}\r\n\r\n            div[class=&amp;quot;columnBoxMail&amp;quot;] { width: auto!important; float:none!important;}\r\n\r\n            table.social div[class=&amp;quot;columnBoxMail&amp;quot;] {\r\n                width:auto!important;\r\n            }\r\n\r\n        }\r\n    &amp;lt;/style&amp;gt;\r\n\r\n&amp;lt;/head&amp;gt;\r\n\r\n&amp;lt;body bgcolor=&amp;quot;#FFFFFF&amp;quot; class=&amp;quot;boxMail&amp;quot;&amp;gt;\r\n\r\n&amp;lt;!-- HEADER --&amp;gt;\r\n&amp;lt;table class=&amp;quot;headBoxMail-wrap&amp;quot; bgcolor=&amp;quot;#FFFFFF&amp;quot;&amp;gt;\r\n    &amp;lt;tr&amp;gt;\r\n        &amp;lt;td&amp;gt;&amp;lt;/td&amp;gt;\r\n        &amp;lt;td class=&amp;quot;headerBoxMail  containerBoxMail&amp;quot; &amp;gt;\r\n\r\n            &amp;lt;div class=&amp;quot;contentBoxMail&amp;quot;&amp;gt;\r\n                &amp;lt;table bgcolor=&amp;quot;#FFFFFF&amp;quot;&amp;gt;\r\n                    &amp;lt;tr&amp;gt;\r\n                        &amp;lt;td&amp;gt;\r\n                            &amp;lt;object type=&amp;quot;image/svg+xml&amp;quot;&amp;gt;\r\n                                &amp;lt;svg xmlns=&amp;quot;http://www.w3.org/2000/svg&amp;quot; xmlns:xlink=&amp;quot;http://www.w3.org/1999/xlink&amp;quot; version=&amp;quot;1.1&amp;quot; id=&amp;quot;Calque_1&amp;quot; x=&amp;quot;0px&amp;quot; y=&amp;quot;0px&amp;quot; width=&amp;quot;168.194px&amp;quot; height=&amp;quot;24.094px&amp;quot; viewBox=&amp;quot;0 0 168.194 24.094&amp;quot; enable-background=&amp;quot;new 0 0 168.194 24.094&amp;quot; xml:space=&amp;quot;preserve&amp;quot;&amp;gt;\r\n                                    &amp;lt;pattern x=&amp;quot;-337.828&amp;quot; y=&amp;quot;308.479&amp;quot; width=&amp;quot;69&amp;quot; height=&amp;quot;69&amp;quot; patternUnits=&amp;quot;userSpaceOnUse&amp;quot; id=&amp;quot;Unnamed_Pattern&amp;quot; viewBox=&amp;quot;2.125 -70.896 69 69&amp;quot; overflow=&amp;quot;visible&amp;quot;&amp;gt;\r\n                                        &amp;lt;g&amp;gt;\r\n                                            &amp;lt;polygon fill=&amp;quot;none&amp;quot; points=&amp;quot;71.125,-1.896 2.125,-1.896 2.125,-70.896 71.125,-70.896   &amp;quot;/&amp;gt;\r\n                                            &amp;lt;polygon fill=&amp;quot;#F7C158&amp;quot; points=&amp;quot;71.125,-1.896 2.125,-1.896 2.125,-70.896 71.125,-70.896   &amp;quot;/&amp;gt;\r\n                                            &amp;lt;g&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#c31924&amp;quot; d=&amp;quot;M61.772-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.105-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.439-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.772-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.105-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.439-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.772-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.105-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.439-71.653c0.018,0.072,0.008,0.127-0.026,0.19C0.361-71.362,0.3-71.4,0.248-71.335     c-0.051,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.07,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.038-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.051-0.12-0.064-0.187c-0.021-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.215,0.124-0.215,0.224c0.002,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                            &amp;lt;/g&amp;gt;\r\n                                            &amp;lt;g&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-71.653c0.018,0.072,0.008,0.127-0.026,0.19c-0.052,0.101-0.113,0.063-0.165,0.128     c-0.051,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.07,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.038-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.051-0.12-0.064-0.187c-0.021-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.215,0.124-0.215,0.224c0.002,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                            &amp;lt;/g&amp;gt;\r\n                                            &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-71.653c0.018,0.072,0.008,0.127-0.026,0.19c-0.052,0.101-0.113,0.063-0.165,0.128    c-0.051,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161    c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631    c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45    c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.07,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221    c0.038-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.051-0.12-0.064-0.187c-0.021-0.114,0.002-0.224,0-0.337    c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207    c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.215,0.124-0.215,0.224C0.5-71.68,0.503-71.744,0.51-71.626    c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                            &amp;lt;g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143C2-61.45,2.217-61.397,2.391-61.46c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224C0.5-56.374,0.503-56.438,0.51-56.32      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      C8.15-41.004,8.149-41.02,8.14-41.04&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224C0.5-33.416,0.503-33.48,0.51-33.362      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224C0.5-18.11,0.503-18.175,0.51-18.057      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362C69-9.692,69.159-9.523,69.154-9.4c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053C17.933-7.969,17.839-8.227,18-8.34      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      C7.915-10.05,7.866-9.836,7.886-9.75C7.717-9.692,7.876-9.523,7.871-9.4C7.868-9.351,7.83-9.295,7.826-9.239      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      C9.114-7.652,9.321-7.799,9.48-7.837c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      C0.254-10.05,0.205-9.836,0.225-9.75C0.056-9.692,0.215-9.523,0.21-9.4c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37C0.33-8.671,0.501-8.456,0.668-8.325c0.19,0.148,0.365,0.572,0.608,0.631      C1.454-7.652,1.66-7.799,1.819-7.837C2-7.88,2.217-7.827,2.391-7.89c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46C3.477-8.933,3.471-8.995,3.5-9.071      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                            &amp;lt;/g&amp;gt;\r\n                                            &amp;lt;g&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-2.778c0.018,0.072,0.008,0.127-0.026,0.19C69.361-2.487,69.3-2.525,69.248-2.46     c-0.051,0.063-0.099,0.276-0.079,0.362C69-2.04,69.159-1.871,69.154-1.748c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C70.397,0,70.604-0.146,70.763-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.07,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.038-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.051-0.12-0.064-0.187c-0.021-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.215,0.124-0.215,0.224c0.002,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-2.778c0.018,0.072,0.007,0.127-0.026,0.19C61.7-2.487,61.64-2.525,61.587-2.46     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C62.737,0,62.943-0.146,63.103-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224C61.915-3.117,61.78-3.02,61.781-2.92c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-2.778c0.018,0.072,0.007,0.127-0.026,0.19C54.04-2.487,53.98-2.525,53.927-2.46     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C55.077,0,55.283-0.146,55.442-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224C54.255-3.117,54.12-3.02,54.121-2.92c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-2.778c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C47.416,0,47.623-0.146,47.782-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224C46.594-3.117,46.459-3.02,46.46-2.92c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-2.778c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C39.756,0,39.962-0.146,40.122-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224C38.934-3.117,38.799-3.02,38.8-2.92c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-2.778c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C32.095,0,32.302-0.146,32.461-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224C31.273-3.117,31.139-3.02,31.14-2.92c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-2.778c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C24.435,0,24.642-0.146,24.801-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-2.778c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C16.774,0,16.981-0.146,17.14-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     C15.81-2.74,15.809-2.756,15.8-2.776&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-2.778c0.018,0.072,0.007,0.127-0.026,0.19C8.077-2.487,8.018-2.525,7.965-2.46     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35C7.868-1.698,7.83-1.643,7.826-1.587     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C9.114,0,9.321-0.146,9.48-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789C8.954-3.54,8.847-3.448,8.692-3.367     c-0.17,0.088-0.139,0.166-0.318,0.224C8.292-3.117,8.158-3.02,8.159-2.92C8.16-2.805,8.164-2.869,8.17-2.751     C8.15-2.74,8.149-2.756,8.14-2.776&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-2.778c0.018,0.072,0.008,0.127-0.026,0.19C0.417-2.487,0.356-2.525,0.304-2.46     C0.253-2.397,0.205-2.184,0.225-2.098C0.056-2.04,0.215-1.871,0.21-1.748c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37C0.33-1.019,0.501-0.804,0.668-0.673c0.19,0.148,0.365,0.572,0.608,0.631     C1.454,0,1.66-0.146,1.819-0.185C2-0.228,2.217-0.175,2.391-0.237c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.07,0.339-0.263,0.376-0.46C3.477-1.28,3.471-1.343,3.5-1.419     c0.038-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.051-0.12-0.064-0.187c-0.021-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789C1.293-3.54,1.187-3.448,1.031-3.367     c-0.17,0.088-0.139,0.166-0.318,0.224C0.632-3.117,0.498-3.02,0.498-2.92C0.5-2.805,0.503-2.869,0.51-2.751     C0.489-2.74,0.488-2.756,0.479-2.776&amp;quot;/&amp;gt;\r\n                                            &amp;lt;/g&amp;gt;\r\n                                        &amp;lt;/g&amp;gt;\r\n                                    &amp;lt;/pattern&amp;gt;\r\n                                    &amp;lt;g&amp;gt;\r\n                                        &amp;lt;path fill=&amp;quot;#C31924&amp;quot; d=&amp;quot;M18.546,22.494l-4.455-6.834l-1.724,0.002l5.575,8.365h1.152l5.523-8.377h-1.676L18.546,22.494   L18.546,22.494z M8.841,21.895c0.003,0.604-0.467,0.906-1.401,0.906l-4.45,0.006c-0.936,0.002-1.404-0.309-1.404-0.926   l-0.005-6.209L0,15.674l0.005,6.207c0,1.443,0.996,2.166,2.988,2.164l4.447-0.002c1.99-0.008,2.984-0.721,2.984-2.148l-0.007-6.232   l-1.582,0.002L8.841,21.895L8.841,21.895z M34.219,16.65c-3.799,0.002-7.317-0.799-10.185-2.16   c1.824,1.148,4.015,2.021,6.442,2.537l0.006,6.992l1.581-0.006l-0.006-6.711c1.073,0.148,2.183,0.23,3.32,0.234l-0.001-0.916   C34.992,16.639,34.605,16.65,34.219,16.65L34.219,16.65z&amp;quot;/&amp;gt;\r\n                                        &amp;lt;g&amp;gt;\r\n                                            &amp;lt;path fill=&amp;quot;#8697AC&amp;quot; d=&amp;quot;M167.12,23.99l-2.52,0.008l-0.004-0.523h2.523c0.159,0,0.436-0.016,0.436-0.143v-0.516    c0-0.127-0.237-0.15-0.441-0.15h-1.538c-0.721,0-1.079-0.227-1.079-0.674v-0.316c0-0.443,0.356-0.67,1.074-0.674h2.438v0.521    h-2.438c-0.199,0-0.439,0.029-0.439,0.15v0.318c0,0.129,0.24,0.154,0.439,0.154l1.54-0.002c0.72,0,1.083,0.227,1.083,0.672v0.516    C168.196,23.77,167.831,23.99,167.12,23.99L167.12,23.99L167.12,23.99z M163.666,23.998h-0.638l-0.006-2.992h0.637L163.666,23.998    L163.666,23.998z M162.161,23.998h-0.489l-2.83-2.158l0.004,2.16l-0.608,0.002l-0.002-2.99h0.486l2.837,2.176l-0.007-2.182h0.608    L162.161,23.998L162.161,23.998z M156.302,24.002h-1.541c-0.713,0.006-1.078-0.264-1.078-0.791l-0.002-2.191l0.638-0.004    l0.003,2.195c0,0.068,0,0.283,0.439,0.281l1.541-0.008c0.446,0,0.446-0.199,0.446-0.264l-0.007-2.209h0.636l0.002,2.209    C157.381,23.738,157.019,24.002,156.302,24.002L156.302,24.002L156.302,24.002z M151.523,24.008l-0.637,0.002l-0.005-2.475    l-1.519,0.002v-0.516l3.636-0.002v0.516h-1.476V24.008L151.523,24.008z M146.252,24.012l-3.073,0.008l-0.005-2.994h3.074v0.52    h-2.438v0.633h2.315v0.518l-2.315,0.004v0.799l2.441-0.004V24.012L146.252,24.012z M141.22,24.02l-2.576,0.002l-0.005-2.99    l2.579-0.006c0.825,0,1.244,0.287,1.244,0.84v1.324C142.462,23.738,142.044,24.02,141.22,24.02L141.22,24.02L141.22,24.02z     M139.279,23.504h1.938c0.604,0,0.604-0.232,0.604-0.314v-1.324c0-0.078,0-0.318-0.604-0.318l-1.939,0.006L139.279,23.504    L139.279,23.504z M135.353,24.027h-3.073v-2.986l3.073-0.004v0.516h-2.437v0.637l2.311-0.006v0.523l-2.306,0.006v0.797    l2.432-0.002V24.027L135.353,24.027z M131.521,24.027l-2.991,0.004l-0.001-2.99h0.637l0.003,2.475l2.353-0.006V24.027    L131.521,24.027z M127.852,24.031l-2.99,0.004v-2.992h0.635l0.004,2.475l2.352-0.002V24.031L127.852,24.031z M124.122,24.035    l-3.071,0.008l-0.005-2.994l3.076-0.002v0.52h-2.438l0.003,0.633h2.31v0.52h-2.31v0.801l2.435-0.002V24.035L124.122,24.035z     M119.118,24.043l-1.543,0.002c-0.717,0-1.077-0.268-1.077-0.797l-0.005-2.195l0.637-0.002l0.004,2.197    c0,0.068,0,0.279,0.441,0.279l1.543-0.006c0.44-0.002,0.44-0.201,0.44-0.266l-0.003-2.205h0.64v2.205    C120.195,23.777,119.832,24.043,119.118,24.043L119.118,24.043L119.118,24.043z M114.336,24.047H113.7l-0.008-2.477l-1.52,0.006    v-0.516l3.64-0.008v0.518h-1.48L114.336,24.047L114.336,24.047z M111.519,24.049h-0.688l-0.681-1.295l-1.415,0.006l0.005,1.289    h-0.639l-0.004-2.988h2.34c0.717,0,1.077,0.221,1.081,0.672v0.352c0,0.355-0.233,0.572-0.694,0.646L111.519,24.049L111.519,24.049    z M108.735,22.238h1.703c0.203,0,0.441-0.027,0.441-0.154v-0.352c0-0.131-0.238-0.156-0.442-0.156h-1.702V22.238L108.735,22.238z     M107.227,24.051l-0.639,0.004l-0.004-2.994h0.637L107.227,24.051L107.227,24.051z M104.062,24.057h-0.445l-1.992-2.988h0.706    l1.519,2.326l1.495-2.328l0.692-0.006L104.062,24.057L104.062,24.057z M98.646,24.059l-3.074,0.008l-0.002-2.994l3.072-0.004v0.52    l-2.434,0.004v0.633l2.313-0.002v0.521h-2.313l0.003,0.805l2.435-0.008V24.059L98.646,24.059z M93.401,24.066h-0.637v-2.473    L91.246,21.6v-0.523l3.634-0.004v0.521h-1.479V24.066L93.401,24.066z M90.547,24.07l-0.643,0.004v-2.998h0.636L90.547,24.07    L90.547,24.07z M88.012,24.074h-2.52v-0.518l2.52-0.004c0.166,0,0.44-0.021,0.44-0.143v-0.516c0-0.129-0.24-0.154-0.442-0.154    l-1.543,0.004c-0.711,0-1.075-0.225-1.078-0.672v-0.318c0-0.441,0.364-0.668,1.078-0.668l2.439-0.01V21.6h-2.439    c-0.197,0-0.438,0.029-0.438,0.154v0.318c0,0.127,0.24,0.152,0.438,0.152l1.543-0.006c0.716,0,1.08,0.227,1.08,0.676v0.516    C89.09,23.848,88.727,24.074,88.012,24.074L88.012,24.074L88.012,24.074z M84.676,24.074l-0.688,0.004l-0.68-1.295h-1.412v1.295    h-0.638l-0.003-2.99l2.339-0.002c0.718,0,1.078,0.227,1.078,0.668v0.355c0,0.359-0.23,0.572-0.69,0.645L84.676,24.074    L84.676,24.074z M81.896,22.266h1.698c0.199,0,0.441-0.027,0.439-0.156v-0.354c0-0.127-0.241-0.156-0.439-0.154l-1.698,0.002    V22.266L81.896,22.266z M80.439,24.078l-3.07,0.004l-0.003-2.992l3.071-0.002v0.52H78v0.637h2.311l0.002,0.52H78l0.002,0.799    l2.437-0.006V24.078L80.439,24.078z M74.839,24.082h-0.446l-1.991-2.986l0.704-0.002l1.523,2.332l1.495-2.332l0.688-0.004    L74.839,24.082L74.839,24.082z M71.838,24.082L71.2,24.09l-0.003-2.994h0.637L71.838,24.082L71.838,24.082z M70.335,24.09h-0.49    l-2.83-2.158v2.16l-0.606,0.002l-0.004-2.996h0.492l2.832,2.18l-0.004-2.182h0.61V24.09L70.335,24.09z M64.479,24.094h-1.543    c-0.715,0.002-1.079-0.264-1.079-0.791l-0.003-2.193h0.636l0.001,2.193c0,0.066,0,0.277,0.443,0.273h1.541    c0.44,0,0.44-0.205,0.44-0.271l-0.002-2.197h0.642v2.197C65.554,23.83,65.191,24.094,64.479,24.094L64.479,24.094L64.479,24.094z     M96.303,20.58l1.555-0.559v0.553L96.303,20.58L96.303,20.58z&amp;quot;/&amp;gt;\r\n                                            &amp;lt;path fill=&amp;quot;#8697AC&amp;quot; d=&amp;quot;M63.893,14.697H63.28v0.484h0.615L63.893,14.697L63.893,14.697z M63.009,14.697h-0.616v0.484h0.618    L63.009,14.697L63.009,14.697z M72.358,18.607h0.611v-0.488h-0.611V18.607L72.358,18.607z M73.24,18.607l0.618-0.004v-0.488    l-0.618,0.004V18.607L73.24,18.607z M80.278,14.678l-0.617,0.002v0.49h0.617V14.678L80.278,14.678z M79.064,15.494    c-0.045,0.008-0.088,0.02-0.132,0.041c-0.038,0.025-0.073,0.061-0.113,0.105c-0.036,0.049-0.069,0.105-0.101,0.186    c-0.026-0.066-0.05-0.119-0.081-0.16c-0.028-0.043-0.058-0.074-0.088-0.096c-0.031-0.021-0.063-0.035-0.095-0.045    c-0.034-0.008-0.065-0.018-0.098-0.02c-0.035-0.012-0.117-0.016-0.236-0.016v1.686h-4.234v0.012l-0.272,0.004    c-0.066-0.025-0.112-0.059-0.147-0.107c-0.029-0.047-0.045-0.109-0.045-0.189v-1.4H72.81v1.396c0,0.076-0.016,0.139-0.042,0.184    c-0.028,0.045-0.07,0.076-0.136,0.1l-0.386,0.014l-7.955,0.006v-1.691h-1.696c-0.092,0.004-0.168,0.004-0.233,0.004    c-0.063,0.012-0.112,0.02-0.152,0.029c-0.131,0.021-0.226,0.082-0.279,0.174c-0.054,0.104-0.081,0.246-0.086,0.447l0.005,0.967    c0,0.102,0.008,0.188,0.019,0.26c0.016,0.072,0.036,0.135,0.068,0.186c0.031,0.049,0.074,0.092,0.117,0.125    c0.048,0.033,0.108,0.049,0.176,0.066l-0.003-0.006c0.083,0.014,0.206,0.018,0.368,0.018l9.826-0.008c0.099,0,0.174,0,0.23,0    c0.061,0,0.099-0.004,0.111-0.01c0.04-0.006,0.07-0.014,0.109-0.025c0.032-0.016,0.066-0.033,0.098-0.057    c0.033-0.025,0.06-0.061,0.092-0.105c0.028-0.045,0.051-0.096,0.076-0.166c0.031,0.074,0.061,0.129,0.091,0.178    c0.035,0.039,0.072,0.076,0.109,0.102c0.038,0.027,0.075,0.041,0.117,0.057c0.042,0.006,0.083,0.018,0.128,0.023h0.304v0.004    l3.89-0.004c0.538,0,1.074,0,1.61,0c0.532,0,1.069,0,1.615,0c0.084,0,0.161,0,0.225-0.01c0.063-0.008,0.119-0.01,0.16-0.02    c0.131-0.023,0.226-0.084,0.28-0.182c0.059-0.094,0.083-0.238,0.082-0.441V15.48l-2.54,0.002    C79.161,15.482,79.113,15.49,79.064,15.494L79.064,15.494z M63.669,17.201h-0.817c-0.1,0-0.179-0.006-0.229-0.025    c-0.057-0.01-0.094-0.035-0.116-0.074c-0.024-0.025-0.034-0.047-0.036-0.08c-0.002-0.029-0.006-0.061-0.006-0.109v-0.541    c0-0.074,0.004-0.135,0.008-0.172c0.003-0.039,0.02-0.066,0.043-0.086c0.024-0.016,0.056-0.027,0.103-0.027    c0.041-0.002,0.099-0.012,0.174-0.012h0.876V17.201L63.669,17.201z M81.132,16.822c0,0.143-0.042,0.24-0.136,0.305    c-0.026,0.02-0.063,0.029-0.103,0.039c-0.041,0.008-0.09,0.008-0.151,0.008l-2,0.002v-0.813c0-0.082,0.013-0.141,0.042-0.193    c0.027-0.047,0.079-0.078,0.148-0.1l2.201-0.002V16.822L81.132,16.822z M82.465,17.754h0.616v-3.01h-0.616V17.754L82.465,17.754z     M89.701,14.674l-0.618,0.002v0.48h0.618V14.674L89.701,14.674z M90.582,14.674h-0.613v0.48h0.613V14.674L90.582,14.674z     M95.339,15.479c-0.065,0.004-0.118,0.016-0.164,0.023c-0.13,0.023-0.219,0.08-0.274,0.18c-0.056,0.098-0.081,0.244-0.081,0.441    v1.039l-4.174,0.004v0.008h-0.272c-0.069-0.023-0.114-0.064-0.151-0.104c-0.027-0.049-0.044-0.109-0.044-0.191v-1.402h-0.611    v1.396c0,0.08-0.017,0.141-0.041,0.184c-0.03,0.045-0.07,0.076-0.137,0.098L89,17.166l-4.146,0.004v-1.455h-0.614l0.001,2.293    c0,0.086-0.01,0.148-0.033,0.197c-0.019,0.043-0.055,0.07-0.108,0.078c-0.015,0.008-0.043,0.008-0.089,0.014    c-0.046,0-0.095,0-0.158,0h-0.101l0.003,0.574h0.356c0.092,0,0.171,0,0.237-0.008c0.065-0.002,0.124-0.016,0.172-0.018    l-0.009-0.002c0.063-0.016,0.113-0.033,0.159-0.066c0.043-0.029,0.08-0.063,0.109-0.113c0.022-0.055,0.045-0.113,0.06-0.182    c0.013-0.074,0.019-0.16,0.015-0.26V17.75l4.322-0.002c0.097,0,0.176-0.006,0.232-0.006s0.096,0,0.114-0.002    c0.036-0.01,0.07-0.02,0.102-0.031c0.038-0.008,0.07-0.029,0.101-0.055c0.034-0.023,0.06-0.061,0.089-0.105    c0.03-0.041,0.057-0.096,0.078-0.168c0.026,0.072,0.063,0.137,0.092,0.176c0.037,0.047,0.073,0.082,0.11,0.107    s0.076,0.043,0.115,0.051c0.045,0.016,0.083,0.021,0.129,0.027h0.308l0,0l5.855-0.002c0.088,0,0.164,0,0.229-0.004    c0.067,0,0.117-0.008,0.159-0.021l-0.008-0.002c0.065-0.01,0.118-0.033,0.169-0.063c0.048-0.033,0.085-0.066,0.115-0.119    c0.028-0.053,0.052-0.109,0.063-0.18c0.013-0.072,0.023-0.16,0.023-0.266v-1.613h-1.691    C95.479,15.473,95.401,15.475,95.339,15.479L95.339,15.479z M95.812,16.045h0.824l0.004,0.834c0,0.039-0.004,0.066-0.009,0.088    c-0.002,0.025-0.011,0.047-0.015,0.061c-0.022,0.051-0.063,0.082-0.126,0.105c-0.059,0.021-0.137,0.033-0.239,0.033h-0.569    c-0.051,0-0.093-0.01-0.128-0.016c-0.032-0.012-0.059-0.023-0.075-0.045c-0.02-0.021-0.035-0.047-0.04-0.084    c-0.003-0.035-0.008-0.082-0.008-0.139V16.34c0-0.078,0.013-0.137,0.037-0.184s0.054-0.082,0.094-0.092    c0.022-0.002,0.055-0.008,0.096-0.012C95.7,16.049,95.751,16.047,95.812,16.045L95.812,16.045z M96.311,14.664H95.7v0.488h0.61    V14.664L96.311,14.664z M98.455,18.252h-0.223c-0.03,0-0.046,0-0.046,0c-0.01-0.008-0.015-0.027-0.019-0.055    c0-0.021,0.012-0.035,0.028-0.037h0.371v-0.193h-0.391c-0.047,0-0.08,0-0.112,0.006c-0.039,0.006-0.063,0.025-0.086,0.051    c-0.016,0.023-0.025,0.066-0.025,0.127v0.133c0,0.061,0.025,0.104,0.08,0.127c0.039,0.025,0.08,0.033,0.132,0.033h0.232    c0.015,0,0.024,0.004,0.029,0.016c0.002,0.006,0.005,0.023,0.002,0.045c0,0.021-0.011,0.035-0.027,0.035h-0.448v0.191h0.474    c0.045,0,0.079-0.002,0.104-0.002c0.041-0.012,0.069-0.027,0.087-0.053c0.015-0.027,0.023-0.068,0.023-0.127v-0.113    c0-0.064-0.023-0.109-0.061-0.145C98.546,18.266,98.506,18.252,98.455,18.252L98.455,18.252z M103.054,16.871    c0.003,0.156-0.062,0.254-0.194,0.281l-4.092,0.004c-0.129-0.029-0.195-0.123-0.195-0.283v-2.145h-0.609v2.352    c0,0.191,0.022,0.34,0.078,0.438c0.049,0.094,0.136,0.154,0.25,0.186c0.106,0.025,0.245,0.037,0.418,0.037l4.203-0.004    c0.186,0,0.322-0.016,0.427-0.041c0.114-0.031,0.2-0.092,0.252-0.189c0.048-0.098,0.07-0.238,0.07-0.43v-2.352h-0.609    L103.054,16.871L103.054,16.871z M104.51,17.73h0.617v-3.006h-0.62L104.51,17.73L104.51,17.73z M125.818,14.637h-0.617v0.488    h0.617V14.637L125.818,14.637z M125.213,16.846c0,0.16-0.064,0.256-0.195,0.287l-8.11,0.006v0.008h-0.121    c-0.128-0.041-0.189-0.141-0.189-0.291l-0.007-1.402h-0.617l0.002,1.395c0,0.072-0.011,0.139-0.039,0.182    c-0.024,0.043-0.067,0.076-0.128,0.098c-0.013,0.002-0.034,0.006-0.066,0.012c-0.029,0-0.063,0-0.094,0.002    c-0.036,0.006-0.066,0.006-0.103,0.006c-0.037,0-0.057,0-0.075,0h-0.2c-0.124-0.041-0.187-0.135-0.187-0.291l-0.002-1.402h-0.616    v1.396c0,0.148-0.055,0.244-0.175,0.283c-0.011,0-0.023,0.006-0.047,0.006c-0.023,0.006-0.056,0.006-0.104,0.008h-0.548v-1.699    h-0.615l0.003,2.26c0,0.158-0.065,0.248-0.193,0.287h-0.908c-0.128-0.033-0.194-0.127-0.194-0.287v-2.252h-0.619l0.005,3.117    h1.776c0.171,0,0.308-0.016,0.419-0.037c0.115-0.027,0.201-0.092,0.254-0.189c0.048-0.094,0.077-0.238,0.077-0.432v-0.188h0.486    c0.199-0.006,0.317-0.008,0.349-0.014c0.034-0.006,0.069-0.012,0.105-0.027c0.039-0.008,0.071-0.031,0.097-0.053    c0.031-0.029,0.063-0.064,0.092-0.107c0.028-0.045,0.052-0.1,0.078-0.168c0.03,0.076,0.068,0.143,0.108,0.191    c0.034,0.049,0.073,0.084,0.115,0.111c0.04,0.025,0.084,0.043,0.131,0.049c0.046,0.01,0.094,0.012,0.147,0.012h0.203    c0.067-0.002,0.132-0.002,0.192-0.002c0.06,0,0.112,0,0.156-0.004c0.049,0,0.074,0,0.076-0.002    c0.034-0.006,0.073-0.018,0.108-0.027c0.037-0.014,0.063-0.031,0.1-0.055c0.03-0.027,0.063-0.063,0.086-0.105    c0.032-0.047,0.059-0.1,0.08-0.168c0.03,0.07,0.061,0.129,0.095,0.174c0.035,0.047,0.071,0.082,0.105,0.107    c0.04,0.023,0.077,0.041,0.122,0.055c0.038,0.01,0.075,0.02,0.124,0.021h0.156l-0.002,0.004l8.163-0.006    c0.177,0,0.316-0.012,0.426-0.035c0.117-0.027,0.2-0.092,0.248-0.191c0.055-0.094,0.077-0.238,0.077-0.432v-1.611h-0.608V16.846    L125.213,16.846z M133.771,14.629h-0.618v0.484h0.618V14.629L133.771,14.629z M134.035,16.838c0,0.16-0.06,0.256-0.195,0.285    l-4.93,0.004v-1.688l-1.694,0.004c-0.085,0-0.159,0-0.225,0.004c-0.065,0.006-0.118,0.014-0.161,0.025    c-0.127,0.021-0.218,0.084-0.275,0.176c-0.058,0.098-0.081,0.246-0.081,0.441v0.965c0,0.102,0.007,0.189,0.023,0.26    c0.01,0.072,0.027,0.139,0.058,0.186c0.032,0.049,0.07,0.09,0.118,0.117c0.044,0.033,0.102,0.055,0.166,0.068h-0.005    c0.04,0.01,0.096,0.018,0.157,0.021c0.066,0.002,0.14,0.002,0.225,0.002h1.078v0.258c0,0.082-0.015,0.148-0.043,0.195    c-0.035,0.045-0.088,0.074-0.154,0.092H127.7v0.574h0.463c0.177,0,0.31-0.008,0.385-0.018h-0.007    c0.071-0.016,0.126-0.041,0.173-0.066c0.048-0.029,0.085-0.072,0.113-0.123c0.03-0.045,0.048-0.109,0.065-0.182    c0.013-0.07,0.018-0.16,0.018-0.26v-0.471l4.988-0.006c0.172,0,0.314-0.01,0.422-0.039c0.116-0.025,0.196-0.086,0.248-0.188    c0.055-0.094,0.079-0.234,0.079-0.428v-1.617h-0.612V16.838L134.035,16.838z M128.294,17.127l-0.962,0.002    c-0.159,0-0.244-0.096-0.244-0.285v-0.537c0-0.074,0.014-0.139,0.04-0.184c0.022-0.049,0.056-0.076,0.094-0.09    c0.016-0.006,0.048-0.006,0.09-0.01c0.045-0.006,0.095-0.008,0.16-0.008h0.822V17.127L128.294,17.127z M134.037,15.113h0.616    v-0.484h-0.618L134.037,15.113L134.037,15.113z M140.093,14.617h-0.621v0.49h0.621V14.617L140.093,14.617z M140.974,14.617h-0.616    l0.003,0.49h0.613V14.617L140.974,14.617z M159.188,15.439c-0.048-0.01-0.105-0.014-0.165-0.023    c-0.062-0.002-0.126-0.006-0.209-0.006h-1.026c-0.089,0-0.167,0.004-0.229,0.006c-0.069,0.01-0.122,0.014-0.168,0.027    c-0.124,0.018-0.213,0.082-0.27,0.178c-0.055,0.094-0.084,0.248-0.084,0.441l0.004,0.748c0,0.143-0.063,0.242-0.184,0.275    c0,0-0.023-0.006-0.079-0.006c-0.055,0.004-0.118,0.004-0.179,0.006v0.016l-4.429,0.004l0.279-1.07v0.006    c0.02-0.078,0.03-0.133,0.04-0.186c0.008-0.057,0.014-0.107,0.014-0.146c0-0.08-0.023-0.145-0.068-0.186    c-0.045-0.045-0.117-0.07-0.21-0.09c-0.028-0.004-0.066-0.008-0.122-0.014c-0.061-0.004-0.132-0.004-0.208-0.006l-1.688,0.006    c-0.077,0-0.145,0-0.204,0.006c-0.061,0-0.1,0.004-0.127,0.008c-0.093,0.021-0.159,0.047-0.208,0.092    c-0.042,0.039-0.067,0.104-0.067,0.184c0,0.045,0.007,0.094,0.016,0.146c0.01,0.053,0.021,0.115,0.036,0.186l0,0    c0.023,0.072,0.045,0.158,0.068,0.244c0.022,0.094,0.047,0.186,0.072,0.283c0.026,0.096,0.048,0.197,0.074,0.287    c0.022,0.09,0.044,0.178,0.064,0.25l-8.563,0.008V15.43h-1.693c-0.088,0-0.167,0-0.229,0.004c-0.065,0.01-0.12,0.02-0.156,0.025    c-0.132,0.021-0.229,0.084-0.278,0.18c-0.058,0.096-0.083,0.244-0.083,0.436l0.002,0.975c0,0.102,0.006,0.189,0.02,0.262    c0.015,0.072,0.038,0.137,0.069,0.186c0.029,0.049,0.068,0.09,0.118,0.119c0.047,0.031,0.107,0.055,0.177,0.066l-0.007-0.002    c0.082,0.014,0.208,0.021,0.375,0.021l16.97-0.021c0.078,0,0.146,0,0.198,0c0.059,0,0.093,0,0.107-0.008    c0.037-0.008,0.072-0.018,0.11-0.025c0.033-0.014,0.066-0.033,0.097-0.061c0.035-0.02,0.064-0.057,0.091-0.102    c0.03-0.045,0.058-0.102,0.081-0.17c0.032,0.078,0.065,0.141,0.103,0.191c0.038,0.051,0.076,0.088,0.118,0.111    c0.038,0.029,0.08,0.043,0.127,0.053c0.048,0.01,0.095,0.01,0.144,0.01h0.992c0.086,0,0.164,0,0.223-0.002    c0.068-0.006,0.12-0.014,0.165-0.023H159.2c0.065-0.01,0.124-0.037,0.172-0.068c0.045-0.029,0.081-0.064,0.117-0.115    c0.023-0.049,0.047-0.113,0.059-0.184c0.013-0.07,0.02-0.158,0.02-0.26v-0.971c0-0.195-0.031-0.348-0.092-0.439    C159.42,15.523,159.324,15.461,159.188,15.439L159.188,15.439z M140.748,17.125h-0.814c-0.097,0-0.176-0.006-0.228-0.02    c-0.057-0.012-0.098-0.043-0.118-0.078c-0.02-0.023-0.036-0.049-0.038-0.082c-0.004-0.027-0.004-0.063-0.004-0.107v-0.541    c0-0.074,0.004-0.133,0.006-0.174c0.006-0.037,0.024-0.066,0.045-0.082c0.026-0.021,0.058-0.037,0.103-0.037    c0.046-0.002,0.103-0.002,0.176-0.002h0.873V17.125L140.748,17.125z M151.768,16.32l-0.117,0.459l0,0    c-0.035,0.133-0.103,0.227-0.199,0.283c-0.029,0.014-0.063,0.031-0.104,0.035c-0.039,0.004-0.085,0.008-0.142,0.008h-0.305    c-0.059,0-0.104-0.004-0.15-0.008c-0.039-0.004-0.071-0.02-0.101-0.035c-0.048-0.029-0.084-0.064-0.118-0.109    c-0.027-0.041-0.054-0.098-0.073-0.174v0.006c-0.018-0.078-0.04-0.158-0.059-0.232c-0.022-0.082-0.042-0.158-0.065-0.23    c-0.046-0.225,0.019-0.328,0.197-0.328h1.036C151.754,15.994,151.819,16.098,151.768,16.32L151.768,16.32z M158.946,16.818    c0,0.072-0.005,0.123-0.019,0.16l0.004-0.004c-0.02,0.047-0.059,0.082-0.121,0.102c-0.055,0.021-0.137,0.029-0.242,0.029h-0.729    c-0.123-0.043-0.183-0.139-0.19-0.293v-0.537c0-0.086,0.026-0.154,0.067-0.205s0.1-0.076,0.188-0.084h0.861    c0.061,0.023,0.105,0.057,0.137,0.105c0.029,0.047,0.044,0.111,0.044,0.184V16.818L158.946,16.818z M167.922,17.09l-0.252-1.006    c-0.048-0.209-0.114-0.371-0.196-0.467c-0.084-0.104-0.197-0.164-0.344-0.188c-0.05-0.01-0.099-0.02-0.163-0.023    c-0.065-0.002-0.142-0.006-0.224-0.006h-1.39v0.586h1.325c0.058,0,0.103,0,0.143,0.008c0.041,0.008,0.08,0.021,0.107,0.033    c0.047,0.029,0.087,0.07,0.118,0.115s0.055,0.098,0.073,0.164v-0.002c0.01,0.059,0.025,0.115,0.042,0.182    c0.014,0.068,0.036,0.141,0.053,0.211c0.018,0.07,0.038,0.146,0.056,0.215c0.015,0.07,0.032,0.125,0.045,0.182l-6.271,0.004    c-0.126-0.027-0.191-0.123-0.191-0.285l-0.007-2.139h-0.606l0.002,2.348c0,0.189,0.027,0.336,0.076,0.432    c0.05,0.092,0.137,0.158,0.256,0.191c0.106,0.02,0.245,0.035,0.415,0.035l7.201-0.01v-0.58H167.922L167.922,17.09z     M166.125,18.516h0.618v-0.492h-0.618V18.516L166.125,18.516z&amp;quot;/&amp;gt;\r\n                                        &amp;lt;/g&amp;gt;\r\n                                        &amp;lt;path fill=&amp;quot;#8697AC&amp;quot; d=&amp;quot;M47.016,22.387h-0.693c-1.093,0.004-2.034,0.67-2.435,1.617L49.458,24   C49.052,23.049,48.113,22.387,47.016,22.387L47.016,22.387z M55.507,17.539v0.639c0,0.627-0.509,1.135-1.133,1.137L38.962,19.33   c-0.624,0-1.133-0.51-1.133-1.133l-0.012-8.51c-0.001-0.625,0.509-1.137,1.136-1.137h0.871c0-0.018-0.005-0.033-0.002-0.049   c-0.003-0.496,0.037-0.984,0.103-1.465L38.95,7.041c-1.461,0-2.646,1.186-2.646,2.646l0.009,8.51   c0.002,1.465,1.19,2.645,2.651,2.645l15.41-0.016c1.461-0.002,2.647-1.186,2.645-2.648v-1.707   C56.548,16.871,56.042,17.227,55.507,17.539L55.507,17.539z&amp;quot;/&amp;gt;\r\n                                        &amp;lt;path fill=&amp;quot;#C2CAD7&amp;quot; d=&amp;quot;M49.181,9.254c-0.017-0.084-0.03-0.168-0.037-0.25c-0.527,0.164-1.043,0.396-1.535,0.697   c-0.607,0.375-1.141,0.824-1.588,1.338c0.372-0.357,0.787-0.684,1.244-0.963C47.877,9.701,48.523,9.428,49.181,9.254L49.181,9.254z    M55.02,9.828c-0.46-0.303-0.952-0.547-1.463-0.732c-0.016,0.115-0.041,0.229-0.071,0.334c0.469,0.168,0.92,0.383,1.348,0.643   C54.887,9.986,54.949,9.902,55.02,9.828L55.02,9.828z M57.1,11.984c-0.059-0.096-0.122-0.191-0.184-0.285   c-0.044,0.043-0.09,0.08-0.136,0.117c0.164,0.209,0.313,0.426,0.455,0.656c0.282,0.459,0.503,0.938,0.671,1.428   C57.738,13.242,57.471,12.596,57.1,11.984L57.1,11.984z M54.831,13.16c0.317-0.336,0.596-0.707,0.836-1.107   c-0.047-0.014-0.092-0.023-0.134-0.039C55.337,12.424,55.104,12.809,54.831,13.16L54.831,13.16z M50.333,3.016   c0-0.088,0.013-0.172,0.032-0.252c-0.923-0.002-1.808,0.205-2.611,0.58C48.558,3.063,49.433,2.941,50.333,3.016L50.333,3.016z    M52.965,3.344c-0.03,0.141-0.083,0.279-0.156,0.398c2.057,1.105,3.379,3.299,3.327,5.697c0.123,0.01,0.243,0.045,0.352,0.092   C56.751,6.891,55.288,4.426,52.965,3.344L52.965,3.344z M51.295,1.791C50.957,1.166,50.542,0.568,50.061,0   c0.423,0.594,0.772,1.217,1.043,1.863C51.165,1.834,51.229,1.811,51.295,1.791L51.295,1.791z M46.676,14.602   c1.669-1.023,3.044-2.27,4.022-3.672c-0.354-0.111-0.672-0.307-0.926-0.566c-0.953,1.217-2.217,2.309-3.726,3.23   C46.394,13.807,46.636,14.172,46.676,14.602L46.676,14.602z M52.313,6.807c0.036-0.313,0.053-0.623,0.053-0.936   c0-0.537-0.054-1.068-0.156-1.586c-0.15,0.066-0.317,0.107-0.488,0.115c0.013,0.191,0.022,0.387,0.022,0.58   c0,0.549-0.056,1.09-0.167,1.617C51.84,6.625,52.085,6.695,52.313,6.807L52.313,6.807z M44.016,14.727   c0-0.023,0.003-0.047,0.006-0.072c-1.611,0.725-3.412,1.275-5.342,1.615v1.057c2.099-0.281,4.062-0.826,5.804-1.586   C44.198,15.49,44.016,15.131,44.016,14.727L44.016,14.727z M42.374,5.191c-0.267,0.859-0.411,1.781-0.411,2.734   c0.003,2.318,0.865,4.434,2.287,6.053c0.084-0.129,0.192-0.238,0.315-0.328c-1.501-1.699-2.416-3.93-2.418-6.379   C42.147,6.557,42.228,5.861,42.374,5.191L42.374,5.191z M46.526,15.348c-0.069,0.131-0.159,0.248-0.265,0.348   c1.417,0.891,3.098,1.412,4.901,1.41c0.951,0,1.871-0.145,2.735-0.42c-0.671,0.15-1.369,0.23-2.085,0.234   C49.861,16.92,48.047,16.342,46.526,15.348L46.526,15.348z&amp;quot;/&amp;gt;\r\n                                        &amp;lt;path fill=&amp;quot;#c31924&amp;quot; d=&amp;quot;M56.414,10.047c-0.092-0.057-0.195-0.094-0.31-0.113c-0.041-0.008-0.086-0.012-0.13-0.012   c-0.208,0-0.398,0.074-0.544,0.201c-0.073,0.064-0.135,0.139-0.182,0.219c-0.069,0.125-0.11,0.266-0.11,0.416   c0,0.377,0.247,0.695,0.589,0.799c0.058,0.02,0.123,0.029,0.184,0.037c0.023,0,0.042,0,0.063,0c0.184,0,0.353-0.059,0.49-0.156   c0.056-0.043,0.107-0.09,0.15-0.143c0.123-0.145,0.195-0.332,0.195-0.539C56.81,10.457,56.653,10.195,56.414,10.047L56.414,10.047z    M45.348,13.889c-0.462,0-0.834,0.375-0.834,0.836c0,0.465,0.375,0.84,0.839,0.84c0.46,0,0.833-0.375,0.833-0.84   C46.185,14.264,45.81,13.889,45.348,13.889L45.348,13.889z M52.166,7.676c-0.226-0.16-0.505-0.258-0.804-0.264c0,0-0.006,0-0.01,0   c-0.766,0-1.387,0.623-1.39,1.387l-0.003,0.01c0,0.094,0.011,0.189,0.03,0.277c0.044,0.221,0.142,0.424,0.274,0.59   c0.221,0.277,0.546,0.465,0.907,0.516c0.063,0.006,0.123,0.01,0.185,0.01c0.635,0,1.168-0.422,1.339-1.006   c0.029-0.104,0.045-0.217,0.052-0.338c0-0.016,0.001-0.031,0.001-0.051C52.748,8.34,52.518,7.928,52.166,7.676L52.166,7.676z    M51.659,3.908c0.004,0,0.009,0,0.009,0c0.156-0.004,0.304-0.045,0.428-0.123c0.107-0.064,0.199-0.152,0.267-0.26   c0.072-0.111,0.118-0.236,0.13-0.379c0.003-0.025,0.005-0.049,0.005-0.078c0-0.459-0.377-0.832-0.839-0.832   c-0.043,0-0.086,0.006-0.13,0.01C51.44,2.26,51.36,2.287,51.282,2.328c-0.187,0.096-0.333,0.258-0.406,0.457   c-0.033,0.092-0.051,0.186-0.051,0.283v0.006C50.825,3.535,51.2,3.908,51.659,3.908L51.659,3.908z&amp;quot;/&amp;gt;\r\n                                    &amp;lt;/g&amp;gt;\r\n                                    &amp;lt;/svg&amp;gt;\r\n                            &amp;lt;/object&amp;gt;\r\n\r\n\r\n                        &amp;lt;/td&amp;gt;\r\n                        &amp;lt;td align=&amp;quot;right&amp;quot;&amp;gt;&amp;lt;h6 class=&amp;quot;collapse&amp;quot;&amp;gt;Invitation&amp;lt;/h6&amp;gt;&amp;lt;/td&amp;gt;\r\n                    &amp;lt;/tr&amp;gt;\r\n                &amp;lt;/table&amp;gt;\r\n            &amp;lt;/div&amp;gt;\r\n\r\n        &amp;lt;/td&amp;gt;\r\n        &amp;lt;td&amp;gt;&amp;lt;/td&amp;gt;\r\n    &amp;lt;/tr&amp;gt;\r\n&amp;lt;/table&amp;gt;&amp;lt;!-- /HEADER --&amp;gt;\r\n\r\n\r\n&amp;lt;!-- BODY --&amp;gt;\r\n&amp;lt;table class=&amp;quot;bodyBoxMail-wrap&amp;quot;&amp;gt;\r\n    &amp;lt;tr&amp;gt;\r\n        &amp;lt;td&amp;gt;&amp;lt;/td&amp;gt;\r\n        &amp;lt;td class=&amp;quot;containerBoxMail&amp;quot; bgcolor=&amp;quot;#FFFFFF&amp;quot;&amp;gt;\r\n\r\n            &amp;lt;div class=&amp;quot;contentBoxMail&amp;quot;&amp;gt;\r\n                &amp;lt;table&amp;gt;\r\n                    &amp;lt;tr&amp;gt;\r\n                        &amp;lt;td&amp;gt;\r\n                            &amp;lt;h3&amp;gt;Bonjour, Limam Oussama&amp;lt;/h3&amp;gt;\r\n                            &amp;lt;p class=&amp;quot;lead&amp;quot;&amp;gt;\r\n                                Invitation pour tutorat                            &amp;lt;/p&amp;gt;\r\n                            &amp;lt;p&amp;gt;\r\n        Vous ete inviter &agrave; effetuer la validation des modules sit&eacute; dans ce mail pour enseigner ....\r\n    &amp;lt;/p&amp;gt;\r\n                            &amp;lt;!-- Callout Panel --&amp;gt;\r\n                            &amp;lt;p class=&amp;quot;callout&amp;quot;&amp;gt;\r\n                                Suivre ce lien :  &amp;lt;a href=&amp;quot;/enseignant/mon-compte/index/36?__token=6561313066616339333831326630333438306531663965633235323732666464383133643161333937343537363634366263333938346332643664353237653651554e474e445532526a67784d45464351305246526d32523558583952392b6c394e454c39784f456355436d6c724a6d65397568596b74705679706d67765a706f6c50714f44525476564c38396231706d527747366a354f736e53437476617562456f6939487549557463554f666531716439775a345130395a70756459313953356478545435654f632b7645465a755948734749304530724a716968616f67667241747a5671534a54303d&amp;quot;&amp;gt;Cliquer ICI! &amp;amp;raquo;&amp;lt;/a&amp;gt;\r\n                            &amp;lt;/p&amp;gt;&amp;lt;!-- /Callout Panel --&amp;gt;\r\n\r\n                            &amp;lt;!--Formation---&amp;gt;\r\n\r\n                        &amp;lt;table class=&amp;quot;tableContent&amp;quot;&amp;gt;\r\n                            &amp;lt;tr&amp;gt;\r\n                                &amp;lt;th&amp;gt;Formation&amp;lt;/th&amp;gt;\r\n                                &amp;lt;th&amp;gt;Niveau&amp;lt;/th&amp;gt;\r\n                                &amp;lt;th&amp;gt;P&eacute;riode&amp;lt;/th&amp;gt;\r\n                                &amp;lt;th&amp;gt;Module&amp;lt;/th&amp;gt;\r\n                            &amp;lt;/tr&amp;gt;\r\n                                                            &amp;lt;tr&amp;gt;\r\n                                    &amp;lt;td rowspan=&amp;quot;4&amp;quot;&amp;gt;\r\n                                        &amp;lt;!--Formation--&amp;gt;\r\n                                        &amp;lt;table class=&amp;quot;tableContent&amp;quot;&amp;gt;\r\n                                                                                            &amp;lt;tr&amp;gt;\r\n                                                    &amp;lt;th&amp;gt;Dipl&ocirc;me&amp;lt;/th&amp;gt;\r\n                                                    &amp;lt;td&amp;gt;Licence Appliqu&eacute;e&amp;lt;/td&amp;gt;\r\n                                                &amp;lt;/tr&amp;gt;\r\n                                                                                            &amp;lt;tr&amp;gt;\r\n                                                    &amp;lt;th&amp;gt;Domaine&amp;lt;/th&amp;gt;\r\n                                                    &amp;lt;td&amp;gt;Sciences de gestion&amp;lt;/td&amp;gt;\r\n                                                &amp;lt;/tr&amp;gt;\r\n                                                                                            &amp;lt;tr&amp;gt;\r\n                                                    &amp;lt;th&amp;gt;Mention&amp;lt;/th&amp;gt;\r\n                                                    &amp;lt;td&amp;gt;Management&amp;lt;/td&amp;gt;\r\n                                                &amp;lt;/tr&amp;gt;\r\n                                                                                            &amp;lt;tr&amp;gt;\r\n                                                    &amp;lt;th&amp;gt;Parcours&amp;lt;/th&amp;gt;\r\n                                                    &amp;lt;td&amp;gt;Licence Appliqu&eacute;e en Management&amp;lt;/td&amp;gt;\r\n                                                &amp;lt;/tr&amp;gt;\r\n                                                                                    &amp;lt;/table&amp;gt;\r\n                                        &amp;lt;!--Fin Formation--&amp;gt;\r\n                                    &amp;lt;/td&amp;gt;\r\n                                &amp;lt;/tr&amp;gt;\r\n                                                                    &amp;lt;tr&amp;gt;\r\n                                        &amp;lt;th rowspan=&amp;quot;3&amp;quot;&amp;gt;1&egrave;re Ann&eacute;e&amp;lt;/th&amp;gt;\r\n                                    &amp;lt;/tr&amp;gt;\r\n                                                                            &amp;lt;tr&amp;gt;\r\n                                            &amp;lt;td rowspan=&amp;quot;2&amp;quot;&amp;gt;Semestre 1&amp;lt;/td&amp;gt;\r\n                                        &amp;lt;/tr&amp;gt;\r\n                                                                                    &amp;lt;tr&amp;gt;\r\n                                                &amp;lt;td&amp;gt;\r\n                                                    &amp;lt;table class=&amp;quot;tableContent&amp;quot;&amp;gt;\r\n                                                        &amp;lt;tr&amp;gt;\r\n                                                            &amp;lt;td&amp;gt; aptitudes en TIC 1&amp;lt;/td&amp;gt;\r\n                                                        &amp;lt;/tr&amp;gt;\r\n                                                        &amp;lt;tr&amp;gt;\r\n                                                            &amp;lt;th&amp;gt; Coef. :&amp;lt;/th&amp;gt;&amp;lt;td&amp;gt; 1.00&amp;lt;/td&amp;gt;\r\n                                                        &amp;lt;/tr&amp;gt;\r\n                                                        &amp;lt;tr&amp;gt;\r\n                                                            &amp;lt;th&amp;gt; Noture. :&amp;lt;/th&amp;gt;&amp;lt;td&amp;gt;  Trans&amp;lt;/td&amp;gt;\r\n                                                        &amp;lt;/tr&amp;gt;\r\n                                                        &amp;lt;tr&amp;gt;\r\n                                                            &amp;lt;th&amp;gt; R&eacute;gime. :&amp;lt;/th&amp;gt;&amp;lt;td&amp;gt;  CC&amp;lt;/td&amp;gt;\r\n                                                        &amp;lt;/tr&amp;gt;\r\n\r\n                                                    &amp;lt;/table&amp;gt;\r\n\r\n\r\n\r\n                                                &amp;lt;/td&amp;gt;\r\n                                            &amp;lt;/tr&amp;gt;\r\n                                        \r\n                                    \r\n                                \r\n                            \r\n                            &amp;lt;/tr&amp;gt;\r\n                        &amp;lt;/table&amp;gt;\r\n\r\n\r\n\r\n                            &amp;lt;!--End Formation--&amp;gt;\r\n\r\n\r\n                            &amp;lt;!-- social &amp;amp; contact --&amp;gt;\r\n                            &amp;lt;table class=&amp;quot;social&amp;quot; width=&amp;quot;100%&amp;quot;&amp;gt;\r\n                                &amp;lt;tr&amp;gt;\r\n                                    &amp;lt;td&amp;gt;\r\n\r\n                                        &amp;lt;!-- column 1 --&amp;gt;\r\n                                        &amp;lt;table align=&amp;quot;left&amp;quot; class=&amp;quot;columnBoxMail&amp;quot;&amp;gt;\r\n                                            &amp;lt;tr&amp;gt;\r\n                                                &amp;lt;td&amp;gt;\r\n\r\n                                                    &amp;lt;h5 class=&amp;quot;&amp;quot;&amp;gt;Contacter nous:&amp;lt;/h5&amp;gt;\r\n                                                    &amp;lt;p class=&amp;quot;&amp;quot;&amp;gt;&amp;lt;a href=&amp;quot;#&amp;quot; class=&amp;quot;soc-btnBoxMail fb&amp;quot;&amp;gt;Facebook&amp;lt;/a&amp;gt; &amp;lt;a href=&amp;quot;#&amp;quot; class=&amp;quot;soc-btnBoxMail tw&amp;quot;&amp;gt;Twitter&amp;lt;/a&amp;gt; &amp;lt;a href=&amp;quot;#&amp;quot; class=&amp;quot;soc-btnBoxMail gp&amp;quot;&amp;gt;Google+&amp;lt;/a&amp;gt;&amp;lt;/p&amp;gt;\r\n\r\n                                                &amp;lt;/td&amp;gt;\r\n                                            &amp;lt;/tr&amp;gt;\r\n                                        &amp;lt;/table&amp;gt;&amp;lt;!-- /column 1 --&amp;gt;\r\n\r\n                                        &amp;lt;!-- column 2 --&amp;gt;\r\n                                        &amp;lt;table align=&amp;quot;left&amp;quot; class=&amp;quot;columnBoxMail&amp;quot;&amp;gt;\r\n                                            &amp;lt;tr&amp;gt;\r\n                                                &amp;lt;td&amp;gt;\r\n\r\n                                                    &amp;lt;h5 class=&amp;quot;&amp;quot;&amp;gt;Contact Info:&amp;lt;/h5&amp;gt;\r\n                                                    &amp;lt;p&amp;gt;\r\n\r\n                                                            T&eacute;l&eacute;phone:\r\n                                                        &amp;lt;strong&amp;gt;+216 71 90 52 48 &amp;lt;/strong&amp;gt; &amp;lt;b&amp;gt;/&amp;lt;/b&amp;gt; &amp;lt;strong&amp;gt;+216 71 90 52&amp;lt;/strong&amp;gt; &amp;lt;b&amp;gt;/&amp;lt;/b&amp;gt; &amp;lt;strong&amp;gt;+216 71 90 52 54 &amp;lt;/strong&amp;gt;  &amp;lt;br&amp;gt;\r\n                                                            Fax:\r\n                                                             &amp;lt;strong&amp;gt;+216 71 90 36 03&amp;lt;/strong&amp;gt; &amp;lt;br&amp;gt;\r\n\r\n                                                    &amp;lt;/p&amp;gt;\r\n\r\n                                                &amp;lt;/td&amp;gt;\r\n                                                &amp;lt;td&amp;gt;\r\n\r\n                                                    Email: &amp;lt;strong&amp;gt;&amp;lt;a href=&amp;quot;emailto:contact@uvt.tn&amp;quot;&amp;gt;contact@uvt.tn&amp;lt;/a&amp;gt;&amp;lt;/strong&amp;gt;&amp;lt;br&amp;gt;\r\n                                                    Site Web :  &amp;lt;strong&amp;gt;&amp;lt;a href=&amp;quot;www.uvt.rnu.tn&amp;quot;&amp;gt;www.uvt.rnu.tn&amp;lt;/a&amp;gt;&amp;lt;/strong&amp;gt;\r\n\r\n                                                &amp;lt;/td&amp;gt;\r\n                                            &amp;lt;/tr&amp;gt;\r\n                                        &amp;lt;/table&amp;gt;&amp;lt;!-- /column 2 --&amp;gt;\r\n\r\n                                        &amp;lt;span class=&amp;quot;clearBoxMail&amp;quot;&amp;gt;&amp;lt;/span&amp;gt;\r\n\r\n                                    &amp;lt;/td&amp;gt;\r\n                                &amp;lt;/tr&amp;gt;\r\n                            &amp;lt;/table&amp;gt;&amp;lt;!-- /social &amp;amp; contact --&amp;gt;\r\n\r\n                        &amp;lt;/td&amp;gt;\r\n                    &amp;lt;/tr&amp;gt;\r\n\r\n                &amp;lt;/table&amp;gt;\r\n            &amp;lt;/div&amp;gt;&amp;lt;!-- /content --&amp;gt;\r\n\r\n        &amp;lt;/td&amp;gt;\r\n        &amp;lt;td&amp;gt;&amp;lt;/td&amp;gt;\r\n    &amp;lt;/tr&amp;gt;\r\n&amp;lt;/table&amp;gt;&amp;lt;!-- /BODY --&amp;gt;\r\n\r\n&amp;lt;!-- FOOTER --&amp;gt;\r\n&amp;lt;table class=&amp;quot;footerBoxMail-wrap&amp;quot;&amp;gt;\r\n    &amp;lt;tr&amp;gt;\r\n        &amp;lt;td&amp;gt;&amp;lt;/td&amp;gt;\r\n        &amp;lt;td class=&amp;quot;containerBoxMail&amp;quot;&amp;gt;\r\n\r\n            &amp;lt;!-- content --&amp;gt;\r\n            &amp;lt;div class=&amp;quot;contentBoxMail&amp;quot;&amp;gt;\r\n                &amp;lt;table&amp;gt;\r\n                    &amp;lt;tr&amp;gt;\r\n                        &amp;lt;td align=&amp;quot;center&amp;quot;&amp;gt;\r\n                            &amp;lt;p&amp;gt;\r\n                                &amp;lt;a href=&amp;quot;#&amp;quot;&amp;gt;Aide&amp;lt;/a&amp;gt; |\r\n                                &amp;lt;a href=&amp;quot;#&amp;quot;&amp;gt;Information&amp;lt;/a&amp;gt; |\r\n                                &amp;lt;a href=&amp;quot;#&amp;quot;&amp;gt;&amp;lt;unsubscribe&amp;gt;D&eacute;inscrire&amp;lt;/unsubscribe&amp;gt;&amp;lt;/a&amp;gt;\r\n                            &amp;lt;/p&amp;gt;\r\n                        &amp;lt;/td&amp;gt;\r\n                    &amp;lt;/tr&amp;gt;\r\n                &amp;lt;/table&amp;gt;\r\n            &amp;lt;/div&amp;gt;&amp;lt;!-- /content --&amp;gt;\r\n\r\n        &amp;lt;/td&amp;gt;\r\n        &amp;lt;td&amp;gt;&amp;lt;/td&amp;gt;\r\n    &amp;lt;/tr&amp;gt;\r\n&amp;lt;/table&amp;gt;&amp;lt;!-- /FOOTER --&amp;gt;\r\n\r\n&amp;lt;/body&amp;gt;\r\n&amp;lt;/html&amp;gt;', 'oussama.limam@gmail.com', 'Limam', 'Oussama', '[{"date":"2018-04-04 10:22:07","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com"},{"date":"2018-04-04 10:23:50","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com"},{"date":"2018-04-04 10:41:18","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com"},{"date":"2018-04-04 10:45:26","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com"},{"date":"2018-04-04 10:46:29","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com"},{"date":"2018-04-04 10:47:20","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com"},{"date":"2018-04-04 10:48:09","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com"},{"date":"2018-04-04 10:49:03","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com"},{"date":"2018-04-04 10:52:28","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com"},{"date":"2018-04-04 10:52:53","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com"},{"date":"2018-04-04 10:54:53","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com"},{"date":"2018-04-04 10:55:22","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com"},{"date":"2018-04-04 10:55:57","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com"},{"date":"2018-04-04 10:56:28","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com"},{"date":"2018-04-04 10:57:09","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com"},{"date":"2018-04-04 10:57:16","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com"},{"date":"2018-04-04 10:57:42","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com"},{"date":"2018-04-04 10:59:37","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com"},{"date":"2018-04-10 08:26:45","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com"},{"date":"2018-04-18 13:16:29","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com"},{"date":"2018-04-23 11:23:49","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com"}]', 'Tutorat', '', '');
INSERT INTO `invitations` (`idinvitations`, `idanneeuniv`, `idperiode`, `codeinvitation`, `textinvitation`, `email`, `nominviter`, `prenominviter`, `datesenvois`, `typeinvitation`, `infosuplimentaire`, `idnaturecoordinateur`) VALUES
(38, '2017-2018', NULL, '', '&amp;lt;!DOCTYPE html PUBLIC &amp;quot;-//W3C//DTD XHTML 1.0 Transitional//EN&amp;quot; &amp;quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&amp;quot;&amp;gt;\r\n&amp;lt;html xmlns=&amp;quot;http://www.w3.org/1999/xhtml&amp;quot;&amp;gt;\r\n&amp;lt;head&amp;gt;\r\n    &amp;lt;!-- If you delete this meta tag, Half Life 3 will never be released. --&amp;gt;\r\n    &amp;lt;meta name=&amp;quot;viewport&amp;quot; content=&amp;quot;width=device-width&amp;quot; /&amp;gt;\r\n\r\n    &amp;lt;meta http-equiv=&amp;quot;Content-Type&amp;quot; content=&amp;quot;text/html; charset=UTF-8&amp;quot; /&amp;gt;\r\n    &amp;lt;title&amp;gt;ZURBemails&amp;lt;/title&amp;gt;\r\n\r\n    &amp;lt;style&amp;gt;\r\n        /*\r\n        Max width before this PARTICULAR table gets nasty\r\n        This query will take effect for any screen smaller than 760px\r\n        and also iPads specifically.\r\n        */\r\n        /*\r\nGeneric Styling, for Desktops/Laptops\r\n*/\r\n        table.tableContent {\r\n            width: 100%;\r\n            border-collapse: collapse;\r\n        }\r\n        /* Zebra striping */\r\n        table.tableContent tr:nth-of-type(odd) {\r\n            background: #eee;\r\n        }\r\n        table.tableContent th {\r\n            background: #333;\r\n            color: white;\r\n            font-weight: bold;\r\n        }\r\n        table.tableContent td, th {\r\n            padding: 6px;\r\n            border: 1px solid #ccc;\r\n            text-align: left;\r\n        }\r\n        @media\r\n        only screen and (max-width: 760px),\r\n        (min-device-width: 768px) and (max-device-width: 1024px)  {\r\n\r\n            /* Force table to not be like tables anymore */\r\n            table.tableContent , thead, tbody, th, td, tr {\r\n                display: block;\r\n            }\r\n\r\n            /* Hide table headers (but not display: none;, for accessibility) */\r\n            table.tableContent thead tr {\r\n                position: absolute;\r\n                top: -9999px;\r\n                left: -9999px;\r\n            }\r\n\r\n            table.tableContent tr { border: 1px solid #ccc; }\r\n\r\n            table.tableContent td {\r\n                /* Behave  like a &amp;quot;row&amp;quot; */\r\n                border: none;\r\n                border-bottom: 1px solid #eee;\r\n                position: relative;\r\n                padding-left: 50%;\r\n            }\r\n\r\n            table.tableContent td:before {\r\n                /* Now like a table header */\r\n                position: absolute;\r\n                /* Top/left values mimic padding */\r\n                top: 6px;\r\n                left: 6px;\r\n                width: 45%;\r\n                padding-right: 10px;\r\n                white-space: nowrap;\r\n            }\r\n\r\n            /*\r\n            Label the data\r\n            */\r\n            /* table.tableContent td:nth-of-type(1):before { content: &amp;quot;Dipl&ocirc;me&amp;quot;; }\r\n             table.tableContent td:nth-of-type(2):before { content: &amp;quot;Last Name&amp;quot;; }\r\n             table.tableContent td:nth-of-type(3):before { content: &amp;quot;Job Title&amp;quot;; }\r\n             table.tableContent td:nth-of-type(4):before { content: &amp;quot;Favorite Color&amp;quot;; }\r\n             table.tableContent td:nth-of-type(5):before { content: &amp;quot;Wars of Trek?&amp;quot;; }\r\n            table.tableContent td:nth-of-type(6):before { content: &amp;quot;Porn Name&amp;quot;; }\r\n             table.tableContent td:nth-of-type(7):before { content: &amp;quot;Date of Birth&amp;quot;; }\r\n             table.tableContent td:nth-of-type(8):before { content: &amp;quot;Dream Vacation City&amp;quot;; }\r\n             table.tableContent td:nth-of-type(9):before { content: &amp;quot;GPA&amp;quot;; }\r\n             table.tableContent td:nth-of-type(10):before { content: &amp;quot;Arbitrary Data&amp;quot;; }\r\n             */\r\n        }\r\n        /* -------------------------------------\r\n                GLOBAL\r\n        ------------------------------------- */\r\n        * {\r\n            margin:0;\r\n            padding:0;\r\n        }\r\n        * { font-family: &amp;quot;Helvetica Neue&amp;quot;, &amp;quot;Helvetica&amp;quot;, Helvetica, Arial, sans-serif; }\r\n\r\n        img.boxMail {\r\n            max-width: 100%;\r\n        }\r\n        .collapse {\r\n            margin:0;\r\n            padding:0;\r\n        }\r\n        body.BoxMail {\r\n            -webkit-font-smoothing:antialiased;\r\n            -webkit-text-size-adjust:none;\r\n            width: 100%!important;\r\n            height: 100%;\r\n        }\r\n\r\n\r\n        /* -------------------------------------\r\n                ELEMENTS\r\n        ------------------------------------- */\r\n        a.BoxMail { color: #2BA6CB;}\r\n\r\n        .btnBoxMail {\r\n            text-decoration:none;\r\n            color: #FFF;\r\n            background-color: #666;\r\n            padding:10px 16px;\r\n            font-weight:bold;\r\n            margin-right:10px;\r\n            text-align:center;\r\n            cursor:pointer;\r\n            display: inline-block;\r\n        }\r\n\r\n        p.callout {\r\n            padding:15px;\r\n            background-color:#ECF8FF;\r\n            margin-bottom: 15px;\r\n        }\r\n        .callout a {\r\n            font-weight:bold;\r\n            color: #2BA6CB;\r\n        }\r\n\r\n        table.social {\r\n            /* 	padding:15px; */\r\n            background-color: #ebebeb;\r\n\r\n        }\r\n        .social .soc-btnBoxMail {\r\n            padding: 3px 7px;\r\n            font-size:12px;\r\n            margin-bottom:10px;\r\n            text-decoration:none;\r\n            color: #FFF;font-weight:bold;\r\n            display:block;\r\n            text-align:center;\r\n        }\r\n        a.fb { background-color: #3B5998!important; }\r\n        a.tw { background-color: #1daced!important; }\r\n        a.gp { background-color: #DB4A39!important; }\r\n        a.ms { background-color: #000!important; }\r\n\r\n        .sidebar .soc-btnBoxMail {\r\n            display:block;\r\n            width:100%;\r\n        }\r\n\r\n        /* -------------------------------------\r\n                HEADER\r\n        ------------------------------------- */\r\n        table.headBoxMail-wrap { width: 100%;}\r\n\r\n        .headerBoxMail.containerBoxMail table.BoxMail td.logo { padding: 15px; }\r\n        .headerBoxMail.containerBoxMail table.BoxMail td.label { padding: 15px; padding-left:0px;}\r\n\r\n\r\n        /* -------------------------------------\r\n                BODY\r\n        ------------------------------------- */\r\n        table.bodyBoxMail-wrap { width: 100%;}\r\n\r\n\r\n        /* -------------------------------------\r\n                FOOTER\r\n        ------------------------------------- */\r\n        table.footerBoxMail-wrap { width: 100%;	clear:both!important;\r\n        }\r\n        .footerBoxMail-wrap .containerBoxMail td.contentBoxMail  p { border-top: 1px solid rgb(215,215,215); padding-top:15px;}\r\n        .footerBoxMail-wrap .containerBoxMail td.contentBoxMail p {\r\n            font-size:10px;\r\n            font-weight: bold;\r\n\r\n        }\r\n\r\n\r\n        /* -------------------------------------\r\n                TYPOGRAPHY\r\n        ------------------------------------- */\r\n        h1.BoxMail,h2.BoxMail,h3.BoxMail,h4.BoxMail,h5.BoxMail,h6.BoxMail {\r\n            font-family: &amp;quot;HelveticaNeue-Light&amp;quot;, &amp;quot;Helvetica Neue Light&amp;quot;, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;Lucida Grande&amp;quot;, sans-serif; line-height: 1.1; margin-bottom:15px; color:#000;\r\n        }\r\n        h1.BoxMail small, h2.BoxMail small, h3.BoxMail small, h4.BoxMail small, h5.BoxMail small, h6.BoxMail small { font-size: 60%; color: #6f6f6f; line-height: 0; text-transform: none; }\r\n\r\n        h1.BoxMail { font-weight:200; font-size: 44px;}\r\n        h2.BoxMail { font-weight:200; font-size: 37px;}\r\n        h3.BoxMail { font-weight:500; font-size: 27px;}\r\n        h4.BoxMail { font-weight:500; font-size: 23px;}\r\n        h5.BoxMail { font-weight:900; font-size: 17px;}\r\n        h6.BoxMail { font-weight:900; font-size: 14px; text-transform: uppercase; color:#444;}\r\n\r\n        .collapse { margin:0!important;}\r\n\r\n        p.BoxMail, ul.BoxMail {\r\n            margin-bottom: 10px;\r\n            font-weight: normal;\r\n            font-size:14px;\r\n            line-height:1.6;\r\n        }\r\n        p.lead { font-size:17px; }\r\n        p.last { margin-bottom:0px;}\r\n\r\n        ul.BoxMail li {\r\n            margin-left:5px;\r\n            list-style-position: inside;\r\n        }\r\n\r\n        /* -------------------------------------\r\n                SIDEBAR\r\n        ------------------------------------- */\r\n        ul.sidebarBoxMail {\r\n            background:#ebebeb;\r\n            display:block;\r\n            list-style-type: none;\r\n        }\r\n        ul.sidebarBoxMail li { display: block; margin:0;}\r\n        ul.sidebarBoxMail li a {\r\n            text-decoration:none;\r\n            color: #666;\r\n            padding:10px 16px;\r\n            /* 	font-weight:bold; */\r\n            margin-right:10px;\r\n            /* 	text-align:center; */\r\n            cursor:pointer;\r\n            border-bottom: 1px solid #777777;\r\n            border-top: 1px solid #FFFFFF;\r\n            display:block;\r\n            margin:0;\r\n        }\r\n        ul.sidebarBoxMail li a.last { border-bottom-width:0px;}\r\n        ul.sidebarBoxMail li a h1,ul.sidebarBoxMail li a h2,ul.sidebarBoxMail li a h3,ul.sidebarBoxMail li a h4,ul.sidebarBoxMail li a h5,ul.sidebarBoxMail li a h6.BoxMail,ul.sidebarBoxMail li a p { margin-bottom:0!important;}\r\n\r\n\r\n\r\n        /* ---------------------------------------------------\r\n                RESPONSIVENESS\r\n                Nuke it from orbit. It''s the only way to be sure.\r\n        ------------------------------------------------------ */\r\n\r\n        /* Set a max-width, and make it display as block so it will automatically stretch to that width, but will also shrink down on a phone or something */\r\n        .containerBoxMail {\r\n            display:block!important;\r\n            max-width:600px!important;\r\n            margin:0 auto!important; /* makes it centered */\r\n            clear:both!important;\r\n        }\r\n\r\n        /* This should also be a block element, so that it will fill 100% of the .container */\r\n        .contentBoxMail {\r\n            padding:15px;\r\n            max-width:600px;\r\n            margin:0 auto;\r\n            display:block;\r\n        }\r\n\r\n        /* Let''s make sure tables in the content area are 100% wide */\r\n        .contentBoxMail table { width: 100%; }\r\n\r\n\r\n        /* Odds and ends */\r\n        .columnBoxMail {\r\n            width: 300px;\r\n            float:left;\r\n        }\r\n        .columnBoxMail tr td { padding: 15px; }\r\n        .columnBoxMail-wrap {\r\n            padding:0!important;\r\n            margin:0 auto;\r\n            max-width:600px!important;\r\n        }\r\n        .columnBoxMail table { width:100%;}\r\n        .socialBoxMail .columnBoxMail {\r\n            width: 280px;\r\n            min-width: 279px;\r\n            float:left;\r\n        }\r\n\r\n        /* Be sure to place a .clear element after each set of columns, just to be safe */\r\n        .clearBoxMail { display: block; clear: both; }\r\n\r\n\r\n        /* -------------------------------------------\r\n                PHONE\r\n                For clients that support media queries.\r\n                Nothing fancy.\r\n        -------------------------------------------- */\r\n        @media only screen and (max-width: 600px) {\r\n\r\n            a[class=&amp;quot;btnBoxMail&amp;quot;] { display:block!important; margin-bottom:10px!important; background-image:none!important; margin-right:0!important;}\r\n\r\n            div[class=&amp;quot;columnBoxMail&amp;quot;] { width: auto!important; float:none!important;}\r\n\r\n            table.social div[class=&amp;quot;columnBoxMail&amp;quot;] {\r\n                width:auto!important;\r\n            }\r\n\r\n        }\r\n    &amp;lt;/style&amp;gt;\r\n\r\n&amp;lt;/head&amp;gt;\r\n\r\n&amp;lt;body bgcolor=&amp;quot;#FFFFFF&amp;quot; class=&amp;quot;boxMail&amp;quot;&amp;gt;\r\n\r\n&amp;lt;!-- HEADER --&amp;gt;\r\n&amp;lt;table class=&amp;quot;headBoxMail-wrap&amp;quot; bgcolor=&amp;quot;#FFFFFF&amp;quot;&amp;gt;\r\n    &amp;lt;tr&amp;gt;\r\n        &amp;lt;td&amp;gt;&amp;lt;/td&amp;gt;\r\n        &amp;lt;td class=&amp;quot;headerBoxMail  containerBoxMail&amp;quot; &amp;gt;\r\n\r\n            &amp;lt;div class=&amp;quot;contentBoxMail&amp;quot;&amp;gt;\r\n                &amp;lt;table bgcolor=&amp;quot;#FFFFFF&amp;quot;&amp;gt;\r\n                    &amp;lt;tr&amp;gt;\r\n                        &amp;lt;td&amp;gt;\r\n                            &amp;lt;object type=&amp;quot;image/svg+xml&amp;quot;&amp;gt;\r\n                                &amp;lt;svg xmlns=&amp;quot;http://www.w3.org/2000/svg&amp;quot; xmlns:xlink=&amp;quot;http://www.w3.org/1999/xlink&amp;quot; version=&amp;quot;1.1&amp;quot; id=&amp;quot;Calque_1&amp;quot; x=&amp;quot;0px&amp;quot; y=&amp;quot;0px&amp;quot; width=&amp;quot;168.194px&amp;quot; height=&amp;quot;24.094px&amp;quot; viewBox=&amp;quot;0 0 168.194 24.094&amp;quot; enable-background=&amp;quot;new 0 0 168.194 24.094&amp;quot; xml:space=&amp;quot;preserve&amp;quot;&amp;gt;\r\n                                    &amp;lt;pattern x=&amp;quot;-337.828&amp;quot; y=&amp;quot;308.479&amp;quot; width=&amp;quot;69&amp;quot; height=&amp;quot;69&amp;quot; patternUnits=&amp;quot;userSpaceOnUse&amp;quot; id=&amp;quot;Unnamed_Pattern&amp;quot; viewBox=&amp;quot;2.125 -70.896 69 69&amp;quot; overflow=&amp;quot;visible&amp;quot;&amp;gt;\r\n                                        &amp;lt;g&amp;gt;\r\n                                            &amp;lt;polygon fill=&amp;quot;none&amp;quot; points=&amp;quot;71.125,-1.896 2.125,-1.896 2.125,-70.896 71.125,-70.896   &amp;quot;/&amp;gt;\r\n                                            &amp;lt;polygon fill=&amp;quot;#F7C158&amp;quot; points=&amp;quot;71.125,-1.896 2.125,-1.896 2.125,-70.896 71.125,-70.896   &amp;quot;/&amp;gt;\r\n                                            &amp;lt;g&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#c31924&amp;quot; d=&amp;quot;M61.772-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.105-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.439-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.772-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.105-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.439-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.772-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.105-71.653c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.439-71.653c0.018,0.072,0.008,0.127-0.026,0.19C0.361-71.362,0.3-71.4,0.248-71.335     c-0.051,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.07,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.038-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.051-0.12-0.064-0.187c-0.021-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.215,0.124-0.215,0.224c0.002,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                            &amp;lt;/g&amp;gt;\r\n                                            &amp;lt;g&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-71.653c0.018,0.072,0.008,0.127-0.026,0.19c-0.052,0.101-0.113,0.063-0.165,0.128     c-0.051,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.07,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.038-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.051-0.12-0.064-0.187c-0.021-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.215,0.124-0.215,0.224c0.002,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                            &amp;lt;/g&amp;gt;\r\n                                            &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-71.653c0.018,0.072,0.008,0.127-0.026,0.19c-0.052,0.101-0.113,0.063-0.165,0.128    c-0.051,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161    c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631    c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45    c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.07,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221    c0.038-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.051-0.12-0.064-0.187c-0.021-0.114,0.002-0.224,0-0.337    c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207    c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.215,0.124-0.215,0.224C0.5-71.68,0.503-71.744,0.51-71.626    c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                            &amp;lt;g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-64.001c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143C2-61.45,2.217-61.397,2.391-61.46c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-56.348c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224C0.5-56.374,0.503-56.438,0.51-56.32      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-48.695c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      C8.15-41.004,8.149-41.02,8.14-41.04&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-41.042c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-33.39c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224C0.5-33.416,0.503-33.48,0.51-33.362      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-25.736c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-18.084c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224C0.5-18.11,0.503-18.175,0.51-18.057      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                                &amp;lt;g&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362C69-9.692,69.159-9.523,69.154-9.4c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.009,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      c0.177,0.042,0.384-0.104,0.543-0.143c0.18-0.043,0.397,0.01,0.571-0.053C17.933-7.969,17.839-8.227,18-8.34      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      C7.915-10.05,7.866-9.836,7.886-9.75C7.717-9.692,7.876-9.523,7.871-9.4C7.868-9.351,7.83-9.295,7.826-9.239      c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631      C9.114-7.652,9.321-7.799,9.48-7.837c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                    &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-10.431c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128      C0.254-10.05,0.205-9.836,0.225-9.75C0.056-9.692,0.215-9.523,0.21-9.4c-0.002,0.05-0.041,0.105-0.045,0.161      c-0.01,0.119,0.017,0.266,0.068,0.37C0.33-8.671,0.501-8.456,0.668-8.325c0.19,0.148,0.365,0.572,0.608,0.631      C1.454-7.652,1.66-7.799,1.819-7.837C2-7.88,2.217-7.827,2.391-7.89c0.222-0.079,0.127-0.337,0.288-0.45      c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46C3.477-8.933,3.471-8.995,3.5-9.071      c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337      c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207      c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169      c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;/g&amp;gt;\r\n                                            &amp;lt;/g&amp;gt;\r\n                                            &amp;lt;g&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M69.439-2.778c0.018,0.072,0.008,0.127-0.026,0.19C69.361-2.487,69.3-2.525,69.248-2.46     c-0.051,0.063-0.099,0.276-0.079,0.362C69-2.04,69.159-1.871,69.154-1.748c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C70.397,0,70.604-0.146,70.763-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.07,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.038-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.051-0.12-0.064-0.187c-0.021-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.215,0.124-0.215,0.224c0.002,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M61.778-2.778c0.018,0.072,0.007,0.127-0.026,0.19C61.7-2.487,61.64-2.525,61.587-2.46     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C62.737,0,62.943-0.146,63.103-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224C61.915-3.117,61.78-3.02,61.781-2.92c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M54.118-2.778c0.018,0.072,0.007,0.127-0.026,0.19C54.04-2.487,53.98-2.525,53.927-2.46     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C55.077,0,55.283-0.146,55.442-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224C54.255-3.117,54.12-3.02,54.121-2.92c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M46.458-2.778c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C47.416,0,47.623-0.146,47.782-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224C46.594-3.117,46.459-3.02,46.46-2.92c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M38.797-2.778c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C39.756,0,39.962-0.146,40.122-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224C38.934-3.117,38.799-3.02,38.8-2.92c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M31.137-2.778c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C32.095,0,32.302-0.146,32.461-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224C31.273-3.117,31.139-3.02,31.14-2.92c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M23.477-2.778c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C24.435,0,24.642-0.146,24.801-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     c-0.021,0.011-0.021-0.005-0.03-0.025&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M15.816-2.778c0.018,0.072,0.007,0.127-0.026,0.19c-0.053,0.101-0.112,0.063-0.165,0.128     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C16.774,0,16.981-0.146,17.14-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789c-0.18,0.034-0.287,0.126-0.442,0.207     c-0.17,0.088-0.139,0.166-0.318,0.224c-0.081,0.026-0.216,0.124-0.215,0.224c0.001,0.115,0.005,0.051,0.012,0.169     C15.81-2.74,15.809-2.756,15.8-2.776&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M8.156-2.778c0.018,0.072,0.007,0.127-0.026,0.19C8.077-2.487,8.018-2.525,7.965-2.46     c-0.05,0.063-0.099,0.276-0.079,0.362c-0.169,0.058-0.01,0.227-0.015,0.35C7.868-1.698,7.83-1.643,7.826-1.587     c-0.01,0.119,0.017,0.266,0.068,0.37c0.097,0.198,0.268,0.413,0.435,0.544c0.19,0.148,0.365,0.572,0.608,0.631     C9.114,0,9.321-0.146,9.48-0.185c0.18-0.043,0.397,0.01,0.571-0.053c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.069,0.339-0.263,0.376-0.46c0.016-0.082,0.01-0.145,0.039-0.221     c0.039-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.052-0.12-0.064-0.187c-0.022-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789C8.954-3.54,8.847-3.448,8.692-3.367     c-0.17,0.088-0.139,0.166-0.318,0.224C8.292-3.117,8.158-3.02,8.159-2.92C8.16-2.805,8.164-2.869,8.17-2.751     C8.15-2.74,8.149-2.756,8.14-2.776&amp;quot;/&amp;gt;\r\n                                                &amp;lt;path fill=&amp;quot;#FFFFFF&amp;quot; d=&amp;quot;M0.495-2.778c0.018,0.072,0.008,0.127-0.026,0.19C0.417-2.487,0.356-2.525,0.304-2.46     C0.253-2.397,0.205-2.184,0.225-2.098C0.056-2.04,0.215-1.871,0.21-1.748c-0.002,0.05-0.041,0.105-0.045,0.161     c-0.01,0.119,0.017,0.266,0.068,0.37C0.33-1.019,0.501-0.804,0.668-0.673c0.19,0.148,0.365,0.572,0.608,0.631     C1.454,0,1.66-0.146,1.819-0.185C2-0.228,2.217-0.175,2.391-0.237c0.222-0.079,0.127-0.337,0.288-0.45     c0.104-0.074,0.287-0.01,0.406-0.051c0.2-0.07,0.339-0.263,0.376-0.46C3.477-1.28,3.471-1.343,3.5-1.419     c0.038-0.103,0.111-0.16,0.09-0.293c-0.01-0.062-0.051-0.12-0.064-0.187c-0.021-0.114,0.002-0.224,0-0.337     c-0.003-0.2,0.017-0.379-0.078-0.55c-0.38-0.688-1.236-0.929-1.975-0.789C1.293-3.54,1.187-3.448,1.031-3.367     c-0.17,0.088-0.139,0.166-0.318,0.224C0.632-3.117,0.498-3.02,0.498-2.92C0.5-2.805,0.503-2.869,0.51-2.751     C0.489-2.74,0.488-2.756,0.479-2.776&amp;quot;/&amp;gt;\r\n                                            &amp;lt;/g&amp;gt;\r\n                                        &amp;lt;/g&amp;gt;\r\n                                    &amp;lt;/pattern&amp;gt;\r\n                                    &amp;lt;g&amp;gt;\r\n                                        &amp;lt;path fill=&amp;quot;#C31924&amp;quot; d=&amp;quot;M18.546,22.494l-4.455-6.834l-1.724,0.002l5.575,8.365h1.152l5.523-8.377h-1.676L18.546,22.494   L18.546,22.494z M8.841,21.895c0.003,0.604-0.467,0.906-1.401,0.906l-4.45,0.006c-0.936,0.002-1.404-0.309-1.404-0.926   l-0.005-6.209L0,15.674l0.005,6.207c0,1.443,0.996,2.166,2.988,2.164l4.447-0.002c1.99-0.008,2.984-0.721,2.984-2.148l-0.007-6.232   l-1.582,0.002L8.841,21.895L8.841,21.895z M34.219,16.65c-3.799,0.002-7.317-0.799-10.185-2.16   c1.824,1.148,4.015,2.021,6.442,2.537l0.006,6.992l1.581-0.006l-0.006-6.711c1.073,0.148,2.183,0.23,3.32,0.234l-0.001-0.916   C34.992,16.639,34.605,16.65,34.219,16.65L34.219,16.65z&amp;quot;/&amp;gt;\r\n                                        &amp;lt;g&amp;gt;\r\n                                            &amp;lt;path fill=&amp;quot;#8697AC&amp;quot; d=&amp;quot;M167.12,23.99l-2.52,0.008l-0.004-0.523h2.523c0.159,0,0.436-0.016,0.436-0.143v-0.516    c0-0.127-0.237-0.15-0.441-0.15h-1.538c-0.721,0-1.079-0.227-1.079-0.674v-0.316c0-0.443,0.356-0.67,1.074-0.674h2.438v0.521    h-2.438c-0.199,0-0.439,0.029-0.439,0.15v0.318c0,0.129,0.24,0.154,0.439,0.154l1.54-0.002c0.72,0,1.083,0.227,1.083,0.672v0.516    C168.196,23.77,167.831,23.99,167.12,23.99L167.12,23.99L167.12,23.99z M163.666,23.998h-0.638l-0.006-2.992h0.637L163.666,23.998    L163.666,23.998z M162.161,23.998h-0.489l-2.83-2.158l0.004,2.16l-0.608,0.002l-0.002-2.99h0.486l2.837,2.176l-0.007-2.182h0.608    L162.161,23.998L162.161,23.998z M156.302,24.002h-1.541c-0.713,0.006-1.078-0.264-1.078-0.791l-0.002-2.191l0.638-0.004    l0.003,2.195c0,0.068,0,0.283,0.439,0.281l1.541-0.008c0.446,0,0.446-0.199,0.446-0.264l-0.007-2.209h0.636l0.002,2.209    C157.381,23.738,157.019,24.002,156.302,24.002L156.302,24.002L156.302,24.002z M151.523,24.008l-0.637,0.002l-0.005-2.475    l-1.519,0.002v-0.516l3.636-0.002v0.516h-1.476V24.008L151.523,24.008z M146.252,24.012l-3.073,0.008l-0.005-2.994h3.074v0.52    h-2.438v0.633h2.315v0.518l-2.315,0.004v0.799l2.441-0.004V24.012L146.252,24.012z M141.22,24.02l-2.576,0.002l-0.005-2.99    l2.579-0.006c0.825,0,1.244,0.287,1.244,0.84v1.324C142.462,23.738,142.044,24.02,141.22,24.02L141.22,24.02L141.22,24.02z     M139.279,23.504h1.938c0.604,0,0.604-0.232,0.604-0.314v-1.324c0-0.078,0-0.318-0.604-0.318l-1.939,0.006L139.279,23.504    L139.279,23.504z M135.353,24.027h-3.073v-2.986l3.073-0.004v0.516h-2.437v0.637l2.311-0.006v0.523l-2.306,0.006v0.797    l2.432-0.002V24.027L135.353,24.027z M131.521,24.027l-2.991,0.004l-0.001-2.99h0.637l0.003,2.475l2.353-0.006V24.027    L131.521,24.027z M127.852,24.031l-2.99,0.004v-2.992h0.635l0.004,2.475l2.352-0.002V24.031L127.852,24.031z M124.122,24.035    l-3.071,0.008l-0.005-2.994l3.076-0.002v0.52h-2.438l0.003,0.633h2.31v0.52h-2.31v0.801l2.435-0.002V24.035L124.122,24.035z     M119.118,24.043l-1.543,0.002c-0.717,0-1.077-0.268-1.077-0.797l-0.005-2.195l0.637-0.002l0.004,2.197    c0,0.068,0,0.279,0.441,0.279l1.543-0.006c0.44-0.002,0.44-0.201,0.44-0.266l-0.003-2.205h0.64v2.205    C120.195,23.777,119.832,24.043,119.118,24.043L119.118,24.043L119.118,24.043z M114.336,24.047H113.7l-0.008-2.477l-1.52,0.006    v-0.516l3.64-0.008v0.518h-1.48L114.336,24.047L114.336,24.047z M111.519,24.049h-0.688l-0.681-1.295l-1.415,0.006l0.005,1.289    h-0.639l-0.004-2.988h2.34c0.717,0,1.077,0.221,1.081,0.672v0.352c0,0.355-0.233,0.572-0.694,0.646L111.519,24.049L111.519,24.049    z M108.735,22.238h1.703c0.203,0,0.441-0.027,0.441-0.154v-0.352c0-0.131-0.238-0.156-0.442-0.156h-1.702V22.238L108.735,22.238z     M107.227,24.051l-0.639,0.004l-0.004-2.994h0.637L107.227,24.051L107.227,24.051z M104.062,24.057h-0.445l-1.992-2.988h0.706    l1.519,2.326l1.495-2.328l0.692-0.006L104.062,24.057L104.062,24.057z M98.646,24.059l-3.074,0.008l-0.002-2.994l3.072-0.004v0.52    l-2.434,0.004v0.633l2.313-0.002v0.521h-2.313l0.003,0.805l2.435-0.008V24.059L98.646,24.059z M93.401,24.066h-0.637v-2.473    L91.246,21.6v-0.523l3.634-0.004v0.521h-1.479V24.066L93.401,24.066z M90.547,24.07l-0.643,0.004v-2.998h0.636L90.547,24.07    L90.547,24.07z M88.012,24.074h-2.52v-0.518l2.52-0.004c0.166,0,0.44-0.021,0.44-0.143v-0.516c0-0.129-0.24-0.154-0.442-0.154    l-1.543,0.004c-0.711,0-1.075-0.225-1.078-0.672v-0.318c0-0.441,0.364-0.668,1.078-0.668l2.439-0.01V21.6h-2.439    c-0.197,0-0.438,0.029-0.438,0.154v0.318c0,0.127,0.24,0.152,0.438,0.152l1.543-0.006c0.716,0,1.08,0.227,1.08,0.676v0.516    C89.09,23.848,88.727,24.074,88.012,24.074L88.012,24.074L88.012,24.074z M84.676,24.074l-0.688,0.004l-0.68-1.295h-1.412v1.295    h-0.638l-0.003-2.99l2.339-0.002c0.718,0,1.078,0.227,1.078,0.668v0.355c0,0.359-0.23,0.572-0.69,0.645L84.676,24.074    L84.676,24.074z M81.896,22.266h1.698c0.199,0,0.441-0.027,0.439-0.156v-0.354c0-0.127-0.241-0.156-0.439-0.154l-1.698,0.002    V22.266L81.896,22.266z M80.439,24.078l-3.07,0.004l-0.003-2.992l3.071-0.002v0.52H78v0.637h2.311l0.002,0.52H78l0.002,0.799    l2.437-0.006V24.078L80.439,24.078z M74.839,24.082h-0.446l-1.991-2.986l0.704-0.002l1.523,2.332l1.495-2.332l0.688-0.004    L74.839,24.082L74.839,24.082z M71.838,24.082L71.2,24.09l-0.003-2.994h0.637L71.838,24.082L71.838,24.082z M70.335,24.09h-0.49    l-2.83-2.158v2.16l-0.606,0.002l-0.004-2.996h0.492l2.832,2.18l-0.004-2.182h0.61V24.09L70.335,24.09z M64.479,24.094h-1.543    c-0.715,0.002-1.079-0.264-1.079-0.791l-0.003-2.193h0.636l0.001,2.193c0,0.066,0,0.277,0.443,0.273h1.541    c0.44,0,0.44-0.205,0.44-0.271l-0.002-2.197h0.642v2.197C65.554,23.83,65.191,24.094,64.479,24.094L64.479,24.094L64.479,24.094z     M96.303,20.58l1.555-0.559v0.553L96.303,20.58L96.303,20.58z&amp;quot;/&amp;gt;\r\n                                            &amp;lt;path fill=&amp;quot;#8697AC&amp;quot; d=&amp;quot;M63.893,14.697H63.28v0.484h0.615L63.893,14.697L63.893,14.697z M63.009,14.697h-0.616v0.484h0.618    L63.009,14.697L63.009,14.697z M72.358,18.607h0.611v-0.488h-0.611V18.607L72.358,18.607z M73.24,18.607l0.618-0.004v-0.488    l-0.618,0.004V18.607L73.24,18.607z M80.278,14.678l-0.617,0.002v0.49h0.617V14.678L80.278,14.678z M79.064,15.494    c-0.045,0.008-0.088,0.02-0.132,0.041c-0.038,0.025-0.073,0.061-0.113,0.105c-0.036,0.049-0.069,0.105-0.101,0.186    c-0.026-0.066-0.05-0.119-0.081-0.16c-0.028-0.043-0.058-0.074-0.088-0.096c-0.031-0.021-0.063-0.035-0.095-0.045    c-0.034-0.008-0.065-0.018-0.098-0.02c-0.035-0.012-0.117-0.016-0.236-0.016v1.686h-4.234v0.012l-0.272,0.004    c-0.066-0.025-0.112-0.059-0.147-0.107c-0.029-0.047-0.045-0.109-0.045-0.189v-1.4H72.81v1.396c0,0.076-0.016,0.139-0.042,0.184    c-0.028,0.045-0.07,0.076-0.136,0.1l-0.386,0.014l-7.955,0.006v-1.691h-1.696c-0.092,0.004-0.168,0.004-0.233,0.004    c-0.063,0.012-0.112,0.02-0.152,0.029c-0.131,0.021-0.226,0.082-0.279,0.174c-0.054,0.104-0.081,0.246-0.086,0.447l0.005,0.967    c0,0.102,0.008,0.188,0.019,0.26c0.016,0.072,0.036,0.135,0.068,0.186c0.031,0.049,0.074,0.092,0.117,0.125    c0.048,0.033,0.108,0.049,0.176,0.066l-0.003-0.006c0.083,0.014,0.206,0.018,0.368,0.018l9.826-0.008c0.099,0,0.174,0,0.23,0    c0.061,0,0.099-0.004,0.111-0.01c0.04-0.006,0.07-0.014,0.109-0.025c0.032-0.016,0.066-0.033,0.098-0.057    c0.033-0.025,0.06-0.061,0.092-0.105c0.028-0.045,0.051-0.096,0.076-0.166c0.031,0.074,0.061,0.129,0.091,0.178    c0.035,0.039,0.072,0.076,0.109,0.102c0.038,0.027,0.075,0.041,0.117,0.057c0.042,0.006,0.083,0.018,0.128,0.023h0.304v0.004    l3.89-0.004c0.538,0,1.074,0,1.61,0c0.532,0,1.069,0,1.615,0c0.084,0,0.161,0,0.225-0.01c0.063-0.008,0.119-0.01,0.16-0.02    c0.131-0.023,0.226-0.084,0.28-0.182c0.059-0.094,0.083-0.238,0.082-0.441V15.48l-2.54,0.002    C79.161,15.482,79.113,15.49,79.064,15.494L79.064,15.494z M63.669,17.201h-0.817c-0.1,0-0.179-0.006-0.229-0.025    c-0.057-0.01-0.094-0.035-0.116-0.074c-0.024-0.025-0.034-0.047-0.036-0.08c-0.002-0.029-0.006-0.061-0.006-0.109v-0.541    c0-0.074,0.004-0.135,0.008-0.172c0.003-0.039,0.02-0.066,0.043-0.086c0.024-0.016,0.056-0.027,0.103-0.027    c0.041-0.002,0.099-0.012,0.174-0.012h0.876V17.201L63.669,17.201z M81.132,16.822c0,0.143-0.042,0.24-0.136,0.305    c-0.026,0.02-0.063,0.029-0.103,0.039c-0.041,0.008-0.09,0.008-0.151,0.008l-2,0.002v-0.813c0-0.082,0.013-0.141,0.042-0.193    c0.027-0.047,0.079-0.078,0.148-0.1l2.201-0.002V16.822L81.132,16.822z M82.465,17.754h0.616v-3.01h-0.616V17.754L82.465,17.754z     M89.701,14.674l-0.618,0.002v0.48h0.618V14.674L89.701,14.674z M90.582,14.674h-0.613v0.48h0.613V14.674L90.582,14.674z     M95.339,15.479c-0.065,0.004-0.118,0.016-0.164,0.023c-0.13,0.023-0.219,0.08-0.274,0.18c-0.056,0.098-0.081,0.244-0.081,0.441    v1.039l-4.174,0.004v0.008h-0.272c-0.069-0.023-0.114-0.064-0.151-0.104c-0.027-0.049-0.044-0.109-0.044-0.191v-1.402h-0.611    v1.396c0,0.08-0.017,0.141-0.041,0.184c-0.03,0.045-0.07,0.076-0.137,0.098L89,17.166l-4.146,0.004v-1.455h-0.614l0.001,2.293    c0,0.086-0.01,0.148-0.033,0.197c-0.019,0.043-0.055,0.07-0.108,0.078c-0.015,0.008-0.043,0.008-0.089,0.014    c-0.046,0-0.095,0-0.158,0h-0.101l0.003,0.574h0.356c0.092,0,0.171,0,0.237-0.008c0.065-0.002,0.124-0.016,0.172-0.018    l-0.009-0.002c0.063-0.016,0.113-0.033,0.159-0.066c0.043-0.029,0.08-0.063,0.109-0.113c0.022-0.055,0.045-0.113,0.06-0.182    c0.013-0.074,0.019-0.16,0.015-0.26V17.75l4.322-0.002c0.097,0,0.176-0.006,0.232-0.006s0.096,0,0.114-0.002    c0.036-0.01,0.07-0.02,0.102-0.031c0.038-0.008,0.07-0.029,0.101-0.055c0.034-0.023,0.06-0.061,0.089-0.105    c0.03-0.041,0.057-0.096,0.078-0.168c0.026,0.072,0.063,0.137,0.092,0.176c0.037,0.047,0.073,0.082,0.11,0.107    s0.076,0.043,0.115,0.051c0.045,0.016,0.083,0.021,0.129,0.027h0.308l0,0l5.855-0.002c0.088,0,0.164,0,0.229-0.004    c0.067,0,0.117-0.008,0.159-0.021l-0.008-0.002c0.065-0.01,0.118-0.033,0.169-0.063c0.048-0.033,0.085-0.066,0.115-0.119    c0.028-0.053,0.052-0.109,0.063-0.18c0.013-0.072,0.023-0.16,0.023-0.266v-1.613h-1.691    C95.479,15.473,95.401,15.475,95.339,15.479L95.339,15.479z M95.812,16.045h0.824l0.004,0.834c0,0.039-0.004,0.066-0.009,0.088    c-0.002,0.025-0.011,0.047-0.015,0.061c-0.022,0.051-0.063,0.082-0.126,0.105c-0.059,0.021-0.137,0.033-0.239,0.033h-0.569    c-0.051,0-0.093-0.01-0.128-0.016c-0.032-0.012-0.059-0.023-0.075-0.045c-0.02-0.021-0.035-0.047-0.04-0.084    c-0.003-0.035-0.008-0.082-0.008-0.139V16.34c0-0.078,0.013-0.137,0.037-0.184s0.054-0.082,0.094-0.092    c0.022-0.002,0.055-0.008,0.096-0.012C95.7,16.049,95.751,16.047,95.812,16.045L95.812,16.045z M96.311,14.664H95.7v0.488h0.61    V14.664L96.311,14.664z M98.455,18.252h-0.223c-0.03,0-0.046,0-0.046,0c-0.01-0.008-0.015-0.027-0.019-0.055    c0-0.021,0.012-0.035,0.028-0.037h0.371v-0.193h-0.391c-0.047,0-0.08,0-0.112,0.006c-0.039,0.006-0.063,0.025-0.086,0.051    c-0.016,0.023-0.025,0.066-0.025,0.127v0.133c0,0.061,0.025,0.104,0.08,0.127c0.039,0.025,0.08,0.033,0.132,0.033h0.232    c0.015,0,0.024,0.004,0.029,0.016c0.002,0.006,0.005,0.023,0.002,0.045c0,0.021-0.011,0.035-0.027,0.035h-0.448v0.191h0.474    c0.045,0,0.079-0.002,0.104-0.002c0.041-0.012,0.069-0.027,0.087-0.053c0.015-0.027,0.023-0.068,0.023-0.127v-0.113    c0-0.064-0.023-0.109-0.061-0.145C98.546,18.266,98.506,18.252,98.455,18.252L98.455,18.252z M103.054,16.871    c0.003,0.156-0.062,0.254-0.194,0.281l-4.092,0.004c-0.129-0.029-0.195-0.123-0.195-0.283v-2.145h-0.609v2.352    c0,0.191,0.022,0.34,0.078,0.438c0.049,0.094,0.136,0.154,0.25,0.186c0.106,0.025,0.245,0.037,0.418,0.037l4.203-0.004    c0.186,0,0.322-0.016,0.427-0.041c0.114-0.031,0.2-0.092,0.252-0.189c0.048-0.098,0.07-0.238,0.07-0.43v-2.352h-0.609    L103.054,16.871L103.054,16.871z M104.51,17.73h0.617v-3.006h-0.62L104.51,17.73L104.51,17.73z M125.818,14.637h-0.617v0.488    h0.617V14.637L125.818,14.637z M125.213,16.846c0,0.16-0.064,0.256-0.195,0.287l-8.11,0.006v0.008h-0.121    c-0.128-0.041-0.189-0.141-0.189-0.291l-0.007-1.402h-0.617l0.002,1.395c0,0.072-0.011,0.139-0.039,0.182    c-0.024,0.043-0.067,0.076-0.128,0.098c-0.013,0.002-0.034,0.006-0.066,0.012c-0.029,0-0.063,0-0.094,0.002    c-0.036,0.006-0.066,0.006-0.103,0.006c-0.037,0-0.057,0-0.075,0h-0.2c-0.124-0.041-0.187-0.135-0.187-0.291l-0.002-1.402h-0.616    v1.396c0,0.148-0.055,0.244-0.175,0.283c-0.011,0-0.023,0.006-0.047,0.006c-0.023,0.006-0.056,0.006-0.104,0.008h-0.548v-1.699    h-0.615l0.003,2.26c0,0.158-0.065,0.248-0.193,0.287h-0.908c-0.128-0.033-0.194-0.127-0.194-0.287v-2.252h-0.619l0.005,3.117    h1.776c0.171,0,0.308-0.016,0.419-0.037c0.115-0.027,0.201-0.092,0.254-0.189c0.048-0.094,0.077-0.238,0.077-0.432v-0.188h0.486    c0.199-0.006,0.317-0.008,0.349-0.014c0.034-0.006,0.069-0.012,0.105-0.027c0.039-0.008,0.071-0.031,0.097-0.053    c0.031-0.029,0.063-0.064,0.092-0.107c0.028-0.045,0.052-0.1,0.078-0.168c0.03,0.076,0.068,0.143,0.108,0.191    c0.034,0.049,0.073,0.084,0.115,0.111c0.04,0.025,0.084,0.043,0.131,0.049c0.046,0.01,0.094,0.012,0.147,0.012h0.203    c0.067-0.002,0.132-0.002,0.192-0.002c0.06,0,0.112,0,0.156-0.004c0.049,0,0.074,0,0.076-0.002    c0.034-0.006,0.073-0.018,0.108-0.027c0.037-0.014,0.063-0.031,0.1-0.055c0.03-0.027,0.063-0.063,0.086-0.105    c0.032-0.047,0.059-0.1,0.08-0.168c0.03,0.07,0.061,0.129,0.095,0.174c0.035,0.047,0.071,0.082,0.105,0.107    c0.04,0.023,0.077,0.041,0.122,0.055c0.038,0.01,0.075,0.02,0.124,0.021h0.156l-0.002,0.004l8.163-0.006    c0.177,0,0.316-0.012,0.426-0.035c0.117-0.027,0.2-0.092,0.248-0.191c0.055-0.094,0.077-0.238,0.077-0.432v-1.611h-0.608V16.846    L125.213,16.846z M133.771,14.629h-0.618v0.484h0.618V14.629L133.771,14.629z M134.035,16.838c0,0.16-0.06,0.256-0.195,0.285    l-4.93,0.004v-1.688l-1.694,0.004c-0.085,0-0.159,0-0.225,0.004c-0.065,0.006-0.118,0.014-0.161,0.025    c-0.127,0.021-0.218,0.084-0.275,0.176c-0.058,0.098-0.081,0.246-0.081,0.441v0.965c0,0.102,0.007,0.189,0.023,0.26    c0.01,0.072,0.027,0.139,0.058,0.186c0.032,0.049,0.07,0.09,0.118,0.117c0.044,0.033,0.102,0.055,0.166,0.068h-0.005    c0.04,0.01,0.096,0.018,0.157,0.021c0.066,0.002,0.14,0.002,0.225,0.002h1.078v0.258c0,0.082-0.015,0.148-0.043,0.195    c-0.035,0.045-0.088,0.074-0.154,0.092H127.7v0.574h0.463c0.177,0,0.31-0.008,0.385-0.018h-0.007    c0.071-0.016,0.126-0.041,0.173-0.066c0.048-0.029,0.085-0.072,0.113-0.123c0.03-0.045,0.048-0.109,0.065-0.182    c0.013-0.07,0.018-0.16,0.018-0.26v-0.471l4.988-0.006c0.172,0,0.314-0.01,0.422-0.039c0.116-0.025,0.196-0.086,0.248-0.188    c0.055-0.094,0.079-0.234,0.079-0.428v-1.617h-0.612V16.838L134.035,16.838z M128.294,17.127l-0.962,0.002    c-0.159,0-0.244-0.096-0.244-0.285v-0.537c0-0.074,0.014-0.139,0.04-0.184c0.022-0.049,0.056-0.076,0.094-0.09    c0.016-0.006,0.048-0.006,0.09-0.01c0.045-0.006,0.095-0.008,0.16-0.008h0.822V17.127L128.294,17.127z M134.037,15.113h0.616    v-0.484h-0.618L134.037,15.113L134.037,15.113z M140.093,14.617h-0.621v0.49h0.621V14.617L140.093,14.617z M140.974,14.617h-0.616    l0.003,0.49h0.613V14.617L140.974,14.617z M159.188,15.439c-0.048-0.01-0.105-0.014-0.165-0.023    c-0.062-0.002-0.126-0.006-0.209-0.006h-1.026c-0.089,0-0.167,0.004-0.229,0.006c-0.069,0.01-0.122,0.014-0.168,0.027    c-0.124,0.018-0.213,0.082-0.27,0.178c-0.055,0.094-0.084,0.248-0.084,0.441l0.004,0.748c0,0.143-0.063,0.242-0.184,0.275    c0,0-0.023-0.006-0.079-0.006c-0.055,0.004-0.118,0.004-0.179,0.006v0.016l-4.429,0.004l0.279-1.07v0.006    c0.02-0.078,0.03-0.133,0.04-0.186c0.008-0.057,0.014-0.107,0.014-0.146c0-0.08-0.023-0.145-0.068-0.186    c-0.045-0.045-0.117-0.07-0.21-0.09c-0.028-0.004-0.066-0.008-0.122-0.014c-0.061-0.004-0.132-0.004-0.208-0.006l-1.688,0.006    c-0.077,0-0.145,0-0.204,0.006c-0.061,0-0.1,0.004-0.127,0.008c-0.093,0.021-0.159,0.047-0.208,0.092    c-0.042,0.039-0.067,0.104-0.067,0.184c0,0.045,0.007,0.094,0.016,0.146c0.01,0.053,0.021,0.115,0.036,0.186l0,0    c0.023,0.072,0.045,0.158,0.068,0.244c0.022,0.094,0.047,0.186,0.072,0.283c0.026,0.096,0.048,0.197,0.074,0.287    c0.022,0.09,0.044,0.178,0.064,0.25l-8.563,0.008V15.43h-1.693c-0.088,0-0.167,0-0.229,0.004c-0.065,0.01-0.12,0.02-0.156,0.025    c-0.132,0.021-0.229,0.084-0.278,0.18c-0.058,0.096-0.083,0.244-0.083,0.436l0.002,0.975c0,0.102,0.006,0.189,0.02,0.262    c0.015,0.072,0.038,0.137,0.069,0.186c0.029,0.049,0.068,0.09,0.118,0.119c0.047,0.031,0.107,0.055,0.177,0.066l-0.007-0.002    c0.082,0.014,0.208,0.021,0.375,0.021l16.97-0.021c0.078,0,0.146,0,0.198,0c0.059,0,0.093,0,0.107-0.008    c0.037-0.008,0.072-0.018,0.11-0.025c0.033-0.014,0.066-0.033,0.097-0.061c0.035-0.02,0.064-0.057,0.091-0.102    c0.03-0.045,0.058-0.102,0.081-0.17c0.032,0.078,0.065,0.141,0.103,0.191c0.038,0.051,0.076,0.088,0.118,0.111    c0.038,0.029,0.08,0.043,0.127,0.053c0.048,0.01,0.095,0.01,0.144,0.01h0.992c0.086,0,0.164,0,0.223-0.002    c0.068-0.006,0.12-0.014,0.165-0.023H159.2c0.065-0.01,0.124-0.037,0.172-0.068c0.045-0.029,0.081-0.064,0.117-0.115    c0.023-0.049,0.047-0.113,0.059-0.184c0.013-0.07,0.02-0.158,0.02-0.26v-0.971c0-0.195-0.031-0.348-0.092-0.439    C159.42,15.523,159.324,15.461,159.188,15.439L159.188,15.439z M140.748,17.125h-0.814c-0.097,0-0.176-0.006-0.228-0.02    c-0.057-0.012-0.098-0.043-0.118-0.078c-0.02-0.023-0.036-0.049-0.038-0.082c-0.004-0.027-0.004-0.063-0.004-0.107v-0.541    c0-0.074,0.004-0.133,0.006-0.174c0.006-0.037,0.024-0.066,0.045-0.082c0.026-0.021,0.058-0.037,0.103-0.037    c0.046-0.002,0.103-0.002,0.176-0.002h0.873V17.125L140.748,17.125z M151.768,16.32l-0.117,0.459l0,0    c-0.035,0.133-0.103,0.227-0.199,0.283c-0.029,0.014-0.063,0.031-0.104,0.035c-0.039,0.004-0.085,0.008-0.142,0.008h-0.305    c-0.059,0-0.104-0.004-0.15-0.008c-0.039-0.004-0.071-0.02-0.101-0.035c-0.048-0.029-0.084-0.064-0.118-0.109    c-0.027-0.041-0.054-0.098-0.073-0.174v0.006c-0.018-0.078-0.04-0.158-0.059-0.232c-0.022-0.082-0.042-0.158-0.065-0.23    c-0.046-0.225,0.019-0.328,0.197-0.328h1.036C151.754,15.994,151.819,16.098,151.768,16.32L151.768,16.32z M158.946,16.818    c0,0.072-0.005,0.123-0.019,0.16l0.004-0.004c-0.02,0.047-0.059,0.082-0.121,0.102c-0.055,0.021-0.137,0.029-0.242,0.029h-0.729    c-0.123-0.043-0.183-0.139-0.19-0.293v-0.537c0-0.086,0.026-0.154,0.067-0.205s0.1-0.076,0.188-0.084h0.861    c0.061,0.023,0.105,0.057,0.137,0.105c0.029,0.047,0.044,0.111,0.044,0.184V16.818L158.946,16.818z M167.922,17.09l-0.252-1.006    c-0.048-0.209-0.114-0.371-0.196-0.467c-0.084-0.104-0.197-0.164-0.344-0.188c-0.05-0.01-0.099-0.02-0.163-0.023    c-0.065-0.002-0.142-0.006-0.224-0.006h-1.39v0.586h1.325c0.058,0,0.103,0,0.143,0.008c0.041,0.008,0.08,0.021,0.107,0.033    c0.047,0.029,0.087,0.07,0.118,0.115s0.055,0.098,0.073,0.164v-0.002c0.01,0.059,0.025,0.115,0.042,0.182    c0.014,0.068,0.036,0.141,0.053,0.211c0.018,0.07,0.038,0.146,0.056,0.215c0.015,0.07,0.032,0.125,0.045,0.182l-6.271,0.004    c-0.126-0.027-0.191-0.123-0.191-0.285l-0.007-2.139h-0.606l0.002,2.348c0,0.189,0.027,0.336,0.076,0.432    c0.05,0.092,0.137,0.158,0.256,0.191c0.106,0.02,0.245,0.035,0.415,0.035l7.201-0.01v-0.58H167.922L167.922,17.09z     M166.125,18.516h0.618v-0.492h-0.618V18.516L166.125,18.516z&amp;quot;/&amp;gt;\r\n                                        &amp;lt;/g&amp;gt;\r\n                                        &amp;lt;path fill=&amp;quot;#8697AC&amp;quot; d=&amp;quot;M47.016,22.387h-0.693c-1.093,0.004-2.034,0.67-2.435,1.617L49.458,24   C49.052,23.049,48.113,22.387,47.016,22.387L47.016,22.387z M55.507,17.539v0.639c0,0.627-0.509,1.135-1.133,1.137L38.962,19.33   c-0.624,0-1.133-0.51-1.133-1.133l-0.012-8.51c-0.001-0.625,0.509-1.137,1.136-1.137h0.871c0-0.018-0.005-0.033-0.002-0.049   c-0.003-0.496,0.037-0.984,0.103-1.465L38.95,7.041c-1.461,0-2.646,1.186-2.646,2.646l0.009,8.51   c0.002,1.465,1.19,2.645,2.651,2.645l15.41-0.016c1.461-0.002,2.647-1.186,2.645-2.648v-1.707   C56.548,16.871,56.042,17.227,55.507,17.539L55.507,17.539z&amp;quot;/&amp;gt;\r\n                                        &amp;lt;path fill=&amp;quot;#C2CAD7&amp;quot; d=&amp;quot;M49.181,9.254c-0.017-0.084-0.03-0.168-0.037-0.25c-0.527,0.164-1.043,0.396-1.535,0.697   c-0.607,0.375-1.141,0.824-1.588,1.338c0.372-0.357,0.787-0.684,1.244-0.963C47.877,9.701,48.523,9.428,49.181,9.254L49.181,9.254z    M55.02,9.828c-0.46-0.303-0.952-0.547-1.463-0.732c-0.016,0.115-0.041,0.229-0.071,0.334c0.469,0.168,0.92,0.383,1.348,0.643   C54.887,9.986,54.949,9.902,55.02,9.828L55.02,9.828z M57.1,11.984c-0.059-0.096-0.122-0.191-0.184-0.285   c-0.044,0.043-0.09,0.08-0.136,0.117c0.164,0.209,0.313,0.426,0.455,0.656c0.282,0.459,0.503,0.938,0.671,1.428   C57.738,13.242,57.471,12.596,57.1,11.984L57.1,11.984z M54.831,13.16c0.317-0.336,0.596-0.707,0.836-1.107   c-0.047-0.014-0.092-0.023-0.134-0.039C55.337,12.424,55.104,12.809,54.831,13.16L54.831,13.16z M50.333,3.016   c0-0.088,0.013-0.172,0.032-0.252c-0.923-0.002-1.808,0.205-2.611,0.58C48.558,3.063,49.433,2.941,50.333,3.016L50.333,3.016z    M52.965,3.344c-0.03,0.141-0.083,0.279-0.156,0.398c2.057,1.105,3.379,3.299,3.327,5.697c0.123,0.01,0.243,0.045,0.352,0.092   C56.751,6.891,55.288,4.426,52.965,3.344L52.965,3.344z M51.295,1.791C50.957,1.166,50.542,0.568,50.061,0   c0.423,0.594,0.772,1.217,1.043,1.863C51.165,1.834,51.229,1.811,51.295,1.791L51.295,1.791z M46.676,14.602   c1.669-1.023,3.044-2.27,4.022-3.672c-0.354-0.111-0.672-0.307-0.926-0.566c-0.953,1.217-2.217,2.309-3.726,3.23   C46.394,13.807,46.636,14.172,46.676,14.602L46.676,14.602z M52.313,6.807c0.036-0.313,0.053-0.623,0.053-0.936   c0-0.537-0.054-1.068-0.156-1.586c-0.15,0.066-0.317,0.107-0.488,0.115c0.013,0.191,0.022,0.387,0.022,0.58   c0,0.549-0.056,1.09-0.167,1.617C51.84,6.625,52.085,6.695,52.313,6.807L52.313,6.807z M44.016,14.727   c0-0.023,0.003-0.047,0.006-0.072c-1.611,0.725-3.412,1.275-5.342,1.615v1.057c2.099-0.281,4.062-0.826,5.804-1.586   C44.198,15.49,44.016,15.131,44.016,14.727L44.016,14.727z M42.374,5.191c-0.267,0.859-0.411,1.781-0.411,2.734   c0.003,2.318,0.865,4.434,2.287,6.053c0.084-0.129,0.192-0.238,0.315-0.328c-1.501-1.699-2.416-3.93-2.418-6.379   C42.147,6.557,42.228,5.861,42.374,5.191L42.374,5.191z M46.526,15.348c-0.069,0.131-0.159,0.248-0.265,0.348   c1.417,0.891,3.098,1.412,4.901,1.41c0.951,0,1.871-0.145,2.735-0.42c-0.671,0.15-1.369,0.23-2.085,0.234   C49.861,16.92,48.047,16.342,46.526,15.348L46.526,15.348z&amp;quot;/&amp;gt;\r\n                                        &amp;lt;path fill=&amp;quot;#c31924&amp;quot; d=&amp;quot;M56.414,10.047c-0.092-0.057-0.195-0.094-0.31-0.113c-0.041-0.008-0.086-0.012-0.13-0.012   c-0.208,0-0.398,0.074-0.544,0.201c-0.073,0.064-0.135,0.139-0.182,0.219c-0.069,0.125-0.11,0.266-0.11,0.416   c0,0.377,0.247,0.695,0.589,0.799c0.058,0.02,0.123,0.029,0.184,0.037c0.023,0,0.042,0,0.063,0c0.184,0,0.353-0.059,0.49-0.156   c0.056-0.043,0.107-0.09,0.15-0.143c0.123-0.145,0.195-0.332,0.195-0.539C56.81,10.457,56.653,10.195,56.414,10.047L56.414,10.047z    M45.348,13.889c-0.462,0-0.834,0.375-0.834,0.836c0,0.465,0.375,0.84,0.839,0.84c0.46,0,0.833-0.375,0.833-0.84   C46.185,14.264,45.81,13.889,45.348,13.889L45.348,13.889z M52.166,7.676c-0.226-0.16-0.505-0.258-0.804-0.264c0,0-0.006,0-0.01,0   c-0.766,0-1.387,0.623-1.39,1.387l-0.003,0.01c0,0.094,0.011,0.189,0.03,0.277c0.044,0.221,0.142,0.424,0.274,0.59   c0.221,0.277,0.546,0.465,0.907,0.516c0.063,0.006,0.123,0.01,0.185,0.01c0.635,0,1.168-0.422,1.339-1.006   c0.029-0.104,0.045-0.217,0.052-0.338c0-0.016,0.001-0.031,0.001-0.051C52.748,8.34,52.518,7.928,52.166,7.676L52.166,7.676z    M51.659,3.908c0.004,0,0.009,0,0.009,0c0.156-0.004,0.304-0.045,0.428-0.123c0.107-0.064,0.199-0.152,0.267-0.26   c0.072-0.111,0.118-0.236,0.13-0.379c0.003-0.025,0.005-0.049,0.005-0.078c0-0.459-0.377-0.832-0.839-0.832   c-0.043,0-0.086,0.006-0.13,0.01C51.44,2.26,51.36,2.287,51.282,2.328c-0.187,0.096-0.333,0.258-0.406,0.457   c-0.033,0.092-0.051,0.186-0.051,0.283v0.006C50.825,3.535,51.2,3.908,51.659,3.908L51.659,3.908z&amp;quot;/&amp;gt;\r\n                                    &amp;lt;/g&amp;gt;\r\n                                    &amp;lt;/svg&amp;gt;\r\n                            &amp;lt;/object&amp;gt;\r\n\r\n\r\n                        &amp;lt;/td&amp;gt;\r\n                        &amp;lt;td align=&amp;quot;right&amp;quot;&amp;gt;&amp;lt;h6 class=&amp;quot;collapse&amp;quot;&amp;gt;Invitation&amp;lt;/h6&amp;gt;&amp;lt;/td&amp;gt;\r\n                    &amp;lt;/tr&amp;gt;\r\n                &amp;lt;/table&amp;gt;\r\n            &amp;lt;/div&amp;gt;\r\n\r\n        &amp;lt;/td&amp;gt;\r\n        &amp;lt;td&amp;gt;&amp;lt;/td&amp;gt;\r\n    &amp;lt;/tr&amp;gt;\r\n&amp;lt;/table&amp;gt;&amp;lt;!-- /HEADER --&amp;gt;\r\n\r\n\r\n&amp;lt;!-- BODY --&amp;gt;\r\n&amp;lt;table class=&amp;quot;bodyBoxMail-wrap&amp;quot;&amp;gt;\r\n    &amp;lt;tr&amp;gt;\r\n        &amp;lt;td&amp;gt;&amp;lt;/td&amp;gt;\r\n        &amp;lt;td class=&amp;quot;containerBoxMail&amp;quot; bgcolor=&amp;quot;#FFFFFF&amp;quot;&amp;gt;\r\n\r\n            &amp;lt;div class=&amp;quot;contentBoxMail&amp;quot;&amp;gt;\r\n                &amp;lt;table&amp;gt;\r\n                    &amp;lt;tr&amp;gt;\r\n                        &amp;lt;td&amp;gt;\r\n                            &amp;lt;h3&amp;gt;Bonjour, Limam Oussama&amp;lt;/h3&amp;gt;\r\n                            &amp;lt;p class=&amp;quot;lead&amp;quot;&amp;gt;\r\n                                Invitation pour tutorat                            &amp;lt;/p&amp;gt;\r\n                            &amp;lt;p&amp;gt;\r\n        Vous ete inviter &agrave; effetuer la validation des modules sit&eacute; dans ce mail pour enseigner ....\r\n    &amp;lt;/p&amp;gt;\r\n                            &amp;lt;!-- Callout Panel --&amp;gt;\r\n                            &amp;lt;p class=&amp;quot;callout&amp;quot;&amp;gt;\r\n                                Suivre ce lien :  &amp;lt;a href=&amp;quot;/enseignant/mon-compte/index/38?__token=6333373965363837343064333366616139616164363639376366313330623264666361373936613136343937313431316462303364363364333763373564633151554e474e445532526a67784d4546435130524652732f7a74682f49495165784d376b5a2f3838456c57516777367054456c30354a7a2b5476524638536c6e4d37524e2b6f615430366472516b79694f304a41567533444a7176656f63775447695a4b64323342706a6e36785036526a307043454c49746f6c58306a5963512b6948415a5730664b6a786d5365544e782b75314f76564a2b4f7376357a76654239536247662f7a74536c773d&amp;quot;&amp;gt;Cliquer ICI! &amp;amp;raquo;&amp;lt;/a&amp;gt;\r\n                            &amp;lt;/p&amp;gt;&amp;lt;!-- /Callout Panel --&amp;gt;\r\n\r\n                            &amp;lt;!--Formation---&amp;gt;\r\n\r\n                        &amp;lt;table class=&amp;quot;tableContent&amp;quot;&amp;gt;\r\n                            &amp;lt;tr&amp;gt;\r\n                                &amp;lt;th&amp;gt;Formation&amp;lt;/th&amp;gt;\r\n                                &amp;lt;th&amp;gt;Niveau&amp;lt;/th&amp;gt;\r\n                            &amp;lt;/tr&amp;gt;\r\n\r\n                                &amp;lt;tr&amp;gt;\r\n                                    &amp;lt;td rowspan=&amp;quot;3&amp;quot;&amp;gt;\r\n                                        &amp;lt;!--Formation--&amp;gt;\r\n                                        &amp;lt;table class=&amp;quot;tableContent&amp;quot;&amp;gt;\r\n                                                                                            &amp;lt;tr&amp;gt;\r\n                                                    &amp;lt;th&amp;gt;Dipl&ocirc;me&amp;lt;/th&amp;gt;\r\n                                                    &amp;lt;td&amp;gt;Licence Appliqu&eacute;e&amp;lt;/td&amp;gt;\r\n                                                &amp;lt;/tr&amp;gt;\r\n                                                                                            &amp;lt;tr&amp;gt;\r\n                                                    &amp;lt;th&amp;gt;Domaine&amp;lt;/th&amp;gt;\r\n                                                    &amp;lt;td&amp;gt;Sciences de gestion&amp;lt;/td&amp;gt;\r\n                                                &amp;lt;/tr&amp;gt;\r\n                                                                                            &amp;lt;tr&amp;gt;\r\n                                                    &amp;lt;th&amp;gt;Mention&amp;lt;/th&amp;gt;\r\n                                                    &amp;lt;td&amp;gt;Management&amp;lt;/td&amp;gt;\r\n                                                &amp;lt;/tr&amp;gt;\r\n                                                                                            &amp;lt;tr&amp;gt;\r\n                                                    &amp;lt;th&amp;gt;Parcours&amp;lt;/th&amp;gt;\r\n                                                    &amp;lt;td&amp;gt;Licence Appliqu&eacute;e en Management&amp;lt;/td&amp;gt;\r\n                                                &amp;lt;/tr&amp;gt;\r\n                                                                                    &amp;lt;/table&amp;gt;\r\n                                        &amp;lt;!--Fin Formation--&amp;gt;\r\n                                    &amp;lt;/td&amp;gt;\r\n                                &amp;lt;/tr&amp;gt;\r\n                                                                    &amp;lt;tr&amp;gt;\r\n                                        &amp;lt;th&amp;gt;2&egrave;me Ann&eacute;e&amp;lt;/th&amp;gt;\r\n                                    &amp;lt;/tr&amp;gt;\r\n                                                                    &amp;lt;tr&amp;gt;\r\n                                        &amp;lt;th&amp;gt;3&egrave;me Ann&eacute;e&amp;lt;/th&amp;gt;\r\n                                    &amp;lt;/tr&amp;gt;\r\n                                \r\n                            &amp;lt;/tr&amp;gt;\r\n                        &amp;lt;/table&amp;gt;\r\n\r\n\r\n\r\n                            &amp;lt;!--End Formation--&amp;gt;\r\n\r\n\r\n                            &amp;lt;!-- social &amp;amp; contact --&amp;gt;\r\n                            &amp;lt;table class=&amp;quot;social&amp;quot; width=&amp;quot;100%&amp;quot;&amp;gt;\r\n                                &amp;lt;tr&amp;gt;\r\n                                    &amp;lt;td&amp;gt;\r\n\r\n                                        &amp;lt;!-- column 1 --&amp;gt;\r\n                                        &amp;lt;table align=&amp;quot;left&amp;quot; class=&amp;quot;columnBoxMail&amp;quot;&amp;gt;\r\n                                            &amp;lt;tr&amp;gt;\r\n                                                &amp;lt;td&amp;gt;\r\n\r\n                                                    &amp;lt;h5 class=&amp;quot;&amp;quot;&amp;gt;Contacter nous:&amp;lt;/h5&amp;gt;\r\n                                                    &amp;lt;p class=&amp;quot;&amp;quot;&amp;gt;&amp;lt;a href=&amp;quot;#&amp;quot; class=&amp;quot;soc-btnBoxMail fb&amp;quot;&amp;gt;Facebook&amp;lt;/a&amp;gt; &amp;lt;a href=&amp;quot;#&amp;quot; class=&amp;quot;soc-btnBoxMail tw&amp;quot;&amp;gt;Twitter&amp;lt;/a&amp;gt; &amp;lt;a href=&amp;quot;#&amp;quot; class=&amp;quot;soc-btnBoxMail gp&amp;quot;&amp;gt;Google+&amp;lt;/a&amp;gt;&amp;lt;/p&amp;gt;\r\n\r\n                                                &amp;lt;/td&amp;gt;\r\n                                            &amp;lt;/tr&amp;gt;\r\n                                        &amp;lt;/table&amp;gt;&amp;lt;!-- /column 1 --&amp;gt;\r\n\r\n                                        &amp;lt;!-- column 2 --&amp;gt;\r\n                                        &amp;lt;table align=&amp;quot;left&amp;quot; class=&amp;quot;columnBoxMail&amp;quot;&amp;gt;\r\n                                            &amp;lt;tr&amp;gt;\r\n                                                &amp;lt;td&amp;gt;\r\n\r\n                                                    &amp;lt;h5 class=&amp;quot;&amp;quot;&amp;gt;Contact Info:&amp;lt;/h5&amp;gt;\r\n                                                    &amp;lt;p&amp;gt;\r\n\r\n                                                            T&eacute;l&eacute;phone:\r\n                                                        &amp;lt;strong&amp;gt;+216 71 90 52 48 &amp;lt;/strong&amp;gt; &amp;lt;b&amp;gt;/&amp;lt;/b&amp;gt; &amp;lt;strong&amp;gt;+216 71 90 52&amp;lt;/strong&amp;gt; &amp;lt;b&amp;gt;/&amp;lt;/b&amp;gt; &amp;lt;strong&amp;gt;+216 71 90 52 54 &amp;lt;/strong&amp;gt;  &amp;lt;br&amp;gt;\r\n                                                            Fax:\r\n                                                             &amp;lt;strong&amp;gt;+216 71 90 36 03&amp;lt;/strong&amp;gt; &amp;lt;br&amp;gt;\r\n\r\n                                                    &amp;lt;/p&amp;gt;\r\n\r\n                                                &amp;lt;/td&amp;gt;\r\n                                                &amp;lt;td&amp;gt;\r\n\r\n                                                    Email: &amp;lt;strong&amp;gt;&amp;lt;a href=&amp;quot;emailto:contact@uvt.tn&amp;quot;&amp;gt;contact@uvt.tn&amp;lt;/a&amp;gt;&amp;lt;/strong&amp;gt;&amp;lt;br&amp;gt;\r\n                                                    Site Web :  &amp;lt;strong&amp;gt;&amp;lt;a href=&amp;quot;www.uvt.rnu.tn&amp;quot;&amp;gt;www.uvt.rnu.tn&amp;lt;/a&amp;gt;&amp;lt;/strong&amp;gt;\r\n\r\n                                                &amp;lt;/td&amp;gt;\r\n                                            &amp;lt;/tr&amp;gt;\r\n                                        &amp;lt;/table&amp;gt;&amp;lt;!-- /column 2 --&amp;gt;\r\n\r\n                                        &amp;lt;span class=&amp;quot;clearBoxMail&amp;quot;&amp;gt;&amp;lt;/span&amp;gt;\r\n\r\n                                    &amp;lt;/td&amp;gt;\r\n                                &amp;lt;/tr&amp;gt;\r\n                            &amp;lt;/table&amp;gt;&amp;lt;!-- /social &amp;amp; contact --&amp;gt;\r\n\r\n                        &amp;lt;/td&amp;gt;\r\n                    &amp;lt;/tr&amp;gt;\r\n\r\n                &amp;lt;/table&amp;gt;\r\n            &amp;lt;/div&amp;gt;&amp;lt;!-- /content --&amp;gt;\r\n\r\n        &amp;lt;/td&amp;gt;\r\n        &amp;lt;td&amp;gt;&amp;lt;/td&amp;gt;\r\n    &amp;lt;/tr&amp;gt;\r\n&amp;lt;/table&amp;gt;&amp;lt;!-- /BODY --&amp;gt;\r\n\r\n&amp;lt;!-- FOOTER --&amp;gt;\r\n&amp;lt;table class=&amp;quot;footerBoxMail-wrap&amp;quot;&amp;gt;\r\n    &amp;lt;tr&amp;gt;\r\n        &amp;lt;td&amp;gt;&amp;lt;/td&amp;gt;\r\n        &amp;lt;td class=&amp;quot;containerBoxMail&amp;quot;&amp;gt;\r\n\r\n            &amp;lt;!-- content --&amp;gt;\r\n            &amp;lt;div class=&amp;quot;contentBoxMail&amp;quot;&amp;gt;\r\n                &amp;lt;table&amp;gt;\r\n                    &amp;lt;tr&amp;gt;\r\n                        &amp;lt;td align=&amp;quot;center&amp;quot;&amp;gt;\r\n                            &amp;lt;p&amp;gt;\r\n                                &amp;lt;a href=&amp;quot;#&amp;quot;&amp;gt;Aide&amp;lt;/a&amp;gt; |\r\n                                &amp;lt;a href=&amp;quot;#&amp;quot;&amp;gt;Information&amp;lt;/a&amp;gt; |\r\n                                &amp;lt;a href=&amp;quot;#&amp;quot;&amp;gt;&amp;lt;unsubscribe&amp;gt;D&eacute;inscrire&amp;lt;/unsubscribe&amp;gt;&amp;lt;/a&amp;gt;\r\n                            &amp;lt;/p&amp;gt;\r\n                        &amp;lt;/td&amp;gt;\r\n                    &amp;lt;/tr&amp;gt;\r\n                &amp;lt;/table&amp;gt;\r\n            &amp;lt;/div&amp;gt;&amp;lt;!-- /content --&amp;gt;\r\n\r\n        &amp;lt;/td&amp;gt;\r\n        &amp;lt;td&amp;gt;&amp;lt;/td&amp;gt;\r\n    &amp;lt;/tr&amp;gt;\r\n&amp;lt;/table&amp;gt;&amp;lt;!-- /FOOTER --&amp;gt;\r\n\r\n&amp;lt;/body&amp;gt;\r\n&amp;lt;/html&amp;gt;', 'oussama.limam@outlook.com', 'Limam', 'Oussama', '[{"date":"2018-04-11 11:03:47","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-12 13:36:42","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-12 13:39:15","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Non"},{"date":"2018-04-12 13:40:04","envoyerpar":"Oussama Limam:Oussama.limam@gmail.com","reponse":"Oui"}]', 'Coordination', '{"Diplome":"18","Formation":"23","Niveaux":{"29":"2\\u00e8me Ann\\u00e9e","31":"3\\u00e8me Ann\\u00e9e"},"Code":"Dip_18_Parc_23"}', 'coordinateur');

-- --------------------------------------------------------

--
-- Structure de la table `langue`
--

CREATE TABLE `langue` (
  `idlangue` varchar(10) NOT NULL,
  `labellangue` varchar(45) DEFAULT NULL,
  `drapeau` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `langue`
--

INSERT INTO `langue` (`idlangue`, `labellangue`, `drapeau`) VALUES
('ar', 'ar', NULL),
('fr', 'fr', NULL);

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
-- Structure de la table `listeactiviterens`
--

CREATE TABLE `listeactiviterens` (
  `idlisteactiviterens` int(11) NOT NULL,
  `labelactiviter` varchar(512) DEFAULT NULL,
  `descactiviter` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Structure de la table `listvalidationtutorat`
--

CREATE TABLE `listvalidationtutorat` (
  `idlistvalidationtutorat` varchar(45) NOT NULL,
  `labelformation` varchar(512) DEFAULT NULL,
  `desclistevalidtutorat` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `listvalidationtutorat`
--

INSERT INTO `listvalidationtutorat` (`idlistvalidationtutorat`, `labelformation`, `desclistevalidtutorat`) VALUES
('InvitationAnnuler', 'Invitation Annuler', 'InvitationAnnuler'),
('InvitationEncours', 'Invitation Encours', 'InvitationEncours'),
('InvitationRefuser', 'Invitation refuser', 'InvitationRefuser'),
('InvitationValider', 'Invitation Valider', 'Invitation Valide');

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

CREATE TABLE `menus` (
  `idmenus` int(11) NOT NULL,
  `idperemenus` int(11) DEFAULT NULL,
  `label` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `labelarabe` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `labelan` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icone` text COLLATE utf8_unicode_ci,
  `help` text COLLATE utf8_unicode_ci,
  `afficher` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `miseajourcours`
--

CREATE TABLE `miseajourcours` (
  `idmiseajourcours` int(11) NOT NULL,
  `datemiseajours` date DEFAULT NULL,
  `conceptions_idconceptions` int(11) NOT NULL
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
  `idRegime` varchar(25) NOT NULL,
  `idNature` varchar(25) NOT NULL,
  `coefficient` decimal(5,2) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `Nombredesemaine` decimal(5,2) DEFAULT NULL,
  `codeue` varchar(45) DEFAULT NULL,
  `titremodule` text,
  `noteeleminatoire` varchar(45) DEFAULT NULL,
  `descriptionecue` text,
  `nbrscience` int(11) DEFAULT NULL,
  `nbroption` int(11) DEFAULT NULL,
  `resumer` text,
  `codemes` varchar(45) DEFAULT NULL,
  `codemoodle` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `module`
--

INSERT INTO `module` (`idModule`, `idue`, `idTypemodule`, `idniveauformation`, `idperiode`, `idRegime`, `idNature`, `coefficient`, `credit`, `Nombredesemaine`, `codeue`, `titremodule`, `noteeleminatoire`, `descriptionecue`, `nbrscience`, `nbroption`, `resumer`, `codemes`, `codemoodle`) VALUES
(1, NULL, 'UE', 47, 'S1P1', 'MX', 'Fond', '5.00', 6, NULL, 'UEF1.2', 'Unité fondamentale 2', '', '', 14, 0, '', '13259902', ''),
(2, 1, 'ECUE', 47, 'S1P1', 'MX', 'Fond', '3.00', 4, NULL, 'MEF1.2.1', 'comptabilité financiére 1', '', '', 14, 0, '', '13259902', ''),
(3, 1, 'ECUE', 47, 'S1P1', 'MX', 'Fond', '2.00', 2, NULL, 'MEF1.2.1', 'introduction au droit', '', '', 14, 0, '', '13259903', ''),
(4, NULL, 'UE', 47, 'S1', 'MX', 'Fond', '3.00', 5, NULL, NULL, 'Principes de gestion 1', '', '', 14, 0, '', '13259901', '13259901'),
(5, 4, 'ECUE', 47, 'S1', 'MX', 'Fond', '3.00', 5, NULL, 'MEF1.1', 'principes de gestion 1:environnement et fonctions de l''entreprise', '', '', 14, 0, '', '13259901', '13259901'),
(6, NULL, 'UE', 47, 'S1', 'MX', 'Fond', '5.00', 7, NULL, NULL, 'Unité fondamentale 3', '', '', 14, 0, '', '13259903', '13259903'),
(7, 6, 'ECUE', 47, 'S1', 'MX', 'Fond', '2.00', 3, NULL, NULL, 'mathématiques 1:analyse', '', '', 14, 0, '', '13259905', '13259905'),
(8, 6, 'ECUE', 47, 'S1', 'MX', 'Fond', '3.00', 4, NULL, NULL, 'microéconomie', '', '', 14, 0, '', '13259904', '13259904'),
(9, NULL, 'UE', 47, 'S1', 'CC', 'Trans', '2.00', 6, NULL, NULL, 'Unité transversale', '', '', 14, 0, '', '13259904', '13259904'),
(10, 9, 'ECUE', 47, 'S1', 'CC', 'Trans', '1.00', 3, NULL, '', 'aptitudes en TIC 1', '', '', 14, 0, '', '13259907', '13259907'),
(11, NULL, 'UE', 47, 'S1', 'CC', 'Opt', '5.00', 6, NULL, 'UEO1', 'UEOP01', '', '', 14, 1, '', '982015001', '982015001'),
(13, 9, 'ECUE', 47, 'S1', 'CC', 'Trans', '1.00', 3, NULL, '', 'langues : Anglais I', '', '', 14, 0, '', '13259906', '13259906'),
(14, 11, 'ECUE', 47, 'S1', 'CC', 'Opt', '3.00', 3, NULL, 'MEO1.1', 'Initiation Documentation QSE', '', '', 14, 0, '', '982015001', '982015001'),
(15, 11, 'ECUE', 47, 'S1', 'CC', 'Opt', '2.00', 3, NULL, 'MEO1.2', 'Projet Professionnel et Personnel', '', '', 14, 0, '', '982015002', '982015002'),
(16, NULL, 'UE', 47, 'S2', 'MX', 'Fond', '5.00', 6, NULL, 'UEF2.3', 'Unité fondamentale 3', '', '', 14, 0, '', '13259907', '13259907'),
(17, 16, 'ECUE', 47, 'S2', 'MX', 'Fond', '3.00', 3, NULL, 'MEF2.3.1', 'statistiques descriptives et probabilité', '', '', 14, 1, '', '13259911', '13259911'),
(18, 16, 'ECUE', 47, 'S2', 'MX', 'Fond', '2.00', 3, NULL, 'MEF2.3.2', 'Mathématiques II : Algébre', '', '', 14, 0, '', '13259912', '13259912');

-- --------------------------------------------------------

--
-- Structure de la table `moduleenseignier`
--

CREATE TABLE `moduleenseignier` (
  `idmoduleenseignier` bigint(20) NOT NULL,
  `iddiplomeensegnier` int(11) NOT NULL,
  `modulenom` text,
  `descmoduleens` text,
  `competencemodule` text,
  `domainemoduleens` text
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
-- Structure de la table `modulevalidationmodule`
--

CREATE TABLE `modulevalidationmodule` (
  `idModule` int(11) NOT NULL,
  `idtypevalidation` varchar(25) NOT NULL,
  `volumehoraireeval` varchar(45) DEFAULT NULL,
  `descmoduleeval` varchar(45) DEFAULT NULL
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

--
-- Contenu de la table `nature`
--

INSERT INTO `nature` (`idNature`, `labelnature`, `descnature`) VALUES
('Fond', 'Fondamentale', 'Fondamentale'),
('Opt', 'Optionnel', 'Optionnel'),
('Trans', 'Transversale', 'Transversale');

-- --------------------------------------------------------

--
-- Structure de la table `naturecoordinateur`
--

CREATE TABLE `naturecoordinateur` (
  `idnaturecoordinateur` varchar(55) NOT NULL,
  `labeltypecoord` varchar(512) DEFAULT NULL,
  `desctypecoord` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `naturecoordinateur`
--

INSERT INTO `naturecoordinateur` (`idnaturecoordinateur`, `labeltypecoord`, `desctypecoord`) VALUES
('co-coordinateur', 'Co-Coordinateur', NULL),
('coordinateur', 'Coordinateur', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `niveauformation`
--

CREATE TABLE `niveauformation` (
  `idniveauformation` int(11) NOT NULL,
  `idformations` int(11) NOT NULL,
  `labelnivformation` varchar(512) DEFAULT NULL,
  `pagesite` text,
  `idlevelformation` int(11) NOT NULL,
  `autreinfonivform` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `niveauformation`
--

INSERT INTO `niveauformation` (`idniveauformation`, `idformations`, `labelnivformation`, `pagesite`, `idlevelformation`, `autreinfonivform`) VALUES
(18, 27, '3ème année', '3ème année', 3, NULL),
(19, 28, '3ème année', '3ème année', 3, NULL),
(20, 35, '1ère Année', '1ère Année', 1, NULL),
(21, 35, '2ème Année', '2ème Année', 2, NULL),
(22, 37, '1ère Année', '1500DT', 1, NULL),
(23, 37, '2ème Année', '1500DT', 2, NULL),
(24, 39, '1ère Année', '1500DT', 1, NULL),
(25, 39, '2ème Année', '2ème Année', 2, NULL),
(27, 22, '2ème Année', 'www.uvt.rnu.tn', 2, NULL),
(28, 22, '3ème Année', 'www.uvt.rnu.tn', 3, NULL),
(29, 23, '2ème Année', 'www.uvt.rnu.tn', 2, NULL),
(31, 23, '3ème Année', 'www.uvt.rnu.tn', 3, NULL),
(32, 24, '3ème Année', 'www.uvt.rnu.tn', 3, NULL),
(33, 41, '1ère Année', 'www.uvt.rnu.tn', 1, NULL),
(34, 41, '2éme Année', 'www.uvt.rnu.tn', 1, NULL),
(36, 42, '2ème Année', 'www.uvt.rnu.tn', 2, NULL),
(37, 44, '3ème Année', 'LAMSEN', 3, NULL),
(41, 50, '3ème Année', '3ème Année', 3, NULL),
(42, 53, '1ère Année', '1ère Année', 1, NULL),
(43, 53, '2ème Année', '2ème Année', 2, NULL),
(44, 54, '3ème Année', '3ème Année', 3, NULL),
(47, 59, '1ère Année', '1ère Année', 1, NULL),
(49, 62, '2ème Année', '2ème Année', 2, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

CREATE TABLE `notification` (
  `idnotification` bigint(20) NOT NULL,
  `datetimenotif` datetime NOT NULL,
  `titrenotif` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `descnotif` text COLLATE utf8_unicode_ci NOT NULL,
  `usertoaffnotif` longtext COLLATE utf8_unicode_ci NOT NULL,
  `autreinfo` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `nvittutoratue`
--

CREATE TABLE `nvittutoratue` (
  `idinvitations` int(11) NOT NULL,
  `idModule` int(11) NOT NULL,
  `statusinvtvalid` varchar(45) NOT NULL,
  `datereponse` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `nvittutoratue`
--

INSERT INTO `nvittutoratue` (`idinvitations`, `idModule`, `statusinvtvalid`, `datereponse`) VALUES
(35, 2, 'InvitationValider', '[{"date":"2018-04-24 14:20:35","idpersonnes":"08340453","Reponse":"Invitation Accepter","statusinvtvalid":"InvitationValider"},{"date":"2018-04-24 14:21:13","idpersonnes":"08340453","Reponse":"Invitation Annuler","statusinvtvalid":"InvitationValider","remarque":"\\n                    "},{"date":"2018-04-24 15:48:27","idpersonnes":"08340453","Reponse":"Invitation Annuler","statusinvtvalid":"InvitationValider","remarque":"\\n                    "},{"date":"2018-04-24 15:55:21","idpersonnes":"08340453","Reponse":"Invitation Annuler","statusinvtvalid":"InvitationAnnuler","remarque":"\\n                    "},{"date":"2018-04-24 15:57:43","idpersonnes":"08340453","Reponse":"Invitation Accepter","statusinvtvalid":"InvitationValider"},{"date":"2018-04-25 16:24:14","idpersonnes":"08340453","Reponse":"Invitation Accepter","statusinvtvalid":"InvitationValider"},{"date":"2018-05-09 15:20:36","idpersonnes":"08340453","Reponse":"Invitation Annuler","statusinvtvalid":"InvitationAnnuler","remarque":"\\n                    "},{"date":"2018-05-09 15:21:51","idpersonnes":"08340453","Reponse":"Invitation Accepter","statusinvtvalid":"InvitationValider"}]'),
(35, 7, 'InvitationValider', '[{"date":"2018-04-24 13:56:35","idpersonnes":"08340453","Reponse":"Invitation Accepter","statusinvtvalid":"InvitationValider"},{"date":"2018-04-24 15:49:41","idpersonnes":"08340453","Reponse":"Invitation Annuler","statusinvtvalid":"InvitationValider","remarque":"\\n                    "},{"date":"2018-04-24 15:55:28","idpersonnes":"08340453","Reponse":"Invitation Annuler","statusinvtvalid":"InvitationAnnuler","remarque":"\\n                    "},{"date":"2018-04-26 12:46:35","idpersonnes":"08340453","Reponse":"Invitation Accepter","statusinvtvalid":"InvitationValider"}]'),
(36, 10, 'InvitationValider', '[{"date":"2018-04-24 15:45:28","idpersonnes":"08340453","Reponse":"Invitation Accepter","statusinvtvalid":"InvitationValider"},{"date":"2018-04-24 16:00:05","idpersonnes":"08340453","Reponse":"Invitation Annuler","statusinvtvalid":"InvitationAnnuler","remarque":"\\n                    "},{"date":"2018-04-26 12:47:29","idpersonnes":"08340453","Reponse":"Invitation Accepter","statusinvtvalid":"InvitationValider"}]');

-- --------------------------------------------------------

--
-- Structure de la table `objective`
--

CREATE TABLE `objective` (
  `idobjective` int(11) NOT NULL,
  `idpereobjective` int(11) DEFAULT NULL,
  `codeobj` varchar(45) DEFAULT NULL,
  `titreobjective` text,
  `descobjective` text,
  `obligatoireobj` tinyint(4) DEFAULT NULL,
  `poidsobjective` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `periode`
--

CREATE TABLE `periode` (
  `idperiode` varchar(25) NOT NULL,
  `idsousperiode` varchar(25) DEFAULT NULL,
  `idlevelformation` int(11) NOT NULL,
  `labelperiode` varchar(512) DEFAULT NULL,
  `descperiode` text,
  `nbrsemaine` int(11) NOT NULL,
  `stddebutperiode` varchar(5) NOT NULL,
  `stdfinperiode` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `periode`
--

INSERT INTO `periode` (`idperiode`, `idsousperiode`, `idlevelformation`, `labelperiode`, `descperiode`, `nbrsemaine`, `stddebutperiode`, `stdfinperiode`) VALUES
('S1', NULL, 1, 'Semestre 1', NULL, 14, '15-09', '04-01'),
('S1P1', 'S1', 1, 'Période 1', NULL, 7, '15-09', '04-11'),
('S1P2', 'S1', 1, 'Période 2', NULL, 7, '04-11', '04-01'),
('S2', NULL, 1, 'Semestre 2', NULL, 14, '15-01', '04-06'),
('S2P1', 'S2', 1, 'Période 1', NULL, 7, '15-01', '04-03'),
('S2P2', 'S2', 1, 'Période 2', NULL, 7, '04-03', '04-06'),
('S3', NULL, 2, 'Semestre 3', NULL, 14, '15-09', '04-01'),
('S3P1', 'S3', 2, 'Période 1', NULL, 7, '15-09', '04-11'),
('S3P2', 'S3', 2, 'Période 2', NULL, 7, '04-11', '04-01'),
('S4', NULL, 2, 'Semestre 4', NULL, 14, '15-01', '04-06'),
('S4P1', 'S4', 2, 'Période 1', NULL, 7, '15-01', '15-03'),
('S4P2', 'S4', 2, 'Période 2', NULL, 7, '15-03', '04-06'),
('S5', NULL, 3, 'Semestre 5', NULL, 14, '15-09', '04-01'),
('S5P1', 'S5', 3, 'Période 1', NULL, 0, '15-09', '04-11'),
('S5P2', 'S5', 3, 'Période 2', NULL, 7, '04-11', '04-01'),
('S6', NULL, 3, 'Semestre 6', NULL, 14, '15-01', '04-06');

-- --------------------------------------------------------

--
-- Structure de la table `periodeformation`
--

CREATE TABLE `periodeformation` (
  `idperiodeformation` int(11) NOT NULL,
  `idanneeuniv` varchar(25) NOT NULL,
  `idformations` int(11) DEFAULT NULL,
  `idniveauformation` int(11) NOT NULL,
  `idperiode` varchar(25) NOT NULL,
  `debutsemaine` int(11) DEFAULT NULL,
  `finsemaine` int(11) DEFAULT NULL,
  `descperiodeforma` text,
  `debutperiode` date NOT NULL,
  `finperiode` date NOT NULL,
  `utiliser` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `periodeformation`
--

INSERT INTO `periodeformation` (`idperiodeformation`, `idanneeuniv`, `idformations`, `idniveauformation`, `idperiode`, `debutsemaine`, `finsemaine`, `descperiodeforma`, `debutperiode`, `finperiode`, `utiliser`) VALUES
(1, '2017-2018', 27, 18, 'S5', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(2, '2017-2018', 27, 18, 'S5P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(3, '2017-2018', 27, 18, 'S5P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(4, '2017-2018', 27, 18, 'S6', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(5, '2017-2018', 28, 19, 'S5', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(6, '2017-2018', 28, 19, 'S5P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(7, '2017-2018', 28, 19, 'S5P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(8, '2017-2018', 28, 19, 'S6', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(9, '2017-2018', 35, 20, 'S1', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(10, '2017-2018', 35, 20, 'S1P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(11, '2017-2018', 35, 20, 'S1P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(12, '2017-2018', 35, 20, 'S2', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(13, '2017-2018', 35, 20, 'S2P1', NULL, NULL, NULL, '2018-01-15', '2018-03-04', 0),
(14, '2017-2018', 35, 20, 'S2P2', NULL, NULL, NULL, '2018-03-04', '2018-06-04', 0),
(15, '2017-2018', 35, 21, 'S3', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(16, '2017-2018', 35, 21, 'S3P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(17, '2017-2018', 35, 21, 'S3P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(18, '2017-2018', 35, 21, 'S4', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(19, '2017-2018', 35, 21, 'S4P1', NULL, NULL, NULL, '2018-01-15', '2018-03-15', 0),
(20, '2017-2018', 35, 21, 'S4P2', NULL, NULL, NULL, '2018-03-15', '2018-06-04', 0),
(21, '2017-2018', 37, 22, 'S1', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(22, '2017-2018', 37, 22, 'S1P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(23, '2017-2018', 37, 22, 'S1P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(24, '2017-2018', 37, 22, 'S2', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(25, '2017-2018', 37, 22, 'S2P1', NULL, NULL, NULL, '2018-01-15', '2018-03-04', 0),
(26, '2017-2018', 37, 22, 'S2P2', NULL, NULL, NULL, '2018-03-04', '2018-06-04', 0),
(27, '2017-2018', 37, 23, 'S3', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(28, '2017-2018', 37, 23, 'S3P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(29, '2017-2018', 37, 23, 'S3P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(30, '2017-2018', 37, 23, 'S4', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(31, '2017-2018', 37, 23, 'S4P1', NULL, NULL, NULL, '2018-01-15', '2018-03-15', 0),
(32, '2017-2018', 37, 23, 'S4P2', NULL, NULL, NULL, '2018-03-15', '2018-06-04', 0),
(33, '2017-2018', 39, 24, 'S1', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(34, '2017-2018', 39, 24, 'S1P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(35, '2017-2018', 39, 24, 'S1P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(36, '2017-2018', 39, 24, 'S2', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(37, '2017-2018', 39, 24, 'S2P1', NULL, NULL, NULL, '2018-01-15', '2018-03-04', 0),
(38, '2017-2018', 39, 24, 'S2P2', NULL, NULL, NULL, '2018-03-04', '2018-06-04', 0),
(39, '2017-2018', 39, 25, 'S3', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(40, '2017-2018', 39, 25, 'S3P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(41, '2017-2018', 39, 25, 'S3P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(42, '2017-2018', 39, 25, 'S4', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(43, '2017-2018', 39, 25, 'S4P1', NULL, NULL, NULL, '2018-01-15', '2018-03-15', 0),
(44, '2017-2018', 39, 25, 'S4P2', NULL, NULL, NULL, '2018-03-15', '2018-06-04', 0),
(45, '2017-2018', 22, 27, 'S3', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(46, '2017-2018', 22, 27, 'S3P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(47, '2017-2018', 22, 27, 'S3P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(48, '2017-2018', 22, 27, 'S4', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(49, '2017-2018', 22, 27, 'S4P1', NULL, NULL, NULL, '2018-01-15', '2018-03-15', 0),
(50, '2017-2018', 22, 27, 'S4P2', NULL, NULL, NULL, '2018-03-15', '2018-06-04', 0),
(51, '2017-2018', 22, 28, 'S5', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(52, '2017-2018', 22, 28, 'S5P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(53, '2017-2018', 22, 28, 'S5P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(54, '2017-2018', 22, 28, 'S6', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(55, '2017-2018', 23, 29, 'S3', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(56, '2017-2018', 23, 29, 'S3P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(57, '2017-2018', 23, 29, 'S3P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(58, '2017-2018', 23, 29, 'S4', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(59, '2017-2018', 23, 29, 'S4P1', NULL, NULL, NULL, '2018-01-15', '2018-03-15', 0),
(60, '2017-2018', 23, 29, 'S4P2', NULL, NULL, NULL, '2018-03-15', '2018-06-04', 0),
(61, '2017-2018', 23, 31, 'S5', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(62, '2017-2018', 23, 31, 'S5P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(63, '2017-2018', 23, 31, 'S5P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(64, '2017-2018', 23, 31, 'S6', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(65, '2017-2018', 24, 32, 'S5', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(66, '2017-2018', 24, 32, 'S5P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(67, '2017-2018', 24, 32, 'S5P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(68, '2017-2018', 24, 32, 'S6', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(69, '2017-2018', 41, 33, 'S1', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(70, '2017-2018', 41, 33, 'S1P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(71, '2017-2018', 41, 33, 'S1P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(72, '2017-2018', 41, 33, 'S2', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(73, '2017-2018', 41, 33, 'S2P1', NULL, NULL, NULL, '2018-01-15', '2018-03-04', 0),
(74, '2017-2018', 41, 33, 'S2P2', NULL, NULL, NULL, '2018-03-04', '2018-06-04', 0),
(75, '2017-2018', 41, 34, 'S1', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(76, '2017-2018', 41, 34, 'S1P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(77, '2017-2018', 41, 34, 'S1P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(78, '2017-2018', 41, 34, 'S2', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(79, '2017-2018', 41, 34, 'S2P1', NULL, NULL, NULL, '2018-01-15', '2018-03-04', 0),
(80, '2017-2018', 41, 34, 'S2P2', NULL, NULL, NULL, '2018-03-04', '2018-06-04', 0),
(81, '2017-2018', 42, 36, 'S3', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(82, '2017-2018', 42, 36, 'S3P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(83, '2017-2018', 42, 36, 'S3P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(84, '2017-2018', 42, 36, 'S4', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(85, '2017-2018', 42, 36, 'S4P1', NULL, NULL, NULL, '2018-01-15', '2018-03-15', 0),
(86, '2017-2018', 42, 36, 'S4P2', NULL, NULL, NULL, '2018-03-15', '2018-06-04', 0),
(87, '2017-2018', 44, 37, 'S5', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(88, '2017-2018', 44, 37, 'S5P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(89, '2017-2018', 44, 37, 'S5P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(90, '2017-2018', 44, 37, 'S6', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(91, '2017-2018', 50, 41, 'S5', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(92, '2017-2018', 50, 41, 'S5P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(93, '2017-2018', 50, 41, 'S5P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(94, '2017-2018', 50, 41, 'S6', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(95, '2017-2018', 53, 42, 'S1', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(96, '2017-2018', 53, 42, 'S1P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(97, '2017-2018', 53, 42, 'S1P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(98, '2017-2018', 53, 42, 'S2', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(99, '2017-2018', 53, 42, 'S2P1', NULL, NULL, NULL, '2018-01-15', '2018-03-04', 0),
(100, '2017-2018', 53, 42, 'S2P2', NULL, NULL, NULL, '2018-03-04', '2018-06-04', 0),
(101, '2017-2018', 53, 43, 'S3', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(102, '2017-2018', 53, 43, 'S3P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(103, '2017-2018', 53, 43, 'S3P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(104, '2017-2018', 53, 43, 'S4', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(105, '2017-2018', 53, 43, 'S4P1', NULL, NULL, NULL, '2018-01-15', '2018-03-15', 0),
(106, '2017-2018', 53, 43, 'S4P2', NULL, NULL, NULL, '2018-03-15', '2018-06-04', 0),
(107, '2017-2018', 54, 44, 'S5', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(108, '2017-2018', 54, 44, 'S5P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(109, '2017-2018', 54, 44, 'S5P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(110, '2017-2018', 54, 44, 'S6', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(111, '2017-2018', 59, 47, 'S1', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(112, '2017-2018', 59, 47, 'S1P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(113, '2017-2018', 59, 47, 'S1P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(114, '2017-2018', 59, 47, 'S2', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(115, '2017-2018', 59, 47, 'S2P1', NULL, NULL, NULL, '2018-01-15', '2018-03-04', 0),
(116, '2017-2018', 59, 47, 'S2P2', NULL, NULL, NULL, '2018-03-04', '2018-06-04', 0),
(117, '2017-2018', 62, 49, 'S3', NULL, NULL, NULL, '2017-09-15', '2018-01-04', 0),
(118, '2017-2018', 62, 49, 'S3P1', NULL, NULL, NULL, '2017-09-15', '2017-11-04', 0),
(119, '2017-2018', 62, 49, 'S3P2', NULL, NULL, NULL, '2017-11-04', '2018-01-04', 0),
(120, '2017-2018', 62, 49, 'S4', NULL, NULL, NULL, '2018-01-15', '2018-06-04', 0),
(121, '2017-2018', 62, 49, 'S4P1', NULL, NULL, NULL, '2018-01-15', '2018-03-15', 0),
(122, '2017-2018', 62, 49, 'S4P2', NULL, NULL, NULL, '2018-03-15', '2018-06-04', 0);

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
  `cin` varchar(45) DEFAULT NULL,
  `datelivrecin` date DEFAULT NULL,
  `civilite` varchar(45) DEFAULT NULL,
  `telephone` text,
  `email` text,
  `motdepass` text,
  `datedenaissance` date DEFAULT NULL,
  `matricule` varchar(45) DEFAULT NULL,
  `typematricule` varchar(45) DEFAULT NULL,
  `datemotdepasse` date DEFAULT NULL,
  `codepostal` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `personnes`
--

INSERT INTO `personnes` (`idpersonnes`, `cin`, `datelivrecin`, `civilite`, `telephone`, `email`, `motdepass`, `datedenaissance`, `matricule`, `typematricule`, `datemotdepasse`, `codepostal`) VALUES
('08340453', '08340453', '2018-02-15', 'Homme', '{"Fix":"71931625","Portable":"21599253"}', 'oussama.limam@gmail.com', 'be898716492646c8a78876682a4c90ea', '1982-09-05', '3655982', 'CNSS', '2018-04-12', '8090'),
('08340460', '08340460', NULL, NULL, NULL, 'oussama.limam@outlook.com', 'be898716492646c8a78876682a4c90ea', NULL, NULL, NULL, '2018-04-12', '');

-- --------------------------------------------------------

--
-- Structure de la table `piecejointes`
--

CREATE TABLE `piecejointes` (
  `idpiecejointes` int(11) NOT NULL,
  `idModule` int(11) NOT NULL,
  `idtypepiecejointe` varchar(45) NOT NULL,
  `titrepiece` text,
  `descpiece` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `plandemodule`
--

CREATE TABLE `plandemodule` (
  `idplandemodule` int(11) NOT NULL,
  `idpereplandemodule` int(11) DEFAULT NULL,
  `idModule` int(11) NOT NULL,
  `titrechapitre` varchar(512) DEFAULT NULL,
  `indexchapitre` varchar(45) DEFAULT NULL,
  `descplan` text,
  `contenuchapitre` text,
  `pathdoc` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `prerequits`
--

CREATE TABLE `prerequits` (
  `idprerequits` int(11) NOT NULL,
  `labelprerequit` varchar(512) DEFAULT NULL,
  `niveauobligation` tinyint(4) DEFAULT NULL,
  `descprerequit` text,
  `module_idModule` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `prerequits`
--

INSERT INTO `prerequits` (`idprerequits`, `labelprerequit`, `niveauobligation`, `descprerequit`, `module_idModule`) VALUES
(1, 'dsqd', 1, 'sqdqs', 5),
(2, 'gfh', 2, 'hfghf', 5),
(3, 'ffs', 2, 'fsdf', 5),
(4, 'ret', 3, 'tret', 5);

-- --------------------------------------------------------

--
-- Structure de la table `projethabilitation`
--

CREATE TABLE `projethabilitation` (
  `idprojethabilitation` int(11) NOT NULL,
  `datecreation` date DEFAULT NULL,
  `dateapplication` date DEFAULT NULL,
  `idanneeuniv` varchar(25) NOT NULL,
  `titreprojet` varchar(512) DEFAULT NULL,
  `descprojet` text,
  `versionprojet` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `referentiel`
--

CREATE TABLE `referentiel` (
  `idobjective` int(11) NOT NULL,
  `idformations` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `referentielmodule`
--

CREATE TABLE `referentielmodule` (
  `idobjective` int(11) NOT NULL,
  `idModule` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `referetielplandemodule`
--

CREATE TABLE `referetielplandemodule` (
  `idcompetence` int(11) NOT NULL,
  `idplandemodule` int(11) NOT NULL
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

--
-- Contenu de la table `regime`
--

INSERT INTO `regime` (`idRegime`, `labelregime`, `descregime`) VALUES
('CC', 'Contrôle contenu', 'Contrôle contenu'),
('MX', 'Mixte', 'Contrôle contenu + examen');

-- --------------------------------------------------------

--
-- Structure de la table `resource`
--

CREATE TABLE `resource` (
  `idresource` int(11) NOT NULL,
  `idactiviter` int(11) NOT NULL,
  `titreresource` text,
  `desresource` text,
  `obligatoirresource` tinyint(4) DEFAULT NULL,
  `poidresource` int(11) DEFAULT NULL
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
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `idroles` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `nomrole` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `descrole` text COLLATE utf8_unicode_ci NOT NULL,
  `poidsrole` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `roles`
--

INSERT INTO `roles` (`idroles`, `nomrole`, `descrole`, `poidsrole`) VALUES
('AdminPedagogie', 'Administrateur pédagogique', '', 50),
('coordinateur', 'Coordinateur', '', 25),
('inviter', 'Inviter', 'Inviter', 10),
('operateur', 'Operateur', 'Operateur', 30),
('root', 'root', '', 100),
('tuteur', 'Tuteur', '', 15);

-- --------------------------------------------------------

--
-- Structure de la table `rolespersonnes`
--

CREATE TABLE `rolespersonnes` (
  `idpersonnes` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `idroles` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `idanneeuniv` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `idperiode` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `rolespersonnes`
--

INSERT INTO `rolespersonnes` (`idpersonnes`, `idroles`, `idanneeuniv`, `idperiode`) VALUES
('08340453', 'tuteur', '2017-2018', 'S1'),
('08340453', 'tuteur', '2017-2018', 'S1P1');

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
-- Structure de la table `scenariomoodle`
--

CREATE TABLE `scenariomoodle` (
  `idscenariomoodle` int(11) NOT NULL,
  `idtyperesourcemoodle` varchar(25) NOT NULL,
  `idplandemodule` int(11) NOT NULL,
  `idactiviter` int(11) NOT NULL,
  `descsenarionmoodle` text,
  `piecejointe` text COMMENT 'scénarion d''activité sous moodle :\nchat \nforum\ndepôt d''un trav',
  `labelscenario` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `idservices` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `idtypeservices` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `idmenus` int(11) DEFAULT NULL,
  `idsousservices` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `url` text COLLATE utf8_unicode_ci,
  `afficher` tinyint(4) DEFAULT NULL,
  `labelaffiche` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `services`
--

INSERT INTO `services` (`idservices`, `idtypeservices`, `idmenus`, `idsousservices`, `label`, `description`, `url`, `afficher`, `labelaffiche`) VALUES
('ens', 'Module', NULL, NULL, 'Enseignant', NULL, 'enseignant', NULL, 'Enseignant'),
('ens-cr', 'Controller', NULL, 'ens', 'Enseignant\\Create', 'enseignant', 'enseignant\\create', NULL, 'create'),
('ens-cr-01', 'Action', NULL, 'ens-cr', 'index', 'enseignant', 'enseignant\\create\\index', NULL, 'create'),
('ens-cr-02', 'Action', NULL, 'ens-cr', 'createjob', 'enseignant', 'enseignant\\create\\createjob', NULL, 'create'),
('ens-cr-03', 'Action', NULL, 'ens-cr', 'donneepersonnelle', 'enseignant', 'enseignant\\create\\donneepersonnelle', NULL, 'create'),
('ens-cr-04', 'Action', NULL, 'ens-cr', 'donnee-perso-arab', 'enseignant', 'enseignant\\create\\donnee-perso-arab', NULL, 'create'),
('ens-cr-05', 'Action', NULL, 'ens-cr', 'etablissementenseigne', 'enseignant', 'enseignant\\create\\etablissementenseigne', NULL, 'create'),
('ens-cr-06', 'Action', NULL, 'ens-cr', 'traveau-enseignant', 'enseignant', 'enseignant\\create\\traveau-enseignant', NULL, 'create'),
('ens-cr-07', 'Action', NULL, 'ens-cr', 'menu-cv-enseignant', 'enseignant', 'enseignant\\create\\menu-cv-enseignant', NULL, 'create'),
('ens-cr-08', 'Action', NULL, 'ens-cr', 'liste-mes-grades-ens', 'enseignant', 'enseignant\\create\\liste-mes-grades-ens', NULL, 'create'),
('ens-cr-09', 'Action', NULL, 'ens-cr', 'mon-grade-ens', 'enseignant', 'enseignant\\create\\mon-grade-ens', NULL, 'create'),
('ens-cr-10', 'Action', NULL, 'ens-cr', 'grades-enseignants', 'enseignant', 'enseignant\\create\\grades-enseignants', NULL, 'create'),
('ens-cr-11', 'Action', NULL, 'ens-cr', 'specialite-enseignant', 'enseignant', 'enseignant\\create\\specialite-enseignant', NULL, 'create'),
('ens-cr-12', 'Action', NULL, 'ens-cr', 'compte-utilisateur', 'enseignant', 'enseignant\\create\\compte-utilisateur', NULL, 'create'),
('ens-cr-13', 'Action', NULL, 'ens-cr', 'diplome-enseignant', 'enseignant', 'enseignant\\create\\diplome-enseignant', NULL, 'create'),
('ens-cr-14', 'Action', NULL, 'ens-cr', 'info-pro-dossier', 'enseignant', 'enseignant\\create\\info-pro-dossier', NULL, 'create'),
('ens-cr-15', 'Action', NULL, 'ens-cr', 'info-pro-dossier-ar', 'enseignant', 'enseignant\\create\\info-pro-dossier-ar', NULL, 'create'),
('ens-cr-16', 'Action', NULL, 'ens-cr', 'depot-dossier-papier', 'enseignant', 'enseignant\\create\\depot-dossier-papier', NULL, 'create'),
('ens-cr-17', 'Action', NULL, 'ens-cr', 'inviter-coordinateur', 'enseignant', 'enseignant\\create\\inviter-coordinateur', NULL, 'create'),
('ens-cr-18', 'Action', NULL, 'ens-cr', 'inviter-coordinateur-mail-send', 'enseignant', 'enseignant\\create\\inviter-coordinateur-mail-send', NULL, 'create'),
('ens-cr-19', 'Action', NULL, 'ens-cr', 'create-compte ', 'enseignant', 'enseignant\\create\\create-compte ', NULL, 'create'),
('ens-inv', 'Controller', NULL, 'ens', 'Enseignant\\MesInvitations', 'enseignant', 'enseignant\\mes-invitations', NULL, 'mes-invitations'),
('ens-inv-01', 'Action', NULL, 'ens-inv', 'index', 'enseignant', 'enseignant\\mes-invitations\\index', NULL, 'mes-invitations'),
('ens-inv-02', 'Action', NULL, 'ens-inv', 'lister-mes-invitations', 'enseignant', 'enseignant\\mes-invitations\\lister-mes-invitations', NULL, 'mes-invitations'),
('ens-inv-03', 'Action', NULL, 'ens-inv', 'accepter-tutorat', 'enseignant', 'enseignant\\mes-invitations\\accepter-tutorat', NULL, 'mes-invitations'),
('ens-inv-04', 'Action', NULL, 'ens-inv', 'accepter-coordination  ', 'enseignant', 'enseignant\\mes-invitations\\accepter-coordination', NULL, 'mes-invitations'),
('ens-inv-05', 'Action', NULL, 'ens-inv', 'show-mail-invitation', 'enseignant', 'enseignant\\mes-invitations\\show-mail-invitation', NULL, 'show-mail-invitation'),
('ens-mn-cmp', 'Controller', NULL, 'ens', 'Enseignant\\MonCompte', 'enseignant', 'enseignant\\mon-compte', NULL, 'mon-compte'),
('ens-mn-cmp-01', 'Action', NULL, 'ens-mn-cmp', 'index', 'enseignant', 'enseignant\\mon-compte\\index', NULL, 'mon-compte'),
('ens-mn-cmp-02', 'Action', NULL, 'ens-mn-cmp', 'create-compte', 'enseignant', 'enseignant\\mon-compte\\create-compte', NULL, 'mon-compte'),
('ens-mn-cmp-03', 'Action', NULL, 'ens-mn-cmp', 'login', 'enseignant', 'enseignant\\mon-compte\\login', NULL, 'mon-compte'),
('ens-mn-cmp-04', 'Action', NULL, 'ens-mn-cmp', 'logout', 'enseignant', 'enseignant\\mon-compte\\logout', NULL, 'mon-compte'),
('ens-mn-cmp-05', 'Action', NULL, 'ens-mn-cmp', 'change-password', 'enseignant', 'enseignant\\mon-compte\\change-password', NULL, 'mon-compte'),
('ens-mn-cmp-06', 'Action', NULL, 'ens-mn-cmp', 'demande-change-password', 'enseignant', 'enseignant\\mon-compte\\demande-change-password', NULL, 'mon-compte'),
('ens-mn-cmp-07', 'Action', NULL, 'ens-mn-cmp', 'save-compte ', 'enseignant', 'enseignant\\mon-compte\\save-compte ', NULL, 'mon-compte'),
('ens-sav', 'Controller', NULL, 'ens', 'Enseignant\\Save', 'enseignant', 'enseignant\\save', NULL, 'save'),
('ens-sav-01', 'Action', NULL, 'ens-sav', 'index', 'enseignant', 'enseignant\\save\\index', NULL, 'save'),
('ens-sav-02', 'Action', NULL, 'ens-sav', 'donneepersonnelle', 'enseignant', 'enseignant\\save\\donneepersonnelle', NULL, 'save'),
('ens-sav-03', 'Action', NULL, 'ens-sav', 'etablissementenseigne', 'enseignant', 'enseignant\\save\\etablissementenseigne', NULL, 'save'),
('ens-sav-04', 'Action', NULL, 'ens-sav', 'traveau-enseignant', 'enseignant', 'enseignant\\save\\traveau-enseignant', NULL, 'save'),
('ens-sh', 'Controller', NULL, 'ens', 'Enseignant\\Show', 'enseignant', 'enseignant\\show', NULL, 'show'),
('ens-sh-01', 'Action', NULL, 'ens-sh', 'index', 'enseignant', 'enseignant\\show\\index', NULL, 'show'),
('ens-sh-02', 'Action', NULL, 'ens-sh', 'showcv', 'enseignant', 'enseignant\\show\\showcv', NULL, 'show'),
('ens-sh-03', 'Action', NULL, 'ens-sh', 'showcvcarriere', 'enseignant', 'enseignant\\show\\showcvcarriere', NULL, 'show'),
('ens-sh-04', 'Action', NULL, 'ens-sh', 'liste-mes-grades-ens', 'enseignant', 'enseignant\\show\\liste-mes-grades-ens', NULL, 'show'),
('ens-sh-05', 'Action', NULL, 'ens-sh', 'list-diplome-enseignant', 'enseignant', 'enseignant\\show\\list-diplome-enseignant', NULL, 'show'),
('ens-sh-06', 'Action', NULL, 'ens-sh', 'gest-diplome-enseignant', 'enseignant', 'enseignant\\show\\gest-diplome-enseignant', NULL, 'show'),
('ens-sh-07', 'Action', NULL, 'ens-sh', 'list-info-pro-dossier', 'enseignant', 'enseignant\\show\\list-info-pro-dossier', NULL, 'show'),
('ens-sh-08', 'Action', NULL, 'ens-sh', 'gest-info-pro-dossier', 'enseignant', 'enseignant\\show\\gest-info-pro-dossier', NULL, 'show'),
('ens-sh-09', 'Action', NULL, 'ens-sh', 'aide-saisie-dossier-enseignat', 'enseignant', 'enseignant\\show\\aide-saisie-dossier-enseignat', NULL, 'show'),
('ens-sh-10', 'Action', NULL, 'ens-sh', 'imprimer-demande-heur-enseigne', 'enseignant', 'enseignant\\show\\imprimer-demande-heur-enseigne', NULL, 'show'),
('ens-sh-11', 'Action', NULL, 'ens-sh', 'depot-dossier-papier', 'enseignant', 'enseignant\\show\\depot-dossier-papier', NULL, 'show'),
('ens-sh-12', 'Action', NULL, 'ens-sh', 'gest-depot-dossier-papier', 'enseignant', 'enseignant\\show\\gest-depot-dossier-papier', NULL, 'show'),
('ens-sh-13', 'Action', NULL, 'ens-sh', 'gest-invitation  ', 'enseignant', 'enseignant\\show\\gest-invitation  ', NULL, 'show'),
('ped', 'Module', NULL, NULL, 'Pedagogie', 'Pedagogie', 'pedagogie', NULL, 'Pedagogie');

-- --------------------------------------------------------

--
-- Structure de la table `specialiterensignant`
--

CREATE TABLE `specialiterensignant` (
  `idspecialiterensignant` bigint(20) NOT NULL,
  `idpersonnes` varchar(25) NOT NULL,
  `idspecialiters` varchar(45) DEFAULT NULL,
  `dateoptentionspecialite` date DEFAULT NULL,
  `descriptionspecialite` text,
  `labelpersospecialite` varchar(512) DEFAULT NULL,
  `pardefautspecialite` tinyint(4) DEFAULT NULL,
  `poidsspeciliter` int(11) DEFAULT NULL COMMENT 'il est bien ou pas dans cette spécilité'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `specialiters`
--

CREATE TABLE `specialiters` (
  `idspecialiters` varchar(45) NOT NULL,
  `labelspecialiter` varchar(512) DEFAULT NULL,
  `descspecialiter` text,
  `abrevspecialiter` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `traveaux`
--

CREATE TABLE `traveaux` (
  `idtraveaux` varchar(45) NOT NULL,
  `labeltrav` varchar(1024) DEFAULT NULL,
  `desctrav` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `traveenseignantsmodule`
--

CREATE TABLE `traveenseignantsmodule` (
  `idtraveaux` varchar(45) NOT NULL,
  `idpersonnes` varchar(25) NOT NULL,
  `idModule` int(11) NOT NULL,
  `idanneeuniv` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `typedocofficiel`
--

CREATE TABLE `typedocofficiel` (
  `idtypedocofficiel` varchar(55) NOT NULL,
  `labeldocofficiel` varchar(512) DEFAULT NULL,
  `desctypedocofficiel` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `typedocofficiel`
--

INSERT INTO `typedocofficiel` (`idtypedocofficiel`, `labeldocofficiel`, `desctypedocofficiel`) VALUES
('dossiertuteur', 'dossier de tuteur', 'dossier de tuteur');

-- --------------------------------------------------------

--
-- Structure de la table `typeenseignement`
--

CREATE TABLE `typeenseignement` (
  `idTypeenseignement` varchar(25) NOT NULL COMMENT 'Type enseignement : TP, TD, Cour Intégré CI,...',
  `labeltypeenseignement` varchar(255) DEFAULT NULL,
  `desctypeenseignement` text,
  `ordreaffichage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `typeenseignement`
--

INSERT INTO `typeenseignement` (`idTypeenseignement`, `labeltypeenseignement`, `desctypeenseignement`, `ordreaffichage`) VALUES
('CI', 'Cours intérés', 'Cours intérés', 1),
('Cours', 'Cours', 'Cours', 2),
('TD', 'Travaux dérigé', 'Travaux dérigé', 3),
('TP', 'Travaux pratique', 'Travaux pratique', 4);

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
(1, 'Licence Appliquée', 'Diplôme', 'Licence Appliquée', 'Licence Appliquée', NULL),
(2, NULL, 'Domaine', 'Domaine', 'Domaine', 1),
(3, NULL, 'Mention', 'Mention', 'Mention', 2),
(4, NULL, 'Parcours', 'Parcours', 'Parcours', 3),
(5, 'Licence Fondamentale', 'Diplôme', 'Licence Fondamentale', 'Licence Fondamentale', NULL),
(6, NULL, 'Domaine', 'Domaine', 'Domaine', 5),
(7, NULL, 'Mention', 'Mention', 'Mention', 6),
(8, NULL, 'Parcours', 'Parcours', 'Parcours', 7),
(9, NULL, 'Cours Libres', 'Cours Libres', 'Cours Libres', NULL),
(10, NULL, 'Domaine', 'Domaine', 'Domaine', 9),
(11, NULL, 'Spécialité', 'Spécialité', 'Spécialité', 10),
(12, NULL, 'Diplôme', 'Master', 'Master', NULL),
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

--
-- Contenu de la table `typemodule`
--

INSERT INTO `typemodule` (`idTypemodule`, `labeltypemodule`, `desctypemodule`) VALUES
('ECUE', 'ECUE', 'ECUE'),
('SOUSUE', 'Sous Unité', 'Sous Unité'),
('UE', 'UE', 'UE');

-- --------------------------------------------------------

--
-- Structure de la table `typepiecejointe`
--

CREATE TABLE `typepiecejointe` (
  `idtypepiecejointe` varchar(45) NOT NULL,
  `labeltypepiecejointe` varchar(512) DEFAULT NULL,
  `desctypepiece` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `typeresourcemoodle`
--

CREATE TABLE `typeresourcemoodle` (
  `idtyperesourcemoodle` varchar(25) NOT NULL COMMENT 'moodle d''activité sous moodl',
  `labeltyperesourcemoodle` varchar(512) DEFAULT NULL,
  `desctyperesourcemoodle` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `typeservices`
--

CREATE TABLE `typeservices` (
  `idtypeservices` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `idperetypeservices` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `typeservices`
--

INSERT INTO `typeservices` (`idtypeservices`, `idperetypeservices`, `label`, `description`) VALUES
('Action', 'Action', 'Action', 'Action'),
('Controller', 'Controller', 'Controller', 'Controller'),
('Module', 'Module', 'Module', 'Module'),
('URL', 'URL', 'URL', 'URL');

-- --------------------------------------------------------

--
-- Structure de la table `typevalidation`
--

CREATE TABLE `typevalidation` (
  `idtypevalidation` varchar(25) NOT NULL,
  `idperetypevalidation` varchar(25) DEFAULT NULL,
  `labeltypevalidation` varchar(512) DEFAULT NULL,
  `desctypevalidation` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `typevalidation`
--

INSERT INTO `typevalidation` (`idtypevalidation`, `idperetypevalidation`, `labeltypevalidation`, `desctypevalidation`) VALUES
('CC', NULL, 'Contrôle continue', 'Contrôle continue'),
('CC_Ecrit', 'CC', 'Ecrit', 'Ecrit'),
('CC_Oral', 'CC', 'Oral', NULL),
('CC_TP_Autres', 'CC', 'TP et Autres', 'TP et Autres'),
('Ex', NULL, 'Examen final', 'Examen final'),
('Ex_Ecrit', 'Ex', 'Ecrit', 'Ecrit'),
('Ex_Oral', 'Ex', 'Oral', 'Oral'),
('Ex_TP_Autres', 'Ex', 'TP et Autres', 'TP et Autres');

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
-- Index pour la table `activiter`
--
ALTER TABLE `activiter`
  ADD PRIMARY KEY (`idactiviter`),
  ADD KEY `fk_activiter_competence1_idx` (`idcompetence`),
  ADD KEY `fk_activiter_activiter1_idx` (`idpereactiviter`);

--
-- Index pour la table `anneeuniv`
--
ALTER TABLE `anneeuniv`
  ADD PRIMARY KEY (`idanneeuniv`);

--
-- Index pour la table `appparams`
--
ALTER TABLE `appparams`
  ADD PRIMARY KEY (`idappparams`);

--
-- Index pour la table `assurerformation`
--
ALTER TABLE `assurerformation`
  ADD PRIMARY KEY (`idassurerformation`),
  ADD KEY `fk_assurerformation_enseignants1_idx` (`idpersonnes`),
  ADD KEY `fk_assurerformation_niveauformation1_idx` (`idniveauformation`);

--
-- Index pour la table `competence`
--
ALTER TABLE `competence`
  ADD PRIMARY KEY (`idcompetence`),
  ADD KEY `fk_competence_objective1_idx` (`idobjective`),
  ADD KEY `fk_competence_competence1_idx` (`idperecompetence`);

--
-- Index pour la table `competenceens`
--
ALTER TABLE `competenceens`
  ADD PRIMARY KEY (`idcompetenceens`),
  ADD KEY `fk_competenceens_enseignants1_idx` (`idpersonnes`);

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
-- Index pour la table `concepteurs`
--
ALTER TABLE `concepteurs`
  ADD PRIMARY KEY (`conceptions_idconceptions`,`enseignants_idpersonnes`),
  ADD KEY `fk_conceptions_has_enseignants_enseignants1_idx` (`enseignants_idpersonnes`),
  ADD KEY `fk_conceptions_has_enseignants_conceptions1_idx` (`conceptions_idconceptions`);

--
-- Index pour la table `conceptions`
--
ALTER TABLE `conceptions`
  ADD PRIMARY KEY (`idconceptions`),
  ADD KEY `fk_conceptions_module1_idx` (`idModule`);

--
-- Index pour la table `coordination`
--
ALTER TABLE `coordination`
  ADD PRIMARY KEY (`idcoordination`),
  ADD KEY `fk_coordination_anneeuniv1_idx` (`idanneeuniv`),
  ADD KEY `fk_coordination_enseignants1_idx` (`idpersonnes`),
  ADD KEY `fk_coordination_niveauformation1_idx` (`idniveauformation`),
  ADD KEY `fk_coordination_naturecoordinateur1_idx` (`idnaturecoordinateur`),
  ADD KEY `Coordination_enseignantformation` (`idformations`);

--
-- Index pour la table `depotdocens`
--
ALTER TABLE `depotdocens`
  ADD PRIMARY KEY (`idpersonnes`,`iddocumentofficiel`),
  ADD KEY `fk_enseignants_has_documentofficiel_documentofficiel1_idx` (`iddocumentofficiel`),
  ADD KEY `fk_enseignants_has_documentofficiel_enseignants1_idx` (`idpersonnes`);

--
-- Index pour la table `diplomeens`
--
ALTER TABLE `diplomeens`
  ADD PRIMARY KEY (`iddiplomeens`),
  ADD KEY `fk_diplomeens_enseignants1_idx` (`idpersonnes`);

--
-- Index pour la table `diplomeensegnier`
--
ALTER TABLE `diplomeensegnier`
  ADD PRIMARY KEY (`iddiplomeensegnier`),
  ADD KEY `fk_diplomeensegnier_etabenseignement1_idx` (`idetabenseignement`);

--
-- Index pour la table `documentofficiel`
--
ALTER TABLE `documentofficiel`
  ADD PRIMARY KEY (`iddocumentofficiel`),
  ADD KEY `fk_documentofficiel_typedocofficiel1_idx` (`idtypedocofficiel`);

--
-- Index pour la table `droits`
--
ALTER TABLE `droits`
  ADD PRIMARY KEY (`iddroits`),
  ADD KEY `fk_droits_roles` (`idroles`),
  ADD KEY `fk_droits_services1` (`idservices`);

--
-- Index pour la table `ensactiviter`
--
ALTER TABLE `ensactiviter`
  ADD PRIMARY KEY (`idensactiviter`),
  ADD KEY `fk_ensactiviter_listeactiviterens1_idx` (`idlisteactiviterens`),
  ADD KEY `fk_ensactiviter_enseignants1_idx` (`idpersonnes`);

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
-- Index pour la table `ensinfopro`
--
ALTER TABLE `ensinfopro`
  ADD PRIMARY KEY (`idensinfopro`),
  ADD KEY `fk_ensinfopro_enseignants1_idx` (`idpersonnes`);

--
-- Index pour la table `etabenseignement`
--
ALTER TABLE `etabenseignement`
  ADD PRIMARY KEY (`idetabenseignement`),
  ADD KEY `fk_etabenseignement_enseignants1_idx` (`idpersonnes`);

--
-- Index pour la table `formations`
--
ALTER TABLE `formations`
  ADD PRIMARY KEY (`idformations`),
  ADD KEY `fk_formations_formations1_idx` (`idpereformations`),
  ADD KEY `fk_formations_typeformation1_idx` (`idtypeformation`),
  ADD KEY `fk_formations_projethabilitation1_idx` (`idprojethabilitation`);

--
-- Index pour la table `formationsuiviense`
--
ALTER TABLE `formationsuiviense`
  ADD PRIMARY KEY (`idformationsuiviense`),
  ADD KEY `fk_formationsuiviense_enseignants1_idx` (`idpersonnes`),
  ADD KEY `fk_formationsuiviense_niveauformation1_idx` (`idniveauformation`);

--
-- Index pour la table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`idgrades`);

--
-- Index pour la table `gradesenseignants`
--
ALTER TABLE `gradesenseignants`
  ADD PRIMARY KEY (`idgradesenseignants`),
  ADD KEY `fk_gradesenseignants_enseignants1_idx` (`idpersonnes`),
  ADD KEY `fk_gradesenseignants_grades1_idx` (`idgrades`);

--
-- Index pour la table `groupes`
--
ALTER TABLE `groupes`
  ADD PRIMARY KEY (`idgroupes`),
  ADD KEY `fk_groupes_niveauformation1_idx` (`idniveauformation`);

--
-- Index pour la table `infopersonne`
--
ALTER TABLE `infopersonne`
  ADD PRIMARY KEY (`idinfopersonne`),
  ADD KEY `fk_infopersonne_personnes1_idx` (`idpersonnes`),
  ADD KEY `fk_infopersonne_langue1_idx` (`idlangue`);

--
-- Index pour la table `invitations`
--
ALTER TABLE `invitations`
  ADD PRIMARY KEY (`idinvitations`),
  ADD KEY `fk_invitations_anneeuniv1_idx` (`idanneeuniv`),
  ADD KEY `fk_invitations_periode1_idx` (`idperiode`),
  ADD KEY `Naturecoordintion_Invitation` (`idnaturecoordinateur`);

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
-- Index pour la table `listeactiviterens`
--
ALTER TABLE `listeactiviterens`
  ADD PRIMARY KEY (`idlisteactiviterens`);

--
-- Index pour la table `listetypeformation`
--
ALTER TABLE `listetypeformation`
  ADD PRIMARY KEY (`idlistetypeformation`),
  ADD KEY `fk_listetypeformation_typeformation1_idx` (`idtypeformation`);

--
-- Index pour la table `listvalidationtutorat`
--
ALTER TABLE `listvalidationtutorat`
  ADD PRIMARY KEY (`idlistvalidationtutorat`);

--
-- Index pour la table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`idmenus`),
  ADD KEY `fk_menus_menus1` (`idperemenus`);

--
-- Index pour la table `miseajourcours`
--
ALTER TABLE `miseajourcours`
  ADD PRIMARY KEY (`idmiseajourcours`),
  ADD KEY `fk_miseajourcours_conceptions1_idx` (`conceptions_idconceptions`);

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
-- Index pour la table `moduleenseignier`
--
ALTER TABLE `moduleenseignier`
  ADD PRIMARY KEY (`idmoduleenseignier`),
  ADD KEY `fk_moduleenseignier_diplomeensegnier1_idx` (`iddiplomeensegnier`);

--
-- Index pour la table `moduleperiode`
--
ALTER TABLE `moduleperiode`
  ADD PRIMARY KEY (`idmoduleperiode`),
  ADD KEY `fk_moduleperiode_module1_idx` (`idModule`),
  ADD KEY `fk_moduleperiode_periodeformation1_idx` (`idperiodeformation`);

--
-- Index pour la table `modulevalidationmodule`
--
ALTER TABLE `modulevalidationmodule`
  ADD PRIMARY KEY (`idModule`,`idtypevalidation`),
  ADD KEY `fk_module_has_validationmodule_module1_idx` (`idModule`),
  ADD KEY `fk_modulevalidationmodule_typevalidation1_idx` (`idtypevalidation`);

--
-- Index pour la table `nature`
--
ALTER TABLE `nature`
  ADD PRIMARY KEY (`idNature`);

--
-- Index pour la table `naturecoordinateur`
--
ALTER TABLE `naturecoordinateur`
  ADD PRIMARY KEY (`idnaturecoordinateur`);

--
-- Index pour la table `niveauformation`
--
ALTER TABLE `niveauformation`
  ADD PRIMARY KEY (`idniveauformation`),
  ADD KEY `fk_niveauformation_formations1_idx` (`idformations`),
  ADD KEY `fk_niveauformation_levelformation1_idx` (`idlevelformation`);

--
-- Index pour la table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`idnotification`);

--
-- Index pour la table `nvittutoratue`
--
ALTER TABLE `nvittutoratue`
  ADD PRIMARY KEY (`idinvitations`,`idModule`),
  ADD KEY `fk_invitations_has_module_module1_idx` (`idModule`),
  ADD KEY `fk_invitations_has_module_invitations1_idx` (`idinvitations`),
  ADD KEY `fk_nvittutoratue_listvalidationtutorat1_idx` (`statusinvtvalid`);

--
-- Index pour la table `objective`
--
ALTER TABLE `objective`
  ADD PRIMARY KEY (`idobjective`),
  ADD KEY `fk_objective_objective1_idx` (`idpereobjective`);

--
-- Index pour la table `periode`
--
ALTER TABLE `periode`
  ADD PRIMARY KEY (`idperiode`),
  ADD KEY `fk_periode_levelformation1_idx` (`idlevelformation`),
  ADD KEY `fk_periode_periode1_idx` (`idsousperiode`);

--
-- Index pour la table `periodeformation`
--
ALTER TABLE `periodeformation`
  ADD PRIMARY KEY (`idperiodeformation`),
  ADD KEY `fk_periodeformation_formations1_idx` (`idformations`),
  ADD KEY `fk_periodeformation_periode1_idx` (`idperiode`),
  ADD KEY `periode_niveau` (`idniveauformation`),
  ADD KEY `idanneeuniv` (`idanneeuniv`);

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
-- Index pour la table `piecejointes`
--
ALTER TABLE `piecejointes`
  ADD PRIMARY KEY (`idpiecejointes`),
  ADD KEY `fk_piecejointes_module1_idx` (`idModule`),
  ADD KEY `fk_piecejointes_typepiecejointe1_idx` (`idtypepiecejointe`);

--
-- Index pour la table `plandemodule`
--
ALTER TABLE `plandemodule`
  ADD PRIMARY KEY (`idplandemodule`),
  ADD KEY `fk_plandemodule_plandemodule1_idx` (`idpereplandemodule`),
  ADD KEY `fk_plandemodule_module1_idx` (`idModule`);

--
-- Index pour la table `prerequits`
--
ALTER TABLE `prerequits`
  ADD PRIMARY KEY (`idprerequits`),
  ADD KEY `fk_prerequits_module1_idx` (`module_idModule`);

--
-- Index pour la table `projethabilitation`
--
ALTER TABLE `projethabilitation`
  ADD PRIMARY KEY (`idprojethabilitation`),
  ADD KEY `fk_projethabilitation_anneeuniv1_idx` (`idanneeuniv`);

--
-- Index pour la table `referentiel`
--
ALTER TABLE `referentiel`
  ADD PRIMARY KEY (`idobjective`,`idformations`),
  ADD KEY `fk_objective_has_formations_formations1_idx` (`idformations`),
  ADD KEY `fk_objective_has_formations_objective1_idx` (`idobjective`);

--
-- Index pour la table `referentielmodule`
--
ALTER TABLE `referentielmodule`
  ADD PRIMARY KEY (`idobjective`,`idModule`),
  ADD KEY `fk_objective_has_module_module1_idx` (`idModule`),
  ADD KEY `fk_objective_has_module_objective1_idx` (`idobjective`);

--
-- Index pour la table `referetielplandemodule`
--
ALTER TABLE `referetielplandemodule`
  ADD PRIMARY KEY (`idcompetence`,`idplandemodule`),
  ADD KEY `fk_competence_has_plandemodule_plandemodule1_idx` (`idplandemodule`),
  ADD KEY `fk_competence_has_plandemodule_competence1_idx` (`idcompetence`);

--
-- Index pour la table `regime`
--
ALTER TABLE `regime`
  ADD PRIMARY KEY (`idRegime`);

--
-- Index pour la table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`idresource`),
  ADD KEY `fk_resource_activiter1_idx` (`idactiviter`);

--
-- Index pour la table `roleresponsable`
--
ALTER TABLE `roleresponsable`
  ADD PRIMARY KEY (`idroleresponsable`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idroles`);

--
-- Index pour la table `rolespersonnes`
--
ALTER TABLE `rolespersonnes`
  ADD PRIMARY KEY (`idpersonnes`,`idroles`,`idanneeuniv`,`idperiode`) USING BTREE;

--
-- Index pour la table `roleutilisateursurformation`
--
ALTER TABLE `roleutilisateursurformation`
  ADD PRIMARY KEY (`idniveauformation`,`idroleresponsable`,`idpersonnes`),
  ADD KEY `fk_niveauformation_has_roleresponsable_roleresponsable1_idx` (`idroleresponsable`),
  ADD KEY `fk_niveauformation_has_roleresponsable_niveauformation1_idx` (`idniveauformation`),
  ADD KEY `fk_niveauformation_has_roleresponsable_personnes1_idx` (`idpersonnes`);

--
-- Index pour la table `scenariomoodle`
--
ALTER TABLE `scenariomoodle`
  ADD PRIMARY KEY (`idscenariomoodle`),
  ADD KEY `fk_scenariomoodle_typeresourcemoodle1_idx` (`idtyperesourcemoodle`),
  ADD KEY `fk_scenariomoodle_plandemodule1_idx` (`idplandemodule`),
  ADD KEY `fk_scenariomoodle_activiter1_idx` (`idactiviter`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`idservices`),
  ADD KEY `fk_services_services1` (`idsousservices`),
  ADD KEY `fk_services_typeservices1` (`idtypeservices`),
  ADD KEY `fk_services_menus1` (`idmenus`);

--
-- Index pour la table `specialiterensignant`
--
ALTER TABLE `specialiterensignant`
  ADD PRIMARY KEY (`idspecialiterensignant`),
  ADD KEY `fk_specialiterensignant_specialiters1_idx` (`idspecialiters`),
  ADD KEY `fk_specialiterensignant_enseignants1_idx` (`idpersonnes`);

--
-- Index pour la table `specialiters`
--
ALTER TABLE `specialiters`
  ADD PRIMARY KEY (`idspecialiters`);

--
-- Index pour la table `traveaux`
--
ALTER TABLE `traveaux`
  ADD PRIMARY KEY (`idtraveaux`);

--
-- Index pour la table `traveenseignantsmodule`
--
ALTER TABLE `traveenseignantsmodule`
  ADD PRIMARY KEY (`idtraveaux`,`idpersonnes`,`idModule`,`idanneeuniv`),
  ADD KEY `fk_traveaux_has_enseignantsmodule_enseignantsmodule1_idx` (`idpersonnes`,`idModule`,`idanneeuniv`),
  ADD KEY `fk_traveaux_has_enseignantsmodule_traveaux1_idx` (`idtraveaux`);

--
-- Index pour la table `typedocofficiel`
--
ALTER TABLE `typedocofficiel`
  ADD PRIMARY KEY (`idtypedocofficiel`);

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
-- Index pour la table `typepiecejointe`
--
ALTER TABLE `typepiecejointe`
  ADD PRIMARY KEY (`idtypepiecejointe`);

--
-- Index pour la table `typeresourcemoodle`
--
ALTER TABLE `typeresourcemoodle`
  ADD PRIMARY KEY (`idtyperesourcemoodle`);

--
-- Index pour la table `typeservices`
--
ALTER TABLE `typeservices`
  ADD PRIMARY KEY (`idtypeservices`),
  ADD KEY `fk_typeservices_typeservices1` (`idperetypeservices`);

--
-- Index pour la table `typevalidation`
--
ALTER TABLE `typevalidation`
  ADD PRIMARY KEY (`idtypevalidation`),
  ADD KEY `fk_typevalidation_typevalidation1_idx` (`idperetypevalidation`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `activiter`
--
ALTER TABLE `activiter`
  MODIFY `idactiviter` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `assurerformation`
--
ALTER TABLE `assurerformation`
  MODIFY `idassurerformation` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `competence`
--
ALTER TABLE `competence`
  MODIFY `idcompetence` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `conceptions`
--
ALTER TABLE `conceptions`
  MODIFY `idconceptions` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `coordination`
--
ALTER TABLE `coordination`
  MODIFY `idcoordination` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `diplomeens`
--
ALTER TABLE `diplomeens`
  MODIFY `iddiplomeens` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `diplomeensegnier`
--
ALTER TABLE `diplomeensegnier`
  MODIFY `iddiplomeensegnier` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `documentofficiel`
--
ALTER TABLE `documentofficiel`
  MODIFY `iddocumentofficiel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `droits`
--
ALTER TABLE `droits`
  MODIFY `iddroits` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=309;
--
-- AUTO_INCREMENT pour la table `ensactiviter`
--
ALTER TABLE `ensactiviter`
  MODIFY `idensactiviter` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `etabenseignement`
--
ALTER TABLE `etabenseignement`
  MODIFY `idetabenseignement` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `formations`
--
ALTER TABLE `formations`
  MODIFY `idformations` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT pour la table `formationsuiviense`
--
ALTER TABLE `formationsuiviense`
  MODIFY `idformationsuiviense` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `gradesenseignants`
--
ALTER TABLE `gradesenseignants`
  MODIFY `idgradesenseignants` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `groupes`
--
ALTER TABLE `groupes`
  MODIFY `idgroupes` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `infopersonne`
--
ALTER TABLE `infopersonne`
  MODIFY `idinfopersonne` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT pour la table `invitations`
--
ALTER TABLE `invitations`
  MODIFY `idinvitations` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT pour la table `listeactiviterens`
--
ALTER TABLE `listeactiviterens`
  MODIFY `idlisteactiviterens` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `listetypeformation`
--
ALTER TABLE `listetypeformation`
  MODIFY `idlistetypeformation` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `menus`
--
ALTER TABLE `menus`
  MODIFY `idmenus` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `miseajourcours`
--
ALTER TABLE `miseajourcours`
  MODIFY `idmiseajourcours` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `modelformation`
--
ALTER TABLE `modelformation`
  MODIFY `idmodelformation` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `module`
--
ALTER TABLE `module`
  MODIFY `idModule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT pour la table `moduleperiode`
--
ALTER TABLE `moduleperiode`
  MODIFY `idmoduleperiode` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `niveauformation`
--
ALTER TABLE `niveauformation`
  MODIFY `idniveauformation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT pour la table `notification`
--
ALTER TABLE `notification`
  MODIFY `idnotification` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `periodeformation`
--
ALTER TABLE `periodeformation`
  MODIFY `idperiodeformation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;
--
-- AUTO_INCREMENT pour la table `piecejointes`
--
ALTER TABLE `piecejointes`
  MODIFY `idpiecejointes` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `plandemodule`
--
ALTER TABLE `plandemodule`
  MODIFY `idplandemodule` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `prerequits`
--
ALTER TABLE `prerequits`
  MODIFY `idprerequits` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `projethabilitation`
--
ALTER TABLE `projethabilitation`
  MODIFY `idprojethabilitation` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `resource`
--
ALTER TABLE `resource`
  MODIFY `idresource` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `scenariomoodle`
--
ALTER TABLE `scenariomoodle`
  MODIFY `idscenariomoodle` int(11) NOT NULL AUTO_INCREMENT;
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
-- Contraintes pour la table `activiter`
--
ALTER TABLE `activiter`
  ADD CONSTRAINT `fk_activiter_activiter1` FOREIGN KEY (`idpereactiviter`) REFERENCES `activiter` (`idactiviter`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_activiter_competence1` FOREIGN KEY (`idcompetence`) REFERENCES `competence` (`idcompetence`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `assurerformation`
--
ALTER TABLE `assurerformation`
  ADD CONSTRAINT `fk_assurerformation_enseignants1` FOREIGN KEY (`idpersonnes`) REFERENCES `enseignants` (`idpersonnes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_assurerformation_niveauformation1` FOREIGN KEY (`idniveauformation`) REFERENCES `niveauformation` (`idniveauformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `competence`
--
ALTER TABLE `competence`
  ADD CONSTRAINT `fk_competence_competence1` FOREIGN KEY (`idperecompetence`) REFERENCES `competence` (`idcompetence`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_competence_objective1` FOREIGN KEY (`idobjective`) REFERENCES `objective` (`idobjective`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `competenceens`
--
ALTER TABLE `competenceens`
  ADD CONSTRAINT `fk_competenceens_enseignants1` FOREIGN KEY (`idpersonnes`) REFERENCES `enseignants` (`idpersonnes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `composantregime`
--
ALTER TABLE `composantregime`
  ADD CONSTRAINT `fk_Regime_has_composanteval_Regime1` FOREIGN KEY (`idRegime`) REFERENCES `regime` (`idRegime`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Regime_has_composanteval_composanteval1` FOREIGN KEY (`idcomposanteval`) REFERENCES `composanteval` (`idcomposanteval`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_composantregime_typevalidation1` FOREIGN KEY (`idtypevalidation`) REFERENCES `typevalidation` (`idtypevalidation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `concepteurs`
--
ALTER TABLE `concepteurs`
  ADD CONSTRAINT `fk_conceptions_has_enseignants_conceptions1` FOREIGN KEY (`conceptions_idconceptions`) REFERENCES `conceptions` (`idconceptions`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_conceptions_has_enseignants_enseignants1` FOREIGN KEY (`enseignants_idpersonnes`) REFERENCES `enseignants` (`idpersonnes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `conceptions`
--
ALTER TABLE `conceptions`
  ADD CONSTRAINT `fk_conceptions_module1` FOREIGN KEY (`idModule`) REFERENCES `module` (`idModule`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `coordination`
--
ALTER TABLE `coordination`
  ADD CONSTRAINT `fk_coordination_anneeuniv1` FOREIGN KEY (`idanneeuniv`) REFERENCES `anneeuniv` (`idanneeuniv`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_coordination_enseignants1` FOREIGN KEY (`idpersonnes`) REFERENCES `enseignants` (`idpersonnes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_coordination_naturecoordinateur1` FOREIGN KEY (`idnaturecoordinateur`) REFERENCES `naturecoordinateur` (`idnaturecoordinateur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_coordination_niveauformation1` FOREIGN KEY (`idniveauformation`) REFERENCES `niveauformation` (`idniveauformation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_formation_coordination1` FOREIGN KEY (`idformations`) REFERENCES `formations` (`idformations`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `depotdocens`
--
ALTER TABLE `depotdocens`
  ADD CONSTRAINT `fk_enseignants_has_documentofficiel_documentofficiel1` FOREIGN KEY (`iddocumentofficiel`) REFERENCES `documentofficiel` (`iddocumentofficiel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_enseignants_has_documentofficiel_enseignants1` FOREIGN KEY (`idpersonnes`) REFERENCES `enseignants` (`idpersonnes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `diplomeens`
--
ALTER TABLE `diplomeens`
  ADD CONSTRAINT `fk_diplomeens_enseignants1` FOREIGN KEY (`idpersonnes`) REFERENCES `enseignants` (`idpersonnes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `diplomeensegnier`
--
ALTER TABLE `diplomeensegnier`
  ADD CONSTRAINT `fk_diplomeensegnier_etabenseignement1` FOREIGN KEY (`idetabenseignement`) REFERENCES `etabenseignement` (`idetabenseignement`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `documentofficiel`
--
ALTER TABLE `documentofficiel`
  ADD CONSTRAINT `fk_documentofficiel_typedocofficiel1` FOREIGN KEY (`idtypedocofficiel`) REFERENCES `typedocofficiel` (`idtypedocofficiel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `droits`
--
ALTER TABLE `droits`
  ADD CONSTRAINT `fk_droits_roles1` FOREIGN KEY (`idroles`) REFERENCES `roles` (`idroles`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_droits_services1` FOREIGN KEY (`idservices`) REFERENCES `services` (`idservices`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ensactiviter`
--
ALTER TABLE `ensactiviter`
  ADD CONSTRAINT `fk_ensactiviter_enseignants1` FOREIGN KEY (`idpersonnes`) REFERENCES `enseignants` (`idpersonnes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ensactiviter_listeactiviterens1` FOREIGN KEY (`idlisteactiviterens`) REFERENCES `listeactiviterens` (`idlisteactiviterens`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Contraintes pour la table `ensinfopro`
--
ALTER TABLE `ensinfopro`
  ADD CONSTRAINT `fk_ensinfopro_enseignants1` FOREIGN KEY (`idpersonnes`) REFERENCES `enseignants` (`idpersonnes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `etabenseignement`
--
ALTER TABLE `etabenseignement`
  ADD CONSTRAINT `fk_etabenseignement_enseignants1` FOREIGN KEY (`idpersonnes`) REFERENCES `enseignants` (`idpersonnes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `formations`
--
ALTER TABLE `formations`
  ADD CONSTRAINT `fk_formations_formations1` FOREIGN KEY (`idpereformations`) REFERENCES `formations` (`idformations`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_formations_projethabilitation1` FOREIGN KEY (`idprojethabilitation`) REFERENCES `projethabilitation` (`idprojethabilitation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_formations_typeformation1` FOREIGN KEY (`idtypeformation`) REFERENCES `typeformation` (`idtypeformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `formationsuiviense`
--
ALTER TABLE `formationsuiviense`
  ADD CONSTRAINT `fk_formationsuiviense_enseignants1` FOREIGN KEY (`idpersonnes`) REFERENCES `enseignants` (`idpersonnes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_formationsuiviense_niveauformation1` FOREIGN KEY (`idniveauformation`) REFERENCES `niveauformation` (`idniveauformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `gradesenseignants`
--
ALTER TABLE `gradesenseignants`
  ADD CONSTRAINT `fk_gradesenseignants_enseignants1` FOREIGN KEY (`idpersonnes`) REFERENCES `enseignants` (`idpersonnes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gradesenseignants_grades1` FOREIGN KEY (`idgrades`) REFERENCES `grades` (`idgrades`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `groupes`
--
ALTER TABLE `groupes`
  ADD CONSTRAINT `fk_groupes_niveauformation1` FOREIGN KEY (`idniveauformation`) REFERENCES `niveauformation` (`idniveauformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `infopersonne`
--
ALTER TABLE `infopersonne`
  ADD CONSTRAINT `fk_infopersonne_langue1` FOREIGN KEY (`idlangue`) REFERENCES `langue` (`idlangue`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_infopersonne_personnes1` FOREIGN KEY (`idpersonnes`) REFERENCES `personnes` (`idpersonnes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `invitations`
--
ALTER TABLE `invitations`
  ADD CONSTRAINT `fk_invitations_anneeuniv1` FOREIGN KEY (`idanneeuniv`) REFERENCES `anneeuniv` (`idanneeuniv`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_invitations_periode1` FOREIGN KEY (`idperiode`) REFERENCES `periode` (`idperiode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `listetypeformation`
--
ALTER TABLE `listetypeformation`
  ADD CONSTRAINT `fk_listetypeformation_typeformation1` FOREIGN KEY (`idtypeformation`) REFERENCES `typeformation` (`idtypeformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `fk_menus_menus1` FOREIGN KEY (`idperemenus`) REFERENCES `menus` (`idmenus`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `miseajourcours`
--
ALTER TABLE `miseajourcours`
  ADD CONSTRAINT `fk_miseajourcours_conceptions1` FOREIGN KEY (`conceptions_idconceptions`) REFERENCES `conceptions` (`idconceptions`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Contraintes pour la table `moduleenseignier`
--
ALTER TABLE `moduleenseignier`
  ADD CONSTRAINT `fk_moduleenseignier_diplomeensegnier1` FOREIGN KEY (`iddiplomeensegnier`) REFERENCES `diplomeensegnier` (`iddiplomeensegnier`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `moduleperiode`
--
ALTER TABLE `moduleperiode`
  ADD CONSTRAINT `fk_moduleperiode_module1` FOREIGN KEY (`idModule`) REFERENCES `module` (`idModule`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_moduleperiode_periodeformation1` FOREIGN KEY (`idperiodeformation`) REFERENCES `periodeformation` (`idperiodeformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `modulevalidationmodule`
--
ALTER TABLE `modulevalidationmodule`
  ADD CONSTRAINT `fk_module_has_validationmodule_module1` FOREIGN KEY (`idModule`) REFERENCES `module` (`idModule`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_modulevalidationmodule_typevalidation1` FOREIGN KEY (`idtypevalidation`) REFERENCES `typevalidation` (`idtypevalidation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `niveauformation`
--
ALTER TABLE `niveauformation`
  ADD CONSTRAINT `fk_niveauformation_formations1` FOREIGN KEY (`idformations`) REFERENCES `formations` (`idformations`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_niveauformation_levelformation1` FOREIGN KEY (`idlevelformation`) REFERENCES `levelformation` (`idlevelformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `nvittutoratue`
--
ALTER TABLE `nvittutoratue`
  ADD CONSTRAINT `fk_invitations_has_module_invitations1` FOREIGN KEY (`idinvitations`) REFERENCES `invitations` (`idinvitations`),
  ADD CONSTRAINT `fk_invitations_has_module_module1` FOREIGN KEY (`idModule`) REFERENCES `module` (`idModule`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nvittutoratue_listvalidationtutorat1` FOREIGN KEY (`statusinvtvalid`) REFERENCES `listvalidationtutorat` (`idlistvalidationtutorat`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `objective`
--
ALTER TABLE `objective`
  ADD CONSTRAINT `fk_objective_objective1` FOREIGN KEY (`idpereobjective`) REFERENCES `objective` (`idobjective`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `periode`
--
ALTER TABLE `periode`
  ADD CONSTRAINT `fk_periode_levelformation1` FOREIGN KEY (`idlevelformation`) REFERENCES `levelformation` (`idlevelformation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_periode_periode1` FOREIGN KEY (`idsousperiode`) REFERENCES `periode` (`idperiode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `periodeformation`
--
ALTER TABLE `periodeformation`
  ADD CONSTRAINT `fk_anneuniv_periodeformation1` FOREIGN KEY (`idanneeuniv`) REFERENCES `anneeuniv` (`idanneeuniv`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_periodeformation_formations1` FOREIGN KEY (`idformations`) REFERENCES `formations` (`idformations`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_periodeformation_periode1` FOREIGN KEY (`idperiode`) REFERENCES `periode` (`idperiode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `permissionsurformation`
--
ALTER TABLE `permissionsurformation`
  ADD CONSTRAINT `fk_roleresponsable_has_permissionformationrole_permissionform1` FOREIGN KEY (`idpermissionformationrole`) REFERENCES `permissionformationrole` (`idpermissionformationrole`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_roleresponsable_has_permissionformationrole_roleresponsable1` FOREIGN KEY (`idroleresponsable`) REFERENCES `roleresponsable` (`idroleresponsable`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `piecejointes`
--
ALTER TABLE `piecejointes`
  ADD CONSTRAINT `fk_piecejointes_module1` FOREIGN KEY (`idModule`) REFERENCES `module` (`idModule`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_piecejointes_typepiecejointe1` FOREIGN KEY (`idtypepiecejointe`) REFERENCES `typepiecejointe` (`idtypepiecejointe`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `plandemodule`
--
ALTER TABLE `plandemodule`
  ADD CONSTRAINT `fk_plandemodule_module1` FOREIGN KEY (`idModule`) REFERENCES `module` (`idModule`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_plandemodule_plandemodule1` FOREIGN KEY (`idpereplandemodule`) REFERENCES `plandemodule` (`idplandemodule`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `prerequits`
--
ALTER TABLE `prerequits`
  ADD CONSTRAINT `fk_prerequits_module1` FOREIGN KEY (`module_idModule`) REFERENCES `module` (`idModule`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `projethabilitation`
--
ALTER TABLE `projethabilitation`
  ADD CONSTRAINT `fk_projethabilitation_anneeuniv1` FOREIGN KEY (`idanneeuniv`) REFERENCES `anneeuniv` (`idanneeuniv`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `referentiel`
--
ALTER TABLE `referentiel`
  ADD CONSTRAINT `fk_objective_has_formations_formations1` FOREIGN KEY (`idformations`) REFERENCES `formations` (`idformations`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_objective_has_formations_objective1` FOREIGN KEY (`idobjective`) REFERENCES `objective` (`idobjective`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `referentielmodule`
--
ALTER TABLE `referentielmodule`
  ADD CONSTRAINT `fk_objective_has_module_module1` FOREIGN KEY (`idModule`) REFERENCES `module` (`idModule`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_objective_has_module_objective1` FOREIGN KEY (`idobjective`) REFERENCES `objective` (`idobjective`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `referetielplandemodule`
--
ALTER TABLE `referetielplandemodule`
  ADD CONSTRAINT `fk_competence_has_plandemodule_competence1` FOREIGN KEY (`idcompetence`) REFERENCES `competence` (`idcompetence`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_competence_has_plandemodule_plandemodule1` FOREIGN KEY (`idplandemodule`) REFERENCES `plandemodule` (`idplandemodule`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `fk_resource_activiter1` FOREIGN KEY (`idactiviter`) REFERENCES `activiter` (`idactiviter`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `roleutilisateursurformation`
--
ALTER TABLE `roleutilisateursurformation`
  ADD CONSTRAINT `fk_niveauformation_has_roleresponsable_niveauformation1` FOREIGN KEY (`idniveauformation`) REFERENCES `niveauformation` (`idniveauformation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_niveauformation_has_roleresponsable_personnes1` FOREIGN KEY (`idpersonnes`) REFERENCES `personnes` (`idpersonnes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_niveauformation_has_roleresponsable_roleresponsable1` FOREIGN KEY (`idroleresponsable`) REFERENCES `roleresponsable` (`idroleresponsable`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `scenariomoodle`
--
ALTER TABLE `scenariomoodle`
  ADD CONSTRAINT `fk_scenariomoodle_activiter1` FOREIGN KEY (`idactiviter`) REFERENCES `activiter` (`idactiviter`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_scenariomoodle_plandemodule1` FOREIGN KEY (`idplandemodule`) REFERENCES `plandemodule` (`idplandemodule`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_scenariomoodle_typeresourcemoodle1` FOREIGN KEY (`idtyperesourcemoodle`) REFERENCES `typeresourcemoodle` (`idtyperesourcemoodle`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `specialiterensignant`
--
ALTER TABLE `specialiterensignant`
  ADD CONSTRAINT `fk_specialiterensignant_enseignants1` FOREIGN KEY (`idpersonnes`) REFERENCES `enseignants` (`idpersonnes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_specialiterensignant_specialiters1` FOREIGN KEY (`idspecialiters`) REFERENCES `specialiters` (`idspecialiters`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `traveenseignantsmodule`
--
ALTER TABLE `traveenseignantsmodule`
  ADD CONSTRAINT `fk_traveaux_has_enseignantsmodule_enseignantsmodule1` FOREIGN KEY (`idpersonnes`,`idModule`,`idanneeuniv`) REFERENCES `enseignantsmodule` (`idpersonnes`, `idModule`, `idanneeuniv`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_traveaux_has_enseignantsmodule_traveaux1` FOREIGN KEY (`idtraveaux`) REFERENCES `traveaux` (`idtraveaux`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `typeformation`
--
ALTER TABLE `typeformation`
  ADD CONSTRAINT `fk_typeformation_typeformation1` FOREIGN KEY (`idpertypeformation`) REFERENCES `typeformation` (`idtypeformation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `typevalidation`
--
ALTER TABLE `typevalidation`
  ADD CONSTRAINT `fk_typevalidation_typevalidation1` FOREIGN KEY (`idperetypevalidation`) REFERENCES `typevalidation` (`idtypevalidation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
