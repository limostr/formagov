<?php
declare(strict_types = 1);
namespace Models\ExTutorat;

use Zend\Cache\Storage\Adapter\Session;
use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select,
    Models\Tutorat\Model\NiveauformationTable;

class ExNiveauformationTable extends NiveauformationTable
{
    public function getNiveau($idformation,$idcompteuser=""){

        // echo $idcompteuser;
        $selector=$this->getSql()->select();

        $selector->where(array("idformations"=>$idformation));
        if(!empty($idcompteuser)){
            $selector->where(" idniveauformation IN ( SELECT idniveauformation FROM responsableformation WHERE idcompteuser=$idcompteuser)");
        }

        $record = $this->selectWith($selector);

        return $record;

    }

    public function getNiveauPeriod($idformation,$allperiode=true,$idcompteuser=""){
        $selector=$this->getSql()->select();

        if(!empty($idcompteuser)){
            $selector->where(" idniveauformation IN ( SELECT idniveauformation FROM responsableformation WHERE idcompteuser=$idcompteuser)");
        }

        $selector->join("formations","formations.idformations=niveauformation.idformations");
        $selector->join("levelformation","levelformation.idlevelformation=niveauformation.idlevelformation");

        $selector->join("periode","periode.idlevelformation=levelformation.idlevelformation");
        $selector->where(array("formations.idformations"=>$idformation));

        if(!$allperiode){
            $selector->where("idsousperiode IS NULL");
        }

        $record = $this->selectWith($selector);
        $data=array();
        foreach ($record as $r){
            if(!isset($data[$r->idlevelformation])){
                $data[$r->idlevelformation]['label']=$r->labellevel;
            }
            if(!isset($data[$r->idlevelformation]['periode'][$r->idperiode])){
                $data[$r->idlevelformation]['periode'][$r->idperiode]=array(
                                                                            'labelperiode'=>$r->labelperiode
                                                                            ,'idniveau'=>$r->idniveauformation
                                                                        );
            }
        }
        return $data;
    }

    public function getNiveauByPeriodeFormation($idformation,$idperiode,$idcompteuser=""){
        $selector=$this->getSql()->select();

        if(!empty($idcompteuser)){
            $selector->where(" idniveauformation IN ( SELECT idniveauformation FROM responsableformation WHERE idcompteuser=$idcompteuser)");
        }

        $selector->join("formations","formations.idformations=niveauformation.idformations");
        $selector->join("levelformation","levelformation.idlevelformation=niveauformation.idlevelformation");

        $selector->join("periode","periode.idlevelformation=levelformation.idlevelformation");
        $selector->where(array("formations.idformations"=>$idformation));


         $selector->where("periode.idperiode='$idperiode'");

        $result = $this->executeSelect($selector);
        $record=$result->current();

        return $record;
    }


    public function getCurentNiveau($year){
        $selector=$this->getSql()->select();



        $selector->join("formations","formations.idformations=niveauformation.idformations");
        $selector->where->literal("datefinhabilitation >=?",$year);


       /* $selec = new Select();
        $selec->from("formations");
        $selec->columns(array("idpereformations"));
        $selec->quantifier('DISTINCT');
        $selector->where->notIn("formations.idformations",$selec);*/

        $records = $this->selectWith($selector);

        return $records;
    }
}
