<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


return [
    'service_manager' => array(
        'factories' => array(
            'navigation' => 'Zend\Navigation\Service\DefaultNavigationFactory', // <-- add this
        ),
    ),
    'view_manager' => [
        'template_map' => include PEDAGOGIE_MODULE_ROOT . '/template_map.php',
        'template_path_stack' => [
            PEDAGOGIE_MODULE_ROOT . '/view',

        ],

    ],
    'controllers' => [
        'invokables' => [
            'Pedagogie\\Show' => 'Pedagogie\\Controller\\ShowController',
            'Pedagogie\\Create' => 'Pedagogie\\Controller\\CreateController',
            'Pedagogie\\Update' => 'Pedagogie\\Controller\\UpdateController',
            'Pedagogie\\Delete' => 'Pedagogie\\Controller\\DeleteController',
            'Pedagogie\\Save' => 'Pedagogie\\Controller\\SaveController',
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
    'navigation' =>   include PEDAGOGIE_MODULE_ROOT . '/navigator/nav_admin_map.php',
    'translator' => array(
        'locale' => 'fr_FR',
        'translation_file_patterns' => array(
            array(
                'type'     => 'phpArray',
                'base_dir' => __DIR__ . '/../language',
                'pattern'  => '%s.php',
            ),
        ),
    ),
    'form_elements' => [
        'factories' => [

        ],
        'invokables' => [
            'pedagogieFormation' => 'Pedagogie\\Form\\Formation',
        ],
    ],
];