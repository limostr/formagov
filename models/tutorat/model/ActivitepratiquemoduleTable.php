<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class ActivitepratiquemoduleTable extends AbstractTableGateway
{
    protected $table ='activitepratiquemodule';
    protected $tableName ='activitepratiquemodule';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Activitepratiquemodule);

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
    	return $select->from('activitepratiquemodule')->columns($columnsArray);    	
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
    			$id=$row->array('idactivitepratique', 'idModule');
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'array('idactivitepratique', 'idModule')' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getActivitepratiquemodule($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('array('idactivitepratique', 'idModule')' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchActivitepratiquemodule($idactivitepratique, $idModule, $idtypevalidation, $volumehoraire, $descactivitepratmodule, $remarqueactivitepratiquem)
    {
        $select = $this->getSelect();
                if ($idactivitepratique != null) {
        	$select->where->like('idactivitepratique' ,'%'.$idactivitepratique.'%');
        }
                if ($idModule != null) {
        	$select->where->like('idModule' ,'%'.$idModule.'%');
        }
                if ($idtypevalidation != null) {
        	$select->where->like('idtypevalidation' ,'%'.$idtypevalidation.'%');
        }
                if ($volumehoraire != null) {
        	$select->where->like('volumehoraire' ,'%'.$volumehoraire.'%');
        }
                if ($descactivitepratmodule != null) {
        	$select->where->like('descactivitepratmodule' ,'%'.$descactivitepratmodule.'%');
        }
                if ($remarqueactivitepratiquem != null) {
        	$select->where->like('remarqueactivitepratiquem' ,'%'.$remarqueactivitepratiquem.'%');
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
    

    public function saveActivitepratiquemodule(Activitepratiquemodule $activitepratiquemodule)
    {
        $data = array(
        	            'idactivitepratique' => $activitepratiquemodule->idactivitepratique,
                        'idModule' => $activitepratiquemodule->idModule,
                        'idtypevalidation' => $activitepratiquemodule->idtypevalidation,
                        'volumehoraire' => $activitepratiquemodule->volumehoraire,
                        'descactivitepratmodule' => $activitepratiquemodule->descactivitepratmodule,
                        'remarqueactivitepratiquem' => $activitepratiquemodule->remarqueactivitepratiquem,
                    );

        $id = (int)$activitepratiquemodule->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getActivitepratiquemodule($id)) {
                $this->update($data, array('array('idactivitepratique', 'idModule')' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addActivitepratiquemodule($idactivitepratique, $idModule, $idtypevalidation, $volumehoraire = null, $descactivitepratmodule = null, $remarqueactivitepratiquem = null)
    {
        $data = array(            'idactivitepratique' => $idactivitepratique,
                        'idModule' => $idModule,
                        'idtypevalidation' => $idtypevalidation,
                    );
                if ($volumehoraire != null) {
        	$data['volumehoraire'] = $volumehoraire;
        }
                if ($descactivitepratmodule != null) {
        	$data['descactivitepratmodule'] = $descactivitepratmodule;
        }
                if ($remarqueactivitepratiquem != null) {
        	$data['remarqueactivitepratiquem'] = $remarqueactivitepratiquem;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateActivitepratiquemodule($array('idactivitepratique', 'idModule'), $idactivitepratique, $idModule, $idtypevalidation, $volumehoraire, $descactivitepratmodule, $remarqueactivitepratiquem)
    {
        $data = array(
        	            'idactivitepratique' => $activitepratiquemodule->idactivitepratique,
                        'idModule' => $activitepratiquemodule->idModule,
                        'idtypevalidation' => $activitepratiquemodule->idtypevalidation,
                        'volumehoraire' => $activitepratiquemodule->volumehoraire,
                        'descactivitepratmodule' => $activitepratiquemodule->descactivitepratmodule,
                        'remarqueactivitepratiquem' => $activitepratiquemodule->remarqueactivitepratiquem,
                            );
        $this->update($data, array(array('idactivitepratique', 'idModule') => $id));
    }

    public function deleteActivitepratiquemodule($id)
    {
        $this->delete(array('array('idactivitepratique', 'idModule')' => $id));
    }

}
