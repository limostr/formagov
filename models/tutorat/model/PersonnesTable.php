<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class PersonnesTable extends AbstractTableGateway
{
    protected $table ='personnes';
    protected $tableName ='personnes';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Personnes);

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
    	return $select->from('personnes')->columns($columnsArray);    	
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
    			$id=$row->idpersonnes;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idpersonnes' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getPersonnes($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idpersonnes' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchPersonnes($matricule, $rib)
    {
        $select = $this->getSelect();
                if ($matricule != null) {
        	$select->where->like('matricule' ,'%'.$matricule.'%');
        }
                if ($rib != null) {
        	$select->where->like('rib' ,'%'.$rib.'%');
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
    

    public function savePersonnes(Personnes $personnes)
    {
        $data = array(
        	            'matricule' => $personnes->matricule,
                        'rib' => $personnes->rib,
                    );

        $id = (int)$personnes->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getPersonnes($id)) {
                $this->update($data, array('idpersonnes' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addPersonnes($matricule = null, $rib = null)
    {
        $data = array(        );
                if ($matricule != null) {
        	$data['matricule'] = $matricule;
        }
                if ($rib != null) {
        	$data['rib'] = $rib;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updatePersonnes($idpersonnes, $matricule, $rib)
    {
        $data = array(
        	            'matricule' => $personnes->matricule,
                        'rib' => $personnes->rib,
                            );
        $this->update($data, array(idpersonnes => $id));
    }

    public function deletePersonnes($id)
    {
        $this->delete(array('idpersonnes' => $id));
    }

}
