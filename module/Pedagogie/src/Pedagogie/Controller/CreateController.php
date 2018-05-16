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
 * CreateController
 *
 * Handles the CreateController requests for the Pedagogie Module
 *
 * @package Pedagogie\Controller
 */
class CreateController extends AbstractActionController
{

    /**
     * Index action for CreateController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();


                                                                        return $viewModel;
    }

    /**
     * Addformation action for CreateController
     *
     * @return ViewModel
     */
    public function addformationAction()
    {
        $viewModel = new ViewModel();
        $sm = $this->getServiceLocator();
        $TypeFormationTable = $sm->get('Model\TypeformationTable');
        $types=$TypeFormationTable->getPrincipalTypesFormation();
        $viewModel->TypesFormation=$types;
        return $viewModel;
    }

    /**
     * Adddyntypeform action for CreateController
     *
     * @return ViewModel
     */
    public function adddyntypeformAction()
    {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);
        $id= $this->getRequest()->getPost('id');

        $sm = $this->getServiceLocator();
        $TypeFormationTable = $sm->get('Model\TypeformationTable');
        $typesModel=array();
        $TypeFormationTable->getModelTypeFormation($id,$typesModel);
        $viewModel->ModelTypesFormation=$typesModel;


        return $viewModel;
    }

    /**
     * Createue action for CreateController
     *
     * @return ViewModel
     */
    public function createueAction()
    {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);
        $idform=$this->params()->fromPost('idform');
        $idPeriode=$this->params()->fromPost('sem');
        $idue=$this->params()->fromPost('idue',null);
        $id=$this->params()->fromPost('id',null);
        try{

        $viewModel->idform=$idform;
        $viewModel->sem=$idPeriode;




            $sm = $this->getServiceLocator();
            $Adapter = $sm->get('DB\Adapter');

            $ModuleTable= new \Models\Tutorat\Model\ModuleTable($Adapter);
            $ModuleAModifier=null;
            if($id && !empty($id)){
                $module=$ModuleTable->select("idModule=".$id);
                $viewModel->Module=$ModuleAModifier=$module->current();

                if(isset($ModuleAModifier->idue) && !empty($ModuleAModifier->idue)){
                    $moduleSelectPere=$ModuleTable->select("idModule=".$ModuleAModifier->idue);

                    $viewModel->UE_Select=$moduleSelectPere->current();
                    $idue=(!empty($ModuleAModifier->idue)) ? $ModuleAModifier->idue : null;
                }


            }elseif($idue && !empty($idue)){
                $module=$ModuleTable->select("idModule=".$idue);
                $viewModel->UE_Select=$module->current();

            }

            $viewModel->idUE=$idue;
            $curentperiodeTable= new \Models\ExTutorat\ExPeriodeTable($Adapter);

            $PeriodeTable = new \Models\ExTutorat\ExNiveauformationTable($Adapter);
            $viewModel->Niveau=$niveau=$PeriodeTable->getNiveauByPeriodeFormation($idform,$idPeriode);

            $regimeTable= new \Models\Tutorat\Model\RegimeTable($Adapter);
            $viewModel->regimes= $regimeTable->fetchAll();

            $natureTable= new \Models\Tutorat\Model\NatureTable($Adapter);
            $viewModel->nature=$natureTable->fetchAll();

            $viewModel->curentPeriode=$curentperiodeTable->getCurentPeriode($idPeriode);

            if($idue && !empty($idue)){
                $viewModel->UEs=$ModuleTable->fetchAll("idue IS NULL AND idniveauformation=".$niveau->idniveauformation);
            }

        }catch (\Exception $e){
            $viewModel->messagesave=\Zend\Json\Encoder::encode(array(
                'status'=>'error',
                'message'=>$e->getMessage()
            ));
            echo $e->getMessage();
        }
        return $viewModel;
    }

    /**
     * Createcalend action for CreateController
     *
     * @return ViewModel
     */
    public function createcalendAction()
    {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);
        return $viewModel;
    }

    /**
     * Configdiplome action for CreateController
     *
     * @return ViewModel
     */
    public function configdiplomeAction()
    {
        $viewModel = new ViewModel();

                                        return $viewModel;
    }

    /**
     * Editformation action for CreateController
     *
     * @return ViewModel
     */
    public function editformationAction()
    {
        try{
            $viewModel = new ViewModel();
            //$viewModel->setTerminal(true);
            $idformation=$this->params()->fromRoute('id');
            $viewModel->idformation=$idformation;
            $sm = $this->getServiceLocator();
            $Adapter = $sm->get('DB\Adapter');

            $formationTable= new \Models\ExTutorat\ExFormationsTable($Adapter);
            $formationTable->getDiplomeDetails($idformation,$formation);

            $PeriodeTable = new \Models\Extutorat\ExNiveauformationTable($Adapter);
            $viewModel->Periode=$PeriodeTable->getNiveauPeriod($idformation,false);

            $viewModel->formation=$formation;
        }catch (\Exception $e){
            $viewModel->messagesave=\Zend\Json\Encoder::encode(array(
                'status'=>'error',
                'message'=>$e->getMessage()
            ));
            echo $e->getMessage();
        }
        return $viewModel;
    }

    /**
     * Savemodule action for CreateController
     *
     * @return ViewModel
     */
    public function savemoduleAction()
    {
        try{
                        $viewModel = new ViewModel();
                        $idModule=$this->params()->fromPost('idModule',null);
                        $idue=$this->params()->fromPost('idue',null);
                        $idniveauformation=$this->params()->fromPost('idniveauformation',null);
                        $idsemestres=$this->params()->fromPost('idsemestres',null);
                        $idregime=$this->params()->fromPost('idregime',null);
                        $titreecue=$this->params()->fromPost('titreecue',null);
                        $coef=$this->params()->fromPost('coef',null);
                        $credit=$this->params()->fromPost('credit',null);
                        $idTypemodule=$this->params()->fromPost('TypeModule',null);
                        $noteeleminatoire=$this->params()->fromPost('noteeleminatoire',null);
                        $descriptionecue=$this->params()->fromPost('descriptionecue',null);
                        $resume=$this->params()->fromPost('resume',null);
                        $nombresemaine=$this->params()->fromPost('Nombredesemaine',null);
                        $nombresience=$this->params()->fromPost('nombresience',null);
                        $nombreoptions=$this->params()->fromPost('nombreoptions',null);
                        $idNature=$this->params()->fromPost('idNature',null);

                        $codemoodle=$this->params()->fromPost('codemoodle',null);
                        $codemes=$this->params()->fromPost('codemes',null);
                            $codeue=$this->params()->fromPost('codeue',null);




                        $BasicData=array(
                            'idniveauformation'=>$idniveauformation
                            ,'idperiode'=>$idsemestres
                            ,'idNature'=>$idNature
                            ,'idRegime'=>$idregime
                            ,'titremodule'=>$titreecue
                            ,'coefficient'=>$coef
                            ,'credit'=>$credit
                            ,'noteeleminatoire'=>$noteeleminatoire
                            ,'descriptionecue'=>$descriptionecue
                            ,'resumer'=>$resume
                            ,'nbrscience'=>$nombresience
                            ,'nbroption'=>$nombreoptions
                            ,'idTypemodule'=>$idTypemodule
                            ,'Nombredesemaine'=> $nombresemaine
                            ,'codemes'=>$codemes
                            ,'codemoodle'=>$codemoodle
                            ,'codeue'=>$codeue
                        );
                            $BasicData['idue']= !empty($idue) ? $idue : NULL ;

                            $sm = $this->getServiceLocator();
                            $Adapter = $sm->get('DB\Adapter');

                            $ModuleTable= new \Models\Tutorat\Model\ModuleTable($Adapter);
                            if(!empty($idModule)){
                            //update
                                $ModuleTable->update($BasicData,"idModule=".$idModule);
                            }else{
                                //insert
                                $ModuleTable->insert($BasicData);
                            }
                            $viewModel->messagesave=\Zend\Json\Encoder::encode(array(
                                'status'=>'success',
                                'message'=>'Un nouveau module ajouter'
                            ));
                        }catch (\Exception $e){
                            $viewModel->messagesave=\Zend\Json\Encoder::encode(array(
                                'status'=>'error',
                                'message'=>$e->getMessage()
                            ));

                        }
                        $viewModel->setTerminal(true);

                        return $viewModel;
    }

    /**
     * Detailecue action for CreateController
     *
     * @return ViewModel
     */
    public function detailecueAction()
    {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);

        return $viewModel;
    }

    /**
     * Menuue action for CreateController
     *
     * @return ViewModel
     */
    public function menuueAction()
    {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);

        $idform=$this->params()->fromPost('idform');
        $idPeriode=$this->params()->fromPost('sem',null);

        $ecran=$this->params()->fromPost('ecran',null);

        $idue=$this->params()->fromPost('idue',null);
        $id=$this->params()->fromPost('id',null);

        $viewModel->ecran=$ecran;
        $viewModel->idue=$idue;
        $viewModel->id=$id;

        $viewModel->idform=$idform;
        $viewModel->sem=$idPeriode;

        return $viewModel;
    }


}
