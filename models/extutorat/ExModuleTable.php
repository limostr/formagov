<?php

declare(strict_types = 1);
namespace Models\ExTutorat;

use Models\Tutorat\Model\ModuleTable;
use Zend\Db\Sql\Predicate\PredicateSet;
use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select;


class ExModuleTable extends ModuleTable
{

    public function getECUE($idFormation="",$idperiode="",$idue="",$idniveau="",$type="ECUE"){
        $selector= $this->getSql()->select();

        $selector->join("typemodule","typemodule.idtypemodule=module.idtypemodule");
        $selector->join("nature","nature.idnature=module.idnature");
        $selector->join("regime","regime.idregime=module.idregime");

        $selector->join("niveauformation","niveauformation.idniveauformation=module.idniveauformation");
        $selector->join("periode","periode.idperiode=module.idperiode");
        $selector->join("levelformation","periode.idlevelformation=levelformation.idlevelformation");
        if(empty($idperiode) && empty($idue)){
            $selector->where("idformations=$idFormation");

        }elseif(!empty($idue)){
            $selector->where("idue=$idue OR idModule=$idue");

        }else{
            if(!empty($idFormation)){
                $selector->where("idformations=$idFormation");
            }
            if(!empty($idniveau)){
                $selector->where("niveauformation.idniveauformation='$idniveau'");

            }
            if(!empty($type)){
                $selector->where("module.idtypemodule='$type'");

            }
            $selector->where("(module.idperiode= '$idperiode' OR idsousperiode= '$idperiode')");
        }

        //$selector->columns(array("idModule"=>new \Zend\DB\));
        $selector->quantifier('DISTINCT');

        $result = $this->selectWith($selector);
         return $result;

    }
    public function getModules($idFormation="",$idperiode="",$idue="",$idniveau="",$type=""){
        $selector= $this->getSql()->select();

        $selector->join("typemodule","typemodule.idtypemodule=module.idtypemodule");
        $selector->join("nature","nature.idnature=module.idnature");
        $selector->join("regime","regime.idregime=module.idregime");

        $selector->join("niveauformation","niveauformation.idniveauformation=module.idniveauformation");
        $selector->join("periode","periode.idperiode=module.idperiode");
        $selector->join("levelformation","periode.idlevelformation=levelformation.idlevelformation");
        if(empty($idperiode) && empty($idue)){
            $selector->where("idformations=$idFormation");

        }elseif(!empty($idue)){
            $selector->where("idue=$idue OR idModule=$idue");

        }else{
            if(!empty($idFormation)){
                $selector->where("idformations=$idFormation");
            }
            if(!empty($idniveau)){
                $selector->where("niveauformation.idniveauformation='$idniveau'");

            }
            if(!empty($type)){
                $selector->where("module.idtypemodule='$type'");

            }
            $selector->where("(module.idperiode= '$idperiode' OR idsousperiode= '$idperiode')");



        }

        //$selector->columns(array("idModule"=>new \Zend\DB\));
        $selector->quantifier('DISTINCT');

         $result = $this->selectWith($selector);
         $data=array();
        foreach ($result as $m){
            if(!isset($data[$m->idperiode])){
                  $data[$m->idperiode]=array(
                        'periode'=>$m->labelperiode
                        ,'level'=>$m->labellevel
                    );
            }

                if($m->idTypemodule=='UE'){
                    if(!isset($data[$m->idperiode]['UE'][$m->idModule]['info'])) {
                        $data[$m->idperiode]['UE'][$m->idModule]['info'] = array(
                            'idModule' => $m->idModule
                            , 'idue' => $m->idue
                            , 'idTypemodule' => $m->idTypemodule
                            , 'idniveauformation' => $m->idniveauformation
                            , 'idperiode' => $m->idperiode
                            , 'idRegime' => $m->idRegime
                            , 'idNature' => $m->idNature
                            , 'coefficient' => $m->coefficient
                            , 'credit' => $m->credit
                            , 'Nombredesemaine' => $m->Nombredesemaine
                            , 'codeue' => $m->codeue
                            , 'titremodule' => $m->titremodule
                            , 'noteeleminatoire' => $m->noteeleminatoire
                            , 'descriptionecue' => $m->descriptionecue
                            , 'nbrscience' => $m->nbrscience
                            , 'nbroption' => $m->nbroption
                            , 'resumer' => $m->resumer
                            , 'codemes' => $m->codemes
                            , 'codemoodle' => $m->codemoodle
                        );
                    }
                }else{
                    if(!isset($data[$m->idperiode]['UE'][$m->idue]['ECUE'][$m->idModule])) {
                        $data[$m->idperiode]['UE'][$m->idue]['ECUE'][$m->idModule] = array(
                            'idModule' => $m->idModule
                            , 'idue' => $m->idue
                            , 'idTypemodule' => $m->idTypemodule
                            , 'idniveauformation' => $m->idniveauformation
                            , 'idperiode' => $m->idperiode
                            , 'idRegime' => $m->idRegime
                            , 'idNature' => $m->idNature
                            , 'coefficient' => $m->coefficient
                            , 'credit' => $m->credit
                            , 'Nombredesemaine' => $m->Nombredesemaine
                            , 'codeue' => $m->codeue
                            , 'titremodule' => $m->titremodule
                            , 'noteeleminatoire' => $m->noteeleminatoire
                            , 'descriptionecue' => $m->descriptionecue
                            , 'nbrscience' => $m->nbrscience
                            , 'nbroption' => $m->nbroption
                            , 'resumer' => $m->resumer
                            , 'codemes' => $m->codemes
                            , 'codemoodle' => $m->codemoodle
                        );
                    }
                }


        }

          return $data;
    }

    public function getModulesInfo($listECUE)
    {
        $selector = $this->getSql()->select();

        $selector->join("typemodule", "typemodule.idtypemodule=module.idtypemodule");
        $selector->join("nature", "nature.idnature=module.idnature");
        $selector->join("regime", "regime.idregime=module.idregime");


        $selector->join("niveauformation", "niveauformation.idniveauformation=module.idniveauformation");
        $selector->join("periode", "periode.idperiode=module.idperiode");
        $selector->join("levelformation", "periode.idlevelformation=levelformation.idlevelformation");
        $selector->where->in('idModule',$listECUE);
          $selector->getSqlString( $this->adapter->getPlatform());

        $result = $this->selectWith($selector);
        $data=array();
        foreach ($result as $m){


            if(!isset($data[$m->idformations]['count'])){
                $data[$m->idformations]['count']=1;
            }


              if(!isset($data[$m->idformations]['niveau'][$m->idniveauformation])
                ||
                !isset($data[$m->idformations]['niveau'][$m->idniveauformation]['periode'][$m->idperiode])
                ||
                !isset($data[$m->idformations]['niveau'][$m->idniveauformation]['periode'][$m->idperiode]['modules'][$m->idModule]))
              {
                  $data[$m->idformations]['count']++;
              }



            if(!isset($data[$m->idformations]['niveau'][$m->idniveauformation]['count'])){
                $data[$m->idformations]['niveau'][$m->idniveauformation]['count']=1;
            }

            if(!isset($data[$m->idformations]['niveau'][$m->idniveauformation]['periode'][$m->idperiode])
            ||
            !isset($data[$m->idformations]['niveau'][$m->idniveauformation]['periode'][$m->idperiode]['modules'][$m->idModule])){
                $data[$m->idformations]['niveau'][$m->idniveauformation]['count']++;
                $data[$m->idformations]['count']++;
            }

            if(!isset($data[$m->idformations]['niveau'][$m->idniveauformation]['periode'][$m->idperiode]['count'])){
                $data[$m->idformations]['niveau'][$m->idniveauformation]['periode'][$m->idperiode]['count']=1;
            }

            if(!isset($data[$m->idformations]['niveau'][$m->idniveauformation]['periode'][$m->idperiode]['modules'][$m->idModule])){

                $data[$m->idformations]['count']++;

                $data[$m->idformations]['niveau'][$m->idniveauformation]['count']++;

                $data[$m->idformations]['niveau'][$m->idniveauformation]['periode'][$m->idperiode]['count']++;

            }


            $data[$m->idformations]['niveau'][$m->idniveauformation]['label']=$m->labelnivformation;
            $data[$m->idformations]['niveau'][$m->idniveauformation]['periode'][$m->idperiode]['label']=$m->labelperiode;
            $data[$m->idformations]['niveau'][$m->idniveauformation]['periode'][$m->idperiode]['modules'][$m->idModule]=array(
                'idModule' => $m->idModule
                , 'idue' => $m->idue
                , 'idTypemodule' => $m->idTypemodule
                , 'idniveauformation' => $m->idniveauformation
                , 'idperiode' => $m->idperiode
                , 'idRegime' => $m->idRegime
                , 'idNature' => $m->idNature
                , 'coefficient' => $m->coefficient
                , 'credit' => $m->credit
                , 'Nombredesemaine' => $m->Nombredesemaine
                , 'codeue' => $m->codeue
                , 'titremodule' => $m->titremodule
                , 'noteeleminatoire' => $m->noteeleminatoire
                , 'descriptionecue' => $m->descriptionecue
                , 'nbrscience' => $m->nbrscience
                , 'nbroption' => $m->nbroption
                , 'resumer' => $m->resumer
                , 'codemes' => $m->codemes
                , 'codemoodle' => $m->codemoodle
            );




        }
        return $data;

    }
    public function getModulesInfoInvite($idInivitation)
    {
        $selector = $this->getSql()->select();

        $selector->join("nvittutoratue", "nvittutoratue.idModule=module.idModule");

        $selector->join("typemodule", "typemodule.idtypemodule=module.idtypemodule");
        $selector->join("nature", "nature.idnature=module.idnature");
        $selector->join("regime", "regime.idregime=module.idregime");


        $selector->join("niveauformation", "niveauformation.idniveauformation=module.idniveauformation");
        $selector->join("periode", "periode.idperiode=module.idperiode");
        $selector->join("levelformation", "periode.idlevelformation=levelformation.idlevelformation");
        $selector->where->literal("idinvitations=?",$idInivitation);
        $selector->getSqlString( $this->adapter->getPlatform());

        $result = $this->selectWith($selector);
        $data=array();
        foreach ($result as $m){


            if(!isset($data[$m->idformations]['count'])){
                $data[$m->idformations]['count']=1;
            }


            if(!isset($data[$m->idformations]['niveau'][$m->idniveauformation])
                ||
                !isset($data[$m->idformations]['niveau'][$m->idniveauformation]['periode'][$m->idperiode])
                ||
                !isset($data[$m->idformations]['niveau'][$m->idniveauformation]['periode'][$m->idperiode]['modules'][$m->idModule]))
            {
                $data[$m->idformations]['count']++;
            }



            if(!isset($data[$m->idformations]['niveau'][$m->idniveauformation]['count'])){
                $data[$m->idformations]['niveau'][$m->idniveauformation]['count']=1;
            }

            if(!isset($data[$m->idformations]['niveau'][$m->idniveauformation]['periode'][$m->idperiode])
                ||
                !isset($data[$m->idformations]['niveau'][$m->idniveauformation]['periode'][$m->idperiode]['modules'][$m->idModule])){
                $data[$m->idformations]['niveau'][$m->idniveauformation]['count']++;
                $data[$m->idformations]['count']++;
            }

            if(!isset($data[$m->idformations]['niveau'][$m->idniveauformation]['periode'][$m->idperiode]['count'])){
                $data[$m->idformations]['niveau'][$m->idniveauformation]['periode'][$m->idperiode]['count']=1;
            }

            if(!isset($data[$m->idformations]['niveau'][$m->idniveauformation]['periode'][$m->idperiode]['modules'][$m->idModule])){

                $data[$m->idformations]['count']++;

                $data[$m->idformations]['niveau'][$m->idniveauformation]['count']++;

                $data[$m->idformations]['niveau'][$m->idniveauformation]['periode'][$m->idperiode]['count']++;

            }


            $data[$m->idformations]['niveau'][$m->idniveauformation]['label']=$m->labelnivformation;
            $data[$m->idformations]['niveau'][$m->idniveauformation]['periode'][$m->idperiode]['label']=$m->labelperiode;
            $data[$m->idformations]['niveau'][$m->idniveauformation]['periode'][$m->idperiode]['modules'][$m->idModule]=array(
                'idModule' => $m->idModule
                , 'idue' => $m->idue
                , 'idTypemodule' => $m->idTypemodule
                , 'idniveauformation' => $m->idniveauformation
                , 'idperiode' => $m->idperiode
                , 'idRegime' => $m->idRegime
                , 'idNature' => $m->idNature
                , 'coefficient' => $m->coefficient
                , 'credit' => $m->credit
                , 'Nombredesemaine' => $m->Nombredesemaine
                , 'codeue' => $m->codeue
                , 'titremodule' => $m->titremodule
                , 'noteeleminatoire' => $m->noteeleminatoire
                , 'descriptionecue' => $m->descriptionecue
                , 'nbrscience' => $m->nbrscience
                , 'nbroption' => $m->nbroption
                , 'resumer' => $m->resumer
                , 'codemes' => $m->codemes
                , 'codemoodle' => $m->codemoodle
            );




        }
        return $data;

    }

    public function getUE_ECUE($idecu,&$ue=array()){
        $selector= $this->getSql()->select();

        $selector->join("typemodule","typemodule.idtypemodule=module.idtypemodule");
        $selector->join("nature","nature.idnature=module.idnature");
        $selector->join("regime","regime.idregime=module.idregime");

        $selector->join("niveauformation","niveauformation.idniveauformation=module.idniveauformation");
        $selector->join("periode","periode.idperiode=module.idperiode");
        $selector->join("levelformation","periode.idlevelformation=levelformation.idlevelformation");

        if(!empty($idecu)){
            $selector->where("idModule=$idecu");
        }
         $result = $this->selectWith($selector);
        $ecu=array();
        foreach ($result as $m){

            $module=array(
                    'idModule' => $m->idModule
                    , 'idue' => $m->idue
                    , 'idTypemodule' => $m->idTypemodule
                    , 'idniveauformation' => $m->idniveauformation
                    , 'idformations' => $m->idformations
                    , 'idperiode' => $m->idperiode
                    , 'idRegime' => $m->idRegime
                    , 'idNature' => $m->idNature
                    , 'coefficient' => $m->coefficient
                    , 'credit' => $m->credit
                    , 'Nombredesemaine' => $m->Nombredesemaine
                    , 'codeue' => $m->codeue
                    , 'titremodule' => $m->titremodule
                    , 'noteeleminatoire' => $m->noteeleminatoire
                    , 'descriptionecue' => $m->descriptionecue
                    , 'nbrscience' => $m->nbrscience
                    , 'nbroption' => $m->nbroption
                    , 'resumer' => $m->resumer
                    , 'codemes' => $m->codemes
                    , 'codemoodle' => $m->codemoodle
                    , 'LabelNiveau' => $m->labelnivformation
                );

            if(!isset($ue['ecue'])){
                $ue['ecue']=$module;
            }else{
                $ue['ue']=$module;
            }
            if(!empty($m->idue)){
                $this->getUE_ECUE($m->idue,$ue);

            }
        }

    }
}