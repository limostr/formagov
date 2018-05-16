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
 * ShowController
 *
 * Handles the ShowController requests for the Pedagogie Module
 *
 * @package Pedagogie\Controller
 */
class ShowController extends AbstractActionController
{

    private $formationsTable = null;

    /**
     * Index action for ShowController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();
        $viewModel->annees=$this->getFormationTable()->fetchAll();
        return $viewModel;
    }




    public function getdiplomesoptionAction(){
        $r = $this->getResponse();
        try{
            $sm = $this->getServiceLocator();
            $Adapter = $sm->get('DB\Adapter');

            $formationTable= new \Models\ExTutorat\ExFormationsTable($Adapter);


            $formations=$formationTable->select("idpereformations IS NULL");

            $option="<option value='' selected>Selecionner une formation</option>";
            foreach($formations as $formation){
                $option.="<option value='".$formation->idformations ."'>".$formation->Label ."</option>";
            }
            echo $option;

        }catch (Zend_Db_Exception $e) {

        }
        return $r;
    }

    public function jsonlisterecueAction(){

        $r = $this->getResponse();

        $idniveau=$this->params()->fromPost("idniveau");
        $idsemestre=$this->params()->fromPost("sem");

        $sm = $this->getServiceLocator();
        $Adapter = $sm->get('DB\Adapter');

        $formationTable= new \Models\ExTutorat\ExModuleTable($Adapter);
        $listemodule=$formationTable->getECUE(null,$idsemestre,null,$idniveau,'ECUE');


        $listecue=array();
        if($listemodule){
            foreach($listemodule as   $value){
                $listecue[]=array('idecue'=>$value->idModule,'labelecue'=>$value->titremodule);
            }
        }

        echo  json_encode($listecue);//json_encode(array("data"=>$listecue, "draw"=> $this->_getParam("draw",1),"recordsTotal"=> count($listecue), "recordsFiltered"=> count($listecue)));

        return $r;


    }
    public function getniveaulevelAction(){

        $response = $this->getResponse();

        $dataposted=$this->params()->fromPost();

        if(isset($dataposted['id'])){
             $sm = $this->getServiceLocator();
            $Adapter = $sm->get('DB\Adapter');

            $NiveauTable= new \Models\ExTutorat\ExNiveauformationTable($Adapter);
            $rec= $NiveauTable->getNiveau($dataposted['id']);
            $options="";
            foreach ($rec as $r){
                $options.="<option value='".$r->idniveauformation."'>".$r->labelnivformation."</option>";
            }

            echo $options;

        }else{
            echo "";
        }

        return $response;
    }


    public function getPeriodeAction(){

        $response = $this->getResponse();

        $dataposted=$this->params()->fromPost();

        if(isset($dataposted['id'])){
            $sm = $this->getServiceLocator();
            $Adapter = $sm->get('DB\Adapter');

            $PeriodeTable= new \Models\ExTutorat\ExPeriodeTable($Adapter);
            $NiveauTable= new \Models\ExTutorat\ExNiveauformationTable($Adapter);
            $nivform=$NiveauTable->select("idniveauformation=".$dataposted['id']);
            $nivform=$nivform->current();
            $rec= $PeriodeTable->getAllPeriodeDetails($nivform->idlevelformation);
            $options="";
            foreach ($rec as $r){
                $options.="<option value='".$r->idperiode."'>".$r->labelperiode."</option>";
            }

            echo $options;

        }else{
            echo "";
        }

        return $response;
    }


    public function getniveaulevelJsonAction(){

        $response = $this->getResponse();

        $dataposted=$this->params()->fromPost();

        if(isset($dataposted['id'])){
            $sm = $this->getServiceLocator();
            $Adapter = $sm->get('DB\Adapter');

            $NiveauTable= new \Models\ExTutorat\ExNiveauformationTable($Adapter);
            $rec= $NiveauTable->getNiveau($dataposted['id']);
            $options="";
            foreach ($rec as $r){
                $options[$r->idniveauformation]=$r->labelnivformation;
            }

            echo \Zend\Json\Encoder::encode($options);

        }else{
            echo "";
        }

        return $response;
    }

    public function getformationoptionAction(){

        $r = $this->getResponse();

          $iddiplome=$this->params()->fromPost("idpere");

        try{

            $option="<option value='' selected>Selecionner une formation</option>";
             $this->contructtree($formations,$iddiplome,"",$option);


            echo $option;

        }catch (Zend_Db_Exception $e) {

        }
        return $r;

    }

    /**
     * Get table
     */
    public function getFormationTable()
    {
        
        if (!$this->formationsTable) {
            $sm = $this->getServiceLocator();
            $this->formationsTable = $sm->get('Model\AnneeunivTable');
        }
         return $this->formationsTable;
    }

