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
        $viewModel = new ViewModel();

                                        return $viewModel;
    }

    /**
     * Showdetailsmoduls action for ShowController
     * 
     * @return ViewModel
     */
    public function showdetailsmodulsAction()
    {
        $viewModel = new ViewModel();
                                $viewModel->setTerminal(true);
                                return $viewModel;
    }

    /**
     * Listeformations action for ShowController
     *
     * @return ViewModel
     */
    public function listeformationsAction()
    {
        $viewModel = new ViewModel();

                        return $viewModel;
    }

    /**
     * Showallue action for ShowController
     *
     * @return ViewModel
     */
    public function showallueAction()
    {
        $viewModel = new ViewModel();

                return $viewModel;
    }

    /**
     * Showenseignementue action for ShowController
     *
     * @return ViewModel
     */
    public function showenseignementueAction()
    {
        $viewModel = new ViewModel();

        return $viewModel;
    }


}
