<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

class Dashboard extends BaseController {
   public function __construct(){
      parent::__construct();
      $this->load->model('Dashboard_model');
      $this->isLoggedIn();
   }

	public function index()	{
      if($this->isAdmin() == TRUE){
         $this->loadThis();
      }else{
         $this->global['pageTitle'] = 'CodeInsect : Dashboard';
   		$this->data['page'] = 'templates/dashboard';
   		$data['users'] = $this->Dashboard_model->getUsers();
         $data['newcase'] = $this->Dashboard_model->getNewCases();
         $this->loadViews("dashboard", $this->global, $data, NULL);
   	}
	}

	}
?>
