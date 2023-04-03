<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Login_model extends CI_Model {
   function auth($email, $password) {
      $this->db->select('userid, password, orgid, name, roleid, role');
      $this->db->from('vw_users');
      $this->db->where('email', $email);
      $this->db->where('isdeleted', false);
      $query = $this->db->get();

      $user = $query->result();

      if(!empty($user)){
         if(verifyHashedPassword($password, $user[0]->password)){
            return $user;
         } else {
            return array();
         }
      } else {
         return array();
      }
   }

   function checkEmailExist($email) {
      $this->db->select('userid');
      $this->db->where('email', $email);
      $this->db->where('isdeleted', false);
      $query = $this->db->get('vw_users');

      if ($query->num_rows() > 0){
         return true;
      } else {
         return false;
      }
   }

   function resetPasswordUser($data) {
      $result = $this->db->insert('reset_password', $data);

      if($result) {
         return TRUE;
      } else {
         return FALSE;
      }
   }

   function getUserInfoByEmail($email)  {
      $this->db->select('userid, email, name');
      $this->db->from('users');
      $this->db->where('isdeleted', false);
      $this->db->where('email', $email);
      $query = $this->db->get();

      return $query->result();
   }

   function checkActivationDetails($email, $activation_id) {
      $this->db->select('id');
      $this->db->from('reset_password');
      $this->db->where('email', $email);
      $this->db->where('activation_id', $activation_id);
      $query = $this->db->get();
      return $query->num_rows;
   }

   function createPasswordUser($email, $password) {
      $this->db->where('email', $email);
      $this->db->where('isdeleted', false);
      $this->db->update('users', array('password'=>getHashedPassword($password)));
      $this->db->delete('reset_password', array('email'=>$email));
   }
}
