<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class GroupesTable extends AbstractTableGateway
{
    protected $table ='groupes';
    protected $tableName ='groupes';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Groupes);

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
    	return $select->from('groupes')->columns($columnsArray);    	
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
    			$id=$row->idgroupes;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idgroupes' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getGroupes($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idgroupes' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchGroupes($idniveauformation, $abrevgroupe, $nbrmaxetudiant, $nbretudiant, $descgroupe, $remarquegroupe)
    {
        $select = $this->getSelect();
                if ($idniveauformation != null) {
        	$select->where->like('idniveauformation' ,'%'.$idniveauformation.'%');
        }
                if ($abrevgroupe != null) {
        	$select->where->like('abrevgroupe' ,'%'.$abrevgroupe.'%');
        }
                if ($nbrmaxetudiant != null) {
        	$select->where->like('nbrmaxetudiant' ,'%'.$nbrmaxetudiant.'%');
        }
                if ($nbretudiant != null) {
        	$select->where->like('nbretudiant' ,'%'.$nbretudiant.'%');
        }
                if ($descgroupe != null) {
        	$select->where->like('descgroupe' ,'%'.$descgroupe.'%');
        }
                if ($remarquegroupe != null) {
        	$select->where->like('remarquegroupe' ,'%'.$remarquegroupe.'%');
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
    

    public function saveGroupes(Groupes $groupes)
    {
        $data = array(
        	            'idniveauformation' => $groupes->idniveauformation,
                        'abrevgroupe' => $groupes->abrevgroupe,
                        'nbrmaxetudiant' => $groupes->nbrmaxetudiant,
                        'nbretudiant' => $groupes->nbretudiant,
                        'descgroupe' => $groupes->descgroupe,
                        'remarquegroupe' => $groupes->remarquegroupe,
                    );

        $id = (int)$groupes->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getGroupes($id)) {
                $this->update($data, array('idgroupes' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addGroupes($idniveauformation, $abrevgroupe = null, $nbrmaxetudiant = null, $nbretudiant = null, $descgroupe = null, $remarquegroupe = null)
    {
        $data = array(            'idniveauformation' => $idniveauformation,
                    );
                if ($abrevgroupe != null) {
        	$data['abrevgroupe'] = $abrevgroupe;
        }
                if ($nbrmaxetudiant != null) {
        	$data['nbrmaxetudiant'] = $nbrmaxetudiant;
        }
                if ($nbretudiant != null) {
        	$data['nbretudiant'] = $nbretudiant;
        }
                if ($descgroupe != null) {
        	$data['descgroupe'] = $descgroupe;
        }
                if ($remarquegroupe != null) {
        	$data['remarquegroupe'] = $remarquegroupe;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateGroupes($idgroupes, $idniveauformation, $abrevgroupe, $nbrmaxetudiant, $nbretudiant, $descgroupe, $remarquegroupe)
    {
        $data = array(
        	            'idniveauformation' => $groupes->idniveauformation,
                        'abrevgroupe' => $groupes->abrevgroupe,
                        'nbrmaxetudiant' => $groupes->nbrmaxetudiant,
                        'nbretudiant' => $groupes->nbretudiant,
                        'descgroupe' => $groupes->descgroupe,
                        'remarquegroupe' => $groupes->remarquegroupe,
                            );
        $this->update($data, array(idgroupes => $id));
    }

    public function deleteGroupes($id)
    {
        $this->delete(array('idgroupes' => $id));
    }

}
