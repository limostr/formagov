<?php
/**
 * Created by PhpStorm.
 * User: username
 * Date: 26/05/2017
 * Time: 23:53
 */

namespace Models\ExTutorat;


use Zend\Authentication\Storage;

class MyAuthStorage extends Storage\Session
{
    public function setRememberMe($rememberMe = 0, $time = 1209600)
    {
        if ($rememberMe == 1) {
            $this->session->getManager()->rememberMe($time);
        }
    }

    public function forgetMe()
    {
        $this->session->getManager()->forgetMe();
    }
}