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
 * MonCompteController
 *
 * Handles the MonCompteController requests for the Enseignant Module
 *
 * @package Enseignant\Controller
 */
class MonCompteController extends AbstractActionController
{

    /**
     * Index action for MonCompteController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
                $viewModel = new ViewModel();
                $CodeEncrypt = $this->params()->fromQuery("__token");
                $DecryptCode= \Myhelper\CryptDecrypt::getDec($CodeEncrypt);
               if($DecryptCode) {
                   $CodeExtracted = explode("|", $DecryptCode);
                   $sm = $this->getServiceLocator();
                   $Adapter = $sm->get('DB\Adapter');
                   $InvitationTable = new \Models\ExTutorat\ExInvitationsTable($Adapter);
                   $EnseignantTable= new \Models\ExTutorat\ExEnseignantsTable($Adapter);


                   if($CodeExtracted[5]=='Tutorat') {
                       $ListeUE = explode(";", $CodeExtracted[1]);
                       $Invitation = $InvitationTable->getInvitation($CodeExtracted[0], $ListeUE, $CodeExtracted[2]);
                       $InvitationInfo = $Invitation->current();


                   }elseif($CodeExtracted[5]=='Coordination') {
                       $Invitation = $InvitationTable->getInvitationCoordination($CodeExtracted[0] , $CodeExtracted[2],$CodeExtracted[1]);
                       $InvitationInfo = $Invitation->current();
                   }
               }else{
                   echo 'erreur de code';
                   return $viewModel;
               }

        if (!empty($InvitationInfo->codeinvitation)) {
            if (!empty($InvitationInfo->datesenvois)) {
                $DecodeJsonSend = \Zend\Json\Decoder::decode($InvitationInfo->datesenvois);
                $Last = $DecodeJsonSend[count($DecodeJsonSend) - 1];

                if ($Last->envoyerpar == $CodeExtracted[3] && $Last->date == $CodeExtracted[4]) {
                    $this->redirect()->toRoute('enseignant/controller-action', array('controller' => 'mon-compte', 'action' => 'create-compte'), array('query' => array("idInvit" => $InvitationInfo->idinvitations)), false);
                } else {
                    echo "Verifier votre email d'envoi";
                }
            } else {
                echo "Verifier votre email d'envoi";
            }
        } else {

            $EnseignantRec = $EnseignantTable->getEnseignant(array(
                "email" => $CodeExtracted[0]
            ));

            if ($EnseignantRec) {
                $this->redirect()->toRoute('application/controller-action', array('controller' => 'authentification', 'action' => 'login'));
            }
        }

                return $viewModel;
    }

    /**
     * CreateCompte action for MonCompteController
     *
     * @return ViewModel
     */
    public function createCompteAction()
    {
                $viewModel = new ViewModel();
                $form = new \Enseignant\Form\CreateCompte();

                $this->layout()->setTemplate('layout/creationcompte');

                $viewModel->form=$form;
                $viewModel->langue=$this->params()->fromQuery('lng',"fr_FR");

                $IdInvitation = $this->params()->fromQuery("idInvit");
                $sm = $this->getServiceLocator();
                $Adapter = $sm->get('DB\Adapter');
                $InvitationTable = new \Models\ExTutorat\ExInvitationsTable($Adapter);
                $EnseignantTable= new \Models\ExTutorat\ExEnseignantsTable($Adapter);

                $Invitation=$InvitationTable->select("idinvitations=$IdInvitation");
                $InvitationRec=$Invitation->current();
                $viewModel->nom=$InvitationRec->nominviter;
                $viewModel->prenom=$InvitationRec->prenominviter;
                $viewModel->email=$InvitationRec->email;
                $viewModel->idinvite=$InvitationRec->idinvitations;



                return $viewModel;
    }

    /**
     * Login action for MonCompteController
     *
     * @return ViewModel
     */
    public function loginAction()
    {
        $viewModel = new ViewModel();

        return $viewModel;
    }

