<?php
	//	$id['idniveauformation']=$row->idniveauformation;
	//	$id['idroleresponsable']=$row->idroleresponsable;
	//	$id['idpersonnes']=$row->idpersonnes;
		
 


namespace Models\Tutorat\Model;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;

class RoleutilisateursurformationTable extends AbstractTableGateway
{
    protected $table ='roleutilisateursurformation';
    protected $tableName ='roleutilisateursurformation';

    public function qi($name)  { return $this->adapter->platform->quoteIdentifier($name); }
    
    public function fp($name) { return $this->adapter->driver->formatParameterName($name); }

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(new Roleutilisateursurformation);

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
    	return $select->from('roleutilisateursurformation')->columns($columnsArray);    	
    }
    
   
    
    

    
}
