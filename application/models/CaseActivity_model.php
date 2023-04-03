<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class CaseActivity_model extends CI_Model {

   /*------------------Case Activity------------------------*/

function getCaseActivity($id) {
   $this->db->where("case_id",$id);
   $query = $this->db->get('vw_case_activity');
   return $query->result();
}

function getActivities(){
   $this->db->select('activity_id, activity_name');
   $this->db->from('activitys');
   $query = $this->db->get();
   return $query->result();
}

function getAdjorn_reasons(){
   $this->db->select('adjorn_reason_id, adjorn_reason_name');
   $this->db->from('adjorn_reasons');
   $query = $this->db->get();
   return $query->result();
}

function getActivity_reasults(){
   $this->db->select('activity_result_id, activity_result_name');
   $this->db->from('activity_results');
   $query = $this->db->get();
   return $query->result();
}

function getOrder_types(){
   $this->db->select('order_type_id, order_type_name');
   $this->db->from('order_types');
   $query = $this->db->get();
   return $query->result();
}

function getContact_types(){
   $this->db->select('contact_type_id, contact_type_name');
   $this->db->from('contact_types');
   $query = $this->db->get();
   return $query->result();
}

function caseActivityCount($searchText = ''){
   $this->db->select('*');
   $this->db->from('vw_case_activity');
   if(!empty($searchText)) {
      $likeCriteria = "(activity_name  LIKE '%".$searchText."%'
                      OR  activity_title  LIKE '%".$searchText."%')";
      $this->db->where($likeCriteria);
   }
   $query = $this->db->get();
   return count($query->result());
}



function addNewCaseActivity($data){
   $this->db->trans_start();
   $this->db->insert('case_activity', $data);
   $insert_id = $this->db->insert_id();
   $this->db->trans_complete();
   return $insert_id;
}

function update_caseActivity($id,$data){
   $this->db->where('case_activity_id', $id);
   $this->db->update('case_activity', $data);
}

function delete_caseActivity($id){
   $query = $this->db->query('delete FROM case_activity where case_activity_id ='.$id.'');
   if($query) {
     return true;
   }
}

 /*------------------Case Activity contacts------------------------*/

function addCaseContact($data) {
   $query=$this->db->insert('case_contacts', $data);
   if($query){
      return true;
   }else {
      return false;
   }
}

function getCaseContacts($id) {
   $this->db->where("case_id",$id);
   $query = $this->db->get('vw_case_contacts');
   return $query->result();
}
/*------------------Case Receipt TYpes------------------------*/
function getCaseReceipt($id) {
   $this->db->where("case_id",$id);
   $query = $this->db->get('receipts');
   return $query->result();
}

function getReceipt_types(){
    $query = $this->db->get('receipt_types');
    return $query->result();
}

function add_caseReceipt($data) {
   $query=$this->db->insert('receipts', $data);
   if($query){
      return true;
   }else {
      return false;
   }
}


}
