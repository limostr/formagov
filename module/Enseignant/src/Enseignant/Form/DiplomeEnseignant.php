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
 * DiplomeEnseignant
 *
 * Provides the DiplomeEnseignant form for the Enseignant Module
 *
 * @package Enseignant\Form
 */
class DiplomeEnseignant extends Form
{

    /**
     * Generate form by adding elements
     */
    public function __construct($name = null)
    {
        parent::__construct($name);
        // add form elements and form configuration here
        $this->setInputFilter(new \Enseignant\Filter\DiplomeEnseignant());
        $this->setName('EnseignantsForm');

        $this->add(
            [
                'name' => 'titrediplome',
                'type' => 'text',
                'options' => [
                    'label' => 'diplomeens_label_titrediplome',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );
        $this->add(
            [
                'name' => 'pays',
                'type' => 'Select',
                'options' => [
                    'label' => 'diplomeens_label_pays',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );
        $this->add(
            [
                'name' => 'etablissement',
                'type' => 'text',
                'options' => [
                    'label' => 'diplomeens_label_etablissement',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );
        $this->add(
            [
                'name' => 'dateobtention',
                'type' => 'text',
                'options' => [
                    'label' => 'diplomeens_label_dateobtention',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );


        $this->add(
            [
                'name' => 'specialiterdiplome',
                'type' => 'text',
                'options' => [
                    'label' => 'diplomeens_label_specialiterdiplome',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'save_diplomeens',
                'type' => 'Submit',
                'options' => [
                ],
                'attributes' => [
                    'value' => 'save_diplomeens',
                    'id' => 'save_diplomeens',
                    'class' => 'btn btn-success',
                ],
            ]
        );
    }


}
