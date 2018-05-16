<?php
/**
 * Created by PhpStorm.
 * User: username
 * Date: 15/08/2017
 * Time: 10:52
 */

namespace Models\ExTutorat;

use Models\Tutorat\Model\PeriodeTable;
use Zend\Db\Sql\Predicate\PredicateSet;
use  Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select ;

class ExPeriodeTable Extends PeriodeTable
{
    public function getCurentPeriode($idperiode){

        $selector=$this->getSql()->select();

        $selector->where(array("idperiode"=>$idperiode,"idsousperiode"=>$idperiode),PredicateSet::OP_OR );


        $result = $this->selectWith($selector);
        return $result;
    }





    public function getPeriodeFormation($idPiriode,$idNiveauFormation,&$preiode=array()){
        $selector=$this->getSql()->select();

        $selector->join("periodeformation","periodeformation.idperiode=periode.idperiode",select::SQL_STAR,'left');

        $selector->where->literal("periode.idperiode=?",$idPiriode);

        $result = $this->selectWith($selector);
        $result= $result->current();
        if(!empty($result->idsousperiode)){
            $this->periodComp($result->idsousperiode,$preiode);
        }
        $preiode[]=$result;

    }

    public function getOnePeriode($where){
        $selector=$this->getSql()->select();
        $selector->where($where);
        $result = $this->selectWith($selector);
        return $result;
    }

    public function getPeriodeTree($idlevelformation){
        $selector=$this->getSql()->select();
        $selector->where("idlevelformation=".$idlevelformation);
        $result = $this->selectWith($selector);
        $periodetree=array();
        foreach($result as $res){
            if(empty($res->idsousperiode) && !isset($periodetree[$res->idperiode]['info'])){
                $periodetree[$res->idperiode]['info']=$res;
            }
            if(isset($res->idsousperiode)  && !empty($res->idsousperiode)&& !isset($periodetree[$res->idsousperiode]['sub'][$res->idperiode])){
                $periodetree[$res->idperiode]['sub'][$res->idperiode]=$res;
            }
        }

        return $result;
    }

    public function getAllPeriodeDetails($idlevelformation){
        $selector=$this->getSql()->select();
        $selector->where("idlevelformation=".$idlevelformation);
        $result = $this->selectWith($selector);


        return $result;
    }

    public function periodComp($idPiriode,&$preiode=array()){
        $selector=$this->getSql()->select();

        $selector->where->literal("idperiode=?",$idPiriode);
        $result = $this->selectWith($selector);
       $result= $result->current();
        if(!empty($result->idsousperiode)){
           $this->periodComp($result->idsousperiode,$preiode);
        }
        $preiode[]=$result;


    }
}