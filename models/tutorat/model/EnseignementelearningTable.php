<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class EnseignementelearningTable extends AbstractTableGateway
{
    protected $table ='enseignementelearning';
    protected $tableName ='enseignementelearning';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Enseignementelearning);

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
    	return $select->from('enseignementelearning')->columns($columnsArray);    	
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
    			$id=$row->array('idactiviteelearning', 'idTypeenseignement', 'idModule');
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'array('idactiviteelearning', 'idTypeenseignement', 'idModule')' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getEnseignementelearning($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('array('idactiviteelearning', 'idTypeenseignement', 'idModule')' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchEnseignementelearning($idactiviteelearning, $idTypeenseignement, $idModule, $seuileval, $descengelearning, $remarqueee)
    {
        $select = $this->getSelect();
                if ($idactiviteelearning != null) {
        	$select->where->like('idactiviteelearning' ,'%'.$idactiviteelearning.'%');
        }
                if ($idTypeenseignement != null) {
        	$select->where->like('idTypeenseignement' ,'%'.$idTypeenseignement.'%');
        }
                if ($idModule != null) {
        	$select->where->like('idModule' ,'%'.$idModule.'%');
        }
                if ($seuileval != null) {
        	$select->where->like('seuileval' ,'%'.$seuileval.'%');
        }
                if ($descengelearning != null) {
        	$select->where->like('descengelearning' ,'%'.$descengelearning.'%');
        }
                if ($remarqueee != null) {
        	$select->where->like('remarqueee' ,'%'.$remarqueee.'%');
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
    

    public function saveEnseignementelearning(Enseignementelearning $enseignementelearning)
    {
        $data = array(
        	            'idactiviteelearning' => $enseignementelearning->idactiviteelearning,
                        'idTypeenseignement' => $enseignementelearning->idTypeenseignement,
                        'idModule' => $enseignementelearning->idModule,
                        'seuileval' => $enseignementelearning->seuileval,
                        'descengelearning' => $enseignementelearning->descengelearning,
                        'remarqueee' => $enseignementelearning->remarqueee,
                    );

        $id = (int)$enseignementelearning->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getEnseignementelearning($id)) {
                $this->update($data, array('array('idactiviteelearning', 'idTypeenseignement', 'idModule')' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addEnseignementelearning($idactiviteelearning, $idTypeenseignement, $idModule, $seuileval = null, $descengelearning = null, $remarqueee = null)
    {
        $data = array(            'idactiviteelearning' => $idactiviteelearning,
                        'idTypeenseignement' => $idTypeenseignement,
                        'idModule' => $idModule,
                    );
                if ($seuileval != null) {
        	$data['seuileval'] = $seuileval;
        }
                if ($descengelearning != null) {
        	$data['descengelearning'] = $descengelearning;
        }
                if ($remarqueee != null) {
        	$data['remarqueee'] = $remarqueee;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   


}
