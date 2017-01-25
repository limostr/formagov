<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class NatureTable extends AbstractTableGateway
{
    protected $table ='nature';
    protected $tableName ='nature';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Nature);

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
    	return $select->from('nature')->columns($columnsArray);    	
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
    			$id=$row->idNature;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idNature' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getNature($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idNature' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchNature($labelnature, $descnature)
    {
        $select = $this->getSelect();
                if ($labelnature != null) {
        	$select->where->like('labelnature' ,'%'.$labelnature.'%');
        }
                if ($descnature != null) {
        	$select->where->like('descnature' ,'%'.$descnature.'%');
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
    

    public function saveNature(Nature $nature)
    {
        $data = array(
        	            'labelnature' => $nature->labelnature,
                        'descnature' => $nature->descnature,
                    );

        $id = (int)$nature->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getNature($id)) {
                $this->update($data, array('idNature' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addNature($labelnature = null, $descnature = null)
    {
        $data = array(        );
                if ($labelnature != null) {
        	$data['labelnature'] = $labelnature;
        }
                if ($descnature != null) {
        	$data['descnature'] = $descnature;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateNature($idNature, $labelnature, $descnature)
    {
        $data = array(
        	            'labelnature' => $nature->labelnature,
                        'descnature' => $nature->descnature,
                            );
        $this->update($data, array(idNature => $id));
    }

    public function deleteNature($id)
    {
        $this->delete(array('idNature' => $id));
    }

}
