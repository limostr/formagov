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
 * CompteUtilisateur
 *
 * Provides the CompteUtilisateur form for the Enseignant Module
 *
 * @package Enseignant\Form
 */
class CompteUtilisateur extends Form
{

    /**
     * Generate form by adding elements
     */
    public function __construct($name = null)
    {
        parent::__construct($name);
        $this->setInputFilter(new \Enseignant\Filter\CompteUtilisateur());
        $this->setName('EnseignantsForm');
        // add form elements and form configuration here
        $this->add(
            [
                'name' => 'email',
                'type' => 'email',
                'options' => [
                    'label' => 'enseignants_label_email',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );


        $this->add(
        [
            'name' => 'motdepass',
            'type' => 'password',
            'options' => [
                'label' => 'enseignants_label_motdepass',
            ],
            'attributes' => [
                'class' => 'form-control',
            ],
        ]
    );
        $this->add(
            [
                'name' => 'confirmmotdepass',
                'type' => 'password',
                'options' => [
                    'label' => 'enseignants_label_motdepass',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );
        $this->add(
            [
                'name' => 'save_compte',
                'type' => 'Submit',
                'options' => [
                ],
                'attributes' => [
                    'value' => 'enseignants_action_save',
                    'id' => 'save_enseignants',
                    'class' => 'btn btn-success',
                ],
            ]
        );
    }


}
