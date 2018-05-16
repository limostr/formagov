<?php
/**
 * Created by PhpStorm.
 * User: username
 * Date: 21/08/2017
 * Time: 12:56
 */
declare(strict_types = 1);


namespace Models\ExTutorat;


use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

use Models\Tutorat\Model\PersonnesTable;

class ExPersonnesTable extends PersonnesTable
{
    public function getRolesPersonnes($email){

    }


    public function getuserinfo($idpersonne){
        $selector = $this->getSql()->select();

        $selector->join("infopersonne", "personnes.idpersonnes=infopersonne.idpersonnes");

        $selector->columns(array("motdepass"=>null));
        $selector->where->literal("personnes.idpersonnes=?",$idpersonne);

        $selector->getSqlString( $this->adapter->getPlatform());
        $result = $this->selectWith($selector);
        $info=new \stdClass();
        $info->fr=null;
        $info->ar=null;
        foreach ($result as $pinfo){
            if($pinfo->idlangue=='fr')
            {
                $info->fr=$pinfo;
            }
            if($pinfo->idlangue=='ar')
            {
                $info->ar=$pinfo;
            }

        }
        return $info;

    }
}