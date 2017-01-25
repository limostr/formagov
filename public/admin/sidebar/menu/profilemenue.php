<?php
/**
 * Created by PhpStorm.
 * User: username
 * Date: 04/01/2016
 * Time: 16:57
 */

$admin = array(
    "Formation"=>array(
        "uri"=>"",
        "titre-ar"=>"Formation",
        "titre-fr"=>"Formation",
        "icone"=>array(
            "class"=>"",
            "src"=>""
        ),
        "roles"=>array("superadmin"),

        "submenus"=>array(
            "ajax"=>array(
                //menu charger par un code
            ),
            "Categorie"=>array(
                "uri"=>"gformation/adminparametrage",
                "titre-ar"=>"Categorie",
                "titre-fr"=>"Categorie",
                "icone"=>array(
                    "class"=>"",
                    "src"=>""
                ),
                "roles"=>array("superadmin"),
            ),
        )
    ),
);

