<?php
declare(strict_types = 1);
namespace Models\Extutorat;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select,
    Models\Tutorat\Model\NiveauformationTable;

class ExNiveauformationTable extends NiveauformationTable
{
    public function getNiveau($idformation,$idcompteuser=""){

        // echo $idcompteuser;
        $selector=$this->getSql()->select();

        $selector->where(array("idformations"=>$idformation));
        if(!empty($idcompteuser)){
            $selector->where(" idniveauformation IN ( SELECT idniveauformation FROM responsableformation WHERE idcompteuser=$idcompteuser)");
        }

        $record = $this->selectWith($selector);

        return $record;

    }
}
