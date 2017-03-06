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
    'strategies' => array(
        'ViewJsonStrategy',
    ),
    'controllers' => [
        'invokables' => [
            'Pedagogie\\Show' => 'Pedagogie\\Controller\\ShowController',
            'Pedagogie\\Create' => 'Pedagogie\\Controller\\CreateController',
            'Pedagogie\\Update' => 'Pedagogie\\Controller\\UpdateController',
            'Pedagogie\\Delete' => 'Pedagogie\\Controller\\DeleteController',
            'Pedagogie\\Save' => 'Pedagogie\\Controller\\SaveController',
            'Pedagogie\\Dashboard' => 'Pedagogie\\Controller\\DashboardController',
            'Pedagogie\\Anneeuniv' => 'Pedagogie\\Controller\\AnneeunivController',
        ],
        'factories' => [
            
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
    'navigation' => $navigation
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
    'form_elements' => [
        'factories' => [
            
        ],
        'invokables' => [
            'pedagogieFormation' => 'Pedagogie\\Form\\Formation',
        ],
    ],
];