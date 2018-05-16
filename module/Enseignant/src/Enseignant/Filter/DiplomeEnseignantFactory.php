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
 * DiplomeEnseignantFactory
 *
 * Creates an instance of DiplomeEnseignant
 *
 * @package Enseignant\Filter
 */
class DiplomeEnseignantFactory implements FactoryInterface
{

    /**
     * Create service
     *
     * @param ServiceLocatorInterface|ServiceLocatorAwareInterface $filterManager
     * @return DiplomeEnseignant
     */
    public function createService(ServiceLocatorInterface $filterManager)
    {
        $serviceLocator = $filterManager->getServiceLocator();

        $instance = new DiplomeEnseignant();

        return $instance;
    }


}
