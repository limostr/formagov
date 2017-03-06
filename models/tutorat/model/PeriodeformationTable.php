<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class PeriodeformationTable extends AbstractTableGateway
{
    protected $table ='periodeformation';
    protected $tableName ='periodeformation';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Periodeformation);

        $this->initialize();
    }

    public function fetchAll()
    {
        $resultSet = $this->select();
        return $resultSet;
    }
    
   	public function newSelect() {
    	return new Select;
    }
    
    public function getSelect(&$select,$columnsArray=array()) 
    {
    	$select = new Select;
    	return $select->from('periodeformation')->columns($columnsArray);    	
    }
    
    public function createIfNotExist($checkColumnsArray,$optionalColumns=array(),&$isRowCreated=null) {
			$rowset=$this->select($checkColumnsArray);
    		$row = $rowset->current();
    		$id=null;
    		if ($row == null) {
    			$allColumns=array_merge($checkColumnsArray,$optionalColumns);
    			$affectedRows = $this->insert($allColumns);
    			if ($affectedRows != 1) {
    				throw new \Exception("error: could not add line to db");
    			}
    			$id=$this->lastInsertValue;
    			$isRowCreated=true;
    		} else {
    			$id=$row->idperiodeformation;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idperiodeformation' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getPeriodeformation($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idperiodeformation' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchPeriodeformation($idformations, $idperiode, $debutsemaine, $finsemaine, $descperiodeforma)
    {
        $select = $this->getSelect();
                if ($idformations != null) {
        	$select->where->like('idformations' ,'%'.$idformations.'%');
        }
                if ($idperiode != null) {
        	$select->where->like('idperiode' ,'%'.$idperiode.'%');
        }
                if ($debutsemaine != null) {
        	$select->where->like('debutsemaine' ,'%'.$debutsemaine.'%');
        }
                if ($finsemaine != null) {
        	$select->where->like('finsemaine' ,'%'.$finsemaine.'%');
        }
                if ($descperiodeforma != null) {
        	$select->where->like('descperiodeforma' ,'%'.$descperiodeforma.'%');
        }
                $statement = $this->getSql()->prepareStatementForSqlObject($select);
        $result = $statement->execute();
        $ret = $result->current();
        if ($ret !== false) {
        	$ret = array($ret);
            while (($line=$result->next()) !== false ) {
        		$ret[]=$line;
        	}
        }
        return $ret;
    }
    

    public function savePeriodeformation(Periodeformation $periodeformation)
    {
        $data = array(
        	            'idformations' => $periodeformation->idformations,
                        'idperiode' => $periodeformation->idperiode,
                        'debutsemaine' => $periodeformation->debutsemaine,
                        'finsemaine' => $periodeformation->finsemaine,
                        'descperiodeforma' => $periodeformation->descperiodeforma,
                    );

        $id = (int)$periodeformation->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getPeriodeformation($id)) {
                $this->update($data, array('idperiodeformation' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addPeriodeformation($idformations, $idperiode, $debutsemaine = null, $finsemaine = null, $descperiodeforma = null)
    {
        $data = array(            'idformations' => $idformations,
                        'idperiode' => $idperiode,
                    );
                if ($debutsemaine != null) {
        	$data['debutsemaine'] = $debutsemaine;
        }
                if ($finsemaine != null) {
        	$data['finsemaine'] = $finsemaine;
        }
                if ($descperiodeforma != null) {
        	$data['descperiodeforma'] = $descperiodeforma;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updatePeriodeformation($idperiodeformation, $idformations, $idperiode, $debutsemaine, $finsemaine, $descperiodeforma)
    {
        $data = array(
        	            'idformations' => $periodeformation->idformations,
                        'idperiode' => $periodeformation->idperiode,
                        'debutsemaine' => $periodeformation->debutsemaine,
                        'finsemaine' => $periodeformation->finsemaine,
                        'descperiodeforma' => $periodeformation->descperiodeforma,
                            );
        $this->update($data, array(idperiodeformation => $id));
    }

    public function deletePeriodeformation($id)
    {
        $this->delete(array('idperiodeformation' => $id));
    }

}
