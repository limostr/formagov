<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class ModuleperiodeTable extends AbstractTableGateway
{
    protected $table ='moduleperiode';
    protected $tableName ='moduleperiode';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Moduleperiode);

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
    	return $select->from('moduleperiode')->columns($columnsArray);    	
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
    			$id=$row->idmoduleperiode;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idmoduleperiode' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getModuleperiode($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idmoduleperiode' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchModuleperiode($idModule, $idperiodeformation, $descmoduleperiode)
    {
        $select = $this->getSelect();
                if ($idModule != null) {
        	$select->where->like('idModule' ,'%'.$idModule.'%');
        }
                if ($idperiodeformation != null) {
        	$select->where->like('idperiodeformation' ,'%'.$idperiodeformation.'%');
        }
                if ($descmoduleperiode != null) {
        	$select->where->like('descmoduleperiode' ,'%'.$descmoduleperiode.'%');
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
    

    public function saveModuleperiode(Moduleperiode $moduleperiode)
    {
        $data = array(
        	            'idModule' => $moduleperiode->idModule,
                        'idperiodeformation' => $moduleperiode->idperiodeformation,
                        'descmoduleperiode' => $moduleperiode->descmoduleperiode,
                    );

        $id = (int)$moduleperiode->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getModuleperiode($id)) {
                $this->update($data, array('idmoduleperiode' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addModuleperiode($idModule, $idperiodeformation, $descmoduleperiode = null)
    {
        $data = array(            'idModule' => $idModule,
                        'idperiodeformation' => $idperiodeformation,
                    );
                if ($descmoduleperiode != null) {
        	$data['descmoduleperiode'] = $descmoduleperiode;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateModuleperiode($idmoduleperiode, $idModule, $idperiodeformation, $descmoduleperiode)
    {
        $data = array(
        	            'idModule' => $moduleperiode->idModule,
                        'idperiodeformation' => $moduleperiode->idperiodeformation,
                        'descmoduleperiode' => $moduleperiode->descmoduleperiode,
                            );
        $this->update($data, array(idmoduleperiode => $id));
    }

    public function deleteModuleperiode($id)
    {
        $this->delete(array('idmoduleperiode' => $id));
    }

}
