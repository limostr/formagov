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
            'Superadmin_Navigator' => 'Superadmin\\Navigator\\Service\\SuperadminNavigationFactory',
        ],
    ],
    'view_manager' => [
        'template_map' => include SUPERADMIN_MODULE_ROOT . '/template_map.php',
        'template_path_stack' => [
            SUPERADMIN_MODULE_ROOT . '/view',
        ],
    ],
    'controllers' => [
        'factories' => [
            
        ],
        'invokables' => [
            'Superadmin\\Gestcompeval' => 'Superadmin\\Controller\\GestcompevalController',
            'Superadmin\\Gestcompens' => 'Superadmin\\Controller\\GestcompensController',
            'Superadmin\\Gestcompactprat' => 'Superadmin\\Controller\\GestcompactpratController',
            'Superadmin\\Formoxiliaire' => 'Superadmin\\Controller\\FormoxiliaireController',
        ],
    ],
    'router' => [
        'routes' => [
            'superadmin' => [
                'type' => 'Literal',
                'options' => [
                    'route' => '/superadmin',
                    'defaults' => [
                        '__NAMESPACE__' => 'Superadmin',
                        'controller' => 'Gestcompens',
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
        'Superadmin_Navigator' => [
            [
                'label' => 'Gestion des Composant d\'enseignement',
                'module' => 'superadmin',
                'controller' => 'show',
                'action' => 'showdetailsformation',
                'pages' => [
                    [
                        'label' => 'Details formations',
                        'module' => 'superadmin',
                        'controller' => 'show',
                        'action' => 'showdetailsformation',
                    ],
                ],
            ],
            [
                'label' => 'Gestion des composants',
                'module' => 'superadmin',
                'controller' => 'show',
                'action' => 'showdetailsformation',
                'pages' => [
                    [
                        'label' => 'Details formations',
                        'module' => 'superadmin',
                        'controller' => 'show',
                        'action' => 'showdetailsformation',
                    ],
                    [
                        'label' => 'Ajouter une formation',
                        'module' => 'superadmin',
                        'controller' => 'create',
                        'action' => 'addformation',
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
];