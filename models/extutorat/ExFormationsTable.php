<?php
declare(strict_types = 1);

namespace Models\ExTutorat;
use
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select,
    Models\Tutorat\Model\FormationsTable;


class ExFormationsTable extends FormationsTable
{
   public function getThisFormation($idformation="",$roles=false,$idsingle=""){
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

    /****
     * @param $idformation
     * @param string $idcompteuser
     * @return null|\Zend\Db\ResultSet\ResultSetInterface
     *
     */

    public function getNiveau($idformation,$idcompteuser=""){

        // echo $idcompteuser;
        $selector = new \Zend\Db\Sql\Select ;
        $selector->from('niveauformation');

        $selector->where(array("idformations"=>$idformation));
        if(!empty($idcompteuser)){
            $selector->where(" idniveauformation IN ( SELECT idniveauformation FROM responsableformation WHERE idcompteuser=$idcompteuser)");
        }

        $record = $this->selectWith($selector);

        return $record;

    }
    public function getPeriode($idlevel){
        $selector = new \Zend\Db\Sql\Select ;
        $selector->from('levelformation');
        $selector->join("periode","periode.idlevelformation=levelformation.idlevelformation");
        $selector->where(array("levelformation.idlevelformation"=>$idlevel));
        $result = $this->selectWith($selector);
        return $result;
    }

    public function getPeriodeSemestre($idlevel,$idniveauformation){
        $selector = new \Zend\Db\Sql\Select ;
        $selector->from('levelformation');
        $selector->join("periode","periode.idlevelformation=levelformation.idlevelformation");
        $selector->where->literal("levelformation.idlevelformation=?",$idlevel);
        $selector->join('periodeformation',"periodeformation.idperiode=periode.idperiode",select::SQL_STAR,'left')->where("idniveauformation='$idniveauformation'");

        $selector->where("idsousperiode IS NULL");
        $result = $this->selectWith($selector);
        return $result;
    }

    public function getDetailsPeriode($subPeriode,$idniveauformation){
        $selector = new \Zend\Db\Sql\Select ;
        $selector->from('periode');
        $selector->where->literal("idsousperiode=?",$subPeriode);
        $selector->join('periodeformation',"periodeformation.idperiode=periode.idperiode",select::SQL_STAR,'left')->where("idniveauformation='$idniveauformation'");
         $result = $this->selectWith($selector);
        return $result;
    }

    public function getTypeFormation($idtype){
        $selector = new \Zend\Db\Sql\Select ;
        $selector->from('typeformation');
        $selector->where(array("idtypeformation"=>$idtype));

        $result = $this->executeSelect($selector);
        $rec=$result->current();
        if($rec){

            return $rec->labeltype;
        }else{
            return "";
        }

    }

   public function getdetailsformation(&$formation,$id="",$idsingne="",$typedepere="",&$Parent=array()){

       if(empty($id)){

           $listeformation=$this->getThisFormation("",true,$idsingne);

         }else{
             $listeformation=$this->getThisFormation($id,true,$idsingne);
         }

         foreach ($listeformation as $key => $value){
             $tmplist=$this->getThisFormation($value['key']);
             if(empty($id)){
                 $index=$value['key'];
             }
             if ($tmplist->count()==0){
                 $formation1=array();
                 $formation1["key"]= $value['key'];
                 $formation1["title"]= $value['abrev'];
                 $formation1["tooltip"]= $value['value'];
                 $formation1["type"]= $value['idtypeformation'];
                 $formation1["labeltype"]=$this->getTypeFormation($value['idtypeformation']);
                 $formation1['typepere']=$typedepere;
                 $formation1["folder"]= "true";

                 $Parent[$value['idtypeformation']]=array('type'=>$this->getTypeFormation($value['idtypeformation']),'label'=>$value['value']);
                 $formation1["description"]= $Parent;


                 $niveau=array();

                 $niveau=$this->getNiveau($value['key']);

                 foreach ($niveau as $keyniv => $valniv){
                     $niv=array();
                     $niv["key"]= "NIV_".$valniv['idniveauformation']."_".$value['key'];
                     $niv["title"]= $valniv['labelnivformation'];
                     $niv["tooltip"]= $value['value'].'('.$valniv['labelnivformation'].')' ;

                     $semestres=$this->getPeriode($valniv['idlevelformation']);

                     foreach ($semestres as  $semestre){
                         $sem=array();
                         $sem["key"]= "SEM_".$semestre['idperiode']."_".$valniv['idlevelformation']."_".$valniv['idniveauformation']."_".$value['key'];
                         $sem["title"]= $semestre['labelperiode'];
                         $sem["tooltip"]= $semestre['labelperiode'];
                         $niv['semestre'][]=$sem;
                     }
                     if(isset($niv['children']) && count($niv['children'])>0){
                         $niv["folder"]= "true";
                     }else{
                         $niv["folder"]= "false";
                     }

                     $formation1['niveau'][]=$niv;
                 }
                 $formation[$typedepere][]=$formation1;
                 $formation1=array();
             }else{

                    if(empty($value['pere'])){
                        $typedepere=$value['value']  ;
                        $Parent=array();
                    }
                 $Parent[$value['idtypeformation']]=array('type'=>$this->getTypeFormation($value['idtypeformation']),'label'=>$value['value']);

                 $this->getdetailsformation($formation ,$value['key'],"",$typedepere,$Parent);
             }
         }
   }



    public function getAllInfoFormation(&$formation,$id="",$idsingne="",$typedepere="",&$Parent=array()){

        if(empty($id)){

            $listeformation=$this->getThisFormation("",true,$idsingne);

        }else{
            $listeformation=$this->getThisFormation($id,true,$idsingne);
        }

        foreach ($listeformation as $key => $value){
            $tmplist=$this->getThisFormation($value['key']);
            if(empty($id)){
                $index=$value['key'];
            }
            if ($tmplist->count()==0){
                $formation1=array();
                $formation1["key"]= $value['key'];
                $formation1["title"]= $value['abrev'];
                $formation1["tooltip"]= $value['value'];
                $formation1["type"]= $value['idtypeformation'];
                $formation1["labeltype"]=$this->getTypeFormation($value['idtypeformation']);
                $formation1['typepere']=$typedepere;
                $formation1["folder"]= "true";
                $formation1["rowspan"]=1;
                $Parent[$value['idtypeformation']]=array('type'=>$this->getTypeFormation($value['idtypeformation']),'label'=>$value['value']);
                $formation1["description"]= $Parent;


                $niveau=array();

                $niveau=$this->getNiveau($value['key']);

                foreach ($niveau as $keyniv => $valniv){
                    $formation1["rowspan"]++;

                    $niv=array();
                    $niv["key"]= "NIV_".$valniv['idniveauformation']."_".$value['key'];
                    $niv["title"]= $valniv['labelnivformation'];
                    $niv["tooltip"]= $value['value'].'('.$valniv['labelnivformation'].')' ;
                    $niv["rowspan"]=1;
                    $semestres=$this->getPeriodeSemestre($valniv['idlevelformation'],$valniv['idniveauformation']);

                    foreach ($semestres as  $semestre){
                        $formation1["rowspan"]++;
                        $niv["rowspan"]++;
                        $sem=array();
                        $sem["key"]= "SEM_".$semestre['idperiodeformation']."_".$semestre['idperiode']."_".$valniv['idlevelformation']."_".$valniv['idniveauformation']."_".$value['key'];
                        $sem["title"]= $semestre['labelperiode'];
                        $sem["tooltip"]= $semestre['labelperiode'];
                        $sem["debut"] = $semestre['debutperiode'];
                        $sem["fin"] = $semestre['finperiode'];
                        $sem["rowspan"]=1;
                        $periodedetail = $this->getDetailsPeriode($semestre['idperiode'],$valniv['idniveauformation']);

                        foreach ($periodedetail as  $prd) {
                            $formation1["rowspan"]++;
                            $sem["rowspan"]++;
                            $niv["rowspan"]++;
                            $p = array();
                            $p["key"] = "PRD_" . $prd['idperiodeformation']."_".$prd['idperiode'] . "_". $semestre['idperiode'] . "_" . $valniv['idlevelformation'] . "_" . $valniv['idniveauformation'] . "_" . $value['key'];
                            $p["title"] = $prd['labelperiode'];
                            $p["tooltip"] = $prd['labelperiode'];
                            $p["debut"] = $prd['debutperiode'];
                            $p["fin"] = $prd['finperiode'];
                            $sem['periode'][] = $p;

                        }
                        if(isset($sem['periode']) && count($sem['periode'])>0) {
                            $sem["folder"] = "true";
                        }
                        $niv['semestre'][]=$sem;
                    }
                    if(isset($niv['semestre']) && count($niv['semestre'])>0){
                        $niv["folder"]= "true";
                    }else{
                        $niv["folder"]= "false";
                    }

                    $formation1['niveau'][]=$niv;
                }
                $formation[$typedepere][]=$formation1;
                $formation1=array();
            }else{

                if(empty($value['pere'])){
                    $typedepere=$value['value']  ;
                    $Parent=array();
                }
                $Parent[$value['idtypeformation']]=array('type'=>$this->getTypeFormation($value['idtypeformation']),'label'=>$value['value']);
//echo "<pre>";print_r($formation);echo "</pre>";
                $this->getAllInfoFormation($formation ,$value['key'],"",$typedepere,$Parent);
            }
        }
    }



   public function getformation($idpere=NULL){
       $selector= $this->getSql()->select();
       $selector->join("typeformation","typeformation.idtypeformation=formations.idtypeformation");
        if(!empty($idpere)){
            $selector->where("idpereformations=$idpere" );
        }else{
            $selector->where("idpereformations IS NULL" );
        }
       $listformation = $this->selectWith($selector);
        return $listformation;
   }

    public function getTypediplome($id,&$diplome=array(),&$gpere=array())
    {
        $selector= $this->getSql()->select();
        $selector->where("idformations='$id'");
        $formation=$this->selectWith($selector);
        if($formation){
            if(!empty($formation->idperformations)){
                $selector= $this->getSql()->select();
                $selector->where("idformations='$id'");
                $formation2=$this->fetchRow("idformations='$id'");
                if($formation2){
                    $this->getTypediplome($formation2->idperformations,$diplome,$gpere);
                    $diplome[]=$formation2->toArray();
                }else{
                    return false;
                }
            }else{
                if(empty($gpere)){
                    $tmp=$formation->toArray() ;
                    $diplome[]=$tmp;
                    $gpere=$tmp;
                    return $gpere;
                }

            }
        }else{

            return false;
        }

    }

    public function getDiplomeDetails($id,&$diplome=array() ){
        $selector= $this->getSql()->select();
        $selector->where("idformations='$id'");

        $result = $this->executeSelect($selector);
        $formation=$result->current();

         if($formation){
            if(isset($formation->idpereformations) && !empty($formation->idpereformations)){
                $selector= $this->getSql()->select();
                $selector->where("idformations='".$formation->idpereformations."'");
                 $result = $this->executeSelect($selector);
                $formation2=$result->current();
                 if(isset($formation2->idpereformations) && !empty($formation2->idpereformations)){
                    $this->getDiplomeDetails($formation2->idpereformations,$diplome);
                 }
                     $diplome[]=array(
                         'idformations'=>$formation2->idformations
                         ,'idpereformations'=>$formation2->idpereformations
                         ,'idtypeformation'=>$this->getTypeFormation($formation2->idtypeformation)
                         ,'codeformation'=>$formation2->codeformation
                         ,'abrev'=>$formation2->abrev
                         ,'Label'=>$formation2->Label
                         ,'Labelar'=>$formation2->Labelar
                         ,'description'=>$formation2->description
                         ,'codeformationuvt'=>$formation2->codeformationuvt
                         ,'codeformationmis'=>$formation2->codeformationmis
                         ,'siteweb'=>$formation2->siteweb
                         ,'niveau'=>$formation2->niveau
                         ,'modeformation'=>$formation2->modeformation
                         ,'prixdeniveau'=>$formation2->prixdeniveau
                         ,'idprojethabilitation'=>$formation2->idprojethabilitation
                     )  ;

            }else{
                return false;
            }
        }
        $diplome[]=array(
            'idformations'=>$formation->idformations
            ,'idpereformations'=>$formation->idpereformations
            ,'idtypeformation'=>$this->getTypeFormation($formation->idtypeformation)
            ,'codeformation'=>$formation->codeformation
            ,'abrev'=>$formation->abrev
            ,'Label'=>$formation->Label
             ,'Labelar'=>$formation->Labelar
             ,'description'=>$formation->description
             ,'codeformationuvt'=>$formation->codeformationuvt
             ,'codeformationmis'=>$formation->codeformationmis
             ,'siteweb'=>$formation->siteweb
             ,'niveau'=>$formation->niveau
             ,'modeformation'=>$formation->modeformation
             ,'prixdeniveau'=>$formation->prixdeniveau
             ,'idprojethabilitation'=>$formation->idprojethabilitation
        );
    }
}
