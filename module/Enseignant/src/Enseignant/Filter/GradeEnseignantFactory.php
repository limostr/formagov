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
 * GradeEnseignantFactory
 *
 * Creates an instance of GradeEnseignant
 *
 * @package Enseignant\Filter
 */
class GradeEnseignantFactory implements FactoryInterface
{

    /**
     * Create service
     *
     * @param ServiceLocatorInterface|ServiceLocatorAwareInterface $filterManager
     * @return GradeEnseignant
     */
    public function createService(ServiceLocatorInterface $filterManager)
    {
        $serviceLocator = $filterManager->getServiceLocator();

        $instance = new GradeEnseignant();

        return $instance;
    }


}
