<?php
 
//		$id=$row->idservices;


namespace Models\ExTutorat;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select ;
use Models\Tutorat\Model\ServicesTable;

class ExServicesTable extends ServicesTable
{
    public function getAllServiceRole($idrole="",$idtype="",$idservicepere=""){
        $selector = $this->getSql()->select();

        $selector->join(array('t'=>"typeservices"), "t.idtypeservices=services.idtypeservices",Select::SQL_STAR,'left');
        $selector->join(array('d'=>"droits"), "d.idservices=services.idservices",Select::SQL_STAR,'left');


        if( !empty($idrole)){
            $selector->where("idroles='".$idrole."'");
        }
        if( !empty($idtype)){
            $selector->where("t.idtypeservices='".$idtype."'");
        }
        if( !empty($idservicepere)){
            $selector->where("idsousservices ='".$idservicepere."'");
        }
        $selector->columns(
            array(
                "labelservice" => "label"
                ,"codeservices" => "idservices"
                ,"codestypeservices" => "idtypeservices"
                ,"url"=>"url"
            )

        );
         $res=$this->selectWith($selector);

        if($res){

            return $res->toArray();
        }else{
            return false;
        }
    }

}
