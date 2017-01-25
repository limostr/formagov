<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


namespace Pedagogie\Form;

use Zend\Form\Form;

/**
 * Formation
 *
 * Provides the Formation form for the Pedagogie Module
 *
 * @package Pedagogie\Form
 */
class Formation extends Form
{

    /**
     * Generate form by adding elements
     */
    public function __construct($name = null)
    {
        // we want to ignore the name passed
        parent::__construct('formation');


        $this->add(
            [
                'name' => 'idpereformations',
                'type' => 'select',
                /*'options' => [
                    'label' => 'pedagogie_label_idpereformations',
                    'value_options' => $this->idpereformationsOptions,
                ],*/
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'idtypeformation',
                'type' => 'select',
                /*'options' => [
                    'label' => 'pedagogie_label_idtypeformation',
                    'value_options' => $this->idtypeformationOptions,
                ],*/
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'codeformation',
                'type' => 'text',
                'options' => [
                    'label' => 'pedagogie_label_codeformation',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'abrev',
                'type' => 'text',
                'options' => [
                    'label' => 'pedagogie_label_abrev',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'Label',
                'type' => 'textarea',
                'options' => [
                    'label' => 'pedagogie_label_Label',
                ],
                'attributes' => [
                    'class' => 'form-control',
                    'rows' => '10',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'Labelar',
                'type' => 'textarea',
                'options' => [
                    'label' => 'pedagogie_label_Labelar',
                ],
                'attributes' => [
                    'class' => 'form-control',
                    'rows' => '10',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'description',
                'type' => 'textarea',
                'options' => [
                    'label' => 'pedagogie_label_description',
                ],
                'attributes' => [
                    'class' => 'form-control',
                    'rows' => '10',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'codeformationuvt',
                'type' => 'text',
                'options' => [
                    'label' => 'pedagogie_label_codeformationuvt',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'codeformationmis',
                'type' => 'text',
                'options' => [
                    'label' => 'pedagogie_label_codeformationmis',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'siteweb',
                'type' => 'textarea',
                'options' => [
                    'label' => 'pedagogie_label_siteweb',
                ],
                'attributes' => [
                    'class' => 'form-control',
                    'rows' => '10',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'niveau',
                'type' => 'text',
                'options' => [
                    'label' => 'pedagogie_label_niveau',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'modeformation',
                'type' => 'text',
                'options' => [
                    'label' => 'pedagogie_label_modeformation',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'prixdeniveau',
                'type' => 'text',
                'options' => [
                    'label' => 'pedagogie_label_prixdeniveau',
                ],
                'attributes' => [
                    'class' => 'form-control',
                ],
            ]
        );

        $this->add(
            [
                'name' => 'save_formations',
                'type' => 'Submit',
                'options' => [
                ],
                'attributes' => [
                    'value' => 'pedagogie_action_save',
                    'id' => 'save_formations',
                    'class' => 'btn btn-success',
                ],
            ]
        );
    }


}
