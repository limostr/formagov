<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class RegimeTable extends AbstractTableGateway
{
    protected $table ='regime';
    protected $tableName ='regime';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Regime);

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
    	return $select->from('regime')->columns($columnsArray);    	
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
    			$id=$row->idRegime;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idRegime' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getRegime($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idRegime' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchRegime($labelregime, $descregime)
    {
        $select = $this->getSelect();
                if ($labelregime != null) {
        	$select->where->like('labelregime' ,'%'.$labelregime.'%');
        }
                if ($descregime != null) {
        	$select->where->like('descregime' ,'%'.$descregime.'%');
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
    

    public function saveRegime(Regime $regime)
    {
        $data = array(
        	            'labelregime' => $regime->labelregime,
                        'descregime' => $regime->descregime,
                    );

        $id = (int)$regime->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getRegime($id)) {
                $this->update($data, array('idRegime' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addRegime($labelregime = null, $descregime = null)
    {
        $data = array(        );
                if ($labelregime != null) {
        	$data['labelregime'] = $labelregime;
        }
                if ($descregime != null) {
        	$data['descregime'] = $descregime;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateRegime($idRegime, $labelregime, $descregime)
    {
        $data = array(
        	            'labelregime' => $regime->labelregime,
                        'descregime' => $regime->descregime,
                            );
        $this->update($data, array(idRegime => $id));
    }

    public function deleteRegime($id)
    {
        $this->delete(array('idRegime' => $id));
    }

}
