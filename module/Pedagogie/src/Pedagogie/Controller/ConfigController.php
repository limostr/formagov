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
 * ConfigController
 *
 * Handles the ConfigController requests for the Pedagogie Module
 *
 * @package Pedagogie\Controller
 */
class ConfigController extends AbstractActionController
{

    /**
     * Index action for ConfigController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();

                                return $viewModel;
    }

    /**
     * Ajoutmodelformation action for ConfigController
     *
     * @return ViewModel
     */
    public function ajoutmodelformationAction()
    {
        $viewModel = new ViewModel();

        return $viewModel;
    }

    /**
     * Listemodelformation action for ConfigController
     *
     * @return ViewModel
     */
    public function listemodelformationAction()
    {
        $viewModel = new ViewModel();
        $sm = $this->getServiceLocator();
        $TypeFormationTable = $sm->get('Model\TypeformationTable');
        $types=$TypeFormationTable->getPrincipalTypesFormation();
        $viewModel->TypesFormation=$types;
        return $viewModel;
    }

    /**
     * Tableaudesfonctions action for ConfigController
     *
     * @return ViewModel
     */
    public function tableaudesfonctionsAction()
    {
        $viewModel = new ViewModel();

        return $viewModel;
    }


}
