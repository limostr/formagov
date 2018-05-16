<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


return [
    'router' => [
        'routes' => [
            'home' => [
                'type' => 'Zend\\Mvc\\Router\\Http\\Literal',
                'options' => [
                    'route' => '/',
                    'defaults' => [
                        'controller' => 'Application\\Controller\\Index',
                        'action' => 'index',
                    ],
                ],
            ],
            'login' => [
                'type' => 'Zend\\Mvc\\Router\\Http\\Literal',
                'options' => [
                    'route' => '/login',
                    'defaults' => [
                        '__NAMESPACE__' => 'Application',
                        'controller' => 'Authentification',
                        'action' => 'login',
                    ],
                ],
            ],
            'logout' => [
                'type' => 'Zend\\Mvc\\Router\\Http\\Literal',
                'options' => [
                    'route' => '/logout',
                    'defaults' => [
                        '__NAMESPACE__' => 'Application',
                        'controller' => 'Authentification',
                        'action' => 'logout',
                    ],
                ],
            ],
            'permission-denied' => [
                'type' => 'Zend\\Mvc\\Router\\Http\\Literal',
                'options' => [
                    'route' => '/permission-denied',
                    'defaults' => [
                        '__NAMESPACE__' => 'Application',
                        'controller' => 'Authentification',
                        'action' => 'permission-denied',
                    ],
                ],
            ],
            'application' => [
                'type' => 'Literal',
                'options' => [
                    'route' => '/application',
                    'defaults' => [
                        '__NAMESPACE__' => 'Application',
                        'controller' => 'Controller\\Authentification',
                        'action' => 'login',
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
    'service_manager' => [
        'abstract_factories' => [
            'Zend\\Cache\\Service\\StorageCacheAbstractServiceFactory',
            'Zend\\Log\\LoggerAbstractServiceFactory',
        ],
        'factories' => [
            'translator' => 'Zend\\Mvc\\Service\\TranslatorServiceFactory',
            'ACLUniv' => 'university\\Acl\\AclModelFactory',
            'GenericParams' => 'university\\Params\\GeniricParamsFactory',
        ],
    ],
    'translator' => [
        'locale' => 'en_US',
        'translation_file_patterns' => [
            [
                'type' => 'gettext',
                'base_dir' => __DIR__ . '/../language',
                'pattern' => '%s.mo',
            ],
        ],
    ],
    'controllers' => [
        'invokables' => [
            'Application\\Controller\\Index' => 'Application\\Controller\\IndexController',
        ],
        'factories' => [
            'Application\\Authentification' => 'Application\\Controller\\AuthentificationControllerFactory',
            'Application\\Menus' => 'Application\\Controller\\MenusControllerFactory',
        ],
    ],
    'view_manager' => [
        'display_not_found_reason' => true,
        'display_exceptions' => true,
        'doctype' => 'HTML5',
        'not_found_template' => 'error/404',
        'exception_template' => 'error/index',
        'template_map' => include APPLICATION_MODULE_ROOT . '/template_map.php',
        'template_path_stack' => [
            __DIR__ . '/../view',
        ],
    ],
    'console' => [
        'router' => [
            'routes' => [
                
            ],
        ],
    ],
];