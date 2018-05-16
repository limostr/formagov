<?php
/**
 * Created by PhpStorm.
 * User: username
 * Date: 21/08/2017
 * Time: 19:18
 */

namespace Models\ExTutorat;



 use  Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select ;

use Models\Tutorat\Model\PlandemoduleTable;

class ExPlandemoduleTable extends PlandemoduleTable
{
    public function TreePlanCours(&$TreePlan,$idModule,$idPerePlan=""){
        $select = $this->getSql()->select();
        $select->where("idModule=$idModule");
        if(!empty($idPerePlan)){
            $select->where( "idpereplandemodule = '$idPerePlan'" );
        }else{
            $select->where( "idpereplandemodule IS NULL" );
        }

        $resultSet = $this->selectWith($select);
        $PlanCours=array();
        if($resultSet) {
            foreach ($resultSet as $r) {
                $NoedChapitre=array();
                $NoedChapitre["key"]= "PEC_"."_".$r->idplandemodule.$r->idModule;
                $NoedChapitre["title"]= ($r->titrechapitre) ;
                $NoedChapitre["tooltip"]= $r->descplan;
                $this->TreePlanCours($NoedChapitre['children'],$idModule,$r->idplandemodule);
                if(is_array($NoedChapitre['children'])){
                    $NoedChapitre["folder"]= "true";
                    $NoedChapitre["iconclass"]= "fa fa-bookmark text-yellow";
                }else{
                    $NoedChapitre["folder"]= "false";
                    $NoedChapitre["iconclass"]= "fa fa-book";
                }
                $PlanCours[]=$NoedChapitre;
            }
        }

    }
}