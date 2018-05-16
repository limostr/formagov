<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


namespace Pedagogie\Form;

use Zend\Form\Form;
use Zend\Form\Element;

/**
 * PeriodeFormation
 *
 * Provides the PeriodeFormation form for the Pedagogie Module
 *
 * @package Pedagogie\Form
 */
class PeriodeFormation extends Form
{

    public function __construct()    {
        parent::__construct();
        $this->setAttribute('method', 'post');
        $this->add(array(
            'name' => 'debutsemaine',
            'attributes' => array(
                'type'  => 'text',
                'label' => 'PeriodeFormation_Num_Semaine_Debut',
            ),
        ));
        $this->add(array(
            'name' => 'finsemaine',
            'attributes' => array(
                'type'  => 'text',
                'label' => 'PeriodeFormation_Num_Semaine_Fin',
            ),
        ));

        $this->add(array(
            'name' => 'debutperiode',
            'attributes' => array(
                'type'  => 'date',
                'label' => 'PeriodeFormation_Date_Debut',
            ),
        ));

        $this->add(array(
            'name' => 'finperiode',
            'attributes' => array(
                'type'  => 'date',
                'label' => 'PeriodeFormation_Date_Fin',
            ),
        ));

        $this->add(array(
            'name' => 'utiliser',
            'type'  => 'checkbox',
            'attributes' => array(
                'label' => 'PeriodeFormation_Periode_Non_Utiliser',
            ),
        ));




        $this->add(array(
            'name' => 'submit',
            'type' => 'Submit',
            'attributes' => array(
                'value' => 'Modifier',
                'id' => 'submitbutton',
            ),
        ));
    }


}
