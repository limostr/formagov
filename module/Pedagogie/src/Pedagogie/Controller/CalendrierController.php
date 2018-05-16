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
 * CalendrierController
 *
 * Handles the CalendrierController requests for the Pedagogie Module
 *
 * @package Pedagogie\Controller
 */
class CalendrierController extends AbstractActionController
{

    /**
     * Index action for CalendrierController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();

        return $viewModel;
    }

    /**
     * Calendrierglobal action for CalendrierController
     *
     * @return ViewModel
     */
    public function calendrierglobalAction()
    {
        $viewModel = new ViewModel();

                return $viewModel;
    }

    /**
     * Caldetailglob action for CalendrierController
     *
     * @return ViewModel
     */
    public function caldetailglobAction()
    {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);

        return $viewModel;
    }


}
