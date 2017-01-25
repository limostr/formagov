<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class FormationsTable extends AbstractTableGateway
{
    protected $table ='formations';
    protected $tableName ='formations';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Formations);

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
    	return $select->from('formations')->columns($columnsArray);    	
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
    			$id=$row->idformations;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idformations' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getFormations($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idformations' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchFormations($idpereformations, $idtypeformation, $codeformation, $abrev, $Label, $Labelar, $description, $codeformationuvt, $codeformationmis, $siteweb, $niveau, $modeformation, $prixdeniveau)
    {
        $select = $this->getSelect();
                if ($idpereformations != null) {
        	$select->where->like('idpereformations' ,'%'.$idpereformations.'%');
        }
                if ($idtypeformation != null) {
        	$select->where->like('idtypeformation' ,'%'.$idtypeformation.'%');
        }
                if ($codeformation != null) {
        	$select->where->like('codeformation' ,'%'.$codeformation.'%');
        }
                if ($abrev != null) {
        	$select->where->like('abrev' ,'%'.$abrev.'%');
        }
                if ($Label != null) {
        	$select->where->like('Label' ,'%'.$Label.'%');
        }
                if ($Labelar != null) {
        	$select->where->like('Labelar' ,'%'.$Labelar.'%');
        }
                if ($description != null) {
        	$select->where->like('description' ,'%'.$description.'%');
        }
                if ($codeformationuvt != null) {
        	$select->where->like('codeformationuvt' ,'%'.$codeformationuvt.'%');
        }
                if ($codeformationmis != null) {
        	$select->where->like('codeformationmis' ,'%'.$codeformationmis.'%');
        }
                if ($siteweb != null) {
        	$select->where->like('siteweb' ,'%'.$siteweb.'%');
        }
                if ($niveau != null) {
        	$select->where->like('niveau' ,'%'.$niveau.'%');
        }
                if ($modeformation != null) {
        	$select->where->like('modeformation' ,'%'.$modeformation.'%');
        }
                if ($prixdeniveau != null) {
        	$select->where->like('prixdeniveau' ,'%'.$prixdeniveau.'%');
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
    

    public function saveFormations(Formations $formations)
    {
        $data = array(
        	            'idpereformations' => $formations->idpereformations,
                        'idtypeformation' => $formations->idtypeformation,
                        'codeformation' => $formations->codeformation,
                        'abrev' => $formations->abrev,
                        'Label' => $formations->Label,
                        'Labelar' => $formations->Labelar,
                        'description' => $formations->description,
                        'codeformationuvt' => $formations->codeformationuvt,
                        'codeformationmis' => $formations->codeformationmis,
                        'siteweb' => $formations->siteweb,
                        'niveau' => $formations->niveau,
                        'modeformation' => $formations->modeformation,
                        'prixdeniveau' => $formations->prixdeniveau,
                    );

        $id = (int)$formations->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getFormations($id)) {
                $this->update($data, array('idformations' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addFormations($idtypeformation, $idpereformations = null, $codeformation = null, $abrev = null, $Label = null, $Labelar = null, $description = null, $codeformationuvt = null, $codeformationmis = null, $siteweb = null, $niveau = null, $modeformation = null, $prixdeniveau = null)
    {
        $data = array(            'idtypeformation' => $idtypeformation,
                    );
                if ($idpereformations != null) {
        	$data['idpereformations'] = $idpereformations;
        }
                if ($codeformation != null) {
        	$data['codeformation'] = $codeformation;
        }
                if ($abrev != null) {
        	$data['abrev'] = $abrev;
        }
                if ($Label != null) {
        	$data['Label'] = $Label;
        }
                if ($Labelar != null) {
        	$data['Labelar'] = $Labelar;
        }
                if ($description != null) {
        	$data['description'] = $description;
        }
                if ($codeformationuvt != null) {
        	$data['codeformationuvt'] = $codeformationuvt;
        }
                if ($codeformationmis != null) {
        	$data['codeformationmis'] = $codeformationmis;
        }
                if ($siteweb != null) {
        	$data['siteweb'] = $siteweb;
        }
                if ($niveau != null) {
        	$data['niveau'] = $niveau;
        }
                if ($modeformation != null) {
        	$data['modeformation'] = $modeformation;
        }
                if ($prixdeniveau != null) {
        	$data['prixdeniveau'] = $prixdeniveau;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateFormations($idformations, $idpereformations, $idtypeformation, $codeformation, $abrev, $Label, $Labelar, $description, $codeformationuvt, $codeformationmis, $siteweb, $niveau, $modeformation, $prixdeniveau)
    {
        $data = array(
        	            'idpereformations' => $formations->idpereformations,
                        'idtypeformation' => $formations->idtypeformation,
                        'codeformation' => $formations->codeformation,
                        'abrev' => $formations->abrev,
                        'Label' => $formations->Label,
                        'Labelar' => $formations->Labelar,
                        'description' => $formations->description,
                        'codeformationuvt' => $formations->codeformationuvt,
                        'codeformationmis' => $formations->codeformationmis,
                        'siteweb' => $formations->siteweb,
                        'niveau' => $formations->niveau,
                        'modeformation' => $formations->modeformation,
                        'prixdeniveau' => $formations->prixdeniveau,
                            );
        $this->update($data, array(idformations => $id));
    }

    public function deleteFormations($id)
    {
        $this->delete(array('idformations' => $id));
    }

}
