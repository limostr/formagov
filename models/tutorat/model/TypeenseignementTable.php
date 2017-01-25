<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class TypeenseignementTable extends AbstractTableGateway
{
    protected $table ='typeenseignement';
    protected $tableName ='typeenseignement';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Typeenseignement);

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
    	return $select->from('typeenseignement')->columns($columnsArray);    	
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
    			$id=$row->idTypeenseignement;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idTypeenseignement' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getTypeenseignement($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idTypeenseignement' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchTypeenseignement($labeltypeenseignement, $desctypeenseignement)
    {
        $select = $this->getSelect();
                if ($labeltypeenseignement != null) {
        	$select->where->like('labeltypeenseignement' ,'%'.$labeltypeenseignement.'%');
        }
                if ($desctypeenseignement != null) {
        	$select->where->like('desctypeenseignement' ,'%'.$desctypeenseignement.'%');
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
    

    public function saveTypeenseignement(Typeenseignement $typeenseignement)
    {
        $data = array(
        	            'labeltypeenseignement' => $typeenseignement->labeltypeenseignement,
                        'desctypeenseignement' => $typeenseignement->desctypeenseignement,
                    );

        $id = (int)$typeenseignement->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getTypeenseignement($id)) {
                $this->update($data, array('idTypeenseignement' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addTypeenseignement($labeltypeenseignement = null, $desctypeenseignement = null)
    {
        $data = array(        );
                if ($labeltypeenseignement != null) {
        	$data['labeltypeenseignement'] = $labeltypeenseignement;
        }
                if ($desctypeenseignement != null) {
        	$data['desctypeenseignement'] = $desctypeenseignement;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateTypeenseignement($idTypeenseignement, $labeltypeenseignement, $desctypeenseignement)
    {
        $data = array(
        	            'labeltypeenseignement' => $typeenseignement->labeltypeenseignement,
                        'desctypeenseignement' => $typeenseignement->desctypeenseignement,
                            );
        $this->update($data, array(idTypeenseignement => $id));
    }

    public function deleteTypeenseignement($id)
    {
        $this->delete(array('idTypeenseignement' => $id));
    }

}
