<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

class Activity_definition extends BaseController {
   /**
   * This is default constructor of the class
   */
   public function __construct(){
      parent::__construct();
      $this->load->model('CaseType_model');
      $this->isLoggedIn();
   }

   /**
   * This function used to load the first screen of the user
   */
   public function index(){
      $this->global['pageTitle'] = 'Pleader : Activity Definition';
      $this->loadViews("admin/definitions/activity_definition", $this->global, NULL , NULL);
   }
}
