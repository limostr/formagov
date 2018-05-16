<?php
/**
 * Created by PhpStorm.
 * User: o.limam
 * Date: 20/04/2018
 * Time: 10:19
 */

namespace Models\ExTutorat;
use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select,
    Models\Tutorat\Model\EnseignantsmoduleTable;

class ExEnseignantsmoduleTable extends EnseignantsmoduleTable
{

    public function getMesTutorat($idpersonne,$idannee){
        $selector = $this->getSql()->select();

        $selector->join("module","enseignantsmodule.idModule=module.idModule");
        $selector->join("typemodule","typemodule.idtypemodule=module.idtypemodule");
        $selector->join("nature","nature.idnature=module.idnature");
        $selector->join("regime","regime.idregime=module.idregime");

        $selector->join("niveauformation","niveauformation.idniveauformation=module.idniveauformation");
        $selector->join("formations","niveauformation.idformations=formations.idformations");

        $selector->join("periode","periode.idperiode=module.idperiode");
        $selector->join("levelformation","periode.idlevelformation=levelformation.idlevelformation");


        $selector->where->literal("idanneeuniv=?",$idannee);
        $selector->where->literal("idpersonnes=?",$idpersonne);
        // $selector->where->literal("idperiode=?",$idperiode);

        // $selector->where("idlangue='fr'");

        $result = $this->selectWith($selector);
        if($result->count()>0){
            return $result;
        }else{
            return null;
        }
    }

    public function isTuteurInTheSamePeriode($idpersonne,$idannee,$idperiode,$idModule){
        $selector = $this->getSql()->select();

        $selector->where->literal("idModule <> ?",$idModule);
        $selector->where->literal("idanneeuniv=?",$idannee);
        $selector->where->literal("idpersonnes=?",$idpersonne);
       // $selector->where->literal("idperiode=?",$idperiode);

       // $selector->where("idlangue='fr'");

        $result = $this->selectWith($selector);
        if($result->count()>0){
            return $result;
        }else{
            return null;
        }
    }

    public function getTuteur($idModule,$idanneeuniv)
    {
        $selector = $this->getSql()->select();


        $selector->join("enseignants", "enseignantsmodule.idpersonnes=enseignants.idpersonnes");
        $selector->join("personnes", "enseignants.idpersonnes=personnes.idpersonnes");
        $selector->join("infopersonne", "infopersonne.idpersonnes=personnes.idpersonnes");


        $selector->where->literal("idModule=?",$idModule);
        $selector->where->literal("idanneeuniv=?",$idanneeuniv);
        $selector->where("idlangue='fr'");

              $result = $this->selectWith($selector);
        if($result->count()>0){
            return $result;
        }else{
            return null;
        }
    }
    public function isTutorForModule($idModule,$idanneeuniv,$idenseignant){
        $selector = $this->getSql()->select();



        $selector->where->literal("idpersonnes=?",$idenseignant);
        $selector->where->literal("idanneeuniv=?",$idanneeuniv);
        $selector->where->literal("idModule=?",$idModule);



        $result = $this->selectWith($selector);
        if($result->count()>0){
            return $result->count();
        }else{
            return null;
        }
    }
    public function NombreTutorat($idanneeuniv,$idenseignant){
        $selector = $this->getSql()->select();



        $selector->where->literal("idpersonnes=?",$idenseignant);
        $selector->where->literal("idanneeuniv=?",$idanneeuniv);




        $result = $this->selectWith($selector);
        if($result->count()>0){
            return $result->count();
        }else{
            return null;
        }
    }
}