<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class TypemoduleTable extends AbstractTableGateway
{
    protected $table ='typemodule';
    protected $tableName ='typemodule';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Typemodule);

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
    	return $select->from('typemodule')->columns($columnsArray);    	
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
    			$id=$row->idTypemodule;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idTypemodule' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getTypemodule($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idTypemodule' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchTypemodule($labeltypemodule, $desctypemodule)
    {
        $select = $this->getSelect();
                if ($labeltypemodule != null) {
        	$select->where->like('labeltypemodule' ,'%'.$labeltypemodule.'%');
        }
                if ($desctypemodule != null) {
        	$select->where->like('desctypemodule' ,'%'.$desctypemodule.'%');
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
    

    public function saveTypemodule(Typemodule $typemodule)
    {
        $data = array(
        	            'labeltypemodule' => $typemodule->labeltypemodule,
                        'desctypemodule' => $typemodule->desctypemodule,
                    );

        $id = (int)$typemodule->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getTypemodule($id)) {
                $this->update($data, array('idTypemodule' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addTypemodule($labeltypemodule = null, $desctypemodule = null)
    {
        $data = array(        );
                if ($labeltypemodule != null) {
        	$data['labeltypemodule'] = $labeltypemodule;
        }
                if ($desctypemodule != null) {
        	$data['desctypemodule'] = $desctypemodule;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateTypemodule($idTypemodule, $labeltypemodule, $desctypemodule)
    {
        $data = array(
        	            'labeltypemodule' => $typemodule->labeltypemodule,
                        'desctypemodule' => $typemodule->desctypemodule,
                            );
        $this->update($data, array(idTypemodule => $id));
    }

    public function deleteTypemodule($id)
    {
        $this->delete(array('idTypemodule' => $id));
    }

}
