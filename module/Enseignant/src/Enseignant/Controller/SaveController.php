<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


namespace Enseignant\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

/**
 * SaveController
 *
 * Handles the SaveController requests for the Enseignant Module
 *
 * @package Enseignant\Controller
 */
class SaveController extends AbstractActionController
{

    /**
     * Index action for SaveController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();

                                        return $viewModel;
    }

    /**
     * Donneepersonnelle action for SaveController
     *
     * @return ViewModel
     */
    public function donneepersonnelleAction()
    {
        $viewModel = new ViewModel();
                                $form = new \Enseignant\Form\Donneepersonnelle();
                                if($this->getRequest()->isPost()) {

                                    $form->setData($this->getRequest()->getPost());
                                   // if($form->isValid()){
                                        $nom=$this->params()->fromPost('nom',null);
                                        $prenom=$this->params()->fromPost('prenom',null);
                                        $cin=$this->params()->fromPost('cin',null);
                                      //  $email=$this->params()->fromPost('email',null);

                                        $telphonefix=$this->params()->fromPost('telfix',null);
                                        $telphonemob=$this->params()->fromPost('telportable',null);

                                        $codepostal=$this->params()->fromPost('codepostal',null);
                                        $pays=$this->params()->fromPost('pays',null);
                                        $ville=$this->params()->fromPost('ville',null);
                                        $adress=$this->params()->fromPost('adress',null);
                                        $lieudenaissance=$this->params()->fromPost('lieudenaissance',null);
                                        $datedenaissance=$this->params()->fromPost('datedenaissance',null);

                                        $rib=$this->params()->fromPost('rib',null);
                                        $civilite=$this->params()->fromPost('civilite',null);

                                        $matricule=$this->params()->fromPost('matricule',null);
                                        $typematricule=$this->params()->fromPost('typematricule',null);


                                        $datelivraison=$this->params()->fromPost('datelivrecin',null);

                                        $lang=$this->params()->fromQuery("lng","fr");

                                        $user = \Myhelper\GenericParams::__getInfoUserLogged();

                                        if($user->idpersonnes!=$cin){
                                            return "erreur";
                                        }

                                        try{
                                        $sm = $this->getServiceLocator();
                                        $Adapter = $sm->get('DB\Adapter');
                                        $Adapter->getDriver()->getConnection()->beginTransaction();

                                        $TablePersonne = new \Models\Tutorat\Model\PersonnesTable($Adapter);
                                        $TableInfoPersonne = new \Models\Tutorat\Model\InfopersonneTable($Adapter);
                                        $TableEnseignant = new \Models\Tutorat\Model\EnseignantsTable($Adapter);
                                        

                                        $datatopost=array(
                                             'matricule'=>$matricule
                                            ,"civilite"=>$civilite
                                             ,"cin"=>$cin
                                            ,"telephone"=>\Zend\Json\Encoder::encode(array("Fix"=>$telphonefix,"Portable"=>$telphonemob))
                                            ,'datelivrecin'=>date("Y-m-d",strtotime($datelivraison))
                                            ,'typematricule'=>$typematricule
                                            ,"codepostal"=>$codepostal
                                            ,"datedenaissance"=>date("Y-m-d",strtotime($datedenaissance))
                                        );
                                        $TablePersonne->update($datatopost,"idpersonnes=".$user->idpersonnes);
                                        
                                        $datatopost=array(
                                             'nom'=>$nom
                                            ,'prenom'=>$prenom
                                            ,'lieudenaissance'=>$lieudenaissance
                                            ,'adress'=>$adress
                                            ,"ville"=>$ville
                                            ,"pays"=>$pays


                                        );
                                        $existInfo=$TableInfoPersonne->select("idpersonnes=".$user->idpersonnes." AND idlangue='$lang'");
                                        if($existInfo->count()>0){
                                            $TableInfoPersonne->update($datatopost,"idpersonnes=".$user->idpersonnes." AND idlangue='$lang'");
                                        }else{
                                            $datatopost['idpersonnes']=$user->idpersonnes;
                                            $datatopost['idlangue']=$lang;
                                            $TableInfoPersonne->insert($datatopost);
                                        }
                                        $Ens=$TableEnseignant->select("idpersonnes=".$user->idpersonnes);
                                        if($Ens->count()>0){
                                            $TableEnseignant->update(array('rib'=>$rib),"idpersonnes=".$user->idpersonnes);
                                        }else{
                                            $TableEnseignant->insert(array('rib'=>$rib));
                                        }



                                        $Adapter->getDriver()->getConnection()->commit();
                                    } catch (\Exception $e){
                                        $viewModel->messagesave=\Zend\Json\Encoder::encode(array("status"=>"Erreur","msg"=>$e->getMessage()));
                                        $Adapter->getDriver()->getConnection()->rollback();
                                    }

                               // }

                        echo $viewModel->messagesave;

                                }
                                return $viewModel;
    }

    /**
     * Etablissementenseigne action for SaveController
     *
     * @return ViewModel
     */
    public function etablissementenseigneAction()
    {
        $viewModel = new ViewModel();

                        return $viewModel;
    }

    /**
     * TraveauEnseignant action for SaveController
     *
     * @return ViewModel
     */
    public function traveauEnseignantAction()
    {
        $viewModel = new ViewModel();

                return $viewModel;
    }

    /**
     * InfoProDossierAr action for SaveController
     *
     * @return ViewModel
     */
    public function infoProDossierArAction()
    {
        $viewModel = new ViewModel();
        try{
                $lang=$this->params()->fromQuery("lng","fr");

                $user = \Myhelper\GenericParams::__getInfoUserLogged();

                $sm = $this->getServiceLocator();
                $Adapter = $sm->get('DB\Adapter');

                $InfoProEns = new \Models\Tutorat\Model\EnsinfoproTable($Adapter);
                $InfoPersonnePro=$InfoProEns->select ("idpersonnes='".$user->idpersonnes."' AND datefin IS NULL AND profisionofficiel=1");
                $societer=$this->params()->fromPost('societer',null);
                $poste=$this->params()->fromPost('poste',null);
                $fonction=$this->params()->fromPost('fonction',null);
                $grade=$this->params()->fromPost('grade',null);
                $data=array(
                  "societerar"=>$societer
                  ,"postear"=>$poste
                  ,"fonctionar"=>$fonction
                  ,"gradedepostear" =>$grade
                  ,"profisionofficiel"  =>1
                );
                if($InfoPersonnePro->count()>0){
                    $id=$InfoPersonnePro->current()->idensinfopro;
                    $InfoProEns->update($data,"idensinfopro=$id");
                }else{
                    $data['idpersonnes']=$user->idpersonnes;
                    $InfoProEns->insert($data);
                }


        }catch(\Exception $e){

        }
        return $viewModel;
    }


}
