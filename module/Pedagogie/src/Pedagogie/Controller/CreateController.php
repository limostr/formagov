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
 * CreateController
 * 
 * Handles the CreateController requests for the Pedagogie Module
 * 
 * @package Pedagogie\Controller
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
     * Addformation action for CreateController
     * 
     * @return ViewModel
     */
    public function addformationAction()
    {
        $viewModel = new ViewModel();
        $sm = $this->getServiceLocator();
        $TypeFormationTable = $sm->get('Model\TypeformationTable');
        $types=$TypeFormationTable->getPrincipalTypesFormation();
        $viewModel->TypesFormation=$types;
        return $viewModel;
    }

    /**
     * Adddyntypeform action for CreateController
     *
     * @return ViewModel
     */
    public function adddyntypeformAction()
    {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);
        $id= $this->getRequest()->getPost('id');

        $sm = $this->getServiceLocator();
        $TypeFormationTable = $sm->get('Model\TypeformationTable');
        $typesModel=array();
        $TypeFormationTable->getModelTypeFormation($id,$typesModel);
        $viewModel->ModelTypesFormation=$typesModel;


        return $viewModel;
    }


}
