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
 * InfoProDossier
 *
 * Provides the InfoProDossier form for the Enseignant Module
 *
 * @package Enseignant\Form
 */
class InfoProDossier extends Form
{

    /**
     * Generate form by adding elements
     */
    public function __construct($name = null)
    {
        parent::__construct($name);
        // add form elements and form configuration here
        $this->setInputFilter(new \Enseignant\Filter\InfoProDossier());
        $this->setName('EnseignantsInfoProForm');

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
                'name' => 'daterecrutement',
                'type' => 'date',
                'options' => [
                    'label' => 'InfoProEns_label_daterecrutement',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'datefin',
                'type' => 'date',
                'options' => [
                    'label' => 'InfoProEns_label_datefin',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );


        $this->add(
            [
                'name' => 'adresspro',
                'type' => 'textarea',
                'options' => [
                    'label' => 'InfoProEns_label_adresspro',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );
        $this->add(
            [
                'name' => 'descposte',
                'type' => 'textarea',
                'options' => [
                    'label' => 'InfoProEns_label_descposte',
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
                    'label' => 'InfoProEns_label_ville',
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
                    'label' => 'InfoProEns_label_codepostal',
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
                    'label' => 'InfoProEns_label_pays',
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
                'name' => 'profisionofficiel',
                'type' => 'checkbox',
                'options' => [
                    'label' => 'InfoProEns_label_profisionofficiel',
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


    }


}
