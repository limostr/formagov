<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


namespace Inscription\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

/**
 * SinscrireController
 *
 * Handles the SinscrireController requests for the Inscription Module
 *
 * @package Inscription\Controller
 */
class SinscrireController extends AbstractActionController
{

    /**
     * Index action for SinscrireController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();

        return $viewModel;
    }


}
