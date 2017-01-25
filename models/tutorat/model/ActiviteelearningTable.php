<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class ActiviteelearningTable extends AbstractTableGateway
{
    protected $table ='activiteelearning';
    protected $tableName ='activiteelearning';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Activiteelearning);

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
    	return $select->from('activiteelearning')->columns($columnsArray);    	
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
    			$id=$row->idactiviteelearning;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idactiviteelearning' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getActiviteelearning($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idactiviteelearning' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchActiviteelearning($labelactivite, $descactivite)
    {
        $select = $this->getSelect();
                if ($labelactivite != null) {
        	$select->where->like('labelactivite' ,'%'.$labelactivite.'%');
        }
                if ($descactivite != null) {
        	$select->where->like('descactivite' ,'%'.$descactivite.'%');
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
    

    public function saveActiviteelearning(Activiteelearning $activiteelearning)
    {
        $data = array(
        	            'labelactivite' => $activiteelearning->labelactivite,
                        'descactivite' => $activiteelearning->descactivite,
                    );

        $id = (int)$activiteelearning->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getActiviteelearning($id)) {
                $this->update($data, array('idactiviteelearning' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addActiviteelearning($labelactivite = null, $descactivite = null)
    {
        $data = array(        );
                if ($labelactivite != null) {
        	$data['labelactivite'] = $labelactivite;
        }
                if ($descactivite != null) {
        	$data['descactivite'] = $descactivite;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateActiviteelearning($idactiviteelearning, $labelactivite, $descactivite)
    {
        $data = array(
        	            'labelactivite' => $activiteelearning->labelactivite,
                        'descactivite' => $activiteelearning->descactivite,
                            );
        $this->update($data, array(idactiviteelearning => $id));
    }

    public function deleteActiviteelearning($id)
    {
        $this->delete(array('idactiviteelearning' => $id));
    }

}
