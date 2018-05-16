<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


return [
    'service_manager' => [
        'factories' => [
            'navigation' => 'Zend\\Navigation\\Service\\DefaultNavigationFactory',
            'Enseignant_Navigator' => 'Enseignant\\Navigator\\Service\\EnseignantNavigationFactory',

        ],
    ],
    'view_manager' => [
        'template_map' => include ENSEIGNANT_MODULE_ROOT . '/template_map.php',
        'template_path_stack' => [
            ENSEIGNANT_MODULE_ROOT . '/view',
        ],
    ],
    'controllers' => [
        'invokables' => [
            'Enseignant\\Create' => 'Enseignant\\Controller\\CreateController',
            'Enseignant\\Show' => 'Enseignant\\Controller\\ShowController',
        ],
        'factories' => [
            'Enseignant\\Save' => 'Enseignant\\Controller\\SaveControllerFactory',
            'Enseignant\\MonCompte' => 'Enseignant\\Controller\\MonCompteControllerFactory',
            'Enseignant\\MesInvitations' => 'Enseignant\\Controller\\MesInvitationsControllerFactory',
            'Enseignant\\Tutorat' => 'Enseignant\\Controller\\TutoratControllerFactory',
            'Enseignant\\Coordination' => 'Enseignant\\Controller\\CoordinationControllerFactory',
        ],
    ],
    'router' => [
        'routes' => [
            'enseignant' => [
                'type' => 'Literal',
                'options' => [
                    'route' => '/enseignant',
                    'defaults' => [
                        '__NAMESPACE__' => 'Enseignant',
                        'controller' => 'Create',
                        'action' => 'index',
                    ],
                ],
                'may_terminate' => true,
                'child_routes' => [
                    'controller-action' => [
                        'type' => 'segment',
                        'options' => [
                            'route' => '/:controller[/:action[/:id]]',
                            'constraints' => [
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id' => '[0-9_-]*',
                            ],
                        ],
                    ],
                ],
            ],
        ],
    ],
    'navigation' => [
        'default' => [
            [
                'label' => 'Mon profile',
                'module' => 'enseignant',
                'controller' => 'show',
                'action' => 'showcv',
            ],
        ],
        'Enseignant_Navigator' => [
            [
                'label' => 'Mon profile',
                'module' => 'enseignant',
                'controller' => 'show',
                'action' => 'showcv',
                'pages' => [
                    [
                        'label' => 'Mon CV',
                        'module' => 'enseignant',
                        'controller' => 'show',
                        'action' => 'showcv',
                    ],
                    [
                        'label' => 'Modifier Mon CV',
                        'module' => 'enseignant',
                        'controller' => 'show',
                        'action' => 'gestioncv',
                    ],
                    [
                        'label' => 'Modifier Mes information pro',
                        'module' => 'enseignant',
                        'controller' => 'show',
                        'action' => 'gestioncv',
                    ],
                ],
            ],
        ],
    ],
    'translator' => [
        'locale' => 'fr_FR',
        'translation_file_patterns' => [
            [
                'type' => 'phpArray',
                'base_dir' => __DIR__ . '/../language',
                'pattern' => '%s.php',
            ],
        ],
    ],
    'form_elements' => [
        'factories' => [
            'enseignantDonneepersonnelle' => 'Enseignant\\Form\\DonneepersonnelleFactory',
            'enseignantGradeEnseignant' => 'Enseignant\\Form\\GradeEnseignantFactory',
            'enseignantSpecialiteEnseignant' => 'Enseignant\\Form\\SpecialiteEnseignantFactory',
            'enseignantDonneePersoAr' => 'Enseignant\\Form\\DonneePersoArFactory',
            'enseignantCompteUtilisateur' => 'Enseignant\\Form\\CompteUtilisateurFactory',
            'enseignantDiplomeEnseignant' => 'Enseignant\\Form\\DiplomeEnseignantFactory',
            'enseignantInfoProDossier' => 'Enseignant\\Form\\InfoProDossierFactory',
            'enseignantInfoProDossierAr' => 'Enseignant\\Form\\InfoProDossierArFactory',
            'enseignantDepotDocEnseignant' => 'Enseignant\\Form\\DepotDocEnseignantFactory',
            'enseignantInviterCoordinateur' => 'Enseignant\\Form\\InviterCoordinateurFactory',
            'enseignantCreateCompte' => 'Enseignant\\Form\\CreateCompteFactory',
        ],
    ],
    'filters' => [
        'factories' => [
            'enseignantDonneepersonnelle' => 'Enseignant\\Filter\\DonneepersonnelleFactory',
            'enseignantGradeEnseignant' => 'Enseignant\\Filter\\GradeEnseignantFactory',
            'enseignantSpecialiteEnseignant' => 'Enseignant\\Filter\\SpecialiteEnseignantFactory',
            'enseignantDonneePersoAr' => 'Enseignant\\Filter\\DonneePersoArFactory',
            'enseignantCompteUtilisateur' => 'Enseignant\\Filter\\CompteUtilisateurFactory',
            'enseignantDiplomeEnseignant' => 'Enseignant\\Filter\\DiplomeEnseignantFactory',
            'enseignantInfoProDossier' => 'Enseignant\\Filter\\InfoProDossierFactory',
            'enseignantInfoProDossierAr' => 'Enseignant\\Filter\\InfoProDossierArFactory',
            'enseignantDepotDocEnseignant' => 'Enseignant\\Filter\\DepotDocEnseignantFactory',
            'enseignantInviterCoordinateur' => 'Enseignant\\Filter\\InviterCoordinateurFactory',
            'enseignantCreateCompte' => 'Enseignant\\Filter\\CreateCompteFactory',
        ],
    ],
];