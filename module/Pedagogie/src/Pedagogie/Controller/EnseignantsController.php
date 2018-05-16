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
 * EnseignantsController
 *
 * Handles the EnseignantsController requests for the Pedagogie Module
 *
 * @package Pedagogie\Controller
 */
class EnseignantsController extends AbstractActionController
{

    /**
     * Index action for EnseignantsController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();

                                return $viewModel;
    }

    /**
     * Invitation action for EnseignantsController
     *
     * @return ViewModel
     */
    public function invitationAction()
    {
        $viewModel = new ViewModel();
                                $form = new  \Pedagogie\Form\Invitation('Invitation');

                                $viewModel->form=$form;

                                $sm = $this->getServiceLocator();
                                $Adapter = $sm->get('DB\Adapter');

                                $periodeTable= new \Models\ExTutorat\ExPeriodeTable($Adapter);
                                $viewModel->rowssem=$periodeTable->fetchAll();
                                $AnneeUnivTable= new \Models\Tutorat\Model\AnneeunivTable($Adapter);
                                $viewModel->rows=$AnneeUnivTable->fetchAll();

                                $viewModel->errors=array();

                                return $viewModel;
    }

    /**
     * EnvoyerInvitation action for EnseignantsController
     *
     * @return ViewModel
     */
    public function envoyerInvitationAction()
    {
        $viewModel = new ViewModel();
        try{
            $idinvitation=$this->params()->fromRoute('id',null);

            $sm = $this->getServiceLocator();
            $Adapter = $sm->get('DB\Adapter');
            $InvitationTable= new \Models\ExTutorat\ExInvitationsTable($Adapter);
            if(!empty($idinvitation)){

                $RecTableGetWay=$InvitationTable->select("idinvitations=$idinvitation" );
                $Invitation=$RecTableGetWay->current();
                $translator = $sm->get('translator');

                ///rechercher des ECUE d'invitation
                $ModuleTable= new \Models\ExTutorat\ExModuleTable($Adapter);
                $InvitationUETable= new \Models\Tutorat\Model\NvittutoratueTable($Adapter);
                $ModuleInviter= $InvitationUETable->select("idinvitations=$idinvitation");

                foreach ($ModuleInviter as $modi){
                    $idues[]=$modi->idModule;
                }

                ///creation de l'url de préinscription
                $EnvoyerPar='Oussama Limam:Oussama.limam@gmail.com';
                $DateEnvoi=date("Y-m-d H:i:s");
                $email=$Invitation->email;
                if($Invitation->typeinvitation=="Tutorat") {

                    $Modules=$ModuleTable->getModulesInfo($idues);
                    $formationTable= new \Models\ExTutorat\ExFormationsTable($Adapter);
                    //Construction des information pour l'affichage
                    foreach ($Modules as $idformation => $m){
                        $formation=array();
                        $formationTable->getDiplomeDetails($idformation,$formation);
                        $Modules[$idformation]['formation']=$formation;
                    }
                    ///criptage de code d'invitation création de __token

                    $codeinvitation = \Myhelper\CryptDecrypt::getEnc($email . "|" . implode(";", $idues) . "|" . $Invitation->idanneeuniv . "|" . $EnvoyerPar . "|" . $DateEnvoi . "|" . $Invitation->typeinvitation);
                    $url = $this->url()->fromRoute('enseignant/controller-action', array('controller' => 'mon-compte', 'action' => 'index'), array('query' => array("__token" => $codeinvitation)), true);


                    $textinvitation = \Myhelper\Template::GenView("Mail/invite", 'layouts/adminlte/map_template.php',
                        array(
                            'nom' => $Invitation->nominviter
                            , "prenom" => $Invitation->prenominviter
                            , "link" => $url
                            , "contextMail" => $translator->translate("Context_Email_Invitation_Tuteur")
                            , "EmailText" => $translator->translate("Message_Email_Invitation_Tuteur")
                            , "textToGetLink" => $translator->translate("GoToLink_Message_Email_Invitation_Tuteur")
                            , "ListeModules" => $Modules

                        )
                    );
                }elseif ($Invitation->typeinvitation=="Coordination"){

                    if(!empty($Invitation->infosuplimentaire)){
                        $formationecue=\Zend\Json\Decoder::decode($Invitation->infosuplimentaire,\Zend\Json\Json::TYPE_ARRAY);
                        $NiveauTable= new \Models\ExTutorat\ExNiveauformationTable($Adapter);
                        $recniveau= $NiveauTable->getNiveau($formationecue["Formation"]);

                        $formationTable= new \Models\ExTutorat\ExFormationsTable($Adapter);

                        $formationTable->getDiplomeDetails($formationecue["Formation"],$formationdetails);

                        $formationInfo["diplome"]=$formationdetails;
                        if(isset($formationecue["Niveaux"])){
                            foreach ($recniveau as $n){
                                if(isset($formationecue["Niveaux"][$n->idniveauformation])){
                                    $formationInfo["niveaux"][$n->idniveauformation]=$n->labelnivformation;
                                }
                            }
                            $ListeInvitations[$Invitation->idinvitations]['formation']=$formationInfo;
                        }

                    }

                    $codeinvitation = \Myhelper\CryptDecrypt::getEnc($email . "|".$formationecue["Formation"]."|" . $Invitation->idanneeuniv . "|" . $EnvoyerPar . "|" . $DateEnvoi . "|" . $Invitation->typeinvitation);
                    $url = $this->url()->fromRoute('enseignant/controller-action', array('controller' => 'mon-compte', 'action' => 'index'), array('query' => array("__token" => $codeinvitation)), true);

                    $textinvitation = \Myhelper\Template::GenView("Mail/invitecoordinateur", 'layouts/adminlte/map_template.php',
                        array(
                            'nom'               => $Invitation->nominviter
                            , "prenom"          => $Invitation->prenominviter
                            , "link"            => $url
                            , "contextMail"     =>  $translator->translate("Context_Email_Invitation_Coordinateur")
                            , "EmailText"       =>  $translator->translate("Message_Email_Invitation_Coordinateur")
                            , "textToGetLink"   =>  $translator->translate("GoToLink_Message_Email_Invitation_Coordinateur")
                            , 'Formations'      =>  $formationInfo

                        )
                    );


                }
                $datesEnvoi=array();
                if(!empty($Invitation->datesenvois)){
                   // print_r($Invitation->datesenvois);die('rrrrr');
                    $datesEnvoi=\Zend\Json\Decoder::decode($Invitation->datesenvois,\Zend\Json\Json::TYPE_ARRAY);

                    $datesEnvoi[]=array('date'=>$DateEnvoi,'envoyerpar'=>$EnvoyerPar);
                }else{
                    $datesEnvoi[]=array('date'=>$DateEnvoi,'envoyerpar'=>$EnvoyerPar);
                }

                $InvitationTable->update(array(
                    'codeinvitation'=>  $codeinvitation
                    ,'textinvitation'=> htmlentities(htmlspecialchars($textinvitation))
                    , "datesenvois"=>   \Zend\Json\Encoder::encode($datesEnvoi)
                ),"idinvitations=$idinvitation");


                //Envoi de mail
                $SenderObj=new \Myhelper\MailSender();
                $SenderObj->setTo($Invitation->email);
                $SenderObj->SetFrom("oussama.limam@gmail.com");
                $SenderObj->setNameFrom("Scolarité UVT");
                $SenderObj->setSubject("Invitation au Coordinateur");
                $SenderObj->getContent($textinvitation);
                $SenderObj->sendMail();
                $viewModel->messagesave=$textinvitation;
            }else{
                $viewModel->messagesave="Erreur de code Invitation";

            }
        }catch (\Exception $e){
            $viewModel->messagesave=$e->getMessage() ;
        }

        $viewModel->setTerminal(true);

        return $viewModel;
    }

    /**
     * ReEnvoyerInvitation action for EnseignantsController
     *
     * @return ViewModel
     */
    public function reEnvoyerInvitationAction()
    {
        $viewModel = new ViewModel();
                                $viewModel->setTerminal(true);


                                return $viewModel;
    }

    /**
     * ListerMailInvitation action for EnseignantsController
     *
     * @return ViewModel
     */
    public function listerMailInvitationAction()
    {
        $viewModel = new ViewModel();
        try{
            $sm = $this->getServiceLocator();
            $Adapter = $sm->get('DB\Adapter');

            $InvitationTable= new \Models\ExTutorat\ExInvitationsTable($Adapter);
            $ModuleTable= new \Models\ExTutorat\ExModuleTable($Adapter);
            $InvitationUETable= new \Models\Tutorat\Model\NvittutoratueTable($Adapter);
            $formationTable= new \Models\ExTutorat\ExFormationsTable($Adapter);
            $idannee=\Myhelper\GenericParams::__getUnivYear();
            $ListeInvitation=$InvitationTable->select("idanneeuniv='$idannee' AND typeinvitation= 'Tutorat'");
            $ListeInvitations=array();
            foreach($ListeInvitation as $Lm){
                $ListeInvitations[$Lm->idinvitations]['invitation']=$Lm;

                ///rechercher des ECUE d'invitation

                $ModuleInviter= $InvitationUETable->select("idinvitations=".$Lm->idinvitations);
                $idues=array();
                foreach ($ModuleInviter as $modi){
                    $idues['liste'][]=$modi->idModule;
                    $idues['reponse'][$modi->idModule]=$modi->datereponse;
                }

                $Modules=$ModuleTable->getModulesInfo($idues['liste']);
                foreach ($Modules as $idformation => $m){
                    $formation=array();
                    $formationTable->getDiplomeDetails($idformation,$formation);
                    $Modules[$idformation]['formation']=$formation;
                    $Modules[$idformation]['reponse']= $idues['reponse'];
                }
                $ListeInvitations[$Lm->idinvitations]['modules']=$Modules;

            }
             $viewModel->listeInvitation=$ListeInvitations;

        }catch (\Exception $e){
            $viewModel->messagesave=$e->getMessage() ;
        }

                                //$viewModel->setTerminal(true);
                                return $viewModel;
    }

    /**
     * SaveMailInvitation action for EnseignantsController
     *
     * @return ViewModel
     */
    public function saveMailInvitationAction()
    {
        $viewModel = new ViewModel();
                                try{
                                    $sm = $this->getServiceLocator();

                                    $Adapter = $sm->get('DB\Adapter');

                                    $email          =   $this->params()->fromPost('email',null);
                                    $nominviter     =   $this->params()->fromPost('nom',null);
                                    $prenominviter  =   $this->params()->fromPost('prenom',null);
                                    $idanneeuniv    =   $this->params()->fromPost('anneescolaire',null);
                                    $idperiode      =   $this->params()->fromPost('semestre',null);
                                    $idues          =   $this->params()->fromPost('idecue',null);

                                    $EnvoyerPar='Oussama Limam:Oussama.limam@gmail.com';
                                    $DateEnvoi=date("Y-m-d H:i:s");
                                   // $codeinvitation= \Myhelper\CryptDecrypt::getEnc($email."|".implode("",$idues)."|".$EnvoyerPar."|".$DateEnvoi);
                                    $translator = $sm->get('translator');

                                    $ModuleTable= new \Models\ExTutorat\ExModuleTable($Adapter);
                                    $Modules=$ModuleTable->getModulesInfo($idues);
                                    $formationTable= new \Models\ExTutorat\ExFormationsTable($Adapter);

                                    foreach ($Modules as $idformation => $m){
                                        $formation=array();
                                        $formationTable->getDiplomeDetails($idformation,$formation);
                                        $Modules[$idformation]['formation']=$formation;
                                    }



                                    //$url=$this->url()->fromRoute('enseignant/controller-action', array('controller'=>'create', 'action'=>'menu-cv-eseignant'),array('query'=>array("__token"=>$codeinvitation)),true);

                                    $textinvitation = \Myhelper\Template::GenView("Mail/invite", 'layouts/adminlte/map_template.php',
                                        array('nom'             =>  $nominviter
                                            , "prenom"          =>  $prenominviter
                                            , "link"            =>  ""//$url
                                            , "contextMail"     =>  $translator->translate("Context_Email_Invitation_Tuteur")
                                            , "EmailText"       =>  $translator->translate("Message_Email_Invitation_Tuteur")
                                            , "textToGetLink"   =>  $translator->translate("GoToLink_Message_Email_Invitation_Tuteur")
                                            , "ListeModules"    =>  $Modules

                                        )
                                    );
                                   // $platform = $Adapter()->getPlatform();

                                    $BasicData=array(

                                         'idanneeuniv'=>$idanneeuniv
                                        ,'idperiode'=>$idperiode
                                        ,'textinvitation'=>htmlentities(htmlspecialchars($textinvitation))
                                        ,'email'=>$email
                                        ,'nominviter'=>$nominviter
                                        ,'prenominviter'=>$prenominviter
                                    ,'typeinvitation'=>"Tutorat"
                                         //,'codeinvitation'=>$codeinvitation
                                        , "datesenvois"=>   \Zend\Json\Encoder::encode(array("0"=>array('date'=>$DateEnvoi,'envoyerpar'=>$EnvoyerPar)))
                                        //DATE ENVOI
                                    );

                                    $Adapter->getDriver()->getConnection()->beginTransaction();
                                    $InvitationTable= new \Models\ExTutorat\ExInvitationsTable($Adapter);
                                    $InvitationListeModuleTable=new \Models\Tutorat\Model\NvittutoratueTable($Adapter);
                                    $InvitaionSended=$InvitationTable->getInvitation($email,$idues,$idanneeuniv);

                                    if($InvitaionSended->count()==0){

                                        $idinvitation=  $InvitationTable->insert($BasicData);

                                        foreach ($idues as $idue){
                                            $BasicData=array(
                                                "idModule"=>$idue
                                                ,"idinvitations"=> $InvitationTable->lastInsertValue
                                                ,'statusinvtvalid'=>'InvitationEncours'
                                            );
                                            $InvitationListeModuleTable->insert($BasicData);
                                        }
                                         $viewModel->messagesave=\Zend\Json\Encoder::encode(array(
                                             'status'=>'success'
                                             ,'idinvitation'=>$InvitationTable->lastInsertValue
                                            ,'Envoi'=>'Oui'
                                             ,'message'=>'Invitation enregistrer'
                                         ));
                                    }else{
                                         $viewModel->messagesave=\Zend\Json\Encoder::encode(array(
                                             'status'=>'success'
                                             ,'Envoi'=>'Non'
                                             ,'message'=>'Déjà envoyer'
                                         ));
                                     }

                                    $Adapter->getDriver()->getConnection()->commit();

                                }catch (\Exception $e){
                                    $viewModel->messagesave=\Zend\Json\Encoder::encode(array(
                                        'status'=>'error',
                                        'message'=>$e->getMessage()
                                    ));
                                    $Adapter->getDriver()->getConnection()->rollback();
                                }
                                $viewModel->setTerminal(true);

                                return $viewModel;
    }

    /**
     * ShowMailInvitation action for EnseignantsController
     *
     * @return ViewModel
     */
    public function showMailInvitationAction()
    {
        $viewModel = new ViewModel();
                                try{
                                    $sm          = $this->getServiceLocator();
                                    $Adapter     = $sm->get('DB\Adapter');
                                    $id          = $this->params()->fromRoute('id',null);

                                    $InvitationTable= new \Models\ExTutorat\ExInvitationsTable($Adapter);
                                    $Invitation=$InvitationTable->select("idinvitations='$id'");
                                    $viewModel->Invitation=$Invitation->current();

                                }catch (\Exception $e){
                                    $viewModel->messagesave=$e->getMessage() ;
                                }

                                $viewModel->setTerminal(true);
                                return $viewModel;
    }

    /**
     * InvitationCoordination action for EnseignantsController
     *
     * @return ViewModel
     */
    public function invitationCoordinationAction()
    {
        $viewModel = new ViewModel();
        $form = new  \Pedagogie\Form\InvitationCoordination();

        $viewModel->form=$form;

        $sm = $this->getServiceLocator();
        $Adapter = $sm->get('DB\Adapter');

         $NatureCoordinationTable= new \Models\Tutorat\Model\NaturecoordinateurTable($Adapter);
        $viewModel->naturecoordination=$NatureCoordinationTable->fetchAll();

        $AnneeUnivTable= new \Models\Tutorat\Model\AnneeunivTable($Adapter);
        $viewModel->rows=$AnneeUnivTable->fetchAll();

        $viewModel->errors=array();

        return $viewModel;
    }

