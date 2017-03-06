<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class PermissionformationroleTable extends AbstractTableGateway
{
    protected $table ='permissionformationrole';
    protected $tableName ='permissionformationrole';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Permissionformationrole);

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
    	return $select->from('permissionformationrole')->columns($columnsArray);    	
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
    			$id=$row->idpermissionformationrole;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idpermissionformationrole' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getPermissionformationrole($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idpermissionformationrole' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchPermissionformationrole($labelpermission, $descpermission)
    {
        $select = $this->getSelect();
                if ($labelpermission != null) {
        	$select->where->like('labelpermission' ,'%'.$labelpermission.'%');
        }
                if ($descpermission != null) {
        	$select->where->like('descpermission' ,'%'.$descpermission.'%');
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
    

    public function savePermissionformationrole(Permissionformationrole $permissionformationrole)
    {
        $data = array(
        	            'labelpermission' => $permissionformationrole->labelpermission,
                        'descpermission' => $permissionformationrole->descpermission,
                    );

        $id = (int)$permissionformationrole->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getPermissionformationrole($id)) {
                $this->update($data, array('idpermissionformationrole' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addPermissionformationrole($labelpermission = null, $descpermission = null)
    {
        $data = array(        );
                if ($labelpermission != null) {
        	$data['labelpermission'] = $labelpermission;
        }
                if ($descpermission != null) {
        	$data['descpermission'] = $descpermission;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updatePermissionformationrole($idpermissionformationrole, $labelpermission, $descpermission)
    {
        $data = array(
        	            'labelpermission' => $permissionformationrole->labelpermission,
                        'descpermission' => $permissionformationrole->descpermission,
                            );
        $this->update($data, array(idpermissionformationrole => $id));
    }

    public function deletePermissionformationrole($id)
    {
        $this->delete(array('idpermissionformationrole' => $id));
    }

}