    /**
     * Showdetailsformation action for ShowController
     *
     * @return ViewModel
     */
    public function showdetailsformationAction()
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

                $PeriodeTable = new \Models\ExTutorat\ExNiveauformationTable($Adapter);
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
     * Showdetailsmoduls action for ShowController
     *
     * @return ViewModel
     */
    public function showdetailsmodulsAction()
    {
        try{
            $viewModel = new ViewModel();
             $viewModel->setTerminal(true);
            $idform=$this->params()->fromPost('idform');
            $idPeriode=$this->params()->fromPost('sem',null);

            $ecran=$this->params()->fromPost('ecran',null);
            $idue=$this->params()->fromPost('idue',null);


            $viewModel->ecran=$ecran;

             $viewModel->idform=$idform;
            $viewModel->sem=$idPeriode;


            $sm = $this->getServiceLocator();
            $Adapter = $sm->get('DB\Adapter');

            $PeriodeTable = new \Models\ExTutorat\ExNiveauformationTable($Adapter);
            $viewModel->Niveau=$niveau=$PeriodeTable->getNiveauByPeriodeFormation($idform,$idPeriode);



            $ModuleTable= new \Models\ExTutorat\ExModuleTable($Adapter);


            $viewModel->modules= $ModuleTable->getModules($idform,$idPeriode,$idue);
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
     * Enseignements action for ShowController
     *
     * @return ViewModel
     */
    public function enseignementsAction()
    {
        $viewModel = new ViewModel();

        return $viewModel;
    }

    /**
     * Gestionue action for ShowController
     *
     * @return ViewModel
     */
    public function gestionueAction()
    {
        $viewModel = new ViewModel();

        return $viewModel;
    }

    /**
     * Detailmodulepresence action for ShowController
     *
     * @return ViewModel
     */
    public function detailmodulepresenceAction()
    {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);
        return $viewModel;
    }

    /**
     * Detailmodulevirtual action for ShowController
     *
     * @return ViewModel
     */
    public function detailmodulevirtualAction()
    {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);

        return $viewModel;
    }

    private function getDescFormation(&$listeformation, $idpere = null)
    {
        $sm = $this->getServiceLocator();

        $_TableFormation = $sm->get('Model\FormationTable');

        if(!empty($idpere)){

        }
        $_TableFormation->getformation();
    }

    /**
     * listeformations action for ShowController
     *
     * @return ViewModel
     */
    public function listeformationsAction()
    {
        $viewModel = new ViewModel();

        $sm = $this->getServiceLocator();
        $_listeformation = $sm->get('Model\FormationTable');
        $viewModel->listeformation=$_listeformation->getformation();
        $formations=array();
        $_listeformation->getdetailsformation($formations);
        $viewModel->formations=$formations;
        return $viewModel;
    }

    /**
     * showallue action for ShowController
     *
     * @return ViewModel
     */
    public function showallueAction()
    {
        $viewModel = new ViewModel();

        return $viewModel;
    }

    /**
     * showallue action for ShowController
     *
     * @return ViewModel
     */
    public function showenseignementueAction()
    {
        $viewModel = new ViewModel();

        return $viewModel;
    }

