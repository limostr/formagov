<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class ComposantevalTable extends AbstractTableGateway
{
    protected $table ='composanteval';
    protected $tableName ='composanteval';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Composanteval);

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
    	return $select->from('composanteval')->columns($columnsArray);    	
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
    			$id=$row->idcomposanteval;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idcomposanteval' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getComposanteval($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idcomposanteval' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchComposanteval($labelcompeval, $desceval, $possederattrapage)
    {
        $select = $this->getSelect();
                if ($labelcompeval != null) {
        	$select->where->like('labelcompeval' ,'%'.$labelcompeval.'%');
        }
                if ($desceval != null) {
        	$select->where->like('desceval' ,'%'.$desceval.'%');
        }
                if ($possederattrapage != null) {
        	$select->where->like('possederattrapage' ,'%'.$possederattrapage.'%');
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
    

    public function saveComposanteval(Composanteval $composanteval)
    {
        $data = array(
        	            'labelcompeval' => $composanteval->labelcompeval,
                        'desceval' => $composanteval->desceval,
                        'possederattrapage' => $composanteval->possederattrapage,
                    );

        $id = (int)$composanteval->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getComposanteval($id)) {
                $this->update($data, array('idcomposanteval' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addComposanteval($labelcompeval = null, $desceval = null, $possederattrapage = null)
    {
        $data = array(        );
                if ($labelcompeval != null) {
        	$data['labelcompeval'] = $labelcompeval;
        }
                if ($desceval != null) {
        	$data['desceval'] = $desceval;
        }
                if ($possederattrapage != null) {
        	$data['possederattrapage'] = $possederattrapage;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateComposanteval($idcomposanteval, $labelcompeval, $desceval, $possederattrapage)
    {
        $data = array(
        	            'labelcompeval' => $composanteval->labelcompeval,
                        'desceval' => $composanteval->desceval,
                        'possederattrapage' => $composanteval->possederattrapage,
                            );
        $this->update($data, array(idcomposanteval => $id));
    }

    public function deleteComposanteval($id)
    {
        $this->delete(array('idcomposanteval' => $id));
    }

}
