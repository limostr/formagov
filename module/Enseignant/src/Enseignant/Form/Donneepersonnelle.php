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
 * Donneepersonnelle
 *
 * Provides the Donneepersonnelle form for the Enseignant Module
 *
 * @package Enseignant\Form
 */
class Donneepersonnelle extends Form
{

    /**
     * Generate form by adding elements
     */
    public function __construct($name = null)
    {
        parent::__construct($name);
        // add form elements and form configuration here
        $this->setInputFilter(new \Enseignant\Filter\Donneepersonnelle());
        $this->setName('EnseignantsForm');

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
                'name' => 'cin',
                'type' => 'text',
                'options' => [
                    'label' => 'enseignants_label_cin',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );
        $this->add(
            [
                'name' => 'datelivrecin',
                'type' => 'date',
                'options' => [
                    'label' => 'enseignants_label_livrerle',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );
        $this->add(
            [
                'name' => 'matricule',
                'type' => 'text',
                'options' => [
                    'label' => 'enseignants_label_matricule',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );
        $this->add(
            [
                'name' => 'typematricule',
                'type' => 'Select',
                'options' => [
                    'label' => 'enseignants_label_type_matricule',
                    'value_options' => array(
                        'CNSS' => 'CNSS',
                        'CNRPS' => 'CNRPS',
                    ),
                ],
                'attributes' => [
                    'class' => 'form-control',
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
                ],
            ]
        );



        $this->add(
            [
                'name' => 'civilite',
                'type' => 'radio',
                'options' => [
                    'label' => 'enseignants_label_civilite',
                    'value_options' => array(
                        'Homme' => 'Homme',
                        'Femme' => 'Femme',
                    ),
                ],

            ]
        );

        $this->add(
            [
                'name' => 'datedenaissance',
                'type' => 'date',
                'options' => [
                    'label' => 'enseignants_label_datedenaissance',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'lieudenaissance',
                'type' => 'text',
                'options' => [
                    'label' => 'enseignants_label_lieudenaissance',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'rib',
                'type' => 'text',
                'options' => [
                    'label' => 'enseignants_label_rib',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'telportable',
                'type' => 'text',
                'options' => [
                    'label' => 'enseignants_label_tel_mobile',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );
        $this->add(
            [
                'name' => 'telfix',
                'type' => 'text',
                'options' => [
                    'label' => 'enseignants_label_tel_fix',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );
        $this->add(
            [
                'name' => 'codepostal',
                'type' => 'text',
                'options' => [
                    'label' => 'enseignants_label_codepostal',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );
        $this->add(
            [
                'name' => 'pays',
                'type' => 'text',
                'options' => [
                    'label' => 'enseignants_label_pays',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );
        $this->add(
            [
                'name' => 'ville',
                'type' => 'text',
                'options' => [
                    'label' => 'enseignants_label_ville',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );
        $this->add(
            [
                'name' => 'adress',
                'type' => 'textarea',
                'options' => [
                    'label' => 'enseignants_label_adress',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );




        $this->add(
            [
                'name' => 'save_enseignants',
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