    /**
     * Logout action for MonCompteController
     *
     * @return ViewModel
     */
    public function logoutAction()
    {
        $viewModel = new ViewModel();

                return $viewModel;
    }

    /**
     * ChangePassword action for MonCompteController
     *
     * @return ViewModel
     */
    public function changePasswordAction()
    {
        $viewModel = new ViewModel();

                return $viewModel;
    }

    /**
     * DemandeChangePassword action for MonCompteController
     *
     * @return ViewModel
     */
    public function demandeChangePasswordAction()
    {
        $viewModel = new ViewModel();

                return $viewModel;
    }

    /**
     * SaveCompte action for MonCompteController
     *
     * @return ViewModel
     */
    public function saveCompteAction()
    {
        $viewModel = new ViewModel();
         
        $sm = $this->getServiceLocator();
        $Adapter = $sm->get('DB\Adapter');

        $EnseignantTable=new \Models\ExTutorat\ExEnseignantsTable($Adapter);
        $PersonneTable=new \Models\Tutorat\Model\PersonnesTable($Adapter);
        $InfoPersonneTable=new \Models\Tutorat\Model\InfopersonneTable($Adapter);
        $InvitationTable = new \Models\ExTutorat\ExInvitationsTable($Adapter);
        $IdInvitation=$this->params()->fromQuery("idInvite");
        $Invitation=$InvitationTable->select("idinvitations=$IdInvitation");
        $InvitationRec=$Invitation->current();

        $form = new \Enseignant\Form\CreateCompte();
        $request = $this->getRequest();
        if ($request->isPost()) {
            $DataPosted = $request->getPost()->toArray();
            $form->setData($DataPosted);
            if($form->isValid()){
            try{
                $Adapter->getDriver()->getConnection()->beginTransaction();
                $EnseignantRec= $EnseignantTable->getEnseignant(array(
                    "email"=> $DataPosted['email']
                ));
                if($EnseignantRec->count()){
                    die("Enseignant déjà inscript");
                }else{
                    $dataPersonne=array(
                                 'idpersonnes'=>$DataPosted['cin']
                                ,'cin'=>$DataPosted['cin']
                                ,'email'=>$DataPosted['email']
                                ,'motdepass'=>md5($DataPosted['motdepass'])
                                ,'datemotdepasse'=> date("Y-m-d H:i:s")
                            );
                    $PersonneTable->insert($dataPersonne);

                    $dataInfoPersonne=array(
                        'idpersonnes'=>$DataPosted['cin']
                        ,'non'=>$DataPosted['nom']
                        ,'prenom'=>$DataPosted['prenom']
                        ,'idlangue'=>'fr'
                    );

                    $InfoPersonneTable->insert($dataInfoPersonne);

                    $EnseignantTable->insert(array('idpersonnes'=>$DataPosted['cin']));


                    $RolesEnseignantTable= new \Models\Tutorat\Model\RolespersonnesTable($Adapter);

                    if($InvitationRec->typeinvitation=="Tutorat"){

                        $RolesEnseignantTable->insert(
                            array(
                                'idpersonnes'=>$DataPosted['cin']
                                ,'idroles'=>'tuteur'
                                ,'idanneeuniv'=>$InvitationRec->idanneeuniv
                            )
                        );


                        $ModuleTable= new \Models\ExTutorat\ExModuleTable($Adapter);
                        $InvitationUETable= new \Models\Tutorat\Model\NvittutoratueTable($Adapter);
                        $EnseignantsmoduleTable= new \Models\Tutorat\Model\EnseignantsmoduleTable($Adapter);
                        $ModuleInviter= $InvitationUETable->select("idinvitations=".$InvitationRec->idinvitations);
                        $idues=array();
                        foreach ($ModuleInviter as $modi){
                            $idues[]=$modi->idModule;
                            $tutoratData=array(
                                'idpersonnes'   =>  $DataPosted['cin']
                                ,'idModule'     =>  $modi->idModule
                                ,'idanneeuniv'  =>  $InvitationRec->idanneeuniv
                            );
                            $EnseignantsmoduleTable->insert($tutoratData);
                        }

                        $Modules=$ModuleTable->getModulesInfo($idues);

                    }elseif ($InvitationRec->typeinvitation=="Coordination"){
                        $RolesEnseignantTable->insert(
                            array(
                                'idpersonnes'=>$DataPosted['cin']
                                ,'idroles'=>'coordinateur'
                                ,'idanneeuniv'=>$InvitationRec->idanneeuniv
                            )
                        );
                        $CoordinationTable= new \Models\Tutorat\Model\CoordinationTable($Adapter);
                        if (!empty($InvitationRec->infosuplimentaire)) {
                            $DecodeJsonSend = \Zend\Json\Decoder::decode($InvitationRec->infosuplimentaire, \Zend\Json\Json::TYPE_ARRAY);

                             if(!isset($DecodeJsonSend['Niveaux'])){
                                 $CoordinationTable->insert(array(
                                     'idnaturecoordinateur' =>$InvitationRec->idnaturecoordinateur
                                     ,'idformations'=>$DecodeJsonSend['Formation']
                                     ,'idpersonnes'=>$DataPosted['cin']
                                     ,'idanneeuniv'=>$InvitationRec->idanneeuniv

                                 ));
                             }else{
                                    foreach($DecodeJsonSend['Niveaux'] as $keyniv => $niv){
                                        $CoordinationTable->insert(array(
                                            'idnaturecoordinateur' =>$InvitationRec->idnaturecoordinateur
                                            ,'idniveauformation'=>$keyniv
                                            ,'idformations'=>$DecodeJsonSend['Formation']
                                            ,'idpersonnes'=>$DataPosted['cin']
                                            ,'idanneeuniv'=>$InvitationRec->idanneeuniv

                                        ));
                                    }
                             }

                        }

                    }
                    if (!empty($InvitationRec->datesenvois)) {
                        $DecodeJsonSend = \Zend\Json\Decoder::decode($InvitationRec->datesenvois,\Zend\Json\Json::TYPE_ARRAY);

                        foreach($DecodeJsonSend as $keyresponse => $reponse){
                            $DecodeJsonSend[$keyresponse]['reponse']="Non";
                        }
                        $DecodeJsonSend[count($DecodeJsonSend) - 1]['reponse']="Oui";
                        $rep= \Zend\Json\Encoder::encode($DecodeJsonSend);
                        $InvitationTable->update(
                            array("codeinvitation" => "","datesenvois"=>$rep)
                            ,"idinvitations=".$InvitationRec->idinvitations
                        );
                    }else{
                        $viewModel->messagesave=\Zend\Json\Encoder::encode(array(
                            'status'=>'error',
                            'message'=>"Probléme d'update d'etat de reponse"
                        ));
                        $Adapter->getDriver()->getConnection()->rollback();
                        return $viewModel;
                    }
                    $viewModel->messagesave=\Zend\Json\Encoder::encode(array(
                        'status'=>'success'
                        ,'Envoi'=>'Non'
                        ,'message'=>'Bien venue'
                    ));

                    $Adapter->getDriver()->getConnection()->commit();
                }
                }catch ( \Exception $e ){
                    $viewModel->messagesave=\Zend\Json\Encoder::encode(array(
                        'status'=>'error',
                        'message'=>$e->getMessage()
                    ));
                $Adapter->getDriver()->getConnection()->rollback();
                return $viewModel;
                }

            }

        }else{
            $viewModel->messagesave=\Zend\Json\Encoder::encode(array(
                'status'=>'error'
                ,'Envoi'=>'Non'
                ,'message'=>'Pas de donnée à envoyer'
            ));

        }

        return $viewModel;
    }


}
