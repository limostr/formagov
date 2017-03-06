<?php
declare(strict_types = 1);
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


namespace Ideeprojet\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

/**
 * FormationsController
 *
 * Handles the FormationsController requests for the Ideeprojet Module
 *
 * @package Ideeprojet\Controller
 */
class FormationsController extends AbstractActionController
{

    /**
     * Index action for FormationsController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();

                return $viewModel;
    }

    /**
     * Show action for FormationsController
     *
     * @return ViewModel
     */
    public function showAction()
    {
        $viewModel = new ViewModel();

        return $viewModel;
    }


}
