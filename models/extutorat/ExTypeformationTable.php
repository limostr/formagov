<?php
namespace Models\Extutorat;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;
use Models\Tutorat\Model\TypeformationTable;

class ExTypeformationTable extends TypeformationTable
{
    public function getPrincipalTypesFormation(){
        $select = $this->getSql()->select();

        $select->where( "idpertypeformation IS NULL OR idpertypeformation = 0" );
        $resultSet = $this->selectWith($select);

        return $resultSet;
    }

    public function  getModelTypeFormation($idType,&$Models){

        $select = $this->getSql()->select();

        $select->where( array("idpertypeformation"=>$idType) );
        $request = $this->getSql()->prepareStatementForSqlObject($select);
        $resultSet=$request->execute();
        $record=  $resultSet->current();
        if($record){
            $Models[]=$record;
            $this->getModelTypeFormation($record['idtypeformation'],$Models);
        }
    }
}
