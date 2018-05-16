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
 * InfoProDossierAr
 *
 * Provides the InfoProDossierAr form for the Enseignant Module
 *
 * @package Enseignant\Form
 */
class InfoProDossierAr extends Form
{

    /**
     * Generate form by adding elements
     */
    public function __construct($name = null)
    {
        parent::__construct($name);
        // add form elements and form configuration here
        $this->setInputFilter(new \Enseignant\Filter\InfoProDossierAr());
        $this->setName('EnseignantsInfoProArForm');



        $this->add(
            [
                'name' => 'idpersonnes',
                'type' => 'hidden',
                'options' => [
                    'label' => 'enseignants_label_idpersonnes',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'societer',
                'type' => 'text',
                'options' => [
                    'label' => 'InfoProEns_label_societer',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'telephonepro',
                'type' => 'text',
                'options' => [
                    'label' => 'InfoProEns_label_telephonepro',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'poste',
                'type' => 'text',
                'options' => [
                    'label' => 'InfoProEns_label_poste',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );
        $this->add(
            [
                'name' => 'fonction',
                'type' => 'text',
                'options' => [
                    'label' => 'InfoProEns_label_fonction',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );



        $this->add(
            [
                'name' => 'grade',
                'type' => 'text',
                'options' => [
                    'label' => 'InfoProEns_label_grade',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );


        $this->add(
            [
                'name' => 'save_InfoProEns',
                'type' => 'Submit',
                'options' => [
                ],
                'attributes' => [
                    'value' => 'InfoProEns_action_save',
                    'id' => 'save_InfoProEns',
                    'class' => 'btn btn-success',
                ],
            ]
        );

        // add form elements and form configuration here
    }


}
