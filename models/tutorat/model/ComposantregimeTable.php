<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class ComposantregimeTable extends AbstractTableGateway
{
    protected $table ='composantregime';
    protected $tableName ='composantregime';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Composantregime);

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
    	return $select->from('composantregime')->columns($columnsArray);    	
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
    			$id=$row->array('idRegime', 'idcomposanteval');
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'array('idRegime', 'idcomposanteval')' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getComposantregime($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('array('idRegime', 'idcomposanteval')' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchComposantregime($idRegime, $idcomposanteval, $possederattrapagecomp, $idtypevalidation)
    {
        $select = $this->getSelect();
                if ($idRegime != null) {
        	$select->where->like('idRegime' ,'%'.$idRegime.'%');
        }
                if ($idcomposanteval != null) {
        	$select->where->like('idcomposanteval' ,'%'.$idcomposanteval.'%');
        }
                if ($possederattrapagecomp != null) {
        	$select->where->like('possederattrapagecomp' ,'%'.$possederattrapagecomp.'%');
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
    

    public function saveComposantregime(Composantregime $composantregime)
    {
        $data = array(
        	            'idRegime' => $composantregime->idRegime,
                        'idcomposanteval' => $composantregime->idcomposanteval,
                        'possederattrapagecomp' => $composantregime->possederattrapagecomp,
                        'idtypevalidation' => $composantregime->idtypevalidation,
                    );

        $id = (int)$composantregime->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getComposantregime($id)) {
                $this->update($data, array('array('idRegime', 'idcomposanteval')' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addComposantregime($idRegime, $idcomposanteval, $idtypevalidation, $possederattrapagecomp = null)
    {
        $data = array(            'idRegime' => $idRegime,
                        'idcomposanteval' => $idcomposanteval,
                        'idtypevalidation' => $idtypevalidation,
                    );
                if ($possederattrapagecomp != null) {
        	$data['possederattrapagecomp'] = $possederattrapagecomp;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateComposantregime($array('idRegime', 'idcomposanteval'), $idRegime, $idcomposanteval, $possederattrapagecomp, $idtypevalidation)
    {
        $data = array(
        	            'idRegime' => $composantregime->idRegime,
                        'idcomposanteval' => $composantregime->idcomposanteval,
                        'possederattrapagecomp' => $composantregime->possederattrapagecomp,
                        'idtypevalidation' => $composantregime->idtypevalidation,
                            );
        $this->update($data, array(array('idRegime', 'idcomposanteval') => $id));
    }

    public function deleteComposantregime($id)
    {
        $this->delete(array('array('idRegime', 'idcomposanteval')' => $id));
    }

}
