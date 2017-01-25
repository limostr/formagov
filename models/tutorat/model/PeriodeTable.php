<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class PeriodeTable extends AbstractTableGateway
{
    protected $table ='periode';
    protected $tableName ='periode';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Periode);

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
    	return $select->from('periode')->columns($columnsArray);    	
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
    			$id=$row->idperiode;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idperiode' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getPeriode($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idperiode' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchPeriode($idpereperiode, $idlevelformation, $labelperiode, $descperiode)
    {
        $select = $this->getSelect();
                if ($idpereperiode != null) {
        	$select->where->like('idpereperiode' ,'%'.$idpereperiode.'%');
        }
                if ($idlevelformation != null) {
        	$select->where->like('idlevelformation' ,'%'.$idlevelformation.'%');
        }
                if ($labelperiode != null) {
        	$select->where->like('labelperiode' ,'%'.$labelperiode.'%');
        }
                if ($descperiode != null) {
        	$select->where->like('descperiode' ,'%'.$descperiode.'%');
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
    

    public function savePeriode(Periode $periode)
    {
        $data = array(
        	            'idpereperiode' => $periode->idpereperiode,
                        'idlevelformation' => $periode->idlevelformation,
                        'labelperiode' => $periode->labelperiode,
                        'descperiode' => $periode->descperiode,
                    );

        $id = (int)$periode->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getPeriode($id)) {
                $this->update($data, array('idperiode' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addPeriode($idlevelformation, $idpereperiode = null, $labelperiode = null, $descperiode = null)
    {
        $data = array(            'idlevelformation' => $idlevelformation,
                    );
                if ($idpereperiode != null) {
        	$data['idpereperiode'] = $idpereperiode;
        }
                if ($labelperiode != null) {
        	$data['labelperiode'] = $labelperiode;
        }
                if ($descperiode != null) {
        	$data['descperiode'] = $descperiode;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updatePeriode($idperiode, $idpereperiode, $idlevelformation, $labelperiode, $descperiode)
    {
        $data = array(
        	            'idpereperiode' => $periode->idpereperiode,
                        'idlevelformation' => $periode->idlevelformation,
                        'labelperiode' => $periode->labelperiode,
                        'descperiode' => $periode->descperiode,
                            );
        $this->update($data, array(idperiode => $id));
    }

    public function deletePeriode($id)
    {
        $this->delete(array('idperiode' => $id));
    }

}
