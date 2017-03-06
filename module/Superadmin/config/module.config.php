<?php
declare(strict_types = 1);
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */

$navigation=include __DIR__ . '/../navigator/nav_admin_map.php';

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
    ],'navigation' => $navigation
    ,
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