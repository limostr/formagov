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
 * DonneepersonnelleFactory
 *
 * Creates an instance of Donneepersonnelle
 *
 * @package Enseignant\Filter
 */
class DonneepersonnelleFactory implements FactoryInterface
{

    /**
     * Create service
     *
     * @param ServiceLocatorInterface|ServiceLocatorAwareInterface $filterManager
     * @return Donneepersonnelle
     */
    public function createService(ServiceLocatorInterface $filterManager)
    {
        $serviceLocator = $filterManager->getServiceLocator();

        $instance = new Donneepersonnelle();

        return $instance;
    }


}
