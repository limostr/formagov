<?php
/**
 * Created by PhpStorm.
 * User: o.limam
 * Date: 24/04/2018
 * Time: 09:27
 */

namespace Models\ExTutorat;

use \Models\Tutorat\Model\RolespersonnesTable;
use Zend\Db\Sql\Predicate\PredicateSet;
use  Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select ;

class ExRolespersonnesTable extends RolespersonnesTable
{
    public function getRolePersonne($idpersonne="",$idannee="",$idperiode="" ){

        $selector=$this->getSql()->select();

        if(!empty($idpersonne)){
            $selector->where->literal("idpersonnes=?",$idpersonne);
        }
        if(!empty($idannee)){
            $selector->where->literal("idanneeuniv=?",$idannee);
        }
        if(!empty($idperiode)){
            $selector->where->literal("idperiode=?",$idperiode);
        }



        $result = $this->selectWith($selector);
        return $result;
    }
}