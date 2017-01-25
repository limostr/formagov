<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class ActivitepratiqueTable extends AbstractTableGateway
{
    protected $table ='activitepratique';
    protected $tableName ='activitepratique';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Activitepratique);

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
    	return $select->from('activitepratique')->columns($columnsArray);    	
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
    			$id=$row->idactivitepratique;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idactivitepratique' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getActivitepratique($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idactivitepratique' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchActivitepratique($labelactivitepratique, $descactivitepratique)
    {
        $select = $this->getSelect();
                if ($labelactivitepratique != null) {
        	$select->where->like('labelactivitepratique' ,'%'.$labelactivitepratique.'%');
        }
                if ($descactivitepratique != null) {
        	$select->where->like('descactivitepratique' ,'%'.$descactivitepratique.'%');
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
    

    public function saveActivitepratique(Activitepratique $activitepratique)
    {
        $data = array(
        	            'labelactivitepratique' => $activitepratique->labelactivitepratique,
                        'descactivitepratique' => $activitepratique->descactivitepratique,
                    );

        $id = (int)$activitepratique->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getActivitepratique($id)) {
                $this->update($data, array('idactivitepratique' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addActivitepratique($labelactivitepratique = null, $descactivitepratique = null)
    {
        $data = array(        );
                if ($labelactivitepratique != null) {
        	$data['labelactivitepratique'] = $labelactivitepratique;
        }
                if ($descactivitepratique != null) {
        	$data['descactivitepratique'] = $descactivitepratique;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateActivitepratique($idactivitepratique, $labelactivitepratique, $descactivitepratique)
    {
        $data = array(
        	            'labelactivitepratique' => $activitepratique->labelactivitepratique,
                        'descactivitepratique' => $activitepratique->descactivitepratique,
                            );
        $this->update($data, array(idactivitepratique => $id));
    }

    public function deleteActivitepratique($id)
    {
        $this->delete(array('idactivitepratique' => $id));
    }

}
