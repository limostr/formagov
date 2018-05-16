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
 * CreateCompte
 *
 * Provides the CreateCompte form for the Enseignant Module
 *
 * @package Enseignant\Form
 */
class CreateCompte extends Form
{

    /**
     * Generate form by adding elements
     */
    public function __construct($name = null)
    {
        parent::__construct($name);
        //$this->setInputFilter(new \Enseignant\Filter\CompteUtilisateur());
        $this->setName('EnseignantsForm');
        // add form elements and form configuration here

        $this->add(
            [
                'name' => 'cin',
                'type' => 'text',
                'options' => [
                    'label' => 'enseignants_label_cin',
                ],
                'attributes' => [
                    'class' => 'form-control',
                    'id'=>'cin',
                ],
            ]
        );



        $this->add(
            [
                'name' => 'nom',
                'type' => 'text',
                'options' => [
                    'label' => 'enseignants_label_nom',
                ],
                'attributes' => [
                    'class' => 'form-control',
                    'id'=>'nom',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'prenom',
                'type' => 'text',
                'options' => [
                    'label' => 'enseignants_label_prenom',
                ],
                'attributes' => [
                    'class' => 'form-control',
                    'id'=>'prenom',
                ],
            ]
        );
        $this->add(
            [
                'name' => 'email',
                'type' => 'email',
                'options' => [
                    'label' => 'enseignants_label_email',
                ],
                'attributes' => [
                    'class' => 'form-control validate[required,custom[email]]',
                    'id'=>'email',
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
                    'id'=>'motdepass',
                ],
            ]
        );
        $this->add(
            [
                'name' => 'confirmmotdepass',
                'type' => 'password',
                'options' => [
                    'label' => 'enseignants_label_confirmer_motdepass',
                ],
                'attributes' => [
                    'class' => 'form-control validate[required,equals[motdepass]]',
                    'id'=>'confirmmotdepass',
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
                    'value' => 'enseignants_submit_compte_creation',
                    'id' => 'enseignants_submit_compte_creation',
                    'class' => 'btn btn-success',
                ],
            ]
        );
    }


}
