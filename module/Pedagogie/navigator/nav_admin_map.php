<?php
/**
 * Created by PhpStorm.
 * User: username
 * Date: 24/01/2017
 * Time: 12:26
 */

return  array(
    'default' => array(

        array(

            'label'      => "Formation",
            'module'     => 'pedagogie',
            'controller' => 'show',
            'action'     => 'showdetailsformation',
            'pages' => array(
                array(
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
);