<?php
/**
 * ZF2 Application built by ZF2rapid
 *
 * @copyright (c) 2015 John Doe
 * @license http://opensource.org/licenses/MIT The MIT License (MIT)
 */


namespace Pedagogie;

use Zend\ModuleManager\Feature\InitProviderInterface;
use Zend\ModuleManager\ModuleManagerInterface;
use Zend\ModuleManager\Feature\ConfigProviderInterface;
use Zend\ModuleManager\Feature\AutoloaderProviderInterface;


use Zend\Mvc\MvcEvent;
/**
 * Module Pedagogie
 *
 * Sets up and configures the Pedagogie module
 *
 * @package Pedagogie
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
        if (!defined('PEDAGOGIE_MODULE_ROOT')) {
            define('PEDAGOGIE_MODULE_ROOT', realpath(__DIR__));

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
                    'Myhelper' => __DIR__ . '/../../vendor/Myhelper',
                    'Models\Tutorat\Model' => __DIR__ . '/../../models/tutorat/model',
                    'Models\ExTutorat' => __DIR__ . '/../../models/extutorat',
                    'Pedagogie\Navigator\Service' => __DIR__ . '/navigator/service',
                 ),

            ),
        );
    }
    /**
     * Config service
     */
    public function getServiceConfig() {
        return array(
            'factories' => array(
                'Model\AnneeunivTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new \Models\ExTutorat\ExAnneeunivTable($dbAdapter);
                    return $table;
                },
                'Model\TypeformationTable'=> function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new \Models\ExTutorat\ExTypeformationTable($dbAdapter);
                    return $table;
                },

            ),
        );
    }

}
