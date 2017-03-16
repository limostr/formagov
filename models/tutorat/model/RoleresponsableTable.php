<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class RoleresponsableTable extends AbstractTableGateway
{
    protected $table ='roleresponsable';
    protected $tableName ='roleresponsable';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Roleresponsable);

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
    	return $select->from('roleresponsable')->columns($columnsArray);    	
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
    			$id=$row->idroleresponsable;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idroleresponsable' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getRoleresponsable($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idroleresponsable' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchRoleresponsable($labelroleresponsable, $descroleresponsable)
    {
        $select = $this->getSelect();
                if ($labelroleresponsable != null) {
        	$select->where->like('labelroleresponsable' ,'%'.$labelroleresponsable.'%');
        }
                if ($descroleresponsable != null) {
        	$select->where->like('descroleresponsable' ,'%'.$descroleresponsable.'%');
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
    

    public function saveRoleresponsable(Roleresponsable $roleresponsable)
    {
        $data = array(
        	            'labelroleresponsable' => $roleresponsable->labelroleresponsable,
                        'descroleresponsable' => $roleresponsable->descroleresponsable,
                    );

        $id = (int)$roleresponsable->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getRoleresponsable($id)) {
                $this->update($data, array('idroleresponsable' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addRoleresponsable($labelroleresponsable = null, $descroleresponsable = null)
    {
        $data = array(        );
                if ($labelroleresponsable != null) {
        	$data['labelroleresponsable'] = $labelroleresponsable;
        }
                if ($descroleresponsable != null) {
        	$data['descroleresponsable'] = $descroleresponsable;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateRoleresponsable($idroleresponsable, $labelroleresponsable, $descroleresponsable)
    {
        $data = array(
        	            'labelroleresponsable' => $roleresponsable->labelroleresponsable,
                        'descroleresponsable' => $roleresponsable->descroleresponsable,
                            );
        $this->update($data, array(idroleresponsable => $id));
    }

    public function deleteRoleresponsable($id)
    {
        $this->delete(array('idroleresponsable' => $id));
    }

}