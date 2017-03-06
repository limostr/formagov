<?php
declare(strict_types = 1);
/**
 * Created by PhpStorm.
 * User: username
 * Date: 24/01/2017
 * Time: 12:26
 */

return  array(
    'default' => array(
        array( 'label'      => "Mon profile",
            'module'     => 'enseignant',
            'controller' => 'show',
            'action'     => 'showcv',)
    ),
    'Enseignant_Navigator' => array(
        array(

            'label'      => "Mon profile",
            'module'     => 'enseignant',
            'controller' => 'show',
            'action'     => 'showcv',
            'pages' => array(
                array(
                    'label' => 'Mon CV',
                    'module'     => 'enseignant',
                    'controller' => 'show',
                    'action'     => 'showcv',
                ),array(
                    'label' => 'Modifier Mon CV',
                    'module'     => 'enseignant',
                    'controller' => 'show',
                    'action'     => 'gestioncv',
                ),


            ),
        ),
    ),
);