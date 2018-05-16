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

use Models\Tutorat\Model\TypevalidationTable;

class ExTypevalidationTable extends TypevalidationTable
{
    public function getValidationwithValueModule(&$typemodule,$idmodule="",$idperetype=""){
        $select = $this->getSql()->select();

        if(!empty($idmodule)){
            $select->join("modulevalidationmodule","modulevalidationmodule.idtypevalidation=typevalidation.idtypevalidation",self::SQL_STAR,self::JOIN_LEFT);
            $select->where( "idModule = $idmodule" );
        }
        if(!empty($idperetype)){
            $select->where( "idperetypevalidation = '$idperetype'" );
        }else{
            $select->where( "idperetypevalidation IS NULL" );

        }

        $resultSet = $this->selectWith($select);

        if($resultSet){
            foreach ($resultSet as $r){
                $tempModule['typevalid']=$r->labeltypevalidation;
                $tempModule['desctype']=$r->desctypevalidation;
                if(!empty($idmodule)){
                    $tempModule['vh']=$r->volumehoraireeval;
                    $tempModule['desc']=$r->descmoduleeval;
                }else{
                    $tempModule['vh']=0;
                    $tempModule['desc']=0;
                }
                $tempModule['subtype']=array();
                $this->getValidationwithValueModule($tempModule['subtype'],$idmodule,$r->idtypevalidation);
                $typemodule[$r->idtypevalidation]=$tempModule;
            }
        }

        return $resultSet;
    }

}