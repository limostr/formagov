<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


namespace Pedagogie\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

/**
 * AnneeunivController
 *
 * Handles the AnneeunivController requests for the Pedagogie Module
 *
 * @package Pedagogie\Controller
 */
class AnneeunivController extends AbstractActionController
{

    /**
     * Index action for AnneeunivController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();

                                                return $viewModel;
    }

    /**
     * Calendrierpedagogie action for AnneeunivController
     *
     * @return ViewModel
     */
    public function calendrierpedagogieAction()
    {
        $viewModel = new ViewModel();

                                        return $viewModel;
    }

    /**
     * PeriodeFormation action for AnneeunivController
     *
     * @return ViewModel
     */
    public function periodeFormationAction()
    {
        $viewModel = new ViewModel();
        $sm = $this->getServiceLocator();
        $Adapter = $sm->get('DB\Adapter');
            $FormationTable=new \Models\ExTutorat\ExFormationsTable($Adapter);
            $FormationTable->getAllInfoFormation($formation);
             //echo "<pre>";print_r($formation);echo "</pre>";
            $viewModel->formations=$formation;
                                return $viewModel;
    }

    /**
     * SavePeriodeFormation action for AnneeunivController
     *
     * @return ViewModel
     */
    public function savePeriodeFormationAction()
    {
        $viewModel = new ViewModel();

                        return $viewModel;
    }

    /**
     * DefinirPeriodeFormation action for AnneeunivController
     *
     * @return ViewModel
     */
    public function definirPeriodeFormationAction()
    {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);
        $form = new \Pedagogie\Form\PeriodeFormation();
        $viewModel->langue="fr_FR";
        $listId=$this->params()->fromQuery("listId");
        $listId=explode("_",$listId);
        if($listId[0]=="PRD"){
            $viewModel->idperiodeformation=$listId[1];
            $viewModel->idperiode=$listId[2];
            $viewModel->idniveau=$listId[5];
            $viewModel->idformation=$listId[6];

        }

        if($listId[0]=="SEM"){
            $viewModel->idperiodeformation=$listId[1];
            $viewModel->idperiode=$listId[2];
            $viewModel->idniveau=$listId[4];
            $viewModel->idformation=$listId[5];

        }



        $viewModel->form=$form;
        return $viewModel;
    }

    /**
     * InitialisationPeriodeFormation action for AnneeunivController
     *
     * @return ViewModel
     */
    public function initialisationPeriodeFormationAction()
    {
        $viewModel = new ViewModel();
        $sm = $this->getServiceLocator();
        $Adapter = $sm->get('DB\Adapter');

        $PeriodeTable = new \Models\ExTutorat\ExPeriodeTable($Adapter);
        $PeriodeFormationTable = new \Models\Tutorat\Model\PeriodeformationTable($Adapter);


$year=\Myhelper\GenericParams::__getUnivYear();
        $NiveauFormationTable=new \Models\ExTutorat\ExNiveauformationTable($Adapter);
        $niveaxRec= $NiveauFormationTable->getCurentNiveau($year);
        $yearExploid=explode("-",$year);

        foreach ($niveaxRec as $nv){
            $PeriodeLevel=$PeriodeTable->select("idlevelformation=".$nv['idlevelformation']);
            foreach ($PeriodeLevel as $p){

                $dateDebutExp=explode("-",$p->stddebutperiode);
                $dateFinExp=explode("-",$p->stdfinperiode);
                $datefin=$datedebut="";

                if($dateDebutExp[1]>=9){
                    $datedebut=$yearExploid[0]."-".$dateDebutExp[1]."-".$dateDebutExp[0];
                }else{
                    $datedebut=$yearExploid[1]."-".$dateDebutExp[1]."-".$dateDebutExp[0];
                }
                if($dateFinExp[1]>=9){
                    $datefin=$yearExploid[0]."-".$dateFinExp[1]."-".$dateFinExp[0];
                }else{
                    $datefin=$yearExploid[1]."-".$dateFinExp[1]."-".$dateFinExp[0];
                }

                $data=array(
                    'idformations'=>$nv['idformations']
                    ,'idniveauformation'=>$nv['idniveauformation']
                    ,'idperiode'=>$p->idperiode
                    ,'idanneeuniv'=>$year
                    ,'debutperiode'=>$datedebut
                    ,'finperiode'=>$datefin
                );

                $select= $PeriodeFormationTable->select($data);
                if($select->count()==0){
                    $PeriodeFormationTable->insert($data);
                }

            }

        }
        return $viewModel;
    }


}
