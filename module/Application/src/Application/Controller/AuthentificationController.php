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
use Zend\Session\Container;
use Zend\Authentication\Result;
/**
 * AuthentificationController
 *
 * Handles the AuthentificationController requests for the Application Module
 *
 * @package Application\Controller
 */
class AuthentificationController extends AbstractActionController
{

    protected $form = null;

    protected $storage = null;

    protected $authservice = null;

    /**
     * Index action for AuthentificationController
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $viewModel = new ViewModel();

                return $viewModel;
    }

    public function getAuthService()
    {
        if (! $this->authservice) {
                    $this->authservice = $this->getServiceLocator()
                        ->get('AuthService');
                }

                return $this->authservice;
    }

    public function getSessionStorage()
    {
        if (! $this->storage) {
            $this->storage = new \Models\ExTutorat\MyAuthStorage("user","infologged");
        }

        return $this->storage;
    }

    /**
     * Login action for IndexController
     *
     * @return ViewModel
     */
    public function loginAction()
    {
        $viewModel = new ViewModel();
                $layout = $this->layout();
                $layout->setTemplate('layout/auth');

                if ($this->getAuthService()->hasIdentity()){
                    return $this->redirect()->toRoute('enseignant/controller-action',array('controller'=>'MesInvitations','action'=>'listerMesInvitations' ));
                }

                return $viewModel;
    }

    private function rolestable($email)
    {
        $sm = $this->getServiceLocator();
        $Adapter = $sm->get('DB\Adapter');

        $PersonnesTable=new \Models\ExTutorat\ExPersonnesTable($Adapter);
        $MesRoles=$PersonnesTable->getRolesPersonnes($email);
    }

    public function authenticateAction()
    {
                $redirect = 'login';
                $request = $this->getRequest();
                $sm = $this->getServiceLocator();
                $Adapter = $sm->get('DB\Adapter');

                if ($request->isPost()){
                    //check authentication...
                    $this->getAuthService()->getAdapter()
                        ->setIdentity($request->getPost('username'))
                        ->setCredential($request->getPost('password'));

                    $result = $this->getAuthService()->authenticate();
                    foreach($result->getMessages() as $message)
                    {
                        //save message temporary into flashmessenger
                        $this->flashmessenger()->addMessage($message);
                    }


                    switch ($result->getCode()) {

                        case Result::FAILURE_IDENTITY_NOT_FOUND:
                            /** do stuff for nonexistent identity **/
                            break;
                        case Result::FAILURE_CREDENTIAL_INVALID:
                            /** do stuff for invalid credential **/
                            break;
                        case Result::SUCCESS:
                            /** do stuff for successful authentication **/
                            $redirect = 'success';

                            //check if it has rememberMe :
                            if ($request->getPost('rememberme') == 1 ) {
                                $this->getSessionStorage()
                                    ->setRememberMe(1);

                            }

                             $userauth=$this->getAuthService()->getAdapter()->getResultRowObject();
                            $PersonnesTable=new \Models\ExTutorat\ExPersonnesTable($Adapter);


                            $Personne=$PersonnesTable->getuserinfo($userauth->idpersonnes);

                            $user=new \stdClass();
                            $user->role="inviter";
                            $user->email=$userauth->email;
                            $user->idpersonnes=$userauth->idpersonnes;

                            $user->info=$Personne;

                            // rechercher le mielleur role de l'utilisateur Recherche

                            $year=\Myhelper\GenericParams::__getUnivYear();
                            $RolePersonneTable=new \Models\ExTutorat\ExRolespersonnesTable($Adapter);
                            $RolesTable=new \Models\ExTutorat\ExRolesTable($Adapter);

                            $MesRolesRec=$RolePersonneTable->getRolePersonne($userauth->idpersonnes,$year);
                            $LesRolesRec=$RolesTable->getRoles();
                            $MaxRole="inviter";
                            foreach ($MesRolesRec as $rp){
                                if($LesRolesRec[$MaxRole]<$LesRolesRec[$rp->idroles]){
                                    $MaxRole=$rp->idroles;
                                }
                            }
                            $user->role=$MaxRole;
                            $user->YearOfRole=$year;



                            $this->getSessionStorage()->write($user);

                             $this->getAuthService()->setStorage($this->getSessionStorage());


                            return $this->redirect()->toRoute('enseignant/controller-action',array('controller'=>'mes-invitations','action'=>'lister-mes-invitations' ));

                            break;

                        default:
                            /** do stuff for other failure **/
                            break;
                    }


                }
                //return $this->redirect()->toRoute('application/controller-action',array('controller'=>'authentification','action'=>$redirect ));

        die($redirect);
                 return $this->redirect()->toRoute($redirect);
    }

    public function logoutAction()
    {

            try{

                $this->getSessionStorage()->forgetMe();
                $this->getSessionStorage()->clear();
                $this->getAuthService()->clearIdentity();
                $this->flashmessenger()->addMessage("Vous ete entrain de déconnecté");
                return $this->getEvent()->getRouter()->assemble( [], array('name' => 'login'));
            }catch(\Zend\Session\Exception $e ){

                echo $e->getMessage();
            }



                // $this->redirect()->toRoute('application/controller-action',array('controller'=>'authentification','action'=>'login' ));
    }

    /**
     * PermissionDenied action for AuthentificationController
     *
     * @return ViewModel
     */
    public function permissionDeniedAction()
    {
        $viewModel = new ViewModel();
        $layout = $this->layout();
        $layout->setTemplate('layout/white');
        return $viewModel;
    }


}
