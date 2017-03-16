<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class EnseignementTable extends AbstractTableGateway
{
    protected $table ='enseignement';
    protected $tableName ='enseignement';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Enseignement);

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
    	return $select->from('enseignement')->columns($columnsArray);    	
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
    			$id=$row->array('idTypeenseignement', 'idModule');
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'array('idTypeenseignement', 'idModule')' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getEnseignement($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('array('idTypeenseignement', 'idModule')' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchEnseignement($idTypeenseignement, $idModule, $valumehoraire, $descenseignement)
    {
        $select = $this->getSelect();
                if ($idTypeenseignement != null) {
        	$select->where->like('idTypeenseignement' ,'%'.$idTypeenseignement.'%');
        }
                if ($idModule != null) {
        	$select->where->like('idModule' ,'%'.$idModule.'%');
        }
                if ($valumehoraire != null) {
        	$select->where->like('valumehoraire' ,'%'.$valumehoraire.'%');
        }
                if ($descenseignement != null) {
        	$select->where->like('descenseignement' ,'%'.$descenseignement.'%');
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
    

    public function saveEnseignement(Enseignement $enseignement)
    {
        $data = array(
        	            'idTypeenseignement' => $enseignement->idTypeenseignement,
                        'idModule' => $enseignement->idModule,
                        'valumehoraire' => $enseignement->valumehoraire,
                        'descenseignement' => $enseignement->descenseignement,
                    );

        $id = (int)$enseignement->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getEnseignement($id)) {
                $this->update($data, array('array('idTypeenseignement', 'idModule')' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addEnseignement($idTypeenseignement, $idModule, $valumehoraire = null, $descenseignement = null)
    {
        $data = array(            'idTypeenseignement' => $idTypeenseignement,
                        'idModule' => $idModule,
                    );
                if ($valumehoraire != null) {
        	$data['valumehoraire'] = $valumehoraire;
        }
                if ($descenseignement != null) {
        	$data['descenseignement'] = $descenseignement;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   


}
