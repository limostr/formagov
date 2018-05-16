INSERT INTO `typeformation` (`idtypeformation`, `desctype`, `labeltype`, `labeltypear`, `labetypean`, `idpertypeformation`) VALUES (1, NULL, 'Licence Appliquée', 'Licence Appliquée', 'Licence Appliquée', NULL);
INSERT INTO `typeformation` (`idtypeformation`, `desctype`, `labeltype`, `labeltypear`, `labetypean`, `idpertypeformation`) VALUES (2, NULL, 'Domaine', 'Domaine', 'Domaine', 1);
INSERT INTO `typeformation` (`idtypeformation`, `desctype`, `labeltype`, `labeltypear`, `labetypean`, `idpertypeformation`) VALUES (3, NULL, 'Mention', 'Mention', 'Mention', 2);
INSERT INTO `typeformation` (`idtypeformation`, `desctype`, `labeltype`, `labeltypear`, `labetypean`, `idpertypeformation`) VALUES (4, NULL, 'Parcours', 'Parcours', 'Parcours', 3);
INSERT INTO `typeformation` (`idtypeformation`, `desctype`, `labeltype`, `labeltypear`, `labetypean`, `idpertypeformation`) VALUES (5, NULL, 'Licence Fondamentale', 'Licence Fondamentale', 'Licence Fondamentale', NULL);
INSERT INTO `typeformation` (`idtypeformation`, `desctype`, `labeltype`, `labeltypear`, `labetypean`, `idpertypeformation`) VALUES (6, NULL, 'Domaine', 'Domaine', 'Domaine', 5);
INSERT INTO `typeformation` (`idtypeformation`, `desctype`, `labeltype`, `labeltypear`, `labetypean`, `idpertypeformation`) VALUES (7, NULL, 'Mention', 'Mention', 'Mention', 6);
INSERT INTO `typeformation` (`idtypeformation`, `desctype`, `labeltype`, `labeltypear`, `labetypean`, `idpertypeformation`) VALUES (8, NULL, 'Parcours', 'Parcours', 'Parcours', 7);
INSERT INTO `typeformation` (`idtypeformation`, `desctype`, `labeltype`, `labeltypear`, `labetypean`, `idpertypeformation`) VALUES (9, NULL, 'Cours Libres', 'Cours Libres', 'Cours Libres', NULL);
INSERT INTO `typeformation` (`idtypeformation`, `desctype`, `labeltype`, `labeltypear`, `labetypean`, `idpertypeformation`) VALUES (10, NULL, 'Domaine', 'Domaine', 'Domaine', 9);
INSERT INTO `typeformation` (`idtypeformation`, `desctype`, `labeltype`, `labeltypear`, `labetypean`, `idpertypeformation`) VALUES (11, NULL, 'Spécialité', 'Spécialité', 'Spécialité', 10);
INSERT INTO `typeformation` (`idtypeformation`, `desctype`, `labeltype`, `labeltypear`, `labetypean`, `idpertypeformation`) VALUES (12, NULL, 'Master', 'Master', 'Master', NULL);
INSERT INTO `typeformation` (`idtypeformation`, `desctype`, `labeltype`, `labeltypear`, `labetypean`, `idpertypeformation`) VALUES (13, NULL, 'Domaine', 'Domaine', 'Domaine', 12);
INSERT INTO `typeformation` (`idtypeformation`, `desctype`, `labeltype`, `labeltypear`, `labetypean`, `idpertypeformation`) VALUES (14, NULL, 'specialite', 'specialite', 'specialite', 13);
INSERT INTO `typeformation` (`idtypeformation`, `desctype`, `labeltype`, `labeltypear`, `labetypean`, `idpertypeformation`) VALUES (15, NULL, 'Formation', 'Formation', 'Formation', NULL);
INSERT INTO `typeformation` (`idtypeformation`, `desctype`, `labeltype`, `labeltypear`, `labetypean`, `idpertypeformation`) VALUES (16, NULL, 'certificat', 'certificat', 'certificat', 15);




