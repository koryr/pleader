<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class CaseType_model extends CI_Model{

   function caseTypeCount($searchText = ''){
      $this->db->select('*');
      $this->db->from('case_types');
      if(!empty($searchText)) {
         $likeCriteria = "(case_type_name  LIKE '%".$searchText."%')";
         $this->db->where($likeCriteria);
      }
      $query = $this->db->get();
      return count($query->result());
   }

   function caseTypeList($searchText = '', $page, $segment){
      $this->db->select('*');
      $this->db->from('case_types');
      if(!empty($searchText)) {
         $likeCriteria = "(case_type_name  LIKE '%".$searchText."%')";
         $this->db->where($likeCriteria);
      }
      $this->db->limit($page, $segment);
      $query = $this->db->get();
      $result = $query->result();
      return $result;
   }

   function addNewCaseType($caseTypeInfo){
      $this->db->trans_start();
      $this->db->insert('case_types', $caseTypeInfo);
      $insert_id = $this->db->insert_id();
      $this->db->trans_complete();
      return $insert_id;
   }
}
