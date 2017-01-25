<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class ModelregimeTable extends AbstractTableGateway
{
    protected $table ='modelregime';
    protected $tableName ='modelregime';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Modelregime);

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
    	return $select->from('modelregime')->columns($columnsArray);    	
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
    			$id=$row->idmodelregime;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idmodelregime' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getModelregime($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idmodelregime' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchModelregime($labelmodelregime, $descmodelregime)
    {
        $select = $this->getSelect();
                if ($labelmodelregime != null) {
        	$select->where->like('labelmodelregime' ,'%'.$labelmodelregime.'%');
        }
                if ($descmodelregime != null) {
        	$select->where->like('descmodelregime' ,'%'.$descmodelregime.'%');
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
    

    public function saveModelregime(Modelregime $modelregime)
    {
        $data = array(
        	            'labelmodelregime' => $modelregime->labelmodelregime,
                        'descmodelregime' => $modelregime->descmodelregime,
                    );

        $id = (int)$modelregime->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getModelregime($id)) {
                $this->update($data, array('idmodelregime' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addModelregime($labelmodelregime = null, $descmodelregime = null)
    {
        $data = array(        );
                if ($labelmodelregime != null) {
        	$data['labelmodelregime'] = $labelmodelregime;
        }
                if ($descmodelregime != null) {
        	$data['descmodelregime'] = $descmodelregime;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateModelregime($idmodelregime, $labelmodelregime, $descmodelregime)
    {
        $data = array(
        	            'labelmodelregime' => $modelregime->labelmodelregime,
                        'descmodelregime' => $modelregime->descmodelregime,
                            );
        $this->update($data, array(idmodelregime => $id));
    }

    public function deleteModelregime($id)
    {
        $this->delete(array('idmodelregime' => $id));
    }

}
