<?php
/**
 * Created by PhpStorm.
 * User: username
 * Date: 18/01/2017
 * Time: 15:35
 */

return array(

    'default' => array(
        array(
            'label' => 'Home',
            'route' => 'home',
        ),
        array(
            'label' => 'Album',
            'route' => 'album',
            'pages' => array(
                array(
                    'label' => 'Add',
                    'route' => 'album',
                    'action' => 'add',
                ),
                array(
                    'label' => 'Edit',
                    'route' => 'album',
                    'action' => 'edit',
                ),
                array(
                    'label' => 'Delete',
                    'route' => 'album',
                    'action' => 'delete',
                ),
            ),
        ),
    ),

);