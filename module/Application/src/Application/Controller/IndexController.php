<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class IndexController extends AbstractActionController
{

    protected $form = null;

    protected $storage = null;

    protected $authservice = null;

    public function indexAction()
    {
        $viewModel = new ViewModel();

                $auth = new AuthenticationService();

                /**
                 * @todo Set up the auth adapter, $authAdapter
                 */

                if ($auth->hasIdentity()) {
                    // Identity exists; get it
                    $identity = $auth->getIdentity();

                }

                return $viewModel;
    }

    /**
     * ChoixAnneeUniversitaire action for IndexController
     *
     * @return ViewModel
     */
    public function choixAnneeUniversitaireAction()
    {

        $anneeUniv=$this->params()->fromPost('anneeuniv',null);

        $session = new \Zend\Session\Container("university");

        $sm = $this->getServiceLocator();
        $Adapter = $sm->get('DB\Adapter');
        if($anneeUniv){
            $idannee=$anneeUniv;
        }else{
            $anneunivTable = new \Models\Tutorat\Model\AnneeunivTable($Adapter);

            $anneeRecords=$anneunivTable->select("activeannee=1");
            if($anneeRecords->count()>0){
                $anneeRec=$anneeRecords->current();
                $idannee=$anneeRec->idanneeuniv;
            }
        }

        $session->anneeuniv=$idannee;


    }


}
