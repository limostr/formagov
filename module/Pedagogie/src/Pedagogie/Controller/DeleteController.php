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
 * DeleteController
 *
 * Handles the DeleteController requests for the Pedagogie Module
 *
 * @package Pedagogie\Controller
 */
class DeleteController extends AbstractActionController
{

    /**
     * Index action for DeleteController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();

        return $viewModel;
    }


}
