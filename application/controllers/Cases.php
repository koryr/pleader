<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

class Cases extends BaseController {
   /**
   * This is default constructor of the class
   */
   public function __construct(){
      parent::__construct();
      $this->load->model('Case_model');
      $this->load->library('pagination');
      $this->isLoggedIn();
   }

   /**
   * This function used to load the first screen of the user
   */
   public function index(){
      $this->global['pageTitle'] = 'Pleader : Cases';
      $searchText = $this->input->post('searchText');
      $data['searchText'] = $searchText;
      $data['case_types'] = $this->Case_model->getCaseTypes();
      $data['county'] = $this->Case_model->getCounty();
      $data['court_divisions'] = $this->Case_model->getCourtDivision();
      $data['case_category'] = $this->Case_model->getCaseCategory();
      $this->loadViews("cases/cases_view", $this->global, $data , NULL);
      $this->load->view('cases/case_modal');
   }

   public function case_data(){
      if($this->isAdmin() == TRUE){
         $this->loadThis();
      }else{
         $searchText = $this->input->post('searchText');
         $data['searchText'] = $searchText;
         $count = $this->Case_model->case_count($searchText);
         $returns = $this->paginationCompress ( "cases/", $count, 5 );
         $data=$this->Case_model->case_list($searchText, $returns["page"], $returns["segment"]);
         echo json_encode($data);
      }
   }

   public function caseList(){
      if($this->isAdmin() == TRUE){
         $this->loadThis();
      }else{
         $this->load->model('Case_model');
         $searchText = $this->input->post('searchText');
         $data['searchText'] = $searchText;
         $this->load->library('pagination');
         $count = $this->Case_model->casesCount($searchText);

         $returns = $this->paginationCompress("caseList/", $count, 5 );
         $data['caseRecords'] = $this->Case_model->caseList($searchText, $returns["page"], $returns["segment"]);
         $this->global['pageTitle'] = 'Pleader : Case Listing';
         $this->loadViews("cases/cases", $this->global, $data, NULL);
      }
   }

   /**
   * This function is used to load the add new form
   */
   function addNew(){
      if($this->isAdmin() == TRUE) {
         $this->loadThis();
      }else{
         $this->global['pageTitle'] = 'Pleader : Add New Case';
         $data['case_types'] = $this->Case_model->getCaseTypes();
         $data['county'] = $this->Case_model->getCounty();
         $data['court_divisions'] = $this->Case_model->getCourtDivision();
         $data['case_category'] = $this->Case_model->getCaseCategory();
         $this->loadViews("cases/addNewCase", $this->global, $data, NULL);
      }
   }

   /**
   * This function is used to add new user to the system
   */
   function addNewCase(){
      if($this->isAdmin() == TRUE){
         $this->loadThis();
      }else{
         $this->load->library('form_validation');
         $this->load->helper('date');
         $this->form_validation->set_rules('case_title','Case Title','trim|required|max_length[128]|xss_clean');
         $this->form_validation->set_rules('case_category_id','Case Category','trim|required|numeric');
         $this->form_validation->set_rules('case_type_id','Case Type','trim|required|numeric');
         $this->form_validation->set_rules('county_id','County ','trim|required|numeric');
         $this->form_validation->set_rules('alleged_crime','Alleged Crime','trim|required');
         $this->form_validation->set_rules('file_number','file_number','trim|required|max_length[128]|xss_clean');
         if($this->form_validation->run() == FALSE){
            $this->addNew();
         }else{
            $case_title = $this->input->post('case_title');
            $case_type_id = $this->input->post('case_type_id');
            $case_category_id = $this->input->post('case_category_id');
            $case_type_id = $this->input->post('case_type_id');
            $county_id = $this->input->post('county_id');
            $start_date = nice_date($this->input->post('start_date'), 'Y-m-d');
            $end_date = nice_date($this->input->post('end_date'), 'Y-m-d');
            $alleged_crime = $this->input->post('alleged_crime');
            $file_number = $this->input->post('file_number');

            $caseInfo = array('case_type_id'=>$case_type_id, 'case_category_id'=>$case_category_id, 'case_type_id'=>$case_type_id,'userid'=>$this->vendorId,
               'orgid'=>$this->orgId,'alleged_crime'=>$alleged_crime, 'file_number'=>$file_number,'case_title'=>$case_title,'start_date'=>$start_date,'end_date'=>$end_date,
               'county_id'=>$county_id);
            $this->load->model('Case_model');
            $result = $this->Case_model->addNewCase($caseInfo);
            if($result > 0){
               $this->session->set_flashdata('success', 'New Case added successfully');
            }else{
               $this->session->set_flashdata('error', 'Case creation failed');
            }
            redirect('cases');
         }
      }
   }

   function editOldCase($caseId = NULL){
      if($this->isAdmin() == TRUE || $caseId == 0){
         $this->loadThis();
      }else{
         if($caseId == null){
            redirect('cases');
         }
         $data['case_types'] = $this->Case_model->getCaseTypes();
         $data['county'] = $this->Case_model->getCounty();
         $data['case_category'] = $this->Case_model->getCaseCategory();
         $data['caseInfo'] = $this->Case_model->getCaseInfo($caseId);
         $this->global['pageTitle'] = 'Pleader : Edit Case';
         $this->loadViews("cases/editOldCase", $this->global, $data, NULL);
      }
   }


   function editCase(){
      if($this->isAdmin() == TRUE){
         $this->loadThis();
      }else{
         $this->load->library('form_validation');
         $caseId = $this->input->post('caseId');
         $this->form_validation->set_rules('case_title','Case Title','trim|required|max_length[128]|xss_clean');
         $this->form_validation->set_rules('case_category_id','Case Category','trim|required|numeric');
         $this->form_validation->set_rules('case_type_id','Case Type','trim|required|numeric');
         $this->form_validation->set_rules('county_id','County ','trim|required|numeric');
         $this->form_validation->set_rules('alleged_crime','Alleged Crime','trim|required');
         $this->form_validation->set_rules('file_number','file_number','trim|required|max_length[128]|xss_clean');
         if($this->form_validation->run() == FALSE){
            $this->editOldCase($caseId);
         }else{
            $case_title = $this->input->post('case_title');
            $case_type_id = $this->input->post('case_type_id');
            $case_category_id = $this->input->post('case_category_id');
            $case_type_id = $this->input->post('case_type_id');
            $county_id = $this->input->post('county_id');
            $alleged_crime = $this->input->post('alleged_crime');
            $file_number = $this->input->post('file_number');

            $caseInfo = array('case_type_id'=>$case_type_id, 'case_category_id'=>$case_category_id, 'case_type_id'=>$case_type_id,'userid'=>$this->vendorId,
               'orgid'=>$this->orgId,'alleged_crime'=>$alleged_crime, 'file_number'=>$file_number,'case_title'=>$case_title,'start_date'=>date('Y-m-d H:i:s'),
               'county_id'=>$county_id);
            $result = $this->Case_model->editCase($caseInfo, $caseId);
            if($result == true){
               $this->session->set_flashdata('success', 'Case updated successfully');
            }else{
               $this->session->set_flashdata('error', 'Case update failed');
            }
            redirect('cases');
         }
      }
   }


}
