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


}
