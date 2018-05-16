<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


namespace Enseignant\Filter;

use Zend\Form\Form;
use Zend\InputFilter\InputFilter;
use Zend\Validator;
use Zend\I18n\Validator as I18nValidator;

/**
 * Donneepersonnelle
 *
 * Provides the Donneepersonnelle filter for the Enseignant Module
 *
 * @package Enseignant\Filter
 */
class Donneepersonnelle extends InputFilter{


    /**
     * Called when filter is executed
     *
     * @param mixed $value
     * @return mixed
     */
    public function __construct(){

        // add filter code here
        $this->add(
            [
                'name' => 'idpersonnes',
                'required' => true,
                'filters' => [
                    [
                        'name' => 'StringTrim',
                    ],
                ],
                'validators' => [
                    [
                        'name' => 'StringLength',
                        'options' => [
                            'max' => 25,
                            'message' => 'personnes_message_personnes_idpersonnes_stringlength',
                        ],
                    ],
                    [
                        'name' => 'NotEmpty',
                        'options' => [
                            'message' => 'personnes_message_personnes_idpersonnes_notempty',
                        ],
                    ],
                ],
            ]
        );

        $this->add(
            [
                'name' => 'cin',
                'required' => false,
                'filters' => [
                    [
                        'name' => 'StringTrim',
                    ],
                ],
                'validators' => [
                    [
                        'name' => 'StringLength',
                        'options' => [
                            'max' => 45,
                            'message' => 'personnes_message_personnes_cin_stringlength',
                        ],
                    ],
                    [
                        'name' => 'NotEmpty',
                        'options' => [
                            'message' => 'personnes_message_personnes_cin_notempty',
                        ],
                    ],
                ],
            ]
        );

        $this->add(
            [
                'name' => 'telephone',
                'required' => false,
                'filters' => [
                    [
                        'name' => 'StringTrim',
                    ],
                ],
                'validators' => [
                    [
                        'name' => 'NotEmpty',
                        'options' => [
                            'message' => 'personnes_message_personnes_telephone_notempty',
                        ],
                    ],
                ],
            ]
        );

        $this->add(
            [
                'name' => 'email',
                'required' => false,
                'filters' => [
                    [
                        'name' => 'StringTrim',
                    ],
                ],
                'validators' => [
                    [
                        'name' => 'NotEmpty',
                        'options' => [
                            'message' => 'personnes_message_personnes_email_notempty',
                        ],
                    ],
                ],
            ]
        );

        $this->add(
            [
                'name' => 'login',
                'required' => false,
                'filters' => [
                    [
                        'name' => 'StringTrim',
                    ],
                ],
                'validators' => [
                    [
                        'name' => 'StringLength',
                        'options' => [
                            'max' => 45,
                            'message' => 'personnes_message_personnes_login_stringlength',
                        ],
                    ],
                    [
                        'name' => 'NotEmpty',
                        'options' => [
                            'message' => 'personnes_message_personnes_login_notempty',
                        ],
                    ],
                ],
            ]
        );

        $this->add(
            [
                'name' => 'motdepass',
                'required' => false,
                'filters' => [
                    [
                        'name' => 'StringTrim',
                    ],
                ],
                'validators' => [
                    [
                        'name' => 'NotEmpty',
                        'options' => [
                            'message' => 'personnes_message_personnes_motdepass_notempty',
                        ],
                    ],
                ],
            ]
        );

        $this->add(
            [
                'name' => 'rib',
                'required' => false,
                'filters' => [
                    [
                        'name' => 'StringTrim',
                    ],
                ],
                'validators' => [
                    [
                        'name' => 'StringLength',
                        'options' => [
                            'max' => 45,
                            'message' => 'enseignants_message_enseignants_rib_stringlength',
                        ],
                    ],
                    [
                        'name' => 'NotEmpty',
                        'options' => [
                            'message' => 'enseignants_message_enseignants_rib_notempty',
                        ],
                    ],
                ],
            ]
        );
    }


}
