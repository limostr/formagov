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
 * ShowController
 *
 * Handles the ShowController requests for the Enseignant Module
 *
 * @package Enseignant\Controller
 */
class ShowController extends AbstractActionController
{

    /**
     * Index action for ShowController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();

                                                                                                        return $viewModel;
    }

    /**
     * Showcv action for ShowController
     *
     * @return ViewModel
     */
    public function showcvAction()
    {
        $viewModel = new ViewModel();

                                                                                                return $viewModel;
    }

    /**
     * Showcvcarriere action for ShowController
     *
     * @return ViewModel
     */
    public function showcvcarriereAction()
    {
        $viewModel = new ViewModel();
                                                                                        $viewModel->terminate(true);
                                                                                        return $viewModel;
    }

    /**
     * ListeMesGradesEns action for ShowController
     *
     * @return ViewModel
     */
    public function listeMesGradesEnsAction()
    {
        $viewModel = new ViewModel();

                                                                                return $viewModel;
    }

    /**
     * ListDiplomeEnseignant action for ShowController
     *
     * @return ViewModel
     */
    public function listDiplomeEnseignantAction()
    {
        $viewModel = new ViewModel();
                                                                $viewModel->setTerminal(true);
                                                                $viewModel->langue=$this->params()->fromQuery('lng',"fr_FR");

                                                                        return $viewModel;
    }

    /**
     * GestDiplomeEnseignant action for ShowController
     *
     * @return ViewModel
     */
    public function gestDiplomeEnseignantAction()
    {
        $viewModel = new ViewModel();
                                                $viewModel->setTerminal(true);

                                                return $viewModel;
    }

    /**
     * ListInfoProDossier action for ShowController
     *
     * @return ViewModel
     */
    public function listInfoProDossierAction()
    {
        $viewModel = new ViewModel();
                                        $viewModel->setTerminal(true);
                                                        return $viewModel;
    }

    /**
     * GestInfoProDossier action for ShowController
     *
     * @return ViewModel
     */
    public function gestInfoProDossierAction()
    {
        $viewModel = new ViewModel();
                                        $viewModel->setTerminal(true);
                                                return $viewModel;
    }

    /**
     * AideSaisieDossierEnseignat action for ShowController
     *
     * @return ViewModel
     */
    public function aideSaisieDossierEnseignatAction()
    {
        $viewModel = new ViewModel();
                                        $viewModel->setTerminal(true);
                                        return $viewModel;
    }

    /**
     * ImprimerDemandeHeurEnseigne action for ShowController
     *
     * @return ViewModel
     */
    public function imprimerDemandeHeurEnseigneAction()
    {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);

        $sm = $this->getServiceLocator();
        $Adapter = $sm->get('DB\Adapter');
        $TutoratTable= new \Models\ExTutorat\ExEnseignantsmoduleTable($Adapter);
        $ModuleTable= new \Models\ExTutorat\ExModuleTable($Adapter);
        $FormationTable=new \Models\ExTutorat\ExFormationsTable($Adapter);
        $PeriodeTable=new \Models\ExTutorat\ExPeriodeTable($Adapter);

        $idanneUniv=\Myhelper\GenericParams::__getUnivYear();
        $sessionUserLoged=new \Zend\Session\Container("user");
        $user=$sessionUserLoged->offsetGet("infologged");

        $MesTutorat=$TutoratTable->getMesTutorat($user->idpersonnes,$idanneUniv);

        $MesAllTutorat=array();
        foreach ($MesTutorat as $t){
            $MesAllTutorat[$t->idModule]=new \stdClass();

            $p=array();
            $PeriodeTable->getPeriodeFormation($t->idperiode,$t->idniveauformation,$p);
            $MesAllTutorat[$t->idModule]->Periode=$p;

            $formation=array();
            $FormationTable->getDiplomeDetails($t->idformations,$formation);
            $MesAllTutorat[$t->idModule]->formation=$formation;

            $ue=array();
            $ModuleTable->getUE_ECUE($t->idModule,$ue);
            $MesAllTutorat[$t->idModule]->Module=$ue;

            ///information générale sur l'ECUE
            $MesAllTutorat[$t->idModule]->ecue=$t;
        }

       //  echo "<pre>";print_r($MesAllTutorat);echo "</pre>";
        $viewModel->MesTutorats=$MesAllTutorat;
        return $viewModel;
    }

    /**
     * DepotDossierPapier action for ShowController
     *
     * @return ViewModel
     */
    public function depotDossierPapierAction()
    {
        $viewModel = new ViewModel();
                $viewModel->setTerminal(true);
                $sm = $this->getServiceLocator();
                $Adapter = $sm->get('DB\Adapter');
                $TableGrades = new \Models\Tutorat\Model\DocumentofficielTable($Adapter);
                $result=$TableGrades->select("idtypedocofficiel='dossiertuteur'");

                $viewModel->doctype=$result;
               return $viewModel;
    }

    /**
     * GestDepotDossierPapier action for ShowController
     *
     * @return ViewModel
     */
    public function gestDepotDossierPapierAction()
    {
        $viewModel = new ViewModel();
                $viewModel->setTerminal(true);

                return $viewModel;
    }

    /**
     * GestInvitation action for ShowController
     *
     * @return ViewModel
     */
    public function gestInvitationAction()
    {
        $viewModel = new ViewModel();

        return $viewModel;
    }


}
