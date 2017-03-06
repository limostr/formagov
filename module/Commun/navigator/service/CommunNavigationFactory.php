<?php
declare(strict_types = 1);
/**
 * Created by PhpStorm.
 * User: username
 * Date: 30/01/2017
 * Time: 16:44
 */

namespace Commun\Navigator\Service;
use Zend\Navigation\Service\DefaultNavigationFactory;


class CommunNavigationFactory extends DefaultNavigationFactory
{
    protected function getName()
    {
        return 'Commun_Navigator';
    }
}