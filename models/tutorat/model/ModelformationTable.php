<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class ModelformationTable extends AbstractTableGateway
{
    protected $table ='modelformation';
    protected $tableName ='modelformation';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Modelformation);

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
    	return $select->from('modelformation')->columns($columnsArray);    	
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
    			$id=$row->idmodelformation;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idmodelformation' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getModelformation($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idmodelformation' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchModelformation($idtypeformation, $idperemodelformation, $labelmodelformation, $descmodelform)
    {
        $select = $this->getSelect();
                if ($idtypeformation != null) {
        	$select->where->like('idtypeformation' ,'%'.$idtypeformation.'%');
        }
                if ($idperemodelformation != null) {
        	$select->where->like('idperemodelformation' ,'%'.$idperemodelformation.'%');
        }
                if ($labelmodelformation != null) {
        	$select->where->like('labelmodelformation' ,'%'.$labelmodelformation.'%');
        }
                if ($descmodelform != null) {
        	$select->where->like('descmodelform' ,'%'.$descmodelform.'%');
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
    

    public function saveModelformation(Modelformation $modelformation)
    {
        $data = array(
        	            'idtypeformation' => $modelformation->idtypeformation,
                        'idperemodelformation' => $modelformation->idperemodelformation,
                        'labelmodelformation' => $modelformation->labelmodelformation,
                        'descmodelform' => $modelformation->descmodelform,
                    );

        $id = (int)$modelformation->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getModelformation($id)) {
                $this->update($data, array('idmodelformation' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addModelformation($idtypeformation, $idperemodelformation = null, $labelmodelformation = null, $descmodelform = null)
    {
        $data = array(            'idtypeformation' => $idtypeformation,
                    );
                if ($idperemodelformation != null) {
        	$data['idperemodelformation'] = $idperemodelformation;
        }
                if ($labelmodelformation != null) {
        	$data['labelmodelformation'] = $labelmodelformation;
        }
                if ($descmodelform != null) {
        	$data['descmodelform'] = $descmodelform;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateModelformation($idmodelformation, $idtypeformation, $idperemodelformation, $labelmodelformation, $descmodelform)
    {
        $data = array(
        	            'idtypeformation' => $modelformation->idtypeformation,
                        'idperemodelformation' => $modelformation->idperemodelformation,
                        'labelmodelformation' => $modelformation->labelmodelformation,
                        'descmodelform' => $modelformation->descmodelform,
                            );
        $this->update($data, array(idmodelformation => $id));
    }

    public function deleteModelformation($id)
    {
        $this->delete(array('idmodelformation' => $id));
    }

}
