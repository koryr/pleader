<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class User_model extends CI_Model{
   /**
   * This function is used to get the user listing count
   * @param string $searchText : This is optional search text
   * @return number $count : This is row count
   */
   function userListingCount($searchText = ''){
      $this->db->select('BaseTbl.userid, BaseTbl.email, BaseTbl.name, BaseTbl.mobile, Role.role');
      $this->db->from('vw_users as BaseTbl');
      $this->db->join('roles as Role', 'Role.roleid = BaseTbl.roleid','left');
      if(!empty($searchText)) {
      $likeCriteria = "(BaseTbl.email  LIKE '%".$searchText."%'
                      OR  BaseTbl.name  LIKE '%".$searchText."%'
                      OR  BaseTbl.mobile  LIKE '%".$searchText."%')";
      $this->db->where($likeCriteria);
      }
      $this->db->where('BaseTbl.isdeleted', false);
      $this->db->where('BaseTbl.roleid !=', 1);
      $query = $this->db->get();
      return count($query->result());
   }

   /**
   * This function is used to get the user listing count
   * @param string $searchText : This is optional search text
   * @param number $page : This is pagination offset
   * @param number $segment : This is pagination limit
   * @return array $result : This is result
   */
   function userListing($searchText = '', $page, $segment){
      $this->db->select('BaseTbl.userid, BaseTbl.email, BaseTbl.name, BaseTbl.mobile, Role.role');
      $this->db->from('vw_users as BaseTbl');
      $this->db->join('roles as Role', 'Role.roleid = BaseTbl.roleid','left');
      if(!empty($searchText)) {
         $likeCriteria = "(BaseTbl.email  LIKE '%".$searchText."%'
                         OR  BaseTbl.name  LIKE '%".$searchText."%'
                         OR  BaseTbl.mobile  LIKE '%".$searchText."%')";
         $this->db->where($likeCriteria);
      }
      $this->db->where('BaseTbl.isdeleted', false);
      $this->db->where('BaseTbl.roleid !=', 1);
      $this->db->limit($page, $segment);
      $query = $this->db->get();
      $result = $query->result();
      return $result;
   }

   /**
   * This function is used to get the user roles information
   * @return array $result : This is result of the query
   */
   function getUserRoles(){
      $this->db->select('roleid, role');
      $this->db->from('roles');
      $this->db->where('roleid !=', 1);
      $query = $this->db->get();
      return $query->result();
   }

   function getUserTypes(){
      $this->db->select('user_type_id, user_type_name');
      $this->db->from('user_types');
      $query = $this->db->get();
      return $query->result();
   }


   /**
   * This function is used to check whether email id is already exist or not
   * @param {string} $email : This is email id
   * @param {number} $userId : This is user id
   * @return {mixed} $result : This is searched result
   */
   function checkEmailExists($email, $userId = 0){
      $this->db->select("email");
      $this->db->from("vw_users");
      $this->db->where("email", $email);
      $this->db->where("isdeleted", false);
      if($userId != 0){
         $this->db->where("userid !=", $userId);
      }
      $query = $this->db->get();
      return $query->result();
   }


   /**
   * This function is used to add new user to system
   * @return number $insert_id : This is last inserted id
   */
   function addNewUser($userInfo){
      $this->db->trans_start();
      $this->db->insert('users', $userInfo);
      $insert_id = $this->db->insert_id();
      $this->db->trans_complete();
      return $insert_id;
   }

   /**
   * This function used to get user information by id
   * @param number $userId : This is user id
   * @return array $result : This is user information
   */
   function getUserInfo($userId){
      $this->db->select('userid, name, email, user_type_id, mobile, roleid');
      $this->db->from('vw_users');
      $this->db->where('isdeleted', false);
      $this->db->where('roleid !=', 1);
      $this->db->where('userid', $userId);
      $query = $this->db->get();
      return $query->result();
   }

   function getUsers(){
      $this->db->select('userid, name, email, user_type_id, mobile, roleid');
      $this->db->from('vw_users');
      $this->db->where('isdeleted', false);
      $this->db->where('roleid !=', 1);
      $query = $this->db->get();
      return $query->result();
   }


   /**
   * This function is used to update the user information
   * @param array $userInfo : This is users updated information
   * @param number $userId : This is user id
   */
   function editUser($userInfo, $userId){
      $this->db->where('userid', $userId);
      $this->db->update('users', $userInfo);
      return TRUE;
   }



   /**
   * This function is used to delete the user information
   * @param number $userId : This is user id
   * @return boolean $result : TRUE / FALSE
   */
   function deleteUser($userId, $userInfo){
      $this->db->where('userid', $userId);
      $this->db->update('users', $userInfo);
      return $this->db->affected_rows();
   }


   /**
   * This function is used to match users password for change password
   * @param number $userId : This is user id
   */
   function matchOldPassword($userId, $oldPassword){
      $this->db->select('userid, password');
      $this->db->where('userid', $userId);
      $this->db->where('isdeleted', false);
      $query = $this->db->get('vw_users');
      $user = $query->result();
      if(!empty($user)){
         if(verifyHashedPassword($oldPassword, $user[0]->password)){
         return $user;
         } else {
            return array();
         }
      } else {
         return array();
      }
   }

   /**
   * This function is used to change users password
   * @param number $userId : This is user id
   * @param array $userInfo : This is user updation info
   */
   function changePassword($userId, $userInfo){
      $this->db->where('userid', $userId);
      $this->db->where('isdeleted', false);
      $this->db->update('users', $userInfo);
      return $this->db->affected_rows();
   }
}
