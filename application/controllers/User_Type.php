<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

class User_Types extends BaseController {

   function __construct(){
      parent::__construct();
      $this->load->model('User_Type_model');
      $this->load->library('pagination');
      $this->isLoggedIn();
   }

   function index(){
      $this->global['pageTitle'] = 'Pleader : Roles';
      $searchText = $this->input->post('searchText');
      $data['searchText'] = $searchText;
      $this->loadViews("admin/user/user_types_view", $this->global, $data, NULL);
      $this->load->view('admin/user/user_types_modal');
   }

   function roles_data(){
      $searchText = $this->input->post('searchText');
      $data['searchText'] = $searchText;
      $count = $this->User_Type_model->role_count($searchText);
      $returns = $this->paginationCompress ( "user/", $count, 5 );
      $data = $this->User_Type_model->role_list($searchText, $returns["page"], $returns["segment"]);
      echo json_encode($data);
   }
}
