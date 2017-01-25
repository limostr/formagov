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
 * CreateController
 *
 * Handles the CreateController requests for the Pedagogie Module
 *
 * @package Pedagogie\Controller
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
     * Addformation action for CreateController
     *
     * @return ViewModel
     */
    public function addformationAction()
    {
        $viewModel = new ViewModel();
        $Formation=new  \Pedagogie\Form\Formation();

       // $Formation->get('submit')->setValue('Enregistrer');

        $viewModel->setVariable("form",$Formation);
        return $viewModel;
    }


}
