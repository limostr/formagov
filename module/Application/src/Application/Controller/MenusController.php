<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

/**
 * MenusController
 *
 * Handles the MenusController requests for the Application Module
 *
 * @package Application\Controller
 */
class MenusController extends AbstractActionController
{

    /**
     * Index action for MenusController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();
        $layout = $this->layout();
        $layout->setTemplate('layout/menu');
         return $viewModel;
    }

    /**
     * Root action for MenusController
     *
     * @return ViewModel
     */
    public function rootAction()
    {
        $viewModel = new ViewModel();

                        return $viewModel;
    }

    /**
     * Tuteur action for MenusController
     *
     * @return ViewModel
     */
    public function tuteurAction()
    {
        $viewModel = new ViewModel();
        $layout = $this->layout();
        $layout->setTemplate('layout/menu');
                return $viewModel;
    }

    /**
     * Coordinateur action for MenusController
     *
     * @return ViewModel
     */
    public function coordinateurAction()
    {
        $viewModel = new ViewModel();

        return $viewModel;
    }


}
