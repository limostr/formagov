<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class ListetypeformationTable extends AbstractTableGateway
{
    protected $table ='listetypeformation';
    protected $tableName ='listetypeformation';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Listetypeformation);

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
    	return $select->from('listetypeformation')->columns($columnsArray);    	
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
    			$id=$row->idlistetypeformation;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idlistetypeformation' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getListetypeformation($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idlistetypeformation' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchListetypeformation($idtypeformation, $labellistform, $abrevlist, $desclisttypeform)
    {
        $select = $this->getSelect();
                if ($idtypeformation != null) {
        	$select->where->like('idtypeformation' ,'%'.$idtypeformation.'%');
        }
                if ($labellistform != null) {
        	$select->where->like('labellistform' ,'%'.$labellistform.'%');
        }
                if ($abrevlist != null) {
        	$select->where->like('abrevlist' ,'%'.$abrevlist.'%');
        }
                if ($desclisttypeform != null) {
        	$select->where->like('desclisttypeform' ,'%'.$desclisttypeform.'%');
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
    

    public function saveListetypeformation(Listetypeformation $listetypeformation)
    {
        $data = array(
        	            'idtypeformation' => $listetypeformation->idtypeformation,
                        'labellistform' => $listetypeformation->labellistform,
                        'abrevlist' => $listetypeformation->abrevlist,
                        'desclisttypeform' => $listetypeformation->desclisttypeform,
                    );

        $id = (int)$listetypeformation->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getListetypeformation($id)) {
                $this->update($data, array('idlistetypeformation' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addListetypeformation($idtypeformation, $labellistform = null, $abrevlist = null, $desclisttypeform = null)
    {
        $data = array(            'idtypeformation' => $idtypeformation,
                    );
                if ($labellistform != null) {
        	$data['labellistform'] = $labellistform;
        }
                if ($abrevlist != null) {
        	$data['abrevlist'] = $abrevlist;
        }
                if ($desclisttypeform != null) {
        	$data['desclisttypeform'] = $desclisttypeform;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateListetypeformation($idlistetypeformation, $idtypeformation, $labellistform, $abrevlist, $desclisttypeform)
    {
        $data = array(
        	            'idtypeformation' => $listetypeformation->idtypeformation,
                        'labellistform' => $listetypeformation->labellistform,
                        'abrevlist' => $listetypeformation->abrevlist,
                        'desclisttypeform' => $listetypeformation->desclisttypeform,
                            );
        $this->update($data, array(idlistetypeformation => $id));
    }

    public function deleteListetypeformation($id)
    {
        $this->delete(array('idlistetypeformation' => $id));
    }

}
