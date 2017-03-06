<?php
declare(strict_types = 1);
/**
 * Created by PhpStorm.
 * User: username
 * Date: 24/01/2017
 * Time: 12:26
 */

return  array(
    'Pedagogie_Navigator' => array(

        array(
            'label'      => "Habilitation formation",
            'module'     => 'pedagogie',
            'controller' => 'show',
            'action'     => 'listeformations',
            'icon' => 'fa fa-building',
            'pages' => array(
                array(
                    'label' => 'Liste formations',
                    'module'     => 'pedagogie',
                    'controller' => 'show',
                    'action'     => 'listeformations',
                    'icon' => 'fa fa-building',
                ),array(
                    'label' => 'Details formations',
                    'module'     => 'pedagogie',
                    'controller' => 'show',
                    'action'     => 'showdetailsformation',
                    'icon' => 'fa fa-building',
                    'visible' => false,
                ),array(
                    'label' => 'Ajouter une formation',
                    'module'     => 'pedagogie',
                    'controller' => 'create',
                    'action'     => 'addformation',
                    'icon' => 'fa fa-building',
                ),


            ),
        ),
        array(
            'label'      => "Gestion des formations",
            'module'     => 'pedagogie',
            'controller' => 'show',
            'action'     => 'whowtreeformation',
            'icon' => 'fa fa-building',
        ),
        array(
            'label'      => "Année Universitaire",
            'module'     => 'pedagogie',
            'controller' => 'anneeuniv',
            'action'     => 'Listeformations',
            'icon' => 'fa fa-building',
            ),
    ),
);