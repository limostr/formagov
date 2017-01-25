<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class ModelcomposantregimeTable extends AbstractTableGateway
{
    protected $table ='modelcomposantregime';
    protected $tableName ='modelcomposantregime';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Modelcomposantregime);

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
    	return $select->from('modelcomposantregime')->columns($columnsArray);    	
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
    			$id=$row->array('idcomposanteval', 'idmodelregime');
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'array('idcomposanteval', 'idmodelregime')' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getModelcomposantregime($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('array('idcomposanteval', 'idmodelregime')' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchModelcomposantregime($idcomposanteval, $idmodelregime, $mpossederattrapagecomp, $idtypevalidation)
    {
        $select = $this->getSelect();
                if ($idcomposanteval != null) {
        	$select->where->like('idcomposanteval' ,'%'.$idcomposanteval.'%');
        }
                if ($idmodelregime != null) {
        	$select->where->like('idmodelregime' ,'%'.$idmodelregime.'%');
        }
                if ($mpossederattrapagecomp != null) {
        	$select->where->like('mpossederattrapagecomp' ,'%'.$mpossederattrapagecomp.'%');
        }
                if ($idtypevalidation != null) {
        	$select->where->like('idtypevalidation' ,'%'.$idtypevalidation.'%');
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
    

    public function saveModelcomposantregime(Modelcomposantregime $modelcomposantregime)
    {
        $data = array(
        	            'idcomposanteval' => $modelcomposantregime->idcomposanteval,
                        'idmodelregime' => $modelcomposantregime->idmodelregime,
                        'mpossederattrapagecomp' => $modelcomposantregime->mpossederattrapagecomp,
                        'idtypevalidation' => $modelcomposantregime->idtypevalidation,
                    );

        $id = (int)$modelcomposantregime->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getModelcomposantregime($id)) {
                $this->update($data, array('array('idcomposanteval', 'idmodelregime')' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addModelcomposantregime($idcomposanteval, $idmodelregime, $idtypevalidation, $mpossederattrapagecomp = null)
    {
        $data = array(            'idcomposanteval' => $idcomposanteval,
                        'idmodelregime' => $idmodelregime,
                        'idtypevalidation' => $idtypevalidation,
                    );
                if ($mpossederattrapagecomp != null) {
        	$data['mpossederattrapagecomp'] = $mpossederattrapagecomp;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateModelcomposantregime($array('idcomposanteval', 'idmodelregime'), $idcomposanteval, $idmodelregime, $mpossederattrapagecomp, $idtypevalidation)
    {
        $data = array(
        	            'idcomposanteval' => $modelcomposantregime->idcomposanteval,
                        'idmodelregime' => $modelcomposantregime->idmodelregime,
                        'mpossederattrapagecomp' => $modelcomposantregime->mpossederattrapagecomp,
                        'idtypevalidation' => $modelcomposantregime->idtypevalidation,
                            );
        $this->update($data, array(array('idcomposanteval', 'idmodelregime') => $id));
    }

    public function deleteModelcomposantregime($id)
    {
        $this->delete(array('array('idcomposanteval', 'idmodelregime')' => $id));
    }

}
