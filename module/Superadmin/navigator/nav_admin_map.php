<?php
declare(strict_types = 1);
/**
 * Created by PhpStorm.
 * User: username
 * Date: 24/01/2017
 * Time: 12:26
 */

return  array(

    'Superadmin_Navigator' => array(
        array(
            'label'      => "Gestion des Composant d'enseignement",
            'module'     => 'superadmin',
            'controller' => 'show',
            'action'     => 'showdetailsformation',
            'pages' => array(
                array(
                    'label' => 'Details formations',
                    'module'     => 'superadmin',
                    'controller' => 'show',
                    'action'     => 'showdetailsformation',
                ),
            )
        ),
        array(
            'label'      => "Gestion des composants",
            'module'     => 'superadmin',
            'controller' => 'show',
            'action'     => 'showdetailsformation',
            'pages' => array(
                array(
                    'label' => 'Details formations',
                    'module'     => 'superadmin',
                    'controller' => 'show',
                    'action'     => 'showdetailsformation',
                ),array(
                    'label' => 'Ajouter une formation',
                    'module'     => 'superadmin',
                    'controller' => 'create',
                    'action'     => 'addformation',
                ),


            ),
        ),
    ),
);