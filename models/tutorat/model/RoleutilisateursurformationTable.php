<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class RoleutilisateursurformationTable extends AbstractTableGateway
{
    protected $table ='roleutilisateursurformation';
    protected $tableName ='roleutilisateursurformation';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Roleutilisateursurformation);

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
    	return $select->from('roleutilisateursurformation')->columns($columnsArray);    	
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
    			$id=$row->array('idniveauformation', 'idroleresponsable', 'idpersonnes');
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'array('idniveauformation', 'idroleresponsable', 'idpersonnes')' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getRoleutilisateursurformation($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('array('idniveauformation', 'idroleresponsable', 'idpersonnes')' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchRoleutilisateursurformation($idniveauformation, $idroleresponsable, $idpersonnes)
    {
        $select = $this->getSelect();
                if ($idniveauformation != null) {
        	$select->where->like('idniveauformation' ,'%'.$idniveauformation.'%');
        }
                if ($idroleresponsable != null) {
        	$select->where->like('idroleresponsable' ,'%'.$idroleresponsable.'%');
        }
                if ($idpersonnes != null) {
        	$select->where->like('idpersonnes' ,'%'.$idpersonnes.'%');
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
    

    public function saveRoleutilisateursurformation(Roleutilisateursurformation $roleutilisateursurformation)
    {
        $data = array(
        	            'idniveauformation' => $roleutilisateursurformation->idniveauformation,
                        'idroleresponsable' => $roleutilisateursurformation->idroleresponsable,
                        'idpersonnes' => $roleutilisateursurformation->idpersonnes,
                    );

        $id = (int)$roleutilisateursurformation->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getRoleutilisateursurformation($id)) {
                $this->update($data, array('array('idniveauformation', 'idroleresponsable', 'idpersonnes')' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addRoleutilisateursurformation($idniveauformation, $idroleresponsable, $idpersonnes)
    {
        $data = array(            'idniveauformation' => $idniveauformation,
                        'idroleresponsable' => $idroleresponsable,
                        'idpersonnes' => $idpersonnes,
                    );
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateRoleutilisateursurformation($array('idniveauformation', 'idroleresponsable', 'idpersonnes'), $idniveauformation, $idroleresponsable, $idpersonnes)
    {
        $data = array(
        	            'idniveauformation' => $roleutilisateursurformation->idniveauformation,
                        'idroleresponsable' => $roleutilisateursurformation->idroleresponsable,
                        'idpersonnes' => $roleutilisateursurformation->idpersonnes,
                            );
        $this->update($data, array(array('idniveauformation', 'idroleresponsable', 'idpersonnes') => $id));
    }

    public function deleteRoleutilisateursurformation($id)
    {
        $this->delete(array('array('idniveauformation', 'idroleresponsable', 'idpersonnes')' => $id));
    }

}
