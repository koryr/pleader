<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

class User extends BaseController {

   function __construct(){
     parent::__construct();
     $this->load->model(array('Users_model','Roles_model','User_Type_model'));
     $this->load->library('pagination');
     $this->isLoggedIn();
   }
   function index(){
      $this->global['pageTitle'] = 'Pleader : Users';
      $searchText = $this->input->post('searchText');
      $data['searchText'] = $searchText;
      $data['roles'] = $this->Roles_model->getRoles();
      $data['usertype'] = $this->User_Type_model->getUserTypes();
      $this->loadViews("admin/user/users_view", $this->global, $data, NULL);
      $this->load->view('admin/user/users_modal');
   }

   function user_data(){
      $searchText = $this->input->post('searchText');
      $data['searchText'] = $searchText;
      $count = $this->Users_model->user_count($searchText);
      $returns = $this->paginationCompress ( "user/", $count, 5 );
      $data=$this->Users_model->user_list($searchText, $returns["page"], $returns["segment"]);
      echo json_encode($data);
   }

   function get_user_data(){
      $id = $this->input->post('userid');
      $data=$this->Users_model->get_user($id);
      echo json_encode($data);
   }

   function save(){
      
     $data=$this->Users_model->save_user();
     echo json_encode($data);
   }

   function update(){
     $data=$this->Users_model->update_user();
     echo json_encode($data);
   }

   function delete(){
     $data=$this->Users_model->delete_user();
     echo json_encode($data);
   }

}
