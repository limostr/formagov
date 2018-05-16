<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


return [
    'view_manager' => [
        'template_map' => include SEMSEM_MODULE_ROOT . '/template_map.php',
        'template_path_stack' => [
            SEMSEM_MODULE_ROOT . '/view',
        ],
    ],
    'controllers' => [
        'factories' => [
            'Semsem\\Gestfichestage' => 'Semsem\\Controller\\GestfichestageControllerFactory',
        ],
    ],
];