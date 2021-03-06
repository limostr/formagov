<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


return [
    'view_manager' => [
        'template_map' => include SCOLARITE_MODULE_ROOT . '/template_map.php',
        'template_path_stack' => [
            SCOLARITE_MODULE_ROOT . '/view',
        ],
    ],
    'controllers' => [
        'factories' => [
            'Scolarite\\Etudiants' => 'Scolarite\\Controller\\EtudiantsControllerFactory',
        ],
    ],
];