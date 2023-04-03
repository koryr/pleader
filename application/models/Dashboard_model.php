<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Dashboard_model extends CI_Model{

   function getUsers(){
      $this->db->select('BaseTbl.userid, BaseTbl.email, BaseTbl.name, BaseTbl.mobile, Role.role');
      $this->db->from('vw_users as BaseTbl');
      $this->db->join('roles as Role', 'Role.roleid = BaseTbl.roleid','left');
      $this->db->where('BaseTbl.isdeleted', false);
      $this->db->where('BaseTbl.roleid !=', 1);
      $query = $this->db->get();
      return count($query->result());
   }

   function getNewCases(){
      $this->db->select('*');
      $this->db->from('vw_cases');
      $query = $this->db->get();
      return count($query->result());
   }
}