INSERT INTO `formations` (`idformations`, `idtypeformation`, `idpereformations`, `codeformation`, `abrev`, `Label`, `Labelar`, `description`, `codeformationuvt`, `codeformationmis`, `siteweb`, `niveau`, `modeformation`, `prixdeniveau`) VALUES
(18, '1', NULL, NULL, 'Licences', 'Licences', 'Licences', 'Licences', 'Licences', 'Licences', 'www.uvt.rnu.tn', NULL, 'Annuelle', NULL),
(20, '2', 18, NULL, 'Sciences de gestion', 'Sciences de gestion', 'Sciences de gestion', 'Sciences de gestion', 'Sciences de gestion', 'Sciences de gestion', 'www.uvt.rnu.tn', NULL, 'Annuelle', NULL),
(19, '3', 20, NULL, 'Management', 'Management', 'Management', 'Management', 'Management', 'Management', 'www.uvt.rnu.tn', NULL, 'Annuelle', NULL),
(21, '3', 20, NULL, 'Comptabilité', 'Comptabilité', 'Comptabilité', 'Comptabilité', 'Comptabilité', 'Comptabilité', 'www.uvt.rnu.tn', NULL, 'Annuelle', NULL),
(22, '4', 19, NULL, 'LAM-GPME', 'Licence Appliquée en Management ', 'LAM-GPME', 'LAM-GPME', 'LAM-GPME', 'LAM-GPME', 'LAM-GPME', NULL, 'Annuelle', NULL),
(23, '4', 19, NULL, 'LAM-MQSE', 'Licence Appliquée en Management', 'LAM-MQSE', 'LAM-MQSE', 'LAM-MQSE', 'LAM-MQSE', 'www.uvt.rnu.tn', NULL, 'Annuelle', NULL),
(24, '4', 21, NULL, 'LGC', 'Licence Fondamentale en Gestion Comptable', 'LGC', 'LGC', 'LGC', 'LGC', 'www.uvt.rnu.tn', NULL, 'Annuelle', NULL),
(25, '13', 18, NULL, 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', NULL, 'Annuelle', NULL),
(26, '3', 25, NULL, 'S.T.I.C', 'Sciences et Technologies de l''Information et de Communication', 'S.T.I.C', 'S.T.I.C', 'S.T.I.C', 'S.T.I.C', 'www.uvt.rnu.tn', NULL, 'Annuelle', NULL),
(27, '4', 26, NULL, 'LASTIC', 'Licence Appliquée en Sciences et Techniques de l''Information et de Communication ', 'Licence Appliquée en Sciences et Techniques de l''information et de Communication', 'LASTIC', 'LASTIC', 'LASTIC', 'LASTIC', NULL, 'Annuelle', NULL),
(28, '4', 26, NULL, 'EOLES', 'EOLES', 'EOLES', 'EOLES', 'EOLES', 'EOLES', 'EOLES', NULL, 'Annuelle', NULL),
(29, '12', NULL, NULL, 'Mastères', 'Mastères', 'Mastères', 'Mastères', 'Master', 'Master', 'Mastères', NULL, 'Annuelle', NULL),
(30, '13', 29, NULL, 'Télécommunications', 'Télécommunications', 'Télécommunications', 'Télécommunications', 'Télécommunications', 'Télécommunications', 'Télécommunications', NULL, 'Annuelle', NULL),
(31, '13', 29, NULL, 'Génie industriel', 'Génie industriel', 'Génie industriel', 'Génie industriel', 'Génie industriel', 'Génie industriel', 'Génie industriel', NULL, 'Annuelle', NULL),
(32, '13', 29, NULL, 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', 'Sciences et technologies', NULL, 'Annuelle', NULL),
(33, '13', 29, NULL, 'Sport et Éducation Physique', 'Sport et Éducation Physique', 'Sport et Éducation Physique', 'Sport et Éducation Physique', 'Sport', 'Sport', 'Sport et Éducation Physique', NULL, 'Annuelle', NULL),
(34, '3', 30, NULL, 'T.R.I', 'Télécommunications et Réseaux informatiques', 'Télécommunications et Réseaux informatiques', 'Télécommunications et Réseaux informatiques', 'TRI', 'TRI', 'Télécommunications et Réseaux informatiques', NULL, 'Annuelle', NULL),
(35, '4', 34, NULL, 'N2TR', 'Mastère professionnel en Nouvelles Technologies des Télécommunications et Réseaux', 'N2TR', 'N2TR', 'N2TR', 'N2TR', 'N2TR', NULL, 'Annuelle', NULL),
(36, '3', 31, NULL, 'OIE', 'Optimisation, Innovation de l''Entreprise', 'Optimisation, Innovation de l''Entreprise', 'OIE', 'OIE', 'OIE', 'OIE', NULL, 'Annuelle', NULL),
(37, '4', 36, NULL, 'MOME', 'Mastère professionnel en Optimisation et Modernisation de l’Entreprise ', 'MOME', 'MOME', 'MOME', 'MOME', 'MOME', NULL, 'Annuelle', NULL),
(38, '3', 32, NULL, 'Informatique', 'Informatique', 'Informatique', 'Informatique', 'Informatique', 'Informatique', 'Informatique', NULL, 'Annuelle', NULL),
(39, '3', 38, NULL, 'MP2L', 'Mastère professionnel en Logiciels libres : MP2L', 'MP2L', 'MP2L', 'MP2L', 'MP2L', 'MP2L', NULL, 'Annuelle', NULL),
(40, '3', 33, NULL, 'STATPS', 'STATPS', 'STATPS', 'STATPS', 'STATPS', 'STATPS', 'STATPS', NULL, 'Annuelle', NULL),
(41, '14', 40, NULL, 'MP3', 'Mastère Professionnel en Préparation Physique ', 'Mastère Professionnel en Préparation Physique ', 'MP3', 'MP3', 'MP3', 'MP3', NULL, 'Annuelle', NULL),
(42, '14', 40, NULL, 'M2P2', 'Mastère Professionnel en Préparation Mentale', 'Mastère Professionnel en Préparation Mentale', 'M2P2', 'M2P2', 'M2P2', 'M2P2', NULL, 'Annuelle', NULL),
(43, '3', 20, NULL, 'Gestion', 'Gestion', 'التصرف', 'Gestion', 'Gestion', 'Gestion', 'Gestion', NULL, 'Annuelle', NULL),
(44, '14', 43, NULL, 'LAMESN', 'Licence Appliquée en Marketing Electronique et Stratégies Numériques ', 'Licence Appliquée en Marketing Electronique et Stratégies Numériques ', 'LAMESN', 'LAMESN', 'LAMESN', 'LAMESN', NULL, 'Annuelle', NULL),
(45, '15', NULL, NULL, 'Formations', 'Formation Continues', 'Formation', 'Formation Continues', 'FC-00', 'FC-00', 'Formation', NULL, 'Planifier', NULL),
(47, '15', NULL, NULL, 'test', 'test', 'test', 'test', 'test', 'test', 'test', NULL, 'Planifier', NULL),
(46, '16', 47, NULL, 'C2i', 'C2i', 'C2i', 'C2i', 'C2i', 'C2i', 'C2i', NULL, 'Annuelle', NULL),
(48, '13', 18, NULL, 'Sciences économiques et de gestion', 'Sciences économiques et de gestion', 'Sciences économiques et de gestion', 'Sciences économiques et de gestion', 'SC-G', 'SC-G', 'Sciences économiques et de gestion', NULL, 'Annuelle', NULL),
(49, '3', 48, NULL, 'Administration des affaires', 'Administration des affaires', 'Administration des affaires', 'Administration des affaires', 'AD-AF', 'AD-AF', 'Administration des affaires', NULL, 'Annuelle', NULL),
(50, '14', 49, NULL, 'L3A-PME', 'Licence appliquée en administration des affaires: L3A-PME', 'GPME', 'GPME', 'GPME-3', 'GPME-3', 'GPME', NULL, 'Annuelle', NULL),
(51, '13', 29, NULL, 'Sciences Économiques & Gestion (SEG)', 'Sciences Économiques & Gestion (SEG)', 'SEG', 'Sciences Économiques & Gestion (SEG)', 'SCE-G-M', 'SCE-G-M', 'SEG', NULL, 'Annuelle', NULL),
(52, '3', 51, NULL, 'MI', 'Management Intégré', 'Management Intégré', 'Management intégré', 'MI-M', 'MI-M', 'Management intégré', NULL, 'Annuelle', NULL),
(53, '4', 52, NULL, 'MPQSE', 'Mastère Professionnel en Management Intégré : Qualité-Sécurité et Environnement ', 'Mastère Professionnel en Management Intégré : Qualité-Sécurité et Environnement ', 'Mastère Professionnel en Management intégré : Qualité-Sécurité et environnement ', 'MI-QSE', 'MI-QSE', 'Mastère Professionnel en Management intégré : Qualité-Sécurité et environnement ', NULL, 'Annuelle', NULL),
(54, '14', 49, NULL, 'L3A-QSE', 'Licence appliquée en administration des affaires: L3A-QSE', 'L3A-QSE', 'L3A-QSE', 'LA3-QSE', 'LA3-QSE', 'L3A-QSE', NULL, 'Annuelle', NULL),
(55, '14', 47, NULL, 'C2i', 'C2i', 'C2i', 'C2i', 'C2i-SP', 'C2i-SP', 'C2i', NULL, 'Planifier', NULL),
(56, '15', 45, NULL, 'Formation Continues', 'Formation Continues', 'Formation Continues', 'Formation Continues', 'CERTIF', 'CERTIF', 'Formation Continues', NULL, 'Planifier', NULL),
(57, '14', 56, NULL, 'C2i', 'Certificat Informatique et Internet : C2i', 'C2i', 'C2i', 'C2i', 'C2i', 'C2i', NULL, '', NULL),
(58, '14', 56, NULL, 'Anglais', 'Anglais', 'Anglais', 'Anglais', 'Anglais', 'Anglais', 'Anglais', NULL, 'Annuelle', NULL),
(59, '4', 19, NULL, 'LAM', 'Licence Appliquée en Management', 'Licence Appliquée en Management', 'Licence appliquée en management : MQSE-GPME', 'MQSE-GPME', 'MQSE-GPME', 'Licence appliquée en management : MQSE-GPME', NULL, 'Annuelle', NULL),
(60, '13', 29, NULL, 'Gestion', 'Gestion', 'Gestion', 'Gestion', 'Gestion-MPMP', 'Gestion-MPMP', 'Gestion', NULL, 'Annuelle', NULL),
(61, '3', 60, NULL, 'Management', 'Management', 'Management', 'Management', 'PMPM-MAN', 'PMPM-MAN', 'Management', NULL, 'Annuelle', NULL),
(62, '4', 61, NULL, 'MPMP', 'Management des Projets', 'Management des Projets', 'Management des Projets', 'MPMP-D', 'MPMP-D', 'Management des Projets', NULL, 'Annuelle', NULL),
(63, '14', 47, NULL, 'VAUTM', 'Validation_Anglais_UTM', 'Validation_Anglais_UTM', 'Validation_Anglais_UTM', 'UTM1', 'UTM1', 'wwv', NULL, 'Planifier', NULL);


INSERT INTO `levelformation` (`idlevelformation`, `labellevel`, `desclevel`) VALUES (1, '1ére', NULL);
INSERT INTO `levelformation` (`idlevelformation`, `labellevel`, `desclevel`) VALUES (2, '2ème', NULL);
INSERT INTO `levelformation` (`idlevelformation`, `labellevel`, `desclevel`) VALUES (3, '3ème', NULL);
INSERT INTO `levelformation` (`idlevelformation`, `labellevel`, `desclevel`) VALUES (4, '4ème', NULL);
INSERT INTO `levelformation` (`idlevelformation`, `labellevel`, `desclevel`) VALUES (5, '5ème', NULL);
INSERT INTO `levelformation` (`idlevelformation`, `labellevel`, `desclevel`) VALUES (6, '6ème', NULL);
INSERT INTO `levelformation` (`idlevelformation`, `labellevel`, `desclevel`) VALUES (7, '7ème', NULL);
INSERT INTO `levelformation` (`idlevelformation`, `labellevel`, `desclevel`) VALUES (8, '8ème', NULL);
INSERT INTO `levelformation` (`idlevelformation`, `labellevel`, `desclevel`) VALUES (9, '9ème', NULL);

INSERT INTO `niveauformation` (`idniveauformation`, `idformations`, `labelnivformation`, `pagesite`, `idlevelformation`) VALUES
(18, 27, '3ème année', '3ème année',3),
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
(53, 58, 'Test_Anglais_UTM2', 'test',  2),
(54, 58, 'Validation_Anglais_OTE13', 'test',  2),
(55, 58, 'Test_Anglais_OTE14', 'test', 3),
(56, 58, 'Validation_Anglais_UTM2', 'www.uvt.rnu.tn', 2),
(57, 58, 'Test Anglais général (OTE15)', 'www.uvt.rnu.tn', 4),
(58, 58, 'Test Anglais des affaires (OTE15)', 'www.uvt.rnu.tn', 4),
(59, 58, 'Test Communication (OTE15)', 'www.uvt.rnu.tn',  4);


INSERT INTO `periode` (`idperiode`, `idlevelformation`, `labelperiode`, `descperiode`) VALUES ('S1', 1, 'Semestre 1', NULL);
INSERT INTO `periode` (`idperiode`, `idlevelformation`, `labelperiode`, `descperiode`) VALUES ('S2', 1, 'Semestre 2', NULL);
INSERT INTO `periode` (`idperiode`, `idlevelformation`, `labelperiode`, `descperiode`) VALUES ('S3', 2, 'Semestre 3', NULL);
INSERT INTO `periode` (`idperiode`, `idlevelformation`, `labelperiode`, `descperiode`) VALUES ('S4', 2, 'Semestre 4', NULL);
INSERT INTO `periode` (`idperiode`, `idlevelformation`, `labelperiode`, `descperiode`) VALUES ('S5', 3, 'Semestre 5', NULL);
INSERT INTO `periode` (`idperiode`, `idlevelformation`, `labelperiode`, `descperiode`) VALUES ('S6', 3, 'Semestre 6', NULL);


INSERT INTO `grade` (`CGRADE`, `DESIGN`, `POIDS`) VALUES
('PE', 'Professeur Emérite', 1),
('PT', 'Professeur Technologue', 2),
('P', 'Professeur', 2),
('MC', 'Maître de Conférence ', 3),
('MT', 'Maître Technologue', 3),
('MA', 'Maître Assistant ', 4),
('A', 'Assistant ', 5),
('T', 'Technologue ', 4),
('AC', 'Assistant Contractuel ', 6),
('AT', 'Assistant Technologue', 4),
('PES', 'Professeur de l’Enseignement Secondaire ', 7),
('EV', 'Enseignant  Visiteur', 8),
('EA', 'Enseignant Associé', 9);

INSERT INTO `specialite` (`CSPEC`, `DESIGNSPEC`) VALUES
('SCE', 'Sciences du Coran et de l''Exégèse'),
('SH', 'Sciences du Hadith'),
('SR', 'Sciences Religieuses'),
('Th', 'Théologie'),
('LLCA', 'Langue, Lettres & Civilisation Arab'),
('LLCF', 'Langue, Lettres & Civilisation Fran'),
('LLCAn', 'Langue, Lettres& Civilisation Angla'),
('LLCAl', 'Langue, Lettres & Civilisation Alle'),
('LLCE', 'Langue, Lettres & Civilisation Espa'),
('LLCI', 'Langue, Lettres & Civilisation Ital'),
('LLCR', 'Langue, Lettres& Civilisation Russe'),
('LLCC', 'Langue, Lettres& Civilisation Chino'),
('LLCSO', 'Langue, Lettres& Civilisations sémi'),
('Ph', 'Philosophie'),
('SOC', 'Sociologie'),
('Hist', 'Histoire'),
('Geo', 'Géographie'),
('Psy', 'Psychologie'),
('SEDE', ' Sciences de l''éducation et didacti'),
('STT', 'Sciences de la traduction & de la t'),
('Math', 'Mathématiques'),
('MathAp', 'Mathématiques Appliquées'),
('Phys', 'Physique'),
('INFO', 'Informatique'),
('CH', 'Chimie'),
('ScBio', 'Sciences Biologiques'),
('SCGeo', 'Sciences Géologiques '),
('DBiAr', 'Documentation, Bibliothéconomie & A'),
('ScCul', 'Sciences Culturelles'),
('Music', 'Musique & Musicologie'),
('ScInfo', 'Sciences de l''information'),
('GMec', 'Génie Mécanique'),
('GCiv', 'Génie Civil'),
('GChim', 'Génie chimique'),
('GIND', 'Génie Industriel'),
('GELEC', 'Génie Électrique'),
('GBIO', 'Génie Biologique'),
('GHyd', 'Génie Hydraulique'),
('GTEXT', 'Génie Textile'),
('TELECO', 'Télécommunications '),
('RESINF', 'Réseaux Informatiques'),
('STL', 'Sciences Transport et Logistique'),
('SCGEST', 'Sciences de Gestion'),
('MFC', 'Méthode Finan. et comptables'),
('MQ', 'Méthodes Quantitatives'),
('InfGes', 'Informatique de Gestion'),
('ScEco', 'Sciences Economiques'),
('DPSC', 'Droit Privé & Sciences Criminelles'),
('DPub', 'Droit Public'),
('ScTrav', 'Sciences du Travail'),
('BioPhy', 'Biophysique'),
('ScPhar', 'Sciences pharmaceutiques'),
('SBP', 'Sciences biologiques pharmaceutique'),
('AM', 'Art & Métiers'),
('HISTAR', 'Histoire de l''Art'),
('STA', 'Sciences & Techniques des Arts'),
('ARCH', 'Architecture'),
('AP', 'Arts Plastiques'),
('URB', 'Urbanisme'),
('STAVC', 'Sc. tech. Aud. Visu. cinéma'),
('STD', 'Sciences & Technologies du Design'),
('SPABS', ' Sciences Biologiques aux Activités'),
('SHAPS', 'Sciences Humaines aux Activités Phy'),
('DAPS', 'Didactique des Activités Physiques ');