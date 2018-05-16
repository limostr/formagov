<?php
/**
 * Created by PhpStorm.
 * User: o.limam
 * Date: 24/04/2018
 * Time: 10:44
 */

namespace Models\ExTutorat;


use Models\Tutorat\Model\NvittutoratueTable;

class ExNvittutoratueTable extends NvittutoratueTable
{
    public function getInvitationECUE($idinvitations,$idModule){

        $selector= $this->getSql()->select();

        $selector->join('invitations','nvittutoratue.idinvitations=invitations.idinvitations');
        $selector->where->literal("invitations.idinvitations=?",$idinvitations );
        $selector->where->literal('idModule=?',$idModule);

        $selector->getSqlString( $this->adapter->getPlatform());
        $result = $this->selectWith($selector);
        if($result->count()>0){
            return $result->current();
        }else{
            return null;
        }

    }
}