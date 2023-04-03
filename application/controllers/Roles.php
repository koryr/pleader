<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

class Roles extends BaseController {

   function __construct(){
     parent::__construct();
     $this->load->model('Roles_model');
     $this->load->library('pagination');
     $this->isLoggedIn();
   }
   function index(){
      $this->global['pageTitle'] = 'Pleader : Roles';
      $searchText = $this->input->post('searchText');
      $data['searchText'] = $searchText;
      $this->loadViews("admin/user/roles_view", $this->global, $data, NULL);
      $this->load->view('admin/user/roles_modal');
   }

   function roles_data(){
      $searchText = $this->input->post('searchText');
      $data['searchText'] = $searchText;
      $count = $this->Roles_model->role_count($searchText);
      $returns = $this->paginationCompress ( "user/", $count, 5 );
      $data=$this->Roles_model->role_list($searchText, $returns["page"], $returns["segment"]);
      echo json_encode($data);
   }
}
