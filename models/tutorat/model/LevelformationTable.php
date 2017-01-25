<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class LevelformationTable extends AbstractTableGateway
{
    protected $table ='levelformation';
    protected $tableName ='levelformation';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Levelformation);

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
    	return $select->from('levelformation')->columns($columnsArray);    	
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
    			$id=$row->idlevelformation;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idlevelformation' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getLevelformation($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idlevelformation' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchLevelformation($labellevel, $desclevel)
    {
        $select = $this->getSelect();
                if ($labellevel != null) {
        	$select->where->like('labellevel' ,'%'.$labellevel.'%');
        }
                if ($desclevel != null) {
        	$select->where->like('desclevel' ,'%'.$desclevel.'%');
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
    

    public function saveLevelformation(Levelformation $levelformation)
    {
        $data = array(
        	            'labellevel' => $levelformation->labellevel,
                        'desclevel' => $levelformation->desclevel,
                    );

        $id = (int)$levelformation->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getLevelformation($id)) {
                $this->update($data, array('idlevelformation' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addLevelformation($labellevel = null, $desclevel = null)
    {
        $data = array(        );
                if ($labellevel != null) {
        	$data['labellevel'] = $labellevel;
        }
                if ($desclevel != null) {
        	$data['desclevel'] = $desclevel;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateLevelformation($idlevelformation, $labellevel, $desclevel)
    {
        $data = array(
        	            'labellevel' => $levelformation->labellevel,
                        'desclevel' => $levelformation->desclevel,
                            );
        $this->update($data, array(idlevelformation => $id));
    }

    public function deleteLevelformation($id)
    {
        $this->delete(array('idlevelformation' => $id));
    }

}
