<?php
declare(strict_types = 1);
namespace Models\ExTutorat;

use
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select,
    Models\Tutorat\Model\LevelformationTable;

class ExLevelformationTable extends LevelformationTable
{
    public function getPeriode($idlevel){
        $selector= $this->getSql()->select();
        $selector->join("periode","periode.idlevelformation=levelformation.idlevelformation");
        $selector->where(array("levelformation.idlevelformation"=>$idlevel));
        $result = $this->selectWith($selector);
        return $result;
    }

}
