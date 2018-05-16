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
 * ModuleensController
 *
 * Handles the ModuleensController requests for the Pedagogie Module
 *
 * @package Pedagogie\Controller
 */
class ModuleensController extends AbstractActionController
{

    /**
     * Index action for ModuleensController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();

                                                                                                                                                return $viewModel;
    }

    /**
     * Infounite action for ModuleensController
     *
     * @return ViewModel
     */
    public function infouniteAction()
    {
        $viewModel = new ViewModel();

                                                                                                                                                                return $viewModel;
    }

    /**
     * Gestionunite action for ModuleensController
     *
     * @return ViewModel
     */
    public function gestionuniteAction()
    {
        $viewModel = new ViewModel();

                                                                                                                                                $idniveau = $this->params()->fromRoute('id');
                                                                                                                                                $sm = $this->getServiceLocator();
                                                                                                                                                $Adapter = $sm->get('DB\Adapter');
                                                                                                                                                $niveaurec = new \Models\Tutorat\Model\NiveauformationTable($Adapter);
                                                                                                                                                $rowniv = $niveaurec->select("idniveauformation='$idniveau'")->current();


                                                                                                                                                $viewModel->idform=$rowniv->idformations;
                                                                                                                                                $formationTable= new \Models\ExTutorat\ExFormationsTable($Adapter);

                                                                                                                                                $formationTable->getDiplomeDetails($rowniv->idformations,$formation);
                                                                                                                                                $viewModel->formation=$formation;

                                                                                                                                                        return $viewModel;
    }

    /**
     * @param $TreeUE
     * @param $periode RecordSets qui contient les données de la période ou on va
     * selectionner les Module
     * @param $idniveau
     * @param string $idUE
     */
    private function constructTreeUE(&$TreeUE, $idperiode, $idniveau, $idUE = '')
    {
        $sm = $this->getServiceLocator();
                                                                                                                                                $Adapter = $sm->get('DB\Adapter');
                                                                                                                                                //model pour la selection des Module (UE/ECUE)
                                                                                                                                                $ModuleTable= new \Models\Tutorat\Model\ModuleTable($Adapter);
                                                                                                                                                $RecModule=null;
                                                                                                                                                if(empty($idUE)){
                                                                                                                                                    $RecModule=$ModuleTable->select("idniveauformation= $idniveau  AND idue IS NULL   AND idperiode= '$idperiode' ");
                                                                                                                                                }else{
                                                                                                                                                    $RecModule=$ModuleTable->select("idniveauformation= $idniveau  AND idue='$idUE' AND idperiode= '$idperiode' ");
                                                                                                                                                }

                                                                                                                                                 if($RecModule){
                                                                                                                                                    //parcour des ue de la periode
                                                                                                                                                    foreach ($RecModule as  $Module){
                                                                                                                                                        //construction de noeud de l'Unité d'enseigenement
                                                                                                                                                        $NoedUe=array();
                                                                                                                                                        //Construire de noeud selon le type de Module
                                                                                                                                                        if(empty($idUE)){
                                                                                                                                                            $NoedUe["key"]= "UE_".$Module->idModule."_".$idperiode;
                                                                                                                                                            $NoedUe["title"]= $Module->titremodule;
                                                                                                                                                            $NoedUe["tooltip"]= $Module->titremodule;
                                                                                                                                                        }else{
                                                                                                                                                            $NoedUe=array();
                                                                                                                                                            $NoedUe["key"]= "ECUE_".$Module->idModule."_".$Module->idModule."_".$idperiode;
                                                                                                                                                            $NoedUe["title"]= ($Module->titremodule) ;
                                                                                                                                                            $NoedUe["tooltip"]= $Module->titremodule;
                                                                                                                                                         }
                                                                                                                                                        $NoedUe['children']=array();
                                                                                                                                                        $this->constructTreeUE($NoedUe['children'],$idperiode,$idniveau,$Module->idModule);
                                                                                                                                                        if(count($NoedUe)>0){
                                                                                                                                                            $NoedUe["iconclass"]="fa fa-briefcase text-yellow";
                                                                                                                                                            $NoedUe["folder"]= "true";

                                                                                                                                                        }else{
                                                                                                                                                            $NoedUe["iconclass"]= "fa fa-book text-blue";
                                                                                                                                                            $NoedUe["folder"]= "false";
                                                                                                                                                            unset($NoedUe['children']);
                                                                                                                                                        }
                                                                                                                                                        $TreeUE[]=$NoedUe;
                                                                                                                                                    }
                                                                                                                                                }
    }

    private function treesemestreformation(&$TreePeriodeUE, $idlevel, $idniveau, $idPerePeriode = '')
    {
        $sm = $this->getServiceLocator();
                                                                                                        $Adapter = $sm->get('DB\Adapter');
                                                                                                        //Model pour la selection de période
                                                                                                        $semestre= new \Models\ExTutorat\ExPeriodeTable($Adapter);
                                                                                                        //model pour la selection des Module (UE/ECUE)
                                                                                                        $_listeue= new \Models\Tutorat\Model\ModuleTable($Adapter);

                                                                                                        $recsemestre=null;
                                                                                                        if(!empty($idPerePeriode)){
                                                                                                            $recsemestre=$semestre->select("idsousperiode= '$idPerePeriode'");
                                                                                                        }else{
                                                                                                            $recsemestre=$semestre->select("idlevelformation=".$idlevel." AND idsousperiode IS NULL");
                                                                                                        }
                                                                                                        foreach ($recsemestre as $sem){
                                                                                                                //construction de noeud de periode qui va contenir l'ensemble des module
                                                                                                                $NoedSem=$ListeNodeUe=array();
                                                                                                                $NoedSem["key"]= "SEM_".$sem->idperiode;
                                                                                                                $NoedSem["title"]= $sem->labelperiode;
                                                                                                                $NoedSem["tooltip"]= $sem->labelperiode;
                                                                                                                $NoedSem['children']=array();
                                                                                                                //parcour des ue de la periode
                                                                                                            $this->constructTreeUE($NoedSem['children'],$sem->idperiode,$idniveau);
                                                                                                                $this->treesemestreformation($NoedSem['children'],$idlevel,$idniveau,$sem->idperiode);

                                                                                                                if(count($NoedSem['children'])>0){
                                                                                                                    $NoedSem["iconclass"]= "fa fa-calendar text-aqua";
                                                                                                                    $NoedSem["folder"]= "true";
                                                                                                                    $TreePeriodeUE[]=$NoedSem;
                                                                                                                }else{
                                                                                                                    $NoedSem["folder"]= "false";
                                                                                                                    $NoedSem["iconclass"]= "fa fa-clock-o text-green";
                                                                                                                    unset($NoedSem['children']);
                                                                                                                }


                                                                                                        }
    }

    /**
     * Jzonunite action for ModuleensController
     *
     * @return ViewModel
     * JZonunit utilise deux fonction privé pour construction l'arbre des unités
     */
    public function jzonuniteAction()
    {
        $viewModel = new ViewModel();
                                                                                                        $Noedtree=array();

                                                                                                        $idniveau = $this->params()->fromRoute('id');
                                                                                                        $sm = $this->getServiceLocator();
                                                                                                        $Adapter = $sm->get('DB\Adapter');

                                                                                                        $niveaurec = new \Models\Tutorat\Model\NiveauformationTable($Adapter);
                                                                                                        $rowniv = $niveaurec->select("idniveauformation='$idniveau'")->current();

                                                                                                        $Noedtree["key"]= "UNETE" ;
                                                                                                        $Noedtree["title"]= "Liste des unite";
                                                                                                        $Noedtree["tooltip"]= "Liste des unite";
                                                                                                        $Noedtree["folder"]= "true";
                                                                                                        $Noedtree["iconclass"]= "fa fa-university text-red";
                                                                                                        $Noedtree['children']=array();

                                                                                                        $this->treesemestreformation($Noedtree['children'],$rowniv->idlevelformation,$idniveau);


                                                                                                        $tree[]=$Noedtree;

                                                                                                        echo \Zend\Json\Encoder::encode($tree) ;
                                                                                                        $viewModel->setTerminal(true);
                                                                                                        return $viewModel;
    }

