<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Users_model extends CI_Model{

	function user_count($searchText = ''){
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
	function user_list($searchText = '', $page, $segment){
		// $hasil=$this->db->get('vw_users');
		// return $hasil->result();

		$this->db->select('*');
      $this->db->from('vw_users as BaseTbl');
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
      return $query->result();
	}
	function get_user($id){
		$this->db->select('*');
      $this->db->from('vw_users');
		$this->db->where('userid', $id);
		$query = $this->db->get();
		return $query->result();
	}

	function save_user(){
		$data = array(
				'email' 	=> $this->input->post('email'),
				'name' 	=> $this->input->post('name'),
				'mobile' => $this->input->post('mobile'),
				'roleid' => $this->input->post('roleid'),
				'user_type_id' => $this->input->post('user_type_id'),
				'password' =>getHashedPassword($this->input->post('password')) ,
				'createdby' =>$this->vendorId,
				'createddtm'=>date('Y-m-d H:i:s')
			);
		$result=$this->db->insert('users',$data);
		return $result;
	}

	function update_user(){
		$email=$this->input->post('email_edit');
		$name=$this->input->post('name_edit');
		$mobile=$this->input->post('mobile_edit');
		$userid=$this->input->post('userid_edit');

		$this->db->set('name', $name);
		$this->db->set('mobile', $mobile);
		$this->db->set('email', $email);
		$this->db->where('userid', $userid);
		$result=$this->db->update('users');
		return $result;
	}

	function delete_user(){
		$userid=$this->input->post('userid');
		$this->db->where('userid', $userid);
		$result=$this->db->delete('users');
		return $result;
	}

}
