<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class PermissionsurformationTable extends AbstractTableGateway
{
    protected $table ='permissionsurformation';
    protected $tableName ='permissionsurformation';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Permissionsurformation);

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
    	return $select->from('permissionsurformation')->columns($columnsArray);    	
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
    			$id=$row->array('idroleresponsable', 'idpermissionformationrole');
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'array('idroleresponsable', 'idpermissionformationrole')' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getPermissionsurformation($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('array('idroleresponsable', 'idpermissionformationrole')' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchPermissionsurformation($idroleresponsable, $idpermissionformationrole)
    {
        $select = $this->getSelect();
                if ($idroleresponsable != null) {
        	$select->where->like('idroleresponsable' ,'%'.$idroleresponsable.'%');
        }
                if ($idpermissionformationrole != null) {
        	$select->where->like('idpermissionformationrole' ,'%'.$idpermissionformationrole.'%');
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
    

    public function savePermissionsurformation(Permissionsurformation $permissionsurformation)
    {
        $data = array(
        	            'idroleresponsable' => $permissionsurformation->idroleresponsable,
                        'idpermissionformationrole' => $permissionsurformation->idpermissionformationrole,
                    );

        $id = (int)$permissionsurformation->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getPermissionsurformation($id)) {
                $this->update($data, array('array('idroleresponsable', 'idpermissionformationrole')' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addPermissionsurformation($idroleresponsable, $idpermissionformationrole)
    {
        $data = array(            'idroleresponsable' => $idroleresponsable,
                        'idpermissionformationrole' => $idpermissionformationrole,
                    );
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updatePermissionsurformation($array('idroleresponsable', 'idpermissionformationrole'), $idroleresponsable, $idpermissionformationrole)
    {
        $data = array(
        	            'idroleresponsable' => $permissionsurformation->idroleresponsable,
                        'idpermissionformationrole' => $permissionsurformation->idpermissionformationrole,
                            );
        $this->update($data, array(array('idroleresponsable', 'idpermissionformationrole') => $id));
    }

    public function deletePermissionsurformation($id)
    {
        $this->delete(array('array('idroleresponsable', 'idpermissionformationrole')' => $id));
    }

}
