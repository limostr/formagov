<?php
	//	$id['idtraveaux']=$row->idtraveaux;
	//	$id['idpersonnes']=$row->idpersonnes;
	//	$id['idModule']=$row->idModule;
	//	$id['idanneeuniv']=$row->idanneeuniv;
		
 


namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class TraveenseignantsmoduleTable extends AbstractTableGateway
{
    protected $table ='traveenseignantsmodule';
    protected $tableName ='traveenseignantsmodule';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Traveenseignantsmodule);

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
    	return $select->from('traveenseignantsmodule')->columns($columnsArray);    	
    }
    
   
    
    

    
}
