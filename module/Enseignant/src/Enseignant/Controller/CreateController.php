<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


namespace Enseignant\Controller;

use Models\ExTutorat\ExEnseignantsTable;
 use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

/**
 * CreateController
 *
 * Handles the CreateController requests for the Enseignant Module
 *
 * @package Enseignant\Controller
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
     * Createjob action for CreateController
     *
     * @return ViewModel
     */
    public function createjobAction()
    {
        $viewModel = new ViewModel();

                                                                                        return $viewModel;
    }

    /**
     * Donneepersonnelle action for CreateController
     *
     * @return ViewModel
     */
    public function donneepersonnelleAction()
    {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);
        $form = new \Enseignant\Form\Donneepersonnelle();

        //chargement des donnée
        $sm = $this->getServiceLocator();
        $Adapter = $sm->get('DB\Adapter');
        $user = \Myhelper\GenericParams::__getInfoUserLogged();
        $viewModel->langue=$this->params()->fromQuery('lng',"fr_FR");

        $EnseignatTable = new ExEnseignantsTable($Adapter);
        $Enseignant=$EnseignatTable->getAllDataEnseignant($user->idpersonnes);

        $dataLoadedEnseignant=array(
            'idpersonnes'=>$user->idpersonnes
            ,'cin'=>$Enseignant->_cin
            ,'datelivrecin'=> $Enseignant->_datelivrecin
            ,'matricule'=>$Enseignant->_matricule
            ,'typematricule'=>$Enseignant->_typematricule
            ,'nom'=>($viewModel->langue=="fr_FR") ? $Enseignant->_Nom_fr : $Enseignant->_Nom_ar
            ,'prenom'=>($viewModel->langue=="fr_FR") ? $Enseignant->_Prenom_fr : $Enseignant->_Prenom_ar
            ,'civilite'=>$Enseignant->_civilite
            ,'datedenaissance'=> $Enseignant->_datedenaissance
            ,'lieudenaissance'=>($viewModel->langue=="fr_FR") ? $Enseignant->_Lieudenaissance_fr : $Enseignant->_Lieudenaissance_ar

            ,'rib'=>$Enseignant->_rib
            ,'telportable'=>$Enseignant->_mobile
            ,'telfix'=>$Enseignant->_fix
            ,'codepostal'=>$Enseignant->_codepostal
            ,'pays' =>($viewModel->langue=="fr_FR") ? $Enseignant->_Pays_fr : $Enseignant->_Pays_ar
            ,'ville'=>($viewModel->langue=="fr_FR") ? $Enseignant->_Ville_fr : $Enseignant->_Ville_ar
            ,'adress'=>($viewModel->langue=="fr_FR") ? $Enseignant->_Adress_fr : $Enseignant->_Adress_ar

        );
         $form->populateValues($dataLoadedEnseignant);


        $viewModel->form=$form;
        return $viewModel;
    }

    /**
     * DonneePersoArab action for CreateController
     *
     * @return ViewModel
     */
    public function donneePersoArabAction()
    {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);
        $form = new \Enseignant\Form\Donneepersonnelle();




        $viewModel->form=$form;
        return $viewModel;
    }

    /**
     * Etablissementenseigne action for CreateController
     *
     * @return ViewModel
     */
    public function etablissementenseigneAction()
    {
        $viewModel = new ViewModel();

                                                                                        return $viewModel;
    }

    /**
     * TraveauEnseignant action for CreateController
     *
     * @return ViewModel
     */
    public function traveauEnseignantAction()
    {
        $viewModel = new ViewModel();

                                                                                        return $viewModel;
    }

    /**
     * MenuEtabEnseignement action for CreateController
     *
     * @return ViewModel
     */
    public function menuCvEnseignantAction()
    {
        $viewModel = new ViewModel();

                                                                                         return $viewModel;
    }

    /**
     * ListeMesGradesEns action for CreateController
     *
     * @return ViewModel
     */
    public function listeMesGradesEnsAction()
    {
        $viewModel = new ViewModel();
                                                                                        $viewModel->setTerminal(true);
                                                                                        return $viewModel;
    }

    /**
     * monGradeEns action for CreateController
     *
     * @return ViewModel
     */
    public function monGradeEnsAction()
    {
        $viewModel = new ViewModel();
                                $viewModel->setTerminal(true);
                                $sm = $this->getServiceLocator();
                                $Adapter = $sm->get('DB\Adapter');
                                $form = new \Enseignant\Form\GradeEnseignant($Adapter);
                                $viewModel->form=$form;
                                return $viewModel;
    }

    /**
     * GradesEnseignants action for CreateController
     *
     * @return ViewModel
     */
    public function gradesEnseignantsAction()
    {
        $viewModel = new ViewModel();
                                                                                        $viewModel->setTerminal(true);
                                                                                        return $viewModel;
    }

    /**
     * SpecialiteEnseignant action for CreateController
     *
     * @return ViewModel
     */
    public function specialiteEnseignantAction()
    {
        $viewModel = new ViewModel();

                                                                                return $viewModel;
    }

    /**
     * CompteUtilisateur action for CreateController
     *
     * @return ViewModel
     */
    public function compteUtilisateurAction()
    {
        $viewModel = new ViewModel();
            $viewModel->setTerminal(true);
            $form = new \Enseignant\Form\CompteUtilisateur();
            $viewModel->form=$form;
            $viewModel->langue=$this->params()->fromQuery('lng',"fr_FR");
        return $viewModel;
    }

    /**
     * DiplomeEnseignant action for CreateController
     *
     * @return ViewModel
     */
    public function diplomeEnseignantAction()
    {
        $viewModel = new ViewModel();
                                                        $viewModel->setTerminal(true);
                                                        $form = new \Enseignant\Form\DiplomeEnseignant();
                                                        $viewModel->form=$form;
                                                        $viewModel->langue=$this->params()->fromQuery('lng',"fr_FR");

                                                        return $viewModel;
    }

    /**
     * InfoProDossier action for CreateController
     *
     * @return ViewModel
     */
    public function infoProDossierAction()
    {
        $viewModel = new ViewModel();
                                        $form = new \Enseignant\Form\InfoProDossier();
                                        $viewModel->setTerminal(true);

                                        $viewModel->form=$form;
                                         return $viewModel;
    }

    /**
     * InfoProDossierAr action for CreateController
     *
     * @return ViewModel
     */
    public function infoProDossierArAction()
    {
        $viewModel = new ViewModel();
                                        $viewModel->setTerminal(true);

                                        $form = new \Enseignant\Form\InfoProDossierAr();
                                        $viewModel->form=$form;
                                        return $viewModel;
    }

    /**
     * DepotDossierPapier action for CreateController
     *
     * @return ViewModel
     */
    public function depotDossierPapierAction()
    {
        $viewModel = new ViewModel();
                        $viewModel->setTerminal(true);


                        $form = new \Enseignant\Form\DepotDocEnseignant();
                        $viewModel->form=$form;
                        return $viewModel;
    }

    /**
     * InviterCoordinateur action for CreateController
     *
     * @return ViewModel
     */
    public function inviterCoordinateurAction()
    {
        $viewModel = new ViewModel();
                       // $viewModel->setTerminal(true);

                        $sm = $this->getServiceLocator();

                        $idformation=$this->params()->fromRoute('id');
                        $viewModel->idformation=$idformation;

                        $Adapter = $sm->get('DB\Adapter');
                        $form = new  \Enseignant\Form\InviterCoordinateur($Adapter);
                        $viewModel->form=$form;
                        $viewModel->langue=$this->params()->fromQuery('lng',"fr_FR");
                        $formationTable= new \Models\ExTutorat\ExFormationsTable($Adapter);
                        $formationTable->getDiplomeDetails($idformation,$formation);
                        $viewModel->formation=$formation;

                        $periodeTable= new \Models\ExTutorat\ExPeriodeTable($Adapter);
                        $viewModel->rowssem=$periodeTable->fetchAll();
                        $AnneeUnivTable= new \Models\Tutorat\Model\AnneeunivTable($Adapter);
                        $viewModel->rows=$AnneeUnivTable->fetchAll();

                        return $viewModel;
    }

    /**
     * InviterCoordinateurMailSend action for CreateController
     *
     * @return ViewModel
     */
    public function inviterCoordinateurMailSendAction()
    {
        $viewModel = new ViewModel();
                $sm = $this->getServiceLocator();
                $email=$this->params()->fromQuery("email");
                $table_invite = new \Models\Tutorat\Model\InvitationsTable($sm);
                $inviter=$table_invite->select("email='$email'");
                if($curentInviter=$inviter->current()){
                    $MessageContent=array(
                        "nom"=>$curentInviter->nominviter
                        ,"prenom"=>$curentInviter->prenominviter
                        ,"EmailText"=>$curentInviter->textinvitation
                        ,"textToGetLink"=>"Pour continuer à .... cliquer ici"
                        ,"link"=>"link : ".$curentInviter->codeinvitation
                    );
                    $sender = new \Myhelper\MailSender($MessageContent);
                    $sender->sendMail();
                }

                return $viewModel;
    }

    /**
     * CreateCompte action for CreateController
     *
     * @return ViewModel
     */
    public function createCompteAction()
    {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);
        $form = new \Enseignant\Form\CompteUtilisateur();
        $viewModel->form=$form;
        $viewModel->langue=$this->params()->fromQuery('lng',"fr_FR");
        return $viewModel;
    }


}
