<?php
declare(strict_types = 1);
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application;

use Zend\Mvc\ModuleRouteListener;
use Zend\Mvc\MvcEvent;
use Zend\ModuleManager\Feature\InitProviderInterface;
use Zend\ModuleManager\ModuleManagerInterface;
use Zend\ModuleManager\Feature\ConfigProviderInterface;
use Zend\ModuleManager\Feature\AutoloaderProviderInterface;
use Zend\Authentication\Storage;
use Zend\Authentication\AuthenticationService;
use Zend\Authentication\Adapter\DbTable as MyDbAuthAdapter;


use Zend\Session\Container;
use Zend\ServiceManager\ServiceManager;

class Module implements InitProviderInterface, ConfigProviderInterface, AutoloaderProviderInterface
{

    public function init(ModuleManagerInterface $manager)
    {
        if (!defined('APPLICATION_MODULE_ROOT')) {
            define('APPLICATION_MODULE_ROOT', realpath(__DIR__));
        }
    }

    public function onBootstrap(MvcEvent $e)
    {
        $eventManager        = $e->getApplication()->getEventManager();
        $moduleRouteListener = new ModuleRouteListener();
        $moduleRouteListener->attach($eventManager);



        $eventManager->attach(MvcEvent::EVENT_DISPATCH, array(
            $this,
            'boforeDispatch'
        ), 100);


    }

    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

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
                    'Models\Model' => __DIR__ . '/../../models/model',
                    'Models\ExTutorat' => __DIR__ . '/../../models/extutorat',

                ),
            ),
        );
    }


    function boforeDispatch(MvcEvent $event)
    {
        $request = $event->getRequest();
        $response = $event->getResponse();
        $target = $event->getTarget();

        $whiteList = array(
            'Application\\Authentification-index',
            'Application\\Authentification-logout',
            'Application\\Authentification-permission-denied',
            'Application\\Authentification-authenticate',
            'Enseignant\\MonCompte-index',
            'Enseignant\\MonCompte-create-compte',
            'Enseignant\\MonCompte-demande-change-password',
            'Enseignant\\MonCompte-save-compte',
            'Enseignant\\MonCompte-change-password',

        );


        $requestUri = $request->getRequestUri();

        $controller = $event->getRouteMatch()->getParam('controller');

        $action = $event->getRouteMatch()->getParam('action');

        $requestedResourse = $controller . "-" . $action;
        //die($requestedResourse);
        $session = new Container('user');

        $authservice=new AuthenticationService();

        $serviceManager = $event->getApplication()->getServiceManager();

        $Adapter = $serviceManager->get('DB\Adapter');

        $session = $serviceManager->get("AuthService");

        \Myhelper\GenericParams::$__DB_ADAPTER__=$Adapter;


        if ($authservice->hasIdentity()) {
            if ($requestedResourse == 'Application\\Authentification-index' || in_array($requestedResourse, $whiteList)) {
                if ($requestedResourse == 'Application\\Authentification-permission-denied'){
                    $response->sendHeaders();
                    return;
                }

                $url = '/';
                $response->setHeaders($response->getHeaders()
                    ->addHeaderLine('Location', $url));
                $response->setStatusCode(302);

            } else {



                $user=$session->getStorage()->getMember();
                $user= $serviceManager->get("AuthService")->getIdentity();

                $ser=new Container("user");
                $userinfolog=$ser->offsetGet("infologged");

                $acl = $serviceManager->get('Acl');
                $acl->initAcl();

                // rechercher le mielleur role de l'utilisateur Recherche
                $year=\Myhelper\GenericParams::__getUnivYear();

                if($year!=$userinfolog->YearOfRole){
                    $RolePersonneTable=new \Models\ExTutorat\ExRolespersonnesTable($Adapter);
                    $RolesTable=new \Models\ExTutorat\ExRolesTable($Adapter);

                    $MesRolesRec=$RolePersonneTable->getRolePersonne($userinfolog->idpersonnes,$year);
                    $LesRolesRec=$RolesTable->getRoles();
                    $MaxRole=$userinfolog->role;
                    foreach ($MesRolesRec as $rp){
                        if($LesRolesRec[$MaxRole]<$LesRolesRec[$rp->idroles]){
                            $MaxRole=$rp->idroles;
                        }
                    }
                    $userinfolog->role=$MaxRole;
                    $userinfolog->YearOfRole=$year;
                    $storage = new \Models\ExTutorat\MyAuthStorage("user","infologged");
                    $storage->write($userinfolog);
                }

                //echo $userinfolog->role."  $controller, $action ";

                $status = $acl->isAccessAllowed($userinfolog->role, $controller, $action);
                ///Bloquage de gestion des rôle
                   /*    if (!$status) {

                        $url = $event->getRouter()->assemble( [], array('name' => 'permission-denied'));

                        $response->setHeaders($response->getHeaders()
                            ->addHeaderLine('Location', $url));
                        $response->setStatusCode(302);
                        $response->sendHeaders();
                   }*/
            }
        } else {

            if ($requestedResourse != 'Application\Authentification-login' && ! in_array($requestedResourse, $whiteList)) {
                $url = $event->getRouter()->assemble( [], array('name' => 'login'));
                //$url = 'application/authentification/login';

                $response->setHeaders($response->getHeaders()
                    ->addHeaderLine('Location', $url));
                $response->setStatusCode(302);
            }

            $response->sendHeaders();
        }
    }


    /**
     * Config service
     */
    public function getServiceConfig() {
        return array(
            'factories' => array(
                'DB\Adapter' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    return $dbAdapter;
                },
                'AuthService' => function($sm) {
                    //My assumption, you've alredy set dbAdapter
                    //and has users table with columns : user_name and pass_word
                    //that password hashed with md5
                    $dbAdapter           = $sm->get('Zend\Db\Adapter\Adapter');
                    $dbTableAuthAdapter  = new MyDbAuthAdapter($dbAdapter,
                        'personnes','email','motdepass', 'MD5(?)');
                    $authService = new AuthenticationService();
                    $authService->setAdapter($dbTableAuthAdapter);
                    $tablestorge = new \Models\ExTutorat\MyAuthStorage();
                    $authService->setStorage($tablestorge);

                    return $authService;
                },
                'Logger' => function ($sm) {
                    $filename = 'log_' . date('F') . '.txt';
                    $log = new Logger();

                    if(!is_dir('./data/logs')){
                        mkdir('./data/logs');
                        chmod('./data/logs', 0777);
                    }

                    $writer = new Stream('./data/logs/' . $filename);
                    $log->addWriter($writer);
                    return $log;
                },
                'Acl' => function ($sm) {

                    return new \Myhelper\Acl\AclModel($sm->get('Zend\Db\Adapter\Adapter'));
                },

            ),
        );
    }
}
