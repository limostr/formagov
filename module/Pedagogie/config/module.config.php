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
            'Pedagogie_Navigator' => 'Pedagogie\\Navigator\\Service\\PedagogieNavigationFactory',
        ],
    ],
    'view_manager' => [
        'template_map' => include PEDAGOGIE_MODULE_ROOT . '/template_map.php',
        'template_path_stack' => [
            PEDAGOGIE_MODULE_ROOT . '/view',
        ],
    ],
    'strategies' => [
        'ViewJsonStrategy',
    ],
    'controllers' => [
        'invokables' => [
            'Pedagogie\\Show' => 'Pedagogie\\Controller\\ShowController',
            'Pedagogie\\Create' => 'Pedagogie\\Controller\\CreateController',
            'Pedagogie\\Update' => 'Pedagogie\\Controller\\UpdateController',
            'Pedagogie\\Delete' => 'Pedagogie\\Controller\\DeleteController',
            'Pedagogie\\Save' => 'Pedagogie\\Controller\\SaveController',
            'Pedagogie\\Dashboard' => 'Pedagogie\\Controller\\DashboardController',
            'Pedagogie\\Anneeuniv' => 'Pedagogie\\Controller\\AnneeunivController',
            'Pedagogie\\Config' => 'Pedagogie\\Controller\\ConfigController',
        ],
        'factories' => [
            'Pedagogie\\Calendrier' => 'Pedagogie\\Controller\\CalendrierControllerFactory',
            'Pedagogie\\Moduleens' => 'Pedagogie\\Controller\\ModuleensControllerFactory',
            'Pedagogie\\Habilitation' => 'Pedagogie\\Controller\\HabilitationControllerFactory',
            'Pedagogie\\Enseignants' => 'Pedagogie\\Controller\\EnseignantsControllerFactory',
        ],
    ],
    'router' => [
        'routes' => [
            'pedagogie' => [
                'type' => 'Literal',
                'options' => [
                    'route' => '/pedagogie',
                    'defaults' => [
                        '__NAMESPACE__' => 'Pedagogie',
                        'controller' => 'Show',
                        'action' => 'index',
                    ],
                ],
                'may_terminate' => true,
                'child_routes' => [
                    'controller-action' => [
                        'type' => 'segment',
                        'options' => [
                            'route' => '/:controller[/:action[/:id/[:id2]]]',
                            'constraints' => [
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id' => '[0-9A-Za-z_-]*',
                                'id2' => '[0-9A-Za-z_-]*',
                            ],
                        ],
                    ],
                ],
            ],
        ],
    ],
    'navigation' => [
        'Pedagogie_Navigator' => [
            [
                'label' => 'Habilitation formation',
                'module' => 'pedagogie',
                'controller' => 'show',
                'action' => 'listeformations',
                'icon' => 'fa fa-building',
                'pages' => [
                    [
                        'label' => 'Liste formations',
                        'module' => 'pedagogie',
                        'controller' => 'show',
                        'action' => 'listeformations',
                        'icon' => 'fa fa-building',
                    ],
                    [
                        'label' => 'Details formations',
                        'module' => 'pedagogie',
                        'controller' => 'show',
                        'action' => 'showdetailsformation',
                        'icon' => 'fa fa-building',
                        'visible' => false,
                    ],
                    [
                        'label' => 'Ajouter une formation',
                        'module' => 'pedagogie',
                        'controller' => 'create',
                        'action' => 'addformation',
                        'icon' => 'fa fa-building',
                    ],
                ],
            ],
            [
                'label' => 'Gestion des formations',
                'module' => 'pedagogie',
                'controller' => 'show',
                'action' => 'whowtreeformation',
                'icon' => 'fa fa-building',
            ],
            [
                'label' => 'Administration & configuration',
                'module' => 'pedagogie',
                'controller' => 'config',
                'action' => 'tableaudesfonctions',
                'icon' => 'fa fa-building',
                'pages' => [
                    [
                        'label' => 'Ajouter un Model de formation',
                        'module' => 'pedagogie',
                        'controller' => 'create',
                        'action' => 'addformation',
                        'icon' => 'fa fa-building',
                    ],
                ],
            ],
            [
                'label' => 'Année Universitaire',
                'module' => 'pedagogie',
                'controller' => 'anneeuniv',
                'action' => 'calendrierpedagogie',
                'icon' => 'fa fa-building',
                'pages' => [
                    [
                        'label' => 'Calendrier',
                        'module' => 'pedagogie',
                        'controller' => 'Calendrier',
                        'action' => 'calendrierglobal',
                        'icon' => 'fa fa-building',
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
            'pedagogieInvitation' => 'Pedagogie\\Form\\InvitationFactory',
            'pedagogieInvitationCoordination' => 'Pedagogie\\Form\\InvitationCoordinationFactory',
            'pedagogiePeriodeFormation' => 'Pedagogie\\Form\\PeriodeFormationFactory',
        ],
        'invokables' => [
            'pedagogieFormation' => 'Pedagogie\\Form\\Formation',
        ],
    ],
];