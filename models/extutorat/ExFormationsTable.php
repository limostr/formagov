<?php
declare(strict_types = 1);
namespace Models\Extutorat;

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

    public function getTypeFormation($idtype){
        $selector = new \Zend\Db\Sql\Select ;
        $selector->from('typeformation');
        $selector->where(array("idtypeformation"=>$idtype));
         $result = $this->selectWith($selector);
        list($key,$val)=each($result);
print_r($val);
        return $val->labeltype;
    }

   public function getdetailsformation(&$formation,$id="",$idsingne="",$typedepere=""){



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

                 $niveau=array();

                 $niveau=$this->getNiveau($value['key']);

                 foreach ($niveau as $keyniv => $valniv){
                     $niv=array();
                     $niv["key"]= "NIV_".$valniv['idniveauformation'];
                     $niv["title"]= $valniv['labelnivformation'];
                     $niv["tooltip"]= $value['value'].'('.$valniv['labelnivformation'].')' ;

                     $semestres=$this->getPeriode($valniv['idlevelformation']);

                     foreach ($semestres as  $semestre){
                         $sem=array();
                         $sem["key"]= "SEM_".$semestre['idperiode']."_".$valniv['idlevelformation']."_".$valniv['idniveauformation'];
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
                 $formation[]=$formation1;
                 $formation1=array();
             }else{
                 $typeprincipale="";
                    if(!$value['pere']){
                      $typeprincipale=$value['idtypeformation']  ;
                    }
                 $this->getdetailsformation($formation ,$value['key'],"",$typeprincipale);
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
}
