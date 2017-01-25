<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class InformationpersonnelTable extends AbstractTableGateway
{
    protected $table ='informationpersonnel';
    protected $tableName ='informationpersonnel';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Informationpersonnel);

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
    	return $select->from('informationpersonnel')->columns($columnsArray);    	
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
    			$id=$row->idinformationpersonnel;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idinformationpersonnel' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getInformationpersonnel($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idinformationpersonnel' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchInformationpersonnel($idpersonnes, $idlangue, $nom, $prenom, $lieudenaissance, $adress)
    {
        $select = $this->getSelect();
                if ($idpersonnes != null) {
        	$select->where->like('idpersonnes' ,'%'.$idpersonnes.'%');
        }
                if ($idlangue != null) {
        	$select->where->like('idlangue' ,'%'.$idlangue.'%');
        }
                if ($nom != null) {
        	$select->where->like('nom' ,'%'.$nom.'%');
        }
                if ($prenom != null) {
        	$select->where->like('prenom' ,'%'.$prenom.'%');
        }
                if ($lieudenaissance != null) {
        	$select->where->like('lieudenaissance' ,'%'.$lieudenaissance.'%');
        }
                if ($adress != null) {
        	$select->where->like('adress' ,'%'.$adress.'%');
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
    

    public function saveInformationpersonnel(Informationpersonnel $informationpersonnel)
    {
        $data = array(
        	            'idpersonnes' => $informationpersonnel->idpersonnes,
                        'idlangue' => $informationpersonnel->idlangue,
                        'nom' => $informationpersonnel->nom,
                        'prenom' => $informationpersonnel->prenom,
                        'lieudenaissance' => $informationpersonnel->lieudenaissance,
                        'adress' => $informationpersonnel->adress,
                    );

        $id = (int)$informationpersonnel->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getInformationpersonnel($id)) {
                $this->update($data, array('idinformationpersonnel' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addInformationpersonnel($idpersonnes, $idlangue, $nom = null, $prenom = null, $lieudenaissance = null, $adress = null)
    {
        $data = array(            'idpersonnes' => $idpersonnes,
                        'idlangue' => $idlangue,
                    );
                if ($nom != null) {
        	$data['nom'] = $nom;
        }
                if ($prenom != null) {
        	$data['prenom'] = $prenom;
        }
                if ($lieudenaissance != null) {
        	$data['lieudenaissance'] = $lieudenaissance;
        }
                if ($adress != null) {
        	$data['adress'] = $adress;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateInformationpersonnel($idinformationpersonnel, $idpersonnes, $idlangue, $nom, $prenom, $lieudenaissance, $adress)
    {
        $data = array(
        	            'idpersonnes' => $informationpersonnel->idpersonnes,
                        'idlangue' => $informationpersonnel->idlangue,
                        'nom' => $informationpersonnel->nom,
                        'prenom' => $informationpersonnel->prenom,
                        'lieudenaissance' => $informationpersonnel->lieudenaissance,
                        'adress' => $informationpersonnel->adress,
                            );
        $this->update($data, array(idinformationpersonnel => $id));
    }

    public function deleteInformationpersonnel($id)
    {
        $this->delete(array('idinformationpersonnel' => $id));
    }

}
