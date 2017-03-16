<?php
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
            'Commun_Navigator' => 'Pedagogie\\Navigator\\Service\\CommunNavigationFactory',
        ],
    ],
    'navigation' => $navigation
    ,
    'view_manager' => [
        'template_map' => include COMMUN_MODULE_ROOT . '/template_map.php',
        'template_path_stack' => [
            COMMUN_MODULE_ROOT . '/view',
        ],
    ],
    'controllers' => [
        'factories' => [
            'Commun\\Formations' => 'Commun\\Controller\\FormationsControllerFactory',
        ],
    ],
    'strategies' => array(
        'ViewJsonStrategy',
    ),
    'router' => [
        'routes' => [
            'commun' => [
                'type' => 'Literal',
                'options' => [
                    'route' => '/commun',
                    'defaults' => [
                        '__NAMESPACE__' => 'Commun',
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
];