<?php
declare(strict_types = 1);
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
 * DashboardController
 *
 * Handles the DashboardController requests for the Pedagogie Module
 *
 * @package Pedagogie\Controller
 */
class DashboardController extends AbstractActionController
{

    /**
     * Index action for DashboardController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();

                return $viewModel;
    }

    /**
     * Infogenform action for DashboardController
     *
     * @return ViewModel
     */
    public function infogenformAction()
    {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);
        return $viewModel;
    }


}