    /**
     * SaveInvitCoordination action for EnseignantsController
     *
     * @return ViewModel
     */
    public function saveInvitCoordinationAction()
    {
        $viewModel = new ViewModel();
                try{
                    $sm = $this->getServiceLocator();

                    $Adapter = $sm->get('DB\Adapter');

                    $email          =   $this->params()->fromPost('email',null);
                    $nominviter     =   $this->params()->fromPost('nom',null);
                    $prenominviter  =   $this->params()->fromPost('prenom',null);
                    $idanneeuniv    =   $this->params()->fromPost('anneescolaire',\Myhelper\GenericParams::__getUnivYear());
                    $idnaturecoordination      =   $this->params()->fromPost('naturecoordination',null);
                    $diplomeecue         =   $this->params()->fromPost('diplomeecue',null);
                    $formationecue=    $this->params()->fromPost('formationecue',null);
                    $Niveau=    $this->params()->fromPost('idNiveau',null);

                    $NiveauTable= new \Models\ExTutorat\ExNiveauformationTable($Adapter);
                    $recniveau= $NiveauTable->getNiveau($formationecue);

                    $formationTable= new \Models\ExTutorat\ExFormationsTable($Adapter);

                    $formationTable->getDiplomeDetails($formationecue,$formationdetails);

                    $formationInfo["diplome"]=$formationdetails;

                    foreach ($recniveau as $n){
                        if(in_array($n->idniveauformation,$Niveau)){
                            $formationInfo["niveaux"][$n->idniveauformation]=$n->labelnivformation;
                        }
                    }

                    $EnvoyerPar='Oussama Limam:Oussama.limam@gmail.com';
                    $DateEnvoi=date("Y-m-d H:i:s");
                    $translator = $sm->get('translator');

                    $textinvitation = \Myhelper\Template::GenView("Mail/invitecoordinateur", 'layouts/adminlte/map_template.php',
                        array('nom'             =>  $nominviter
                        , "prenom"          =>  $prenominviter
                        , "link"            =>  ""
                        , "contextMail"     =>  $translator->translate("Context_Email_Invitation_Coordinateur")
                        , "EmailText"       =>  $translator->translate("Message_Email_Invitation_Coordinateur")
                        , "textToGetLink"   =>  $translator->translate("GoToLink_Message_Email_Invitation_Coordinateur")
                        ,'Formations'=>$formationInfo

                        )
                    );
                    // $platform = $Adapter()->getPlatform();

                    $BasicData=array(

                        'idanneeuniv'           =>$idanneeuniv
                        ,'textinvitation'       =>htmlentities(htmlspecialchars($textinvitation))
                        ,'email'                =>$email
                        ,'nominviter'           =>$nominviter
                        ,'prenominviter'        =>$prenominviter
                        ,'typeinvitation'       =>"Coordination"
                        ,'idnaturecoordinateur' =>$idnaturecoordination
                        ,'infosuplimentaire'    =>\Zend\Json\Encoder::encode(array("Diplome"=>"$diplomeecue","Formation"=>"$formationecue","Niveaux"=>$formationInfo["niveaux"],"Code"=>"Dip_$diplomeecue"."_Parc_$formationecue"))
                        ,'datesenvois'          =>\Zend\Json\Encoder::encode(array("0"=>array('date'=>$DateEnvoi,'envoyerpar'=>$EnvoyerPar)))

                    );

                    $InvitationTable= new \Models\ExTutorat\ExInvitationsTable($Adapter);
                    $InvitaionSended=$InvitationTable->getInvitationCoordination($email,$idanneeuniv,"Dip_$diplomeecue"."_Parc_$formationecue");
                      if($InvitaionSended->count()==0){

                        $InvitationTable->insert($BasicData);
                        $viewModel->messagesave=\Zend\Json\Encoder::encode(array(
                            'status'=>'success'
                            ,'idinvitation'=>$InvitationTable->lastInsertValue
                            ,'Envoi'=>'Oui'
                            ,'message'=>'Invitation enregistrer'
                        ));
                     }else{
                        $viewModel->messagesave=\Zend\Json\Encoder::encode(array(
                            'status'=>'success'
                            ,'Envoi'=>'Non'
                            ,'message'=>'Déjà envoyer'
                        ));
                    }


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
     * ListerInivitationCoordinateur action for EnseignantsController
     *
     * @return ViewModel
     */
    public function listerInivitationCoordinateurAction()
    {

        $viewModel = new ViewModel();
        try{
            $sm = $this->getServiceLocator();
            $Adapter = $sm->get('DB\Adapter');

            $InvitationTable= new \Models\ExTutorat\ExInvitationsTable($Adapter);
            $ModuleTable= new \Models\ExTutorat\ExModuleTable($Adapter);
            $InvitationUETable= new \Models\Tutorat\Model\NvittutoratueTable($Adapter);
            $formationTable= new \Models\ExTutorat\ExFormationsTable($Adapter);
            $idannee=\Myhelper\GenericParams::__getUnivYear();
            $ListeInvitation=$InvitationTable->select("idanneeuniv='$idannee' AND typeinvitation='Coordination'");
            $ListeInvitations=array();
            foreach($ListeInvitation as $Lm){
                $ListeInvitations[$Lm->idinvitations]['invitation']=$Lm;

                ///rechercher des ECUE d'invitation
                ///

                if(!empty($Lm->infosuplimentaire)){
                    $formationecue=\Zend\Json\Decoder::decode($Lm->infosuplimentaire,\Zend\Json\Json::TYPE_ARRAY);
                     $NiveauTable= new \Models\ExTutorat\ExNiveauformationTable($Adapter);
                    $recniveau= $NiveauTable->getNiveau($formationecue["Formation"]);

                    $formationTable= new \Models\ExTutorat\ExFormationsTable($Adapter);

                    $formationTable->getDiplomeDetails($formationecue["Formation"],$formationdetails);

                    $formationInfo["diplome"]=$formationdetails;
                    if(isset($formationecue["Niveaux"])){
                        foreach ($recniveau as $n){
                            if(isset($formationecue["Niveaux"][$n->idniveauformation])){
                                $formationInfo["niveaux"][$n->idniveauformation]=$n->labelnivformation;
                            }
                        }
                        $ListeInvitations[$Lm->idinvitations]['formation']=$formationInfo;
                    }

                }


            }
            $viewModel->listeInvitation=$ListeInvitations;

        }catch (\Exception $e){
            $viewModel->messagesave=$e->getMessage() ;
        }

        //$viewModel->setTerminal(true);

        return $viewModel;
    }


}
