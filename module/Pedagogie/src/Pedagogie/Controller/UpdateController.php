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
 * UpdateController
 * 
 * Handles the UpdateController requests for the Pedagogie Module
 * 
 * @package Pedagogie\Controller
 */
class UpdateController extends AbstractActionController
{

    /**
     * Index action for UpdateController
     * 
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();

                return $viewModel;
    }

    /**
     * Updateue action for UpdateController
     *
     * @return ViewModel
     */
    public function updateueAction()
    {
        $viewModel = new ViewModel();
        $viewModel->setTerminal(true);
        return $viewModel;
    }


}
