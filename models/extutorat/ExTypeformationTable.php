<?php
declare(strict_types = 1);
namespace Models\ExTutorat;

use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;
use Models\Tutorat\Model\TypeformationTable;

class ExTypeformationTable extends TypeformationTable
{
    public function getPrincipalTypesFormation(){
        $select = $this->getSql()->select();

        $select->where( "idpertypeformation IS NULL OR idpertypeformation = 0" );
        $resultSet = $this->selectWith($select);

        return $resultSet;
    }

    public function  getModelTypeFormation($idType,&$Models){

        $select = $this->getSql()->select();

        $select->where( array("idpertypeformation"=>$idType) );
        $request = $this->getSql()->prepareStatementForSqlObject($select);
        $resultSet=$request->execute();
        $record=  $resultSet->current();
        if($record){
            $Models[]=$record;
            $this->getModelTypeFormation($record['idtypeformation'],$Models);
        }
    }

    public function getThisTypesFormation($idTypesFormation="",$idsingle=""){
        $selector= $this->getSql()->select();


        $selector->columns(array("key"=>"idformations","value"=>"Label","abrev"=>"abrev","idtypeformation"=>"idtypeformation","pere"=>"idpereformations"));
        if(empty($idformation) && empty($idsingle)){
            $selector->where("idpereformations IS NULL" );
        }elseif(empty($idsingle)){
            $selector->where(array("idpereformations"=>$idformation));
        }

        if(!empty($idsingle)){
            $selector->where(array("idformations"=>$idsingle));
        }


        $listformation = $this->selectWith($selector);

        if($listformation)
        {
            return $listformation;
        }else{
            return array();
        }


    }


    private function contructtree(&$formation, $id = '', $idsingne = '')
    {
        $sm = $this->getServiceLocator();
        $_listeformation = $sm->get('Model\FormationTable');
        $_listeniveau= $sm->get('Model\NiveauformationTable');
        $_listLevel= $sm->get('Model\LevelformationTable');

        if(empty($id)){
            $listeformation=$_listeformation->getThisFormation("",true,$idsingne);
        }else{
            $listeformation=$_listeformation->getThisFormation($id,true,$idsingne);
        }
        //print_r($listeformation);
        foreach ($listeformation as $key => $value){
            $tmplist=$_listeformation->getThisFormation($value['key']);

            if ($tmplist->count()==0){
                $formation1=array();
                $formation1["key"]= $value['key'];
                $formation1["title"]= $value['abrev'];
                $formation1["tooltip"]= $value['value'];
                $formation1["iconclass"]= "fa fa-graduation-cap text-green";

                $formation1["folder"]= "true";
                $niveau=array();

                $niveau=$_listeniveau->getNiveau($value['key']);

                foreach ($niveau as $keyniv => $valniv){
                    $niv=array();
                    $niv["key"]= "NIV_".$valniv['idniveauformation'];
                    $niv["title"]= $valniv['labelnivformation'];
                    $niv["tooltip"]= $value['value'].'('.$valniv['labelnivformation'].')' ;
                    $niv["iconclass"]= "fa fa-tags text-yellow";

                    $semestres=$_listLevel->getPeriode($valniv['idlevelformation']);

                    foreach ($semestres as  $semestre){
                        $sem=array();
                        $sem["key"]= "SEM_".$semestre['idperiode']."_".$valniv['idlevelformation']."_".$valniv['idniveauformation'];
                        $sem["title"]= $semestre['labelperiode'];
                        $sem["tooltip"]= $semestre['labelperiode'];
                        $sem["iconclass"]= "fa fa-calendar-check-o text-red";
                        $niv['children'][]=$sem;
                    }
                    if(isset($niv['children']) && count($niv['children'])>0){
                        $niv["folder"]= "true";
                    }else{
                        $niv["folder"]= "false";
                    }

                    $formation1['children'][]=$niv;
                }
                $formation[]=$formation1;
                $formation1=array();
            }else{
                $formation1=array();
                $formation1["key"]= "PERE_".$value['key'];
                $formation1["title"]= $value['abrev'];
                $formation1["tooltip"]= $value['value'];
                $formation1["folder"]= "true";
                $formation1['children']=array();
                $formation1["iconclass"]= "fa fa-folder text-purple";

                $this->contructtree($formation1['children'],$value['key']);
                $formation[]=$formation1;
            }
        }
    }

}
