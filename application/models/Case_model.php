<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Case_model extends CI_Model{

   function casesCount($searchText = ''){
      $this->db->select('*');
      $this->db->from('vw_cases');
      if(!empty($searchText)) {
         $likeCriteria = "(case_number  LIKE '%".$searchText."%'
                         OR  case_title  LIKE '%".$searchText."%')";
         $this->db->where($likeCriteria);
      }
      $query = $this->db->get();
      return count($query->result());
   }

   function case_count($searchText = ''){
      $this->db->select('*');
      $this->db->from('vw_cases');
      if(!empty($searchText)) {
         $likeCriteria = "(case_number  LIKE '%".$searchText."%'
                         OR  case_title  LIKE '%".$searchText."%')";
         $this->db->where($likeCriteria);
      }
      $query = $this->db->get();
      return count($query->result());
   }

   function case_list($searchText = '', $page, $segment){
      $this->db->select('*');
      $this->db->from('vw_cases');
      if(!empty($searchText)) {
         $likeCriteria = "(case_number  LIKE '%".$searchText."%'
                         OR  case_title  LIKE '%".$searchText."%')";
         $this->db->where($likeCriteria);
      }
      $this->db->limit($page, $segment);
      $query = $this->db->get();
      $result = $query->result();
      return $result;
   }

   function caseList($searchText = '', $page, $segment){
      $this->db->select('*');
      $this->db->from('vw_cases');
      if(!empty($searchText)) {
         $likeCriteria = "(case_number  LIKE '%".$searchText."%'
                         OR  case_title  LIKE '%".$searchText."%')";
         $this->db->where($likeCriteria);
      }
      $this->db->limit($page, $segment);
      $query = $this->db->get();
      $result = $query->result();
      return $result;
   }

   function addNewCase($caseInfo){
      $this->db->trans_start();
      $this->db->insert('cases', $caseInfo);
      $insert_id = $this->db->insert_id();
      $this->db->trans_complete();
      return $insert_id;
   }

   function getCaseTypes(){
      $this->db->select('case_type_id, case_type_name');
      $this->db->from('case_types');
      $query = $this->db->get();
      return $query->result();
   }

   function getCounty(){
      $this->db->select('county_id, county_name');
      $this->db->from('counties');
      $query = $this->db->get();
      return $query->result();
   }

   function getCourtDivision(){
      $this->db->select('court_division_id, court_station_name');
      $this->db->from('vw_court_divisions');
      $query = $this->db->get();
      return $query->result();
   }

   function getCaseCategory(){
      $this->db->select('case_category_id, case_category_name');
      $this->db->from('case_category');
      $query = $this->db->get();
      return $query->result();
   }

   function getCaseInfo($caseId){
      $this->db->select('*');
      $this->db->from('vw_cases');
      $this->db->where('case_id', $caseId);
      $query = $this->db->get();
      return $query->result();
   }

   function editCase($caseInfo, $caseId){
      $this->db->where('case_id', $caseId);
      $this->db->update('cases', $caseInfo);
      return TRUE;
   }


}
