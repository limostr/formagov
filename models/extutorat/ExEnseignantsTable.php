<?php
/**
 * Created by PhpStorm.
 * User: o.limam
 * Date: 10/04/2018
 * Time: 12:55
 */

declare(strict_types = 1);

namespace Models\ExTutorat;


use Zend\Db\TableGateway\AbstractTableGateway,
    Zend\Db\Adapter\Adapter,
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select,
    Models\Tutorat\Model\EnseignantsTable;



class ExEnseignantsTable extends  EnseignantsTable
{
    public function getEnseignant($where=array())
    {
        $selector = $this->getSql()->select();

        $selector->join("personnes", "personnes.idpersonnes=enseignants.idpersonnes");

        if(is_array($where) && count($where)>0){
            foreach ($where as $attrib => $constraint){
                $selector->where->literal("$attrib=?",$constraint);
            }
            $selector->getSqlString( $this->adapter->getPlatform());
            $result = $this->selectWith($selector);
            return $result;
        }else{
            return null;
        }
    }


    public function getAllDataEnseignant($where="")
    {
        $selector = $this->getSql()->select();

        $selector->join("personnes", "personnes.idpersonnes=enseignants.idpersonnes");
        $selector->join("infopersonne", "personnes.idpersonnes=infopersonne.idpersonnes",select::SQL_STAR,'left');

        if(is_array($where) && count($where)>0) {
            foreach ($where as $attrib => $constraint) {
                $selector->where->literal("$attrib=?", $constraint);
            }

            $selector->getSqlString( $this->adapter->getPlatform());
            $result = $this->selectWith($selector);
            $Enseignants =array();

            foreach ($result as $res){
                if(!isset($Enseignants[$res->cin])){
                    $Enseignants[$res->cin]=new \stdClass();
                }

                if($res->idlangue=='fr'){
                    $Enseignants[$res->cin]->_Nom_fr=$res->nom;
                    $Enseignants[$res->cin]->_Prenom_fr=$res->prenom;
                    $Enseignants[$res->cin]->_Ville_fr=$res->ville;
                    $Enseignants[$res->cin]->_Pays_fr=$res->pays;
                    $Enseignants[$res->cin]->_Adress_fr=$res->adress;
                    $Enseignants[$res->cin]->_Lieudenaissance_fr=$res->lieudenaissance;
                    if(!empty($res->autreinfo)){
                        $Enseignants[$res->cin]->_Autreinfo_fr=\Zend\Json\Decoder::decode($res->autreinfo);
                    }
                }else if($res->idlangue=='ar'){
                    $Enseignants[$res->cin]->_Nom_ar=$res->nom;
                    $Enseignants[$res->cin]->_Prenom_ar=$res->prenom;
                    $Enseignants[$res->cin]->_Ville_ar=$res->ville;
                    $Enseignants[$res->cin]->_Pays_ar=$res->pays;
                    $Enseignants[$res->cin]->_Adress_ar=$res->adress;
                    $Enseignants[$res->cin]->_Lieudenaissance_ar=$res->lieudenaissance;
                    if(!empty($res->autreinfo)){
                        $Enseignants[$res->cin]->_Autreinfo_ar=\Zend\Json\Decoder::decode($res->autreinfo);
                    }
                }
                $Enseignants[$res->cin]->_rib=$res->rib;
                $Enseignants[$res->cin]->_cin=$res->cin;
                $Enseignants[$res->cin]->_datelivrecin=$res->datelivrecin;
                $Enseignants[$res->cin]->_civilite=$res->civilite;

                if(!empty($res->telephone)){
                    $telephone = \Zend\Json\Decoder::decode($res->telephone);
                    $Enseignants[$res->cin]->_fix=isset($telephone['Fix']) ? $telephone['Fix'] : "";
                    $Enseignants[$res->cin]->_mobile=isset($telephone['Portable']) ? $telephone['Portable'] : "";
                }else{
                    $Enseignants[$res->cin]->_fix="";
                    $Enseignants[$res->cin]->_mobile="";
                }

                $Enseignants[$res->cin]->_codepostal=$res->codepostal;
                $Enseignants[$res->cin]->_email=$res->email;
                $Enseignants[$res->cin]->_datedenaissance=$res->datedenaissance;
                $Enseignants[$res->cin]->_matricule=$res->matricule;
                $Enseignants[$res->cin]->_typematricule=$res->typematricule;
                $Enseignants[$res->cin]->_datemotdepasse=$res->datemotdepasse;
             }

            return $Enseignants;
        }elseif(!empty($where)){

            $selector->where->literal("personnes.idpersonnes=?", $where);

             $selector->getSqlString( $this->adapter->getPlatform());
            $result = $this->selectWith($selector);

            $Enseignant =new \stdClass();
            foreach ($result as $res){


                if($res->idlangue=='fr'){
                    $Enseignant->_Nom_fr=$res->nom;
                    $Enseignant->_Prenom_fr=$res->prenom;
                    $Enseignant->_Ville_fr=$res->ville;
                    $Enseignant->_Pays_fr=$res->pays;
                    $Enseignant->_Adress_fr=$res->adress;
                    $Enseignant->_Lieudenaissance_fr=$res->lieudenaissance;
                    if(!empty($res->autreinfo)){
                        $Enseignant->_Autreinfo_fr=\Zend\Json\Decoder::decode($res->autreinfo);
                    }
                }else if($res->idlangue=='ar'){
                    $Enseignant->_Nom_ar=$res->nom;
                    $Enseignant->_Prenom_ar=$res->prenom;
                    $Enseignant->_Ville_ar=$res->ville;
                    $Enseignant->_Pays_ar=$res->pays;
                    $Enseignant->_Adress_ar=$res->adress;
                    $Enseignant->_Lieudenaissance_ar=$res->lieudenaissance;
                    if(!empty($res->autreinfo)){
                        $Enseignant->_Autreinfo_ar=\Zend\Json\Decoder::decode($res->autreinfo);
                    }
                }
                $Enseignant->_rib=$res->rib;
                $Enseignant->_cin=$res->cin;
                $Enseignant->_datelivrecin=$res->datelivrecin;
                $Enseignant->_civilite=$res->civilite;

                if(!empty($res->telephone)){
                    $telephone = \Zend\Json\Decoder::decode($res->telephone);
                    $Enseignant->_fix=isset($telephone->Fix) ? $telephone->Fix : "";
                    $Enseignant->_mobile=isset($telephone->Portable) ? $telephone->Portable : "";
                }else{
                    $Enseignant->_fix="";
                    $Enseignant->_mobile="";
                }

                $Enseignant->_email=$res->email;
                $Enseignant->_codepostal=$res->codepostal;
                $Enseignant->_datedenaissance=$res->datedenaissance;
                $Enseignant->_matricule=$res->matricule;
                $Enseignant->_typematricule=$res->typematricule;
                $Enseignant->_datemotdepasse=$res->datemotdepasse;

            }

            return $Enseignant;


        }
        return null;


    }


}