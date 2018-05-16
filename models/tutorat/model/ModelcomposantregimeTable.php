<?php
	//	$id['idcomposanteval']=$row->idcomposanteval;
	//	$id['idmodelregime']=$row->idmodelregime;
		
 


namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class ModelcomposantregimeTable extends AbstractTableGateway
{
    protected $table ='modelcomposantregime';
    protected $tableName ='modelcomposantregime';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Modelcomposantregime);

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
    	return $select->from('modelcomposantregime')->columns($columnsArray);    	
    }
    
   
    
    

    
}
