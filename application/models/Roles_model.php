<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Roles_model extends CI_Model{

	function role_count($searchText = ''){
		$this->db->select('BaseTbl.roleid, BaseTbl.email, BaseTbl.name, BaseTbl.mobile, Role.role');
		$this->db->from('vw_roles as BaseTbl');
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
	* This function is used to get the role listing count
	* @param string $searchText : This is optional search text
	* @param number $page : This is pagination offset
	* @param number $segment : This is pagination limit
	* @return array $result : This is result
	*/
	function role_list($searchText = '', $page, $segment){
		// $hasil=$this->db->get('vw_roles');
		// return $hasil->result();

		$this->db->select('*');
      $this->db->from('vw_roles as BaseTbl');
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

	function get_role($id){
		$this->db->select('*');
      $this->db->from('vw_roles');
		$this->db->where('roleid', $id);
		$query = $this->db->get();
		return $query->result();
	}

   /**
   * This function is used to get the user roles information
   * @return array $result : This is result of the query
   */
   function getRoles(){
      $this->db->select('roleid, role');
      $this->db->from('roles');
      $this->db->where('roleid !=', 1);
      $query = $this->db->get();
      return $query->result();
   }

	function save_role(){
		$data = array(
				'email' 	=> $this->input->post('email'),
				'name' 	=> $this->input->post('name'),
				'mobile' => $this->input->post('mobile'),
			);
		$result=$this->db->insert('roles',$data);
		return $result;
	}

	function update_role(){
		$email=$this->input->post('email');
		$name=$this->input->post('name');
		$mobile=$this->input->post('mobile');
		$roleid=$this->input->post('roleid');

		$this->db->set('name', $name);
		$this->db->set('mobile', $mobile);
		$this->db->where('roleid', $roleid);
		$result=$this->db->update('roles');
		return $result;
	}

	function delete_role(){
		$roleid=$this->input->post('roleid');
		$this->db->where('roleid', $roleid);
		$result=$this->db->delete('roles');
		return $result;
	}

}
