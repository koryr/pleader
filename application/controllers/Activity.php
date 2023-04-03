<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

class Activity extends BaseController {
	function __construct(){
		parent::__construct();

		$this->load->helper(array('url','form'));
		$this->load->library(array('form_validation','session','pagination'));
		$this->load->model(array('Activity_model','Case_model', 'User_model'));
		$this->isLoggedIn();
	}

	public function index(){
		$this->global['pageTitle'] = 'Pleader : Activities';
      $this->loadViews("cases/activityyDetails", $this->global, NULL , NULL);

	}

   public function viewActivity($activity_id){
      if($this->isAdmin() == TRUE) {
         $this->loadThis();
      }else{
			$id = $activity_id;
			$data['activity_id'] = $activity_id;
         $this->global['pageTitle'] = 'Pleader : Activity Details';
         $searchText = $this->input->post('searchText');
         $data['searchText'] = $searchText;
         // $count = $this->CaseActivity_model->caseActivityCount($searchText);
         // $returns = $this->paginationCompress("viewCase/", $count, 5 );
			$data['activityDetails'] = $this->Activity_model->getActivity($activity_id);
         // $data['activityRecords'] = $this->CaseActivity_model->getCaseActivity($id);
			// $data['contacts'] = $this->CaseActivity_model->getCaseContacts($id);
         $this->loadViews("cases/activityDetails", $this->global, $data, NULL);
      }
   }
}
