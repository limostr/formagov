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
        ],
    ],
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
            'Pedagogie\\Dashboard' => 'Pedagogie\\Controller\\DashboardController',
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
    'navigation' => array(
        'default' => array(

            array(
                'label'      => "Formation",
                'module'     => 'pedagogie',
                'controller' => 'show',
                'action'     => 'listeformations',
                'pages' => array(
                    array(
                        'label' => 'Liste formations',
                        'module'     => 'pedagogie',
                        'controller' => 'show',
                        'action'     => 'listeformations',
                    ),array(
                        'label' => 'Details formations',
                        'module'     => 'pedagogie',
                        'controller' => 'show',
                        'action'     => 'showdetailsformation',
                    ),array(
                        'label' => 'Ajouter une formation',
                        'module'     => 'pedagogie',
                        'controller' => 'create',
                        'action'     => 'addformation',
                    ),

                ),
            ),
        ),
    ),
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