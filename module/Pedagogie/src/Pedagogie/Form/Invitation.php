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
 * Invitation
 *
 * Provides the Invitation form for the Pedagogie Module
 *
 * @package Pedagogie\Form
 */
class Invitation extends Form
{

    /**
     * Generate form by adding elements
     */
    public function __construct()    {
        parent::__construct();
        $this->setAttribute('method', 'post');
        $this->add(array(
            'name' => 'email',
            'attributes' => array(
                'type'  => 'text',
                'label' => 'email :',
            ),
        ));
        $this->add(array(
            'name' => 'nom',
            'attributes' => array(
                'type'  => 'text',
                'label' => 'Nom :',
            ),
        ));

        $this->add(array(
            'name' => 'prenom',
            'attributes' => array(
                'type'  => 'text',
                'label' => 'Prenom :',
            ),
        ));

        $this->add(array(
            'name' => 'semestre',
            'attributes' => array(
                'type'  => 'select',
                'label' => 'semestre :',
            ),
        ));

        $this->add(array(
            'name' => 'anneescolaire',
            'attributes' => array(
                'type'  => 'select',
                'label' => 'anneescolaire :',
            ),
        ));


        $this->add(array(
            'name' => 'submit',
            'type' => 'Submit',
            'attributes' => array(
                'value' => 'Inviter',
                'id' => 'submitbutton',
            ),
        ));
    }


}
