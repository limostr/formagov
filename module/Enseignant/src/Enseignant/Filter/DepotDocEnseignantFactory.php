<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


namespace Enseignant\Filter;

use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorAwareInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

/**
 * DepotDocEnseignantFactory
 *
 * Creates an instance of DepotDocEnseignant
 *
 * @package Enseignant\Filter
 */
class DepotDocEnseignantFactory implements FactoryInterface
{

    /**
     * Create service
     *
     * @param ServiceLocatorInterface|ServiceLocatorAwareInterface $filterManager
     * @return DepotDocEnseignant
     */
    public function createService(ServiceLocatorInterface $filterManager)
    {
        $serviceLocator = $filterManager->getServiceLocator();

        $instance = new DepotDocEnseignant();

        return $instance;
    }


}
