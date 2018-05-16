<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


namespace Esen\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

/**
 * InscriptionController
 *
 * Handles the InscriptionController requests for the Esen Module
 *
 * @package Esen\Controller
 */
class InscriptionController extends AbstractActionController
{

    /**
     * Index action for InscriptionController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();

        return $viewModel;
    }


}
