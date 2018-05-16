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
 * HabilitationController
 *
 * Handles the HabilitationController requests for the Pedagogie Module
 *
 * @package Pedagogie\Controller
 */
class HabilitationController extends AbstractActionController
{

    /**
     * Index action for HabilitationController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();

                return $viewModel;
    }

    /**
     * Formation action for HabilitationController
     *
     * @return ViewModel
     */
    public function formationAction()
    {
        $viewModel = new ViewModel();


        return $viewModel;
    }


}
