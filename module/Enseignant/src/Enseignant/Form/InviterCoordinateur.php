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
 * InviterCoordinateur
 *
 * Provides the InviterCoordinateur form for the Enseignant Module
 *
 * @package Enseignant\Form
 */
class InviterCoordinateur extends Form
{

    /**
    /**
     * Generate form by adding elements
     */
    private $Adapter;
    public function __construct ($Adapter,$name = null )  {
        parent::__construct();
        $this->Adapter=$Adapter;
        $this->setName('InviterCoordinateurForm');
        $this->setInputFilter(new \Enseignant\Filter\InviterCoordinateur());
        $this->setAttribute('method', 'post');
        $this->add(array(
            'name' => 'email',
            'type' => 'email',
            'options' => [
                'label' => 'enseignants_label_email',
            ],
        ));
        $this->add(array(
            'name' => 'nom',
            'type' => 'text',
            'options' => [
                'label' => 'enseignants_label_nom',
            ],

        ));

        $this->add(array(
            'name' => 'prenom',
            'type' => 'text',
            'options' => [
                'label' => 'enseignants_label_prenom',
            ],

        ));


        $this->add(array(
            'name' => 'anneescolaire',
            'options' => [
                'label' => 'Enseignant_Inviter_Coordinateur_Anneescolaire',
                'empty_option' => 'Selectionner une année',
                'value_options' => $this->getOptionsForSelectYearsUniv(),
            ],
            'type'  => 'select',

        ));


        $this->add(array(
            'name' => 'submit',
            'type' => 'Submit',
            'attributes' => array(
                'value' => 'Enseignant_Inviter_Coordinateur_Submit_Inviter',
                'id' => 'submitbutton',
                'class'=>'btn btn-success',
            ),
        ));
    }
    public function getOptionsForSelectYearsUniv()
    {

        $TableGrades = new \Models\Tutorat\Model\AnneeunivTable($this->Adapter);
        $result=$TableGrades->fetchAll();
        $selectData = array();

        foreach ($result as $res) {
            $selectData[$res->idanneeuniv] = $res->labelanneeuniv;
        }
        return $selectData;
    }


}
