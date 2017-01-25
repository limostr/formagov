<?php
namespace Models\Extutorat;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select,
    Models\Tutorat\Model\FormationsTable;

class ExFormationsTable extends FormationsTable
{
   public function gest(){
      // $this->getSql()->select()->join();
   }

}
