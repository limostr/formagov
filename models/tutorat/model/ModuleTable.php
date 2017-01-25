<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class ModuleTable extends AbstractTableGateway
{
    protected $table ='module';
    protected $tableName ='module';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Module);

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
    	return $select->from('module')->columns($columnsArray);    	
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
    			$id=$row->idModule;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idModule' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getModule($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idModule' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchModule($idue, $idTypemodule, $idniveauformation, $idperiode, $credit, $coefficient, $idRegime, $idNature, $Nombredesemaine)
    {
        $select = $this->getSelect();
                if ($idue != null) {
        	$select->where->like('idue' ,'%'.$idue.'%');
        }
                if ($idTypemodule != null) {
        	$select->where->like('idTypemodule' ,'%'.$idTypemodule.'%');
        }
                if ($idniveauformation != null) {
        	$select->where->like('idniveauformation' ,'%'.$idniveauformation.'%');
        }
                if ($idperiode != null) {
        	$select->where->like('idperiode' ,'%'.$idperiode.'%');
        }
                if ($credit != null) {
        	$select->where->like('credit' ,'%'.$credit.'%');
        }
                if ($coefficient != null) {
        	$select->where->like('coefficient' ,'%'.$coefficient.'%');
        }
                if ($idRegime != null) {
        	$select->where->like('idRegime' ,'%'.$idRegime.'%');
        }
                if ($idNature != null) {
        	$select->where->like('idNature' ,'%'.$idNature.'%');
        }
                if ($Nombredesemaine != null) {
        	$select->where->like('Nombredesemaine' ,'%'.$Nombredesemaine.'%');
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
    

    public function saveModule(Module $module)
    {
        $data = array(
        	            'idue' => $module->idue,
                        'idTypemodule' => $module->idTypemodule,
                        'idniveauformation' => $module->idniveauformation,
                        'idperiode' => $module->idperiode,
                        'credit' => $module->credit,
                        'coefficient' => $module->coefficient,
                        'idRegime' => $module->idRegime,
                        'idNature' => $module->idNature,
                        'Nombredesemaine' => $module->Nombredesemaine,
                    );

        $id = (int)$module->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getModule($id)) {
                $this->update($data, array('idModule' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addModule($idTypemodule, $idniveauformation, $idperiode, $idRegime, $idNature, $idue = null, $credit = null, $coefficient = null, $Nombredesemaine = null)
    {
        $data = array(            'idTypemodule' => $idTypemodule,
                        'idniveauformation' => $idniveauformation,
                        'idperiode' => $idperiode,
                        'idRegime' => $idRegime,
                        'idNature' => $idNature,
                    );
                if ($idue != null) {
        	$data['idue'] = $idue;
        }
                if ($credit != null) {
        	$data['credit'] = $credit;
        }
                if ($coefficient != null) {
        	$data['coefficient'] = $coefficient;
        }
                if ($Nombredesemaine != null) {
        	$data['Nombredesemaine'] = $Nombredesemaine;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateModule($idModule, $idue, $idTypemodule, $idniveauformation, $idperiode, $credit, $coefficient, $idRegime, $idNature, $Nombredesemaine)
    {
        $data = array(
        	            'idue' => $module->idue,
                        'idTypemodule' => $module->idTypemodule,
                        'idniveauformation' => $module->idniveauformation,
                        'idperiode' => $module->idperiode,
                        'credit' => $module->credit,
                        'coefficient' => $module->coefficient,
                        'idRegime' => $module->idRegime,
                        'idNature' => $module->idNature,
                        'Nombredesemaine' => $module->Nombredesemaine,
                            );
        $this->update($data, array(idModule => $id));
    }

    public function deleteModule($id)
    {
        $this->delete(array('idModule' => $id));
    }

}
