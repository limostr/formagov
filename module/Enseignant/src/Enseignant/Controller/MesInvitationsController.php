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
 * MesInvitationsController
 *
 * Handles the MesInvitationsController requests for the Enseignant Module
 *
 * @package Enseignant\Controller
 */
class MesInvitationsController extends AbstractActionController
{

    /**
     * Index action for MesInvitationsController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();

                                                                return $viewModel;
    }

    /**
     * ListerMesInvitations action for MesInvitationsController
     *
     * @return ViewModel
     */
    public function listerMesInvitationsAction()
    {
        $viewModel = new ViewModel();

                                try{
                                    $sm = $this->getServiceLocator();
                                    $Adapter = $sm->get('DB\Adapter');


                                    $idannee=\Myhelper\GenericParams::__getUnivYear();

                                    $InvitationTable= new \Models\ExTutorat\ExInvitationsTable($Adapter);
                                    $ModuleTable= new \Models\ExTutorat\ExModuleTable($Adapter);
                                    $InvitationUETable= new \Models\Tutorat\Model\NvittutoratueTable($Adapter);
                                    $formationTable= new \Models\ExTutorat\ExFormationsTable($Adapter);

                                    $EnseignementModuleTable= new \Models\ExTutorat\ExEnseignantsmoduleTable($Adapter);

                                    $ser=new \Zend\Session\Container("user");
                                    $user=$ser->offsetGet("infologged");

                                    $ListeInvitation=$InvitationTable->select("idanneeuniv='$idannee' AND typeinvitation= 'Tutorat' AND email='".$user->email."'");
                                    $ListeInvitations=array();
                                    foreach($ListeInvitation as $Lm){
                                        $ListeInvitations[$Lm->idinvitations]['invitation']=$Lm;

                                        ///rechercher des ECUE d'invitation

                                        $ModuleInviter= $InvitationUETable->select("idinvitations=".$Lm->idinvitations);
                                        $idues=array();
                                        $sessionUserLoged=new \Zend\Session\Container("user");
                                        $user=$sessionUserLoged->offsetGet("infologged");

                                        foreach ($ModuleInviter as $modi){
                                            $idues['liste'][]=$modi->idModule;
                                            $idues['reponse'][$modi->idModule]=$modi->datereponse;
                                            $ens=$EnseignementModuleTable->select("idModule=".$modi->idModule." AND idpersonnes='".$user->idpersonnes."' AND idanneeuniv='$idannee'");

                                            if($ens->count()>0){
                                                $ens=$ens->current();
                                                $idues['bloquer'][$modi->idModule]=$ens->validationadmin;
                                            }else{
                                                $idues['bloquer'][$modi->idModule]=0;
                                            }
                                        }

                                        $Modules=$ModuleTable->getModulesInfo($idues['liste']);
                                        foreach ($Modules as $idformation => $m){
                                            $formation=array();
                                            $formationTable->getDiplomeDetails($idformation,$formation);
                                            $Modules[$idformation]['formation']=$formation;
                                            $Modules[$idformation]['reponse']= $idues['reponse'];
                                            $Modules[$idformation]['bloquer']=$idues['bloquer'];

                                        }
                                        $ListeInvitations[$Lm->idinvitations]['modules']=$Modules;

                                    }
                                    $viewModel->listeInvitation=$ListeInvitations;


                                    /**
                                     * Lister les invitation pour Coordination
                                    **/
                                    $ListeInvitation=$InvitationTable->select("idanneeuniv='$idannee' AND typeinvitation='Coordination' AND email='".$user->email."'");
                                    $ListeInvitationsCoordination=array();
                                    foreach($ListeInvitation as $Lm){
                                        $ListeInvitationsCoordination[$Lm->idinvitations]['invitation']=$Lm;

                                        ///rechercher des ECUE d'invitation

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
                                                $ListeInvitationsCoordination[$Lm->idinvitations]['formation']=$formationInfo;
                                            }

                                        }

                                    }
                                    $viewModel->listeInvitationCoordination=$ListeInvitationsCoordination;

                                }catch (\Exception $e){
                                    $viewModel->messagesave=$e->getMessage() ;
                                }

                                return $viewModel;
    }

    /**
     * AccepterTutorat action for MesInvitationsController
     *
     * @return ViewModel
     */
    public function accepterTutoratAction()
    {
        $viewModel = new ViewModel();
                                $viewModel->setTerminal(true);
                                try{
                                    $sm = $this->getServiceLocator();
                                    $Adapter = $sm->get('DB\Adapter');
                                    $TutoratTable= new \Models\ExTutorat\ExEnseignantsmoduleTable($Adapter);
                                    $ModuleTable= new \Models\ExTutorat\ExModuleTable($Adapter);
                                    $formationTable= new \Models\ExTutorat\ExFormationsTable($Adapter);
                                    $niveauTable = new \Models\ExTutorat\ExNiveauformationTable($Adapter);


                                    $sessionUserLoged=new \Zend\Session\Container("user");

                                    $user=$sessionUserLoged->offsetGet("infologged");

                                    $idanneUniv=\Myhelper\GenericParams::__getUnivYear();


                                    $idecue=$this->params()->fromQuery('ecue',null);
                                    $Module=array();
                                    $ModuleTable->getUE_ECUE($idecue,$Module);
                                    $viewModel->Module=$Module;
                                    //print_r($Module);
                                    if(isset($Module['ue'])){
                                        $formationdetails=array();
                                        $formationTable->getDiplomeDetails($Module['ue']['idformations'],$formationdetails);
                                        $viewModel->formation=$formationdetails;
                                        $PeriodeTable = new \Models\ExTutorat\ExPeriodeTable($Adapter);
                                        $periode=array();
                                        $PeriodeTable->periodComp($Module['ue']['idperiode'],$periode);
                                        $viewModel->periode=$periode;
                                    }


                                }catch (\Exception $e){
                                    $viewModel->messagesave=\Zend\Json\Encoder::encode(array("status"=>"ERREUR","message"=>$e->getMessage())) ;
                                }
                                $viewModel->ecue=$idecue;

                                $viewModel->invitations=$this->params()->fromQuery('invitations');

                                return $viewModel;
    }

    /**
     * AccepterCoordination action for MesInvitationsController
     *
     * @return ViewModel
     */
    public function accepterCoordinationAction()
    {
        $viewModel = new ViewModel();
                                $viewModel->setTerminal(true);
                                return $viewModel;
    }

    /**
     * ShowMailInvitation action for MesInvitationsController
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
     * SaveAcceptTutorat action for MesInvitationsController
     *
     * @return ViewModel
     */
    public function saveAcceptTutoratAction()
    {
        $viewModel = new ViewModel();

                $viewModel->setTerminal(true);
                 try{
                    $sm = $this->getServiceLocator();
                    $Adapter = $sm->get('DB\Adapter');
                    $Adapter->getDriver()->getConnection()->beginTransaction();


                    $TutoratTable= new \Models\ExTutorat\ExEnseignantsmoduleTable($Adapter);
                    $RolesEnseignantTable= new \Models\ExTutorat\ExRolespersonnesTable($Adapter);
                    $RoleTable = new \Models\ExTutorat\ExRolesTable($Adapter);
                    $InvitationTable = new \Models\ExTutorat\ExNvittutoratueTable($Adapter);

                    $EcueTable= new \Models\ExTutorat\ExModuleTable($Adapter);

                    $sessionUserLoged=new \Zend\Session\Container("user");
                    $user=$sessionUserLoged->offsetGet("infologged");

                    $idecue=$this->params()->fromQuery('ecue',null);
                     $idinvitaions=$this->params()->fromQuery('invitations',null);


                    $EcueTable->getUE_ECUE($idecue,$Module);
                    $idanneUniv=\Myhelper\GenericParams::__getUnivYear();

                    $data=array(
                        "idpersonnes"=>$user->idpersonnes
                        ,"idModule"=>$idecue
                        ,"idanneeuniv"=>$idanneUniv
                    );

                    $HasRole=$RolesEnseignantTable->getRolePersonne($user->idpersonnes,$idanneUniv,$Module['ecue']['idperiode']);
                     $RoleRecCompare=$RoleTable->getRoles();

                    if($HasRole->count()>=1){
                        $HasRole=$HasRole->current();
                        if($RoleRecCompare[$HasRole->idroles]<=$RoleRecCompare['tuteur']){
                            $RolesEnseignantTable->update(array("idroles"=>'tuteur','idperiode'=>$Module['ecue']['idperiode']),"idpersonnes='".$user->idpersonnes."' AND idanneeuniv='".$idanneUniv."' AND idperiode='".$Module['ecue']['idperiode']."'");
                        }
                    }else{
                        $RolesEnseignantTable->insert(
                            array(
                                "idroles"=>'tuteur'
                                ,"idpersonnes"=>$user->idpersonnes
                                ,"idanneeuniv"=>$idanneUniv
                                ,"idperiode"=>$Module['ecue']['idperiode']
                            )
                        );
                     }
                    $recExistTutorat=$TutoratTable->getTuteur($idecue,$idanneUniv);
                    if($recExistTutorat){
                        $viewModel->messagesave=\Zend\Json\Encoder::encode(array("status"=>"warrning","msg"=>"tuteur existe","nbr"=> $recExistTutorat->count() ));
                    }else{
                        $viewModel->messagesave=\Zend\Json\Encoder::encode(array("status"=>"OK"));
                    }

                    $IsTheTutor= $TutoratTable->isTutorForModule($idecue,$idanneUniv,$user->idpersonnes);
                    if(!$IsTheTutor){
                        $TutoratTable->insert($data);
                    }else{
                        $viewModel->messagesave=\Zend\Json\Encoder::encode(array("status"=>"OK","msg"=>"vous ete déjà le tuteur"));
                    }

                    ///Mettre ajour l'invitation de tutorat
                     ///
                     $InvitationRec=$InvitationTable->getInvitationECUE($idinvitaions,$idecue);
                     $dataInvitation=array();
                    if(!empty($InvitationRec->datereponse)){
                        $dataInvitation=\Zend\Json\Decoder::decode($InvitationRec->datereponse,\Zend\Json\Json::TYPE_ARRAY);
                        $dataInvitation[]=array(
                            "date"=>date("Y-m-d H:i:s")
                            ,"idpersonnes"=>$user->idpersonnes
                            ,"Reponse"=>'Invitation Accepter'
                            ,"statusinvtvalid"=>"InvitationValider"
                        );
                    }else{
                        $dataInvitation[]= array(
                            "date"=>date("Y-m-d H:i:s")
                            ,"idpersonnes"=>$user->idpersonnes
                            ,"Reponse"=>'Invitation Accepter'
                            ,"statusinvtvalid"=>"InvitationValider"
                        ) ;
                    }
                     $InvitationTable->update(array(
                         "datereponse"=>\Zend\Json\Encoder::encode($dataInvitation)
                         ,"statusinvtvalid"=>"InvitationValider"
                     ),"idinvitations=".$InvitationRec->idinvitations." AND idModule=".$idecue);



                    $Adapter->getDriver()->getConnection()->commit();
                }catch (\Exception $e){
                    $viewModel->messagesave=\Zend\Json\Encoder::encode(array("status"=>"Erreur","msg"=>$e->getMessage()));
                     $Adapter->getDriver()->getConnection()->rollback();
                }
                echo $viewModel->messagesave;
                return $viewModel;
    }

    /**
     * SaveAcceptCoordination action for MesInvitationsController
     *
     * @return ViewModel
     */
    public function saveAcceptCoordinationAction()
    {
        $viewModel = new ViewModel();
                $viewModel->setTerminal(true);
                try{

                }catch (\Exception $e){
                    $viewModel->messagesave=$e->getMessage() ;
                }
                return $viewModel;
    }

    /**
     * AnnulerAcceptTutorat action for MesInvitationsController
     *
     * @return ViewModel
     */
    public function annulerAcceptTutoratAction()
    {
        $viewModel = new ViewModel();
                $viewModel->setTerminal(true);

                $sessionUserLoged=new \Zend\Session\Container("user");
                $user=$sessionUserLoged->offsetGet("infologged");

                $idecue=$this->params()->fromQuery('ecue',null);
                $idinvitaions=$this->params()->fromQuery('invitations',null);

                $viewModel->ecue=$idecue;
                $viewModel->invitations=$idinvitaions;



                return $viewModel;
    }

    /**
     * AnnulerAcceptCoordination action for MesInvitationsController
     *
     * @return ViewModel
     */
    public function annulerAcceptCoordinationAction()
    {
        $viewModel = new ViewModel();

                return $viewModel;
    }

    /**
     * SaveAnnulerTutorat action for MesInvitationsController
     *
     * @return ViewModel
     */
    public function saveAnnulerTutoratAction()
    {
        $viewModel = new ViewModel();

                    try{
                        $sm = $this->getServiceLocator();
                        $Adapter = $sm->get('DB\Adapter');
                        $Adapter->getDriver()->getConnection()->beginTransaction();
                        $TutoratTable= new \Models\ExTutorat\ExEnseignantsmoduleTable($Adapter);
                        $RolesEnseignantTable= new \Models\ExTutorat\ExRolespersonnesTable($Adapter);
                        $RoleTable = new \Models\ExTutorat\ExRolesTable($Adapter);
                        $InvitationTable = new \Models\ExTutorat\ExNvittutoratueTable($Adapter);

                        $EcueTable= new \Models\ExTutorat\ExModuleTable($Adapter);


                        $Remarque = $this->params()->fromPost("remarque");

                        $sessionUserLoged=new \Zend\Session\Container("user");
                        $user=$sessionUserLoged->offsetGet("infologged");

                        $idecue=$this->params()->fromQuery('ecue',null);
                        $idinvitaions=$this->params()->fromQuery('invitations',null);

                         ///Mettre ajour l'invitation de tutorat
                        ///
                        $InvitationRec=$InvitationTable->getInvitationECUE($idinvitaions,$idecue);
                        $dataInvitation=array();
                        if(!empty($InvitationRec->datereponse)){
                            $dataInvitation=\Zend\Json\Decoder::decode($InvitationRec->datereponse,\Zend\Json\Json::TYPE_ARRAY);
                            $dataInvitation[]=array(
                                "date"=>date("Y-m-d H:i:s")
                                ,"idpersonnes"=>$user->idpersonnes
                                ,"Reponse"=>'Invitation Annuler'
                                ,"statusinvtvalid"=>"InvitationAnnuler"
                                ,"remarque"=>htmlentities(htmlspecialchars($Remarque))
                            );
                        }else{
                            $dataInvitation[]= array(
                                "date"=>date("Y-m-d H:i:s")
                                ,"idpersonnes"=>$user->idpersonnes
                                ,"Reponse"=>'Invitation Annuler'
                                ,"statusinvtvalid"=>"InvitationAnnuler"
                                ,"remarque"=>htmlentities(htmlspecialchars($Remarque))
                            ) ;
                        }

                        //mettre a jours la reponse à l'invitation annuler
                        $InvitationTable->update(array(
                            "datereponse"=>\Zend\Json\Encoder::encode($dataInvitation)
                            ,"statusinvtvalid"=>"InvitationAnnuler"
                        ),"idinvitations=".$InvitationRec->idinvitations." AND idModule=".$idecue);



                        $EcueTable->getUE_ECUE($idecue,$Module);
                        //supprimer la tutorat
                        $idanneUniv=\Myhelper\GenericParams::__getUnivYear();

                        $data=array(
                            "idpersonnes"=>$user->idpersonnes
                            ,"idModule"=>$idecue
                            ,"idanneeuniv"=>$idanneUniv
                        );


                        $TutoratTable->delete($data);

                        $HasTutoratIntheSamePeriode=$TutoratTable->isTuteurInTheSamePeriode($user->idpersonnes,$idanneUniv,$Module['ecue']['idperiode'],$idecue);


                        $HasRole=$RolesEnseignantTable->getRolePersonne($user->idpersonnes,$idanneUniv,$Module['ecue']['idperiode']);
                        $RoleRecCompare=$RoleTable->getRoles();

                        if($HasTutoratIntheSamePeriode->count()>=1){
                            $HasRole=$HasRole->current();
                            if(isset($HasRole->idroles) && $HasRole->idroles=='tuteur'){
                                $RolesEnseignantTable->delete(array(
                                    "idroles"=>'tuteur'
                                    ,"idpersonnes"=>$user->idpersonnes
                                    ,"idanneeuniv"=>$idanneUniv
                                    ,"idperiode"=>$Module['ecue']['idperiode']
                                ));
                            }
                        }


                        echo \Zend\Json\Encoder::encode(array(
                            'status'=>'success',
                            'message'=>'Annulation effectué avec succée'
                        ));

                        $Adapter->getDriver()->getConnection()->commit();


                    }catch (\Exception $e){
                        $Adapter->getDriver()->getConnection()->rollback();
                        $viewModel->messagesave=\Zend\Json\Encoder::encode(array(
                            'status'=>'error',
                            'message'=>$e->getMessage()
                         ));

                    }
                    echo $viewModel->messagesave;
                $viewModel->setTerminal(true);
                return $viewModel;
    }

    /**
     * RefusAcceptTutorat action for MesInvitationsController
     *
     * @return ViewModel
     */
    public function refusAcceptTutoratAction()
    {
        $viewModel = new ViewModel();

                return $viewModel;
    }

    /**
     * ModifierAnnulationTutorat action for MesInvitationsController
     *
     * @return ViewModel
     */
    public function modifierAnnulationTutoratAction()
    {
        $viewModel = new ViewModel();

        return $viewModel;
    }


}
