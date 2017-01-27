<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


return [
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
];