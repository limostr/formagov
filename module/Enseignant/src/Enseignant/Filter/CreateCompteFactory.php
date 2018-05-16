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
 * CreateCompteFactory
 *
 * Creates an instance of CreateCompte
 *
 * @package Enseignant\Filter
 */
class CreateCompteFactory implements FactoryInterface
{

    /**
     * Create service
     *
     * @param ServiceLocatorInterface|ServiceLocatorAwareInterface $filterManager
     * @return CreateCompte
     */
    public function createService(ServiceLocatorInterface $filterManager)
    {
        $serviceLocator = $filterManager->getServiceLocator();

        $instance = new CreateCompte();

        return $instance;
    }


}
