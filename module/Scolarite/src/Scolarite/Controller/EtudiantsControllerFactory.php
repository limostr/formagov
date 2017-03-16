<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


namespace Scolarite\Controller;

use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorAwareInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

/**
 * EtudiantsControllerFactory
 *
 * Creates an instance of EtudiantsController
 *
 * @package Scolarite\Controller
 */
class EtudiantsControllerFactory implements FactoryInterface
{

    /**
     * Create service
     *
     * @param ServiceLocatorInterface|ServiceLocatorAwareInterface $controllerManager
     * @return EtudiantsController
     */
    public function createService(ServiceLocatorInterface $controllerManager)
    {
        $serviceLocator = $controllerManager->getServiceLocator();

        $instance = new EtudiantsController();

        return $instance;
    }


}
