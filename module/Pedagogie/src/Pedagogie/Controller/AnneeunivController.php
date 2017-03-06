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
 * AnneeunivController
 *
 * Handles the AnneeunivController requests for the Pedagogie Module
 *
 * @package Pedagogie\Controller
 */
class AnneeunivController extends AbstractActionController
{

    /**
     * Index action for AnneeunivController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();

                return $viewModel;
    }

    /**
     * Calendrierpedagogie action for AnneeunivController
     *
     * @return ViewModel
     */
    public function calendrierpedagogieAction()
    {
        $viewModel = new ViewModel();

        return $viewModel;
    }


}
