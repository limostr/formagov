<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class NiveauformationTable extends AbstractTableGateway
{
    protected $table ='niveauformation';
    protected $tableName ='niveauformation';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Niveauformation);

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
    	return $select->from('niveauformation')->columns($columnsArray);    	
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
    			$id=$row->idniveauformation;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idniveauformation' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getNiveauformation($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idniveauformation' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchNiveauformation($idformations, $labelnivformation, $pagesite, $idlevelformation)
    {
        $select = $this->getSelect();
                if ($idformations != null) {
        	$select->where->like('idformations' ,'%'.$idformations.'%');
        }
                if ($labelnivformation != null) {
        	$select->where->like('labelnivformation' ,'%'.$labelnivformation.'%');
        }
                if ($pagesite != null) {
        	$select->where->like('pagesite' ,'%'.$pagesite.'%');
        }
                if ($idlevelformation != null) {
        	$select->where->like('idlevelformation' ,'%'.$idlevelformation.'%');
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
    

    public function saveNiveauformation(Niveauformation $niveauformation)
    {
        $data = array(
        	            'idformations' => $niveauformation->idformations,
                        'labelnivformation' => $niveauformation->labelnivformation,
                        'pagesite' => $niveauformation->pagesite,
                        'idlevelformation' => $niveauformation->idlevelformation,
                    );

        $id = (int)$niveauformation->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getNiveauformation($id)) {
                $this->update($data, array('idniveauformation' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addNiveauformation($idformations, $idlevelformation, $labelnivformation = null, $pagesite = null)
    {
        $data = array(            'idformations' => $idformations,
                        'idlevelformation' => $idlevelformation,
                    );
                if ($labelnivformation != null) {
        	$data['labelnivformation'] = $labelnivformation;
        }
                if ($pagesite != null) {
        	$data['pagesite'] = $pagesite;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateNiveauformation($idniveauformation, $idformations, $labelnivformation, $pagesite, $idlevelformation)
    {
        $data = array(
        	            'idformations' => $niveauformation->idformations,
                        'labelnivformation' => $niveauformation->labelnivformation,
                        'pagesite' => $niveauformation->pagesite,
                        'idlevelformation' => $niveauformation->idlevelformation,
                            );
        $this->update($data, array(idniveauformation => $id));
    }

    public function deleteNiveauformation($id)
    {
        $this->delete(array('idniveauformation' => $id));
    }

}