    public function jzonuniteActionOLD()
    {
        $viewModel = new ViewModel();
                        $Noedtree=array();

                        $idniveau = $this->params()->fromRoute('id');
                        $sm = $this->getServiceLocator();

                        $Adapter = $sm->get('DB\Adapter');

                        $_listeue= new \Models\Tutorat\Model\ModuleTable($Adapter);

                        $semestre= new \Models\ExTutorat\ExPeriodeTable($Adapter);

                        $niveaurec = new \Models\Tutorat\Model\NiveauformationTable($Adapter);
                        $rowniv = $niveaurec->select("idniveauformation='$idniveau'")->current();


                        $recsemestre=$semestre->select("idlevelformation=".$rowniv->idlevelformation);
                      //  print_r($recsemestre);
                        $semestres=array();
                        foreach ($recsemestre as $sem){
                            $RecUe=$_listeue->select("idniveauformation='$idniveau' AND idue IS NULL AND idperiode='".$sem->idperiode."'");
                            if($RecUe){
                                $NoedSem=$ListeNodeUe=array();
                                $NoedSem["key"]= "SEM_".$sem->idperiode;
                                $NoedSem["title"]= $sem->labelperiode;
                                $NoedSem["tooltip"]= $sem->labelperiode;
                                $NoedSem["folder"]= "true";
                                $NoedSem["iconclass"]= "fa fa-calendar text-green";
                                $NoedSem['children']=array();
                                foreach ($RecUe as  $ue){
                                    $NoedUe=array();
                                    $NoedUe["key"]= "UE_".$ue->idModule."_".$sem->idperiode;
                                    $NoedUe["title"]= $ue->titremodule;
                                    $NoedUe["tooltip"]= $ue->titremodule;
                                    $NoedUe["folder"]= "true";
                                    $NoedUe["iconclass"]= "fa fa-bookmark text-yellow";
                                    $NoedUe['children']=array();
                                    $tmplist=$_listeue->select("idue='".$ue->idModule."'");
                                    $ListeNoedECUE=array();
                                    foreach ($tmplist as $ecue){
                                        $NoedECUE=array();
                                        $NoedECUE["key"]= "ECUE_".$ecue->idModule."_".$ue->idModule."_".$sem->idperiode;
                                        $NoedECUE["title"]= ($ecue->titremodule) ;
                                        $NoedECUE["tooltip"]= $ecue->titremodule;
                                        $NoedECUE["iconclass"]= "fa fa-book";
                                        $NoedECUE["folder"]= "false";
                                        $ListeNoedECUE[]=$NoedECUE;
                                    }
                                    $NoedUe['children']=$ListeNoedECUE;
                                    $ListeNodeUe[]=$NoedUe;
                                }

                                $NoedSem['children']=$ListeNodeUe;
                                $ListeUe[]=$NoedSem;
                            }

                        }

                        $Noedtree["key"]= "UNETE" ;
                        $Noedtree["title"]= "Liste des unite";
                        $Noedtree["tooltip"]= "Liste des unite";
                        $Noedtree["folder"]= "true";
                        $Noedtree["iconclass"]= "fa fa-university text-red";

                        $Noedtree['children']=$ListeUe;
                        $tree[]=$Noedtree;

                        echo \Zend\Json\Encoder::encode($tree) ;
                        $viewModel->setTerminal(true);
                        return $viewModel;
    }

    public function editueAction()
    {
        $viewModel = new ViewModel();

                                                                                                                                                return $viewModel;
    }

    public function editdetailecueAction()
    {
        $viewModel = new ViewModel();

                                                                                                        return $viewModel;
    }

    public function editdetailueAction()
    {
        $viewModel = new ViewModel();

                                                                                                        return $viewModel;
    }

    /**
     * Createenseignement action for ModuleensController
     *
     * @return ViewModel
     */
    public function createenseignementAction()
    {
        $viewModel = new ViewModel();
                                                                                                        $viewModel->setTerminal(true);

                                                                                                        $sm = $this->getServiceLocator();
                                                                                                        $Adapter = $sm->get('DB\Adapter');

                                                                                                        $typeenseignementTable= new \Models\Tutorat\Model\TypeenseignementTable($Adapter);
                                                                                                        $viewModel->typeensignement=$typeenseignementTable->select();

                                                                                                         return $viewModel;
    }

    /**
     * Createplancours action for ModuleensController
     *
     * @return ViewModel
     */
    public function createplancoursAction()
    {
        $viewModel = new ViewModel();

                                                                                                                                return $viewModel;
    }

    /**
     * Createtp action for ModuleensController
     *
     * @return ViewModel
     */
    public function createtpAction()
    {
        $viewModel = new ViewModel();

                                                                                                                        return $viewModel;
    }

    /**
     * Createtd action for ModuleensController
     *
     * @return ViewModel
     */
    public function createtdAction()
    {
        $viewModel = new ViewModel();

                                                                                                                return $viewModel;
    }

