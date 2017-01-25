<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


return [
    'view_manager' => [
        'template_map' => include IDEEPROJET_MODULE_ROOT . '/template_map.php',
        'template_path_stack' => [
            IDEEPROJET_MODULE_ROOT . '/view',
        ],
    ],
    'controllers' => [
        'invokables' => [
            'Ideeprojet\\Formations' => 'Ideeprojet\\Controller\\FormationsController',
        ],
    ],
    'router' => [
        'routes' => [
            'ideeprojet' => [
                'type' => 'Literal',
                'options' => [
                    'route' => '/ideeprojet',
                    'defaults' => [
                        '__NAMESPACE__' => 'Ideeprojet',
                        'controller' => 'Formations',
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
];