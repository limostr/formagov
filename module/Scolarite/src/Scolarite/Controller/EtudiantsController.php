<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


namespace Scolarite\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

/**
 * EtudiantsController
 *
 * Handles the EtudiantsController requests for the Scolarite Module
 *
 * @package Scolarite\Controller
 */
class EtudiantsController extends AbstractActionController
{

    /**
     * Index action for EtudiantsController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();

        return $viewModel;
    }


}
