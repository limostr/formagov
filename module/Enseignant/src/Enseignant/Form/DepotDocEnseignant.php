<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


namespace Enseignant\Form;

use Zend\Form\Form;

/**
 * DepotDocEnseignant
 *
 * Provides the DepotDocEnseignant form for the Enseignant Module
 *
 * @package Enseignant\Form
 */
class DepotDocEnseignant extends Form
{

    /**
     * Generate form by adding elements
     */
    public function __construct($name = null)
    {
        parent::__construct($name);
        $this->setInputFilter(new \Enseignant\Filter\DepotDocEnseignant());
        $this->setName('EnseignantsForm');
        // add form elements and form configuration here

        $this->add(
            [
                'name' => 'doctype',
                'type' => 'select',
                'options' => [
                    'label' => 'derpot_enseignants_label_doctype',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );
        $this->add(
            [
                'name' => 'titredoc',
                'type' => 'text',
                'options' => [
                    'label' => 'derpot_enseignants_label_titredoc',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );
        $this->add(
            [
                'name' => 'docdesc',
                'type' => 'textarea',
                'options' => [
                    'label' => 'derpot_enseignants_label_docdesc',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'obligatoire',
                'type' => 'checkbox',
                'options' => [
                    'label' => 'derpot_enseignants_label_obligatoire',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );
        $this->add(
            [
                'name' => 'save_Doc',
                'type' => 'Submit',
                'options' => [
                ],
                'attributes' => [
                    'value' => 'derpot_enseignants_action_save',
                    'id' => 'id_derpot_enseignants',
                    'class' => 'btn btn-success',
                ],
            ]
        );
     }


}