    /**
     * Saveenseignement action for ModuleensController
     *
     * @return ViewModel
     */
    public function saveenseignementAction()
    {
        $viewModel = new ViewModel();

                                                                                                        return $viewModel;
    }

    /**
     * Editvalidationmodule action for ModuleensController
     *
     * @return ViewModel
     */
    public function editvalidationmoduleAction()
    {
        $viewModel = new ViewModel();
                                                    $viewModel->setTerminal(true);

                                                    $sm = $this->getServiceLocator();
                                                    $Adapter = $sm->get('DB\Adapter');
                                                    $idmodule=$this->params()->fromPost('idmodule',null);


                                                    $TableTypeEval=new \Models\ExTutorat\ExTypevalidationTable($Adapter);
                                                    $typemodule=array();
                                                    $TableTypeEval->getValidationwithValueModule($typemodule,$idmodule);
                                                    //print_r($typemodule);
                                                    $viewModel->typemodule=$typemodule;
                                                    return $viewModel;
}

    /**
     * Savevalidationmodule action for ModuleensController
     *
     * @return ViewModel
     */
    public function savevalidationmoduleAction()
    {
        $viewModel = new ViewModel();
                                                                $viewModel->setTerminal(true);
                                                                $sm = $this->getServiceLocator();
                                                                $Adapter = $sm->get('DB\Adapter');
                                                                $idmodule=$this->params()->fromPost('idmodule',null);


                                                                return $viewModel;
    }

    /**
     * Editprerequit action for ModuleensController
     *
     * @return ViewModel
     */
    public function editprerequitAction()
    {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);

        $sm = $this->getServiceLocator();
        $Adapter = $sm->get('DB\Adapter');
        $idmodule=$this->params()->fromPost('idmodule',null);
        $viewModel->idmodule=$idmodule;

         $TablePrerequit=new \Models\Tutorat\Model\PrerequitsTable($Adapter);

