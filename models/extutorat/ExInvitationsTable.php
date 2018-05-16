<?php
 
//		$id=$row->idinvitations;



namespace Models\ExTutorat;
use
    Zend\Db\ResultSet\ResultSet,
    Zend\Db\Sql\Select,
    Models\Tutorat\Model\InvitationsTable;

class ExInvitationsTable extends InvitationsTable
{


    public function getInvitation($email,$listECUE,$annee){
        //$platform = $this->getAdapter()->getPlatform();
        $selector= $this->getSql()->select();
        $selector->join('nvittutoratue','nvittutoratue.idinvitations=invitations.idinvitations');
        $selector->where->literal("email=?",$email );
        $selector->where->literal("idanneeuniv= ?",$annee );
        $selector->where ("typeinvitation= 'Tutorat'" );
        $selector->where->in('idModule',$listECUE);
        $selector->getSqlString( $this->adapter->getPlatform());
        $result = $this->selectWith($selector);
        return $result;
    }

    public function getInvitationCoordination($email,$annee,$formation){

        $selector= $this->getSql()->select();
        $selector->where->literal("email=?",$email );
        $selector->where->literal("idanneeuniv= ?",$annee );
        $selector->where ("typeinvitation= 'Coordination'" );

        $selector->where->like('infosuplimentaire',"%$formation%");
        echo $selector->getSqlString( $this->adapter->getPlatform());
        $result = $this->selectWith($selector);
        return $result;
    }



    public function getInvitationWithCode($CodeInvitation){
        //$platform = $this->getAdapter()->getPlatform();
        $selector= $this->getSql()->select();
        $selector->join('nvittutoratue','nvittutoratue.idinvitations=invitations.idinvitations');
        $selector->where->literal("codeinvitation=?",$CodeInvitation );

        $selector->getSqlString( $this->adapter->getPlatform());
        $result = $this->selectWith($selector);
        return $result;
    }
}
