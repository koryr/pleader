<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

class CaseActivity extends BaseController {
	function __construct(){
		parent::__construct();

		$this->load->helper(array('url','form'));
		$this->load->library(array('form_validation','session','pagination'));
		$this->load->model(array('CaseActivity_model','Case_model', 'User_model'));
		$this->isLoggedIn();
	}

	public function index(){
		$this->global['pageTitle'] = 'Pleader : Cases Activities';
      $this->loadViews("cases/caseDetails", $this->global, NULL , NULL);

	}

	function viewCase($caseid){
      if($this->isAdmin() == TRUE) {
         $this->loadThis();
      }else{
			$id = $caseid;
			$data['case_id'] = $caseid;
         $this->global['pageTitle'] = 'Pleader : Case Details';
         $searchText = $this->input->post('searchText');
         $data['searchText'] = $searchText;
         $count = $this->CaseActivity_model->caseActivityCount($searchText);
         $returns = $this->paginationCompress("viewCase/", $count, 5 );
			$data['caseDetails'] = $this->Case_model->getCaseInfo($id);
         $data['activityRecords'] = $this->CaseActivity_model->getCaseActivity($id);
			$data['contacts'] = $this->CaseActivity_model->getCaseContacts($id);
         $this->loadViews("cases/caseDetails", $this->global, $data, NULL);
      }
   }


   function addCaseActivity($caseid){
      if($this->isAdmin() == TRUE) {
         $this->loadThis();
      }else{
			$data['case_id'] = $caseid;
         $this->global['pageTitle'] = 'Pleader : Add New Case';
         $data['order_type'] = $this->CaseActivity_model->getOrder_types();
         $data['activitys'] = $this->CaseActivity_model->getActivities();
         $data['adjorn_reason'] = $this->CaseActivity_model->getAdjorn_reasons();
			$data['activity_reasults'] = $this->CaseActivity_model->getActivity_reasults();
         $this->loadViews("cases/addCaseActivity", $this->global, $data, NULL);
      }
   }

	function caseContact($caseid){
      if($this->isAdmin() == TRUE) {
         $this->loadThis();
      }else{
			$data['case_id'] = $caseid;
         $this->global['pageTitle'] = 'Pleader : Add New Case';
         $data['users'] = $this->User_model->getUsers();
         $data['contactType'] = $this->CaseActivity_model->getContact_types();
         $this->loadViews("cases/addCaseContact", $this->global, $data, NULL);
      }
   }

   public function act($id)	{

		$data['case_activity'] = $this->CI_caseActivity->getCaseActivity($id);
		$data['total'] = $this->db->count_all("vw_case_activity");
		$data['order_type'] = $this->CI_category->getOrder_types();
		$data['contact_type'] = $this->CI_category->getContact_types();
		$data['receipt_type'] = $this->CI_caseActivity->getReceipt_types();
		$data['case_contacts'] = $this->CI_caseActivity->getCaseContacts($id);
		$data['case_receipt'] = $this->CI_caseActivity->getCaseReceipt($id);
		$data['activity'] = $this->CI_category->read_activity();
		$data['adjourn_reasons'] = $this->CI_category->getAdjorn_reason();
		$data['activity_reasults'] = $this->CI_category->getActivity_reasults();
		$data['case'] = $this->CI_case->getCase();
		$data['caseid'] = $id;
		$data['user'] = $this->CI_user->get_users();
		$data['county'] = $this->CI_category->select_county();
		$data['org'] = $this->CI_category->getOrgs();
		if($this->CI_auth->check_logged()=== true){
			$this->data['pagetitle'] = 'Case Activity';
			$this->data['page'] = 'templates/case_activity';
			$this->data['viewdata'] = json_encode($data);
			$this->load->view('app', $this->data);
		} else {
			$this->load->view('_login_form');
		}
   }


   public function getCaseActivity($id){
		if($this->isAdmin() == TRUE) {
         $this->loadThis();
      }else{
			$this->global['pageTitle'] = 'Pleader : Case Activity';
			$searchText = $this->input->post('searchText');
         $data['searchText'] = $searchText;
			$this->data['page'] = 'templates/cases';
			$list = $this->CaseActivity_model->getCaseActivity($id);
			$count = $this->Case_model->casesCount($searchText);
         $returns = $this->paginationCompress("caseList/", $count, 5 );
         $data['activityRecords'] = $this->CaseActivity_model->caseactivityList($searchText, $returns["page"], $returns["segment"]);
         $this->loadViews("cases/addCaseActivity", $this->global, $data, NULL);
		}
   }

	public function addNewCaseActivity()  {
		if($this->isAdmin() == TRUE){
         $this->loadThis();
      }else{
			$this->load->library('form_validation');
         $this->load->helper('date');

			$this->form_validation->set_rules('activity_result_id', 'Activity Results', 'trim|required|numeric');
			$this->form_validation->set_rules('activity_id', 'Activity', 'trim|required|numeric');
			$this->form_validation->set_rules('adjourn_id', 'Adjorn Reason', 'trim|required|numeric');
			$this->form_validation->set_rules('order_type_id', 'Order TYpe', 'trim|required|numeric');
			$this->form_validation->set_rules('start_date', 'Start Date', 'trim|required|xss_clean');
			$this->form_validation->set_rules('order_details', 'Order Details', 'trim|required|xss_clean');
			$this->form_validation->set_rules('adjorn_details', 'Adjorn Details', 'trim|required|xss_clean');
			if($this->form_validation->run() == FALSE){
            $this->addNew();
         }else{
				$activity_id = $this->input->post('activity_id');
            $adjourn_id = $this->input->post('adjourn_id');
				$order_type_id = $this->input->post('order_type_id');
				$activity_result_id = $this->input->post('activity_result_id');
            $case_id = $this->input->post('case_id');
				$id = $case_id;
            $county_id = $this->input->post('county_id');
            $start_date = nice_date($this->input->post('start_date'), 'Y-m-d');
            $end_date = nice_date($this->input->post('end_date'), 'Y-m-d');
				$activity_time = nice_date($this->input->post('activity_time'), 'Y-m-d');
				$finish_time = nice_date($this->input->post('finish_time'), 'Y-m-d');
				$now = time();
 				$activity_time = unix_to_human($now, TRUE, 'us');
				$finish_time = unix_to_human($now, TRUE, 'us');
            $adjorn_details = $this->input->post('adjorn_details');
            $order_details = $this->input->post('order_details');
	   		$data = array('case_id' => $id,'orgid'=>$this->orgId,'order_type_id' => $order_type_id,'adjorn_reason_id'=>$adjourn_id,'activity_result_id'=>$activity_result_id,
	   				'activity_date' => $start_date,'activity_time' => $activity_time,'activity_id' => $activity_id,
						'finish_time' => $finish_time,'order_details' => $order_details,'adjorn_details' => $adjorn_details);
				$result = $this->CaseActivity_model->addNewCaseActivity($data);
            if($result > 0){
               $this->session->set_flashdata('success', 'New Case Activity added successfully');
            }else{
               $this->session->set_flashdata('error', 'Case creation failed');
            }
            redirect('cases');
			}
		}
	}

	public function ajax_edit($id) {
		$this->load->database();
		$q = $this->db->get_where('case_activity', array('case_activity_id' => $id));
		echo json_encode($q->row());
	}

	public function ajax_update() {
		$data = array('case_activity_id' => $this->input->post('case_activity_id'),'case_type_id' => $this->input->post('case_type_name'),'county_id' => $this->input->post('county_name'),
					'case_title' => $this->input->post('case_title'),'alleged_crime' => $this->input->post('alleged_crime'),
					'client_id' => $this->input->post('client_id'),'file_number' => $this->input->post('client_id'),'start_date' => $this->input->post('startDate'));
		$this->CI_caseActivity->update_caseActivity(array('case_activity_id' => $this->input->post('case_activity_id')), $data);
		echo json_encode(array("status" => TRUE));
	}

	public function ajax_delete($id){
		$this->CI_caseActivity->delete_caseActivity();
		echo json_encode(['success'=>true]);
	}

	public function addCaseContact(){
		if($this->isAdmin() == TRUE){
         $this->loadThis();
      }else{
			$this->load->library('form_validation');
         $this->load->helper('date');

			$this->form_validation->set_rules('user_id', 'User Id', 'trim|required|numeric');
			$this->form_validation->set_rules('contact_type', 'Contact Type', 'trim|required|numeric');
			$this->form_validation->set_rules('contact_number', 'Contact Number', 'trim|required|numeric');
			$this->form_validation->set_rules('details','Details', 'trim|required|xss_clean');
			if($this->form_validation->run() == FALSE){
            $this->caseContact($this->input->post('case_id'));
         }else{
				$case_id = $this->input->post('case_id');
				$id = $case_id;
   			$data = array('case_id' => $id,'userid' => $this->input->post('user_id'),'contact_type_id' => $this->input->post('contact_type'),'orgid' =>$this->orgId,
   				'case_contact_no' => $this->input->post('contact_number'),'is_active' => $this->input->post('is_active')=='on'?true:false, 'change_by' =>$this->vendorId,
				'details' => $this->input->post('details'));
				$result = $this->CaseActivity_model->addCaseContact($data);
				if($result > 0){
					$this->session->set_flashdata('success', 'New Case Contact added successfully');
				}else{
					$this->session->set_flashdata('error', 'Case Contact creation failed');
				}
				redirect('cases');
			}
		}
	}

	public function addReceipt($id){
		if($this->CI_auth->check_logged()===true){
			$session_data = $this->session->userdata('logged_in');
   			$data = array('receipt_type_id' => $this->input->post('receipt_type_id'),'receipt_for' => $this->input->post('receiptfor'),'case_id' => $id,
   				'receipt_date' => $this->input->post('receipt_date'),'for_process' => $this->input->post('for_process')=='on'?true:false, 'change_by' => $this->CI_auth->logged_id(),
				'amount' => $this->input->post('amount'),'case_number' => $this->input->post('case_number'));
			$result = $this->CI_caseActivity->add_caseReceipt($data);
			echo json_encode(array("status" => TRUE));
		}else {
			$this->load->view('_login_form');
		}
	}
}