        return $viewModel;
    }

    /**
     * Listeprerequit action for ModuleensController
     *
     * @return ViewModel
     */
    public function listeprerequitAction()
    {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);
        $sm = $this->getServiceLocator();
        $Adapter = $sm->get('DB\Adapter');
        $idmodule=$this->params()->fromPost('idmodule',null);
        $TablePrerequit=new \Models\Tutorat\Model\PrerequitsTable($Adapter);
        $viewModel->Prerequits=$TablePrerequit->select("module_idModule=$idmodule");

        $viewModel->idmodule=$this->params()->fromPost('idmodule',null);


        return $viewModel;
    }

    /**
     * Saveprerequit action for ModuleensController
     *
     * @return ViewModel
     */
    public function saveprerequitAction()
    {
        $viewModel = new ViewModel();
                                                $viewModel->setTerminal(true);
                                                $sm = $this->getServiceLocator();
                                                $Adapter = $sm->get('DB\Adapter');
                                                $idmodule=$this->params()->fromPost('idmodule',null);
                                                $id=$this->params()->fromRoute('id',null);
                                                $TablePrerequit=new \Models\Tutorat\Model\PrerequitsTable($Adapter);
                                                try{
                                                    $data=array(
                                                        'labelprerequit'=>$this->params()->fromPost('Prerequit')
                                                        ,'descprerequit'=>$this->params()->fromPost('descprerequit')
                                                        ,'niveauobligation'=>$this->params()->fromPost('obligatoire')
                                                        ,'module_idModule'=>$idmodule
                                                    );
                                                    if(!empty($id)){
                                                        $TablePrerequit->update($data,array("idprerequits"=>$id));
                                                    }else{
                                                        $TablePrerequit->insert($data);
                                                    }

                                                    $viewModel->messagesave=\Zend\Json\Encoder::encode(array(
                                                        'status'=>'success',
                                                        'message'=>'Un nouveau Prerequit'
                                                    ));
                                                }catch (\Exception $e){
                                                    $viewModel->messagesave=\Zend\Json\Encoder::encode(array(
                                                        'status'=>'error',
                                                        'message'=>$e->getMessage()
                                                    ));

                                                }

                                                return $viewModel;
    }

    /**
     * Gestionprerequit action for ModuleensController
     *
     * @return ViewModel
     */
    public function gestionprerequitAction()
    {
        $viewModel = new ViewModel();
                                                $viewModel->setTerminal(true);

                                                $viewModel->idmodule=$this->params()->fromPost('idmodule',null);

                                                return $viewModel;
    }

    /**
     * Deleteprerequit action for ModuleensController
     *
     * @return ViewModel
     */
    public function deleteprerequitAction()
    {
        $viewModel = new ViewModel();
                                                $viewModel->setTerminal(true);
                                                $sm = $this->getServiceLocator();
                                                $Adapter = $sm->get('DB\Adapter');
                                                $idprerequit=$this->params()->fromPost('idp',null);
                                                try {
                                                     $TablePrerequit=new \Models\Tutorat\Model\PrerequitsTable($Adapter);
                                                    $TablePrerequit->delete(array("idprerequits"=>$idprerequit));
                                                    $viewModel->messagesave=\Zend\Json\Encoder::encode(array(
                                                        'status'=>'success',
                                                        'message'=>'Un nouveau Prerequit'
                                                    ));
                                                }catch (\Exception $e){
                                                    $viewModel->messagesave=\Zend\Json\Encoder::encode(array(
                                                        'status'=>'error',
                                                        'message'=>$e->getMessage()
                                                    ));

                                                }
                                                return $viewModel;
    }

    /**
     * Editplancours action for ModuleensController
     *
     * @return ViewModel
     */
    public function editplancoursAction()
    {
        $viewModel = new ViewModel();
                        $viewModel->setTerminal(true);

                        return $viewModel;
    }

    /**
     * Gestionplancours action for ModuleensController
     *
     * @return ViewModel
     */
    public function gestionplancoursAction()
    {
        $viewModel = new ViewModel();
                        $viewModel->setTerminal(true);

                        $viewModel->idmodule=$this->params()->fromPost('idmodule',null);


                        $sm = $this->getServiceLocator();
                        $Adapter = $sm->get('DB\Adapter');
                        return $viewModel;
    }

    /**
     * Jsonplancours action for ModuleensController
     *
     * @return ViewModel
     */
    public function jsonplancoursAction()
    {
        $viewModel = new ViewModel();
                        $viewModel->setTerminal(true);
                        $viewModel->treePlanCours ="";
                        $sm = $this->getServiceLocator();
                        $Adapter = $sm->get('DB\Adapter');


                        $idModule=$this->params()->fromRoute('id',null);
                        $viewModel->idmodule=$idModule;

                        $TableCoursPlan = new \Models\ExTutorat\ExPlandemoduleTable($Adapter);
                        $TableCoursPlan->TreePlanCours($treePlan,$idModule);

                        $Noedtree["key"]= "PLC" ;
                        $Noedtree["title"]= "Plan de cours";
                        $Noedtree["tooltip"]= "Plan de cours";
                        $Noedtree["folder"]= "true";
                        $Noedtree["iconclass"]= "fa fa-book text-red";

                        $Noedtree['children']=$treePlan;
                        $tree[]=$Noedtree;

                        echo \Zend\Json\Encoder::encode($tree) ;
                        return $viewModel;
    }

    /**
     * Chapitreplancours action for ModuleensController
     *
     * @return ViewModel
     */
    public function chapitreplancoursAction()
    {
        $viewModel = new ViewModel();

                return $viewModel;
    }

    /**
     * Savechapitre action for ModuleensController
     *
     * @return ViewModel
     */
    public function savechapitreAction()
    {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);
        $request = $this->getRequest();


        $idModule=$this->params()->fromRoute('idmodule');
        $titre=$this->params()->fromPost('titre');
        $Index=$this->params()->fromPost('index');
        $desc=$this->params()->fromPost('desc');
        $comptenue=$this->params()->fromPost('contenu');
        $path=$this->params()->fromPost('path');
        $idpere=$this->params()->fromPost('idpere');


        $data=array(
              'idModule'=>$idModule
            , 'titrechapitre'=>$titre
            , 'indexchapitre'=>$Index
            , 'descplan'=>$desc
            , 'contenuchapitre'=>$comptenue
            , 'pathdoc'=>$path
            , 'idplandemodule'=>''
        );
        if(!empty($idpere)){
            $data['idpereplandemodule']=$idpere;
        }
    $idCh=$this->params()->fromPost('idchp');


        $sm = $this->getServiceLocator();
        $Adapter = $sm->get('DB\Adapter');
        $TableCoursPlan = new \Models\Tutorat\Model\PlandemoduleTable($Adapter);
        if(!empty($idmodule)){
            $TableCoursPlan->update($data,"idModule=");
        }else{
            $TableCoursPlan->insert($data);
        }


        return $viewModel;
    }


}
