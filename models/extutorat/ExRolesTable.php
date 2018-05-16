<?php
/**
 * Created by PhpStorm.
 * User: o.limam
 * Date: 24/04/2018
 * Time: 10:03
 */

namespace Models\ExTutorat;



use Models\Tutorat\Model\RolesTable;
use  Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select ;


class ExRolesTable extends RolesTable
{
    public function getRoles()
    {
        $selector = $this->getSql()->select();
        $selector->order("poidsrole ASC");
        $result = $this->selectWith($selector);
        $roles=array();
        foreach ($result as $r){
            $roles[$r->idroles]=$r->poidsrole;
        }
        return $roles;
    }

}