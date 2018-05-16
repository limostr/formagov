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
 * CoordinationController
 *
 * Handles the CoordinationController requests for the Enseignant Module
 *
 * @package Enseignant\Controller
 */
class CoordinationController extends AbstractActionController
{

    /**
     * Index action for CoordinationController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();

        return $viewModel;
    }


}