    /**
     * Whowjsonformation action for ShowController
     *
     * @return ViewModel
     */
    private function contructtree(&$formation, $id = '', $idsingne = '',&$options="")
    {
        $sm = $this->getServiceLocator();
        $_listeformation = $sm->get('Model\FormationTable');
        $_listeniveau= $sm->get('Model\NiveauformationTable');
        $_listLevel= $sm->get('Model\LevelformationTable');

        if(empty($id)){
            $listeformation=$_listeformation->getThisFormation("",true,$idsingne);
        }else{
            $listeformation=$_listeformation->getThisFormation($id,true,$idsingne);
        }
         //print_r($listeformation);
        foreach ($listeformation as $key => $value){
            $tmplist=$_listeformation->getThisFormation($value['key']);

            if ($tmplist->count()==0){
                $formation1=array();
                $formation1["key"]= $value['key'];
                $formation1["title"]= $value['abrev'];
                $formation1["tooltip"]= $value['value'];
                $formation1["iconclass"]= "fa fa-graduation-cap text-green";

                $formation1["folder"]= "true";
                $niveau=array();

                $niveau=$_listeniveau->getNiveau($value['key']);
                $options.="<option value='".$value['key']."'>".$value['abrev']."</option>";


                foreach ($niveau as $keyniv => $valniv){
                    $niv=array();
                    $niv["key"]= "NIV_".$valniv['idniveauformation'];
                    $niv["title"]= $valniv['labelnivformation'];
                    $niv["tooltip"]= $value['value'].'('.$valniv['labelnivformation'].')' ;
                    $niv["iconclass"]= "fa fa-tags text-yellow";



                    $semestres=$_listLevel->getPeriode($valniv['idlevelformation']);

                    foreach ($semestres as  $semestre){
                        $sem=array();
                        $sem["key"]= "SEM_".$semestre['idperiode']."_".$valniv['idlevelformation']."_".$valniv['idniveauformation'];
                        $sem["title"]= $semestre['labelperiode'];
                        $sem["tooltip"]= $semestre['labelperiode'];
                        $sem["iconclass"]= "fa fa-calendar-check-o text-red";
                        $niv['children'][]=$sem;
                    }
                    if(isset($niv['children']) && count($niv['children'])>0){
                        $niv["folder"]= "true";
                    }else{
                        $niv["folder"]= "false";
                    }

                    $formation1['children'][]=$niv;
                }
                $formation[]=$formation1;
                $formation1=array();
            }else{
                $formation1=array();
                $formation1["key"]= "PERE_".$value['key'];
                $formation1["title"]= $value['abrev'];
                $formation1["tooltip"]= $value['value'];
                $formation1["folder"]= "true";
                $formation1['children']=array();
                $formation1["iconclass"]= "fa fa-folder text-purple";

                $this->contructtree($formation1['children'],$value['key'], $idsingne ,$options);
                $formation[]=$formation1;
            }
        }
    }

    public function whowjsonformationAction()
    {
        $allform=array();

        $currentformation="";
        $this->contructtree($allform,"",$currentformation);
        $formation1["key"]= "GPERE_IDEtab";
        $formation1["title"]= "Gestion des formations";
        $formation1["tooltip"]= "Universite Virtuelle de Tunis";
        $formation1["folder"]= "true";
        $formation1['iconclass']="fa fa-briefcase text-green";
        $formation1['children']=$allform;
        $form[]=$formation1;
        echo \Zend\Json\Encoder::encode($form);
        $viewModel = new ViewModel();

        $viewModel->setTerminal(true);
        return $viewModel;
    }

    /**
     * Whowtreeformation action for ShowController
     *
     * @return ViewModel
     */
    public function whowtreeformationAction()
    {
        $viewModel = new ViewModel();

        return $viewModel;
    }

    /**
     * Configdiplome action for ShowController
     *
     * @return ViewModel
     */
    public function configdiplomeAction()
    {
        $viewModel = new ViewModel();
        return $viewModel;
    }

    /**
     * Parametrageniveau action for ShowController
     *
     * @return ViewModel
     */
    public function parametrageniveauAction()
    {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);
        $id1=$this->params()->fromRoute('id');
        $id2=$this->params()->fromRoute('id1');



        $ids=explode("_",$id2);
        $sm = $this->getServiceLocator();
        $_listeformation = $sm->get('Model\FormationTable');
        $viewModel->listeformation=$_listeformation->getformation($ids[3]);
        $formations=array();

        $_listeformation->getdetailsformation($formations);
        $viewModel->formations=$formations;
        return $viewModel;
    }

    /**
     * Parametrageuniv action for ShowController
     *
     * @return ViewModel
     */
    public function parametrageunivAction()
    {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);
        $id1=$this->params()->fromRoute('id');
        $id2=$this->params()->fromRoute('id1');
        $ids=explode("_",$id2);
        $sm = $this->getServiceLocator();
        $_listeformation = $sm->get('Model\FormationTable');
        $viewModel->listeformation=$_listeformation->getformation( );
        $formations=array();

        $_listeformation->getdetailsformation($formations);
        $viewModel->formations=$formations;

        return $viewModel;
    }

    /**
     * Parametrageformation action for ShowController
     *
     * @return ViewModel
     */
    public function parametrageformationAction()
    {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);

        $id1=$this->params()->fromRoute('id');
        $id2=$this->params()->fromRoute('id1');
        $ids=explode("_",$id2);
        $sm = $this->getServiceLocator();
        $_listeformation = $sm->get('Model\FormationTable');
        $viewModel->listeformation=$_listeformation->getformation($ids[1]);
        $formations=array();

        $_listeformation->getdetailsformation($formations);
        $viewModel->formations=$formations;

        return $viewModel;
    }

    /**
     * Detailecue action for ShowController
     *
     * @return ViewModel
     */
    public function detailecueAction()
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
