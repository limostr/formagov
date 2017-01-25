<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class LangueTable extends AbstractTableGateway
{
    protected $table ='langue';
    protected $tableName ='langue';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Langue);

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
    	return $select->from('langue')->columns($columnsArray);    	
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
    			$id=$row->idlangue;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idlangue' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getLangue($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idlangue' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchLangue($labellangue, $drapeau)
    {
        $select = $this->getSelect();
                if ($labellangue != null) {
        	$select->where->like('labellangue' ,'%'.$labellangue.'%');
        }
                if ($drapeau != null) {
        	$select->where->like('drapeau' ,'%'.$drapeau.'%');
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
    

    public function saveLangue(Langue $langue)
    {
        $data = array(
        	            'labellangue' => $langue->labellangue,
                        'drapeau' => $langue->drapeau,
                    );

        $id = (int)$langue->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getLangue($id)) {
                $this->update($data, array('idlangue' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addLangue($labellangue = null, $drapeau = null)
    {
        $data = array(        );
                if ($labellangue != null) {
        	$data['labellangue'] = $labellangue;
        }
                if ($drapeau != null) {
        	$data['drapeau'] = $drapeau;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateLangue($idlangue, $labellangue, $drapeau)
    {
        $data = array(
        	            'labellangue' => $langue->labellangue,
                        'drapeau' => $langue->drapeau,
                            );
        $this->update($data, array(idlangue => $id));
    }

    public function deleteLangue($id)
    {
        $this->delete(array('idlangue' => $id));
    }

}
