<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


namespace Scolarite;

use Zend\ModuleManager\Feature\InitProviderInterface;
use Zend\ModuleManager\ModuleManagerInterface;
use Zend\ModuleManager\Feature\ConfigProviderInterface;
use Zend\ModuleManager\Feature\AutoloaderProviderInterface;

/**
 * Module Scolarite
 *
 * Sets up and configures the Scolarite module
 *
 * @package Scolarite
 */
class Module implements InitProviderInterface, ConfigProviderInterface, AutoloaderProviderInterface
{

    /**
     * Init module
     *
     * Initialize module on loading
     *
     * @param ModuleManagerInterface $manager
     */
    public function init(ModuleManagerInterface $manager)
    {
        if (!defined('SCOLARITE_MODULE_ROOT')) {
            define('SCOLARITE_MODULE_ROOT', realpath(__DIR__));
        }
    }

    /**
     * Get module configuration
     *
     * Reads the module configuration from the config/ directory
     *
     * @return array module configuration data
     */
    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

    /**
     * Get module autoloader configuration
     *
     * Sets up the module autoloader configuration
     *
     * @return array module autoloader configuration
     */
    public function getAutoloaderConfig()
    {
        return array(
            'Zend\\Loader\\ClassMapAutoloader' => array(
                __NAMESPACE__ => __DIR__ . '/autoload_classmap.php',
            ),
            'Zend\\Loader\\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ),
            ),
        );
    }


}
