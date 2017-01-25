<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class TypevalidationTable extends AbstractTableGateway
{
    protected $table ='typevalidation';
    protected $tableName ='typevalidation';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Typevalidation);

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
    	return $select->from('typevalidation')->columns($columnsArray);    	
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
    			$id=$row->idtypevalidation;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idtypevalidation' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getTypevalidation($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idtypevalidation' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchTypevalidation($labeltypevalidation, $desctypevalidation)
    {
        $select = $this->getSelect();
                if ($labeltypevalidation != null) {
        	$select->where->like('labeltypevalidation' ,'%'.$labeltypevalidation.'%');
        }
                if ($desctypevalidation != null) {
        	$select->where->like('desctypevalidation' ,'%'.$desctypevalidation.'%');
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
    

    public function saveTypevalidation(Typevalidation $typevalidation)
    {
        $data = array(
        	            'labeltypevalidation' => $typevalidation->labeltypevalidation,
                        'desctypevalidation' => $typevalidation->desctypevalidation,
                    );

        $id = (int)$typevalidation->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getTypevalidation($id)) {
                $this->update($data, array('idtypevalidation' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addTypevalidation($labeltypevalidation = null, $desctypevalidation = null)
    {
        $data = array(        );
                if ($labeltypevalidation != null) {
        	$data['labeltypevalidation'] = $labeltypevalidation;
        }
                if ($desctypevalidation != null) {
        	$data['desctypevalidation'] = $desctypevalidation;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateTypevalidation($idtypevalidation, $labeltypevalidation, $desctypevalidation)
    {
        $data = array(
        	            'labeltypevalidation' => $typevalidation->labeltypevalidation,
                        'desctypevalidation' => $typevalidation->desctypevalidation,
                            );
        $this->update($data, array(idtypevalidation => $id));
    }

    public function deleteTypevalidation($id)
    {
        $this->delete(array('idtypevalidation' => $id));
    }

}