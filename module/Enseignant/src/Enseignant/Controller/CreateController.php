<?php
declare(strict_types = 1);
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
 * CreateController
 * 
 * Handles the CreateController requests for the Enseignant Module
 * 
 * @package Enseignant\Controller
 */
class CreateController extends AbstractActionController
{

    /**
     * Index action for CreateController
     * 
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();

                return $viewModel;
    }

    /**
     * Createjob action for CreateController
     *
     * @return ViewModel
     */
    public function createjobAction()
    {
        $viewModel = new ViewModel();

        return $viewModel;
    }


}
