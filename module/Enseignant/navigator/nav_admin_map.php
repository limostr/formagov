<?php
declare(strict_types = 1);
/**
 * Created by PhpStorm.
 * User: username
 * Date: 24/01/2017
 * Time: 12:26
 */

return [
    [
        'label' => 'Mon profile',
        'module' => 'enseignant',
        'controller' => 'show',
        'action' => 'showcv',
        'pages' => [
            [
                'label' => 'Mon CV',
                'module' => 'enseignant',
                'controller' => 'show',
                'action' => 'showcv',
            ],
            [
                'label' => 'Modifier Mon CV',
                'module' => 'enseignant',
                'controller' => 'show',
                'action' => 'gestioncv',
            ],[
                'label' => 'Modifier Mes information pro',
                'module' => 'enseignant',
                'controller' => 'show',
                'action' => 'gestioncv',
            ],
        ],
    ],
];