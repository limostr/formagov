<?php
declare(strict_types = 1);


return  array(
    'Virtualfactorymodel_Navigator' => array(
        array(
            'label'      => "Configuration",
            'module'     => 'Virtualfactorymodel',
            'controller' => 'factorymodel',
            'action'     => 'usine',
            'icon' => 'fa fa-building',

            'pages' => array(
                array(
                    'label' => 'Usine',
                    'module'     => 'Virtualfactorymodel',
                    'controller' => 'factorymodel',
                    'action'     => 'usine',
                    'icon' => 'fa fa-building',
                ) ,array(
                    'label' => 'Atelier',
                    'module'     => 'Virtualfactorymodel',
                    'controller' => 'factorymodel',
                    'action'     => 'atelier',
                    'icon' => 'fa fa-building',

                ) ,
                array(
                    'label' => 'Ligne production',
                    'module'     => 'Virtualfactorymodel',
                    'controller' => 'factorymodel',
                    'action'     => 'productline',
                    'icon' => 'fa fa-building',
                ) ,
                array(
                    'label' => 'Poste',
                    'module'     => 'Virtualfactorymodel',
                    'controller' => 'factorymodel',
                    'action'     => 'Poste',
                    'icon' => 'fa fa-building',
                ) ,
            ),
        ),
        array(
            'label'      => "Virtualisation de l'usine",
            'module'     => 'Virtualfactorymodel',
            'controller' => 'component',
            'action'     => 'affichercomponent',
            'icon' => 'fa fa-building',
            'pages' => array(
                array(
                    'label' => 'Composant',
                    'module'     => 'Virtualfactorymodel',
                    'controller' => 'component',
                    'action'     => 'affichercomponent',
                    'icon' => 'fa fa-building',
                ) ,
                array(
                    'label' => 'Règle',
                    'module'     => 'Virtualfactorymodel',
                    'controller' => 'rules',
                    'action'     => 'afficherregle',
                    'icon' => 'fa fa-building',
                ) ,
                array(
                    'label' => 'Processus',
                    'module'     => 'Virtualfactorymodel',
                    'controller' => 'Workflows',
                    'action'     => 'afficherprocess',
                    'icon' => 'fa fa-building',
                ) ,
            ),
        )
    ),
);