<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class User_Type_model extends CI_Model{

   /**
   * This function is used to get the user roles information
   * @return array $result : This is result of the query
   */

   function getUserTypes(){
      $this->db->select('user_type_id, user_type_name');
      $this->db->from('user_types');
      $query = $this->db->get();
      return $query->result();
   }
}
