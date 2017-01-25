<?php
namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class AnneeunivTable extends AbstractTableGateway
{
    protected $table ='anneeuniv';
    protected $tableName ='anneeuniv';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Anneeuniv);

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
    	return $select->from('anneeuniv')->columns($columnsArray);    	
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
    			$id=$row->idanneeuniv;
    			$isRowCreated=false;
    		}
    		return $id;
    }
    
    //http://stackoverflow.com/questions/6156942/how-do-i-insert-an-empty-row-but-have-the-autonumber-update-correctly
    
    public function createEmptyRow() {
    	$row=array(
    	'idanneeuniv' => null
    	);
    	$affectedRows=$this->insert($row);
 		if ($affectedRows != 1) {
    		throw new \Exception("error: could not add empty row to db");
    	}
    	$id=$this->lastInsertValue;
    	return $id;
	}
    
    public function getAnneeuniv($id)
    {
        $id  = (int) $id;
        $rowset = $this->select(array('idanneeuniv' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function matchAnneeuniv($labelanneeuniv, $descanneeuniv)
    {
        $select = $this->getSelect();
                if ($labelanneeuniv != null) {
        	$select->where->like('labelanneeuniv' ,'%'.$labelanneeuniv.'%');
        }
                if ($descanneeuniv != null) {
        	$select->where->like('descanneeuniv' ,'%'.$descanneeuniv.'%');
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
    

    public function saveAnneeuniv(Anneeuniv $anneeuniv)
    {
        $data = array(
        	            'labelanneeuniv' => $anneeuniv->labelanneeuniv,
                        'descanneeuniv' => $anneeuniv->descanneeuniv,
                    );

        $id = (int)$anneeuniv->id;
        if ($id == 0) {
            $this->insert($data);
        } else {
            if ($this->getAnneeuniv($id)) {
                $this->update($data, array('idanneeuniv' => $id));
            } else {
                throw new \Exception('Form id does not exit');
            }
        }
    }

    public function addAnneeuniv($labelanneeuniv = null, $descanneeuniv = null)
    {
        $data = array(        );
                if ($labelanneeuniv != null) {
        	$data['labelanneeuniv'] = $labelanneeuniv;
        }
                if ($descanneeuniv != null) {
        	$data['descanneeuniv'] = $descanneeuniv;
        }
                $affectedRows=$this->insert($data);
                return $affectedRows;
            }
    
   
    public function updateAnneeuniv($idanneeuniv, $labelanneeuniv, $descanneeuniv)
    {
        $data = array(
        	            'labelanneeuniv' => $anneeuniv->labelanneeuniv,
                        'descanneeuniv' => $anneeuniv->descanneeuniv,
                            );
        $this->update($data, array(idanneeuniv => $id));
    }

    public function deleteAnneeuniv($id)
    {
        $this->delete(array('idanneeuniv' => $id));
    }

}
