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
 * GradeEnseignant
 *
 * Provides the GradeEnseignant form for the Enseignant Module
 *
 * @package Enseignant\Form
 */
class GradeEnseignant extends Form
{

    /**
     * Generate form by adding elements
     */
    private $Adapter;
    public function __construct($Adapter,$name = null )
    {
        parent::__construct($name);
        // add form elements and form configuration here
        $this->Adapter=$Adapter;
       // $this->setInputFilter(new \Enseignant\Filter\GradeEnseignant());
        $this->setName('GradeForm');

        $this->add(
            [
                'name' => 'idpersonnes',
                'type' => 'text',
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
                'name' => 'idgrades',
                'type' => 'Select',
                'options' => [
                    'label' => 'grade_label_idgrades',
                    'empty_option' => 'Selectionner un grade',
                     'value_options' => $this->getOptionsForSelect(),
                ],

            ]
        );


        $this->add(
            [
                'name' => 'save_grade',
                'type' => 'Submit',
                'options' => [
                ],
                'attributes' => [
                    'value' => 'grade_action_save',
                    'id' => 'save_grade',
                    'class' => 'btn btn-success',
                ],
            ]
        );
        // add form elements and form configuration here
    }
    public function getOptionsForSelect()
    {

        $TableGrades = new \Models\Tutorat\Model\GradesTable($this->Adapter);
        $result=$TableGrades->fetchAll();
        $selectData = array();

        foreach ($result as $res) {
            $selectData[$res->idgrades] = $res->labelgrade;
        }
        return $selectData;
    }

}
