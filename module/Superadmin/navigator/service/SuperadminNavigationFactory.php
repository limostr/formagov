<?php
/**
 * Created by PhpStorm.
 * User: username
 * Date: 30/01/2017
 * Time: 16:44
 */

namespace Superadmin\Navigator\Service;
use Zend\Navigation\Service\DefaultNavigationFactory;


class SuperadminNavigationFactory extends DefaultNavigationFactory
{
    protected function getName()
    {
        return 'Superadmin_Navigator';
    }
}