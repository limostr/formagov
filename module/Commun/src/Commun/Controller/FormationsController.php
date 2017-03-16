<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


namespace Commun\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\View\Model\JsonModel;

/**
 * FormationsController
 *
 * Handles the FormationsController requests for the Commun Module
 *
 * @package Commun\Controller
 */
class FormationsController extends AbstractActionController
{

    /**
     * Index action for FormationsController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();

                return $viewModel;
    }

    /**
     * Whowjsonformation action for ShowController
     *
     * @return ViewModel
     */
    private function contructtree(&$formation, $id = '', $idsingne = '')
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

                        $this->contructtree($formation1['children'],$value['key']);
                        $formation[]=$formation1;
                    }
                }
    }

    /**
     * Whowjsonforma action for FormationsController
     *
     * @return ViewModel
     */
    public function whowjsonformaAction()
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

        $viewModel =new JsonModel(array(
            'data' => $form,
        ));

        $viewModel->setTerminal(true);
        return $viewModel;


    }


}
