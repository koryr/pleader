<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

class CaseType extends BaseController {
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
      $this->global['pageTitle'] = 'Pleader : Cases';
      $this->loadViews("admin/case_types", $this->global, NULL , NULL);
   }

   public function caseTypeList(){
      if($this->isAdmin() == TRUE){
         $this->loadThis();
      }else{
         $this->load->model('CaseType_model');
         $searchText = $this->input->post('searchText');
         $data['searchText'] = $searchText;
         $this->load->library('pagination');
         $count = $this->CaseType_model->caseTypeCount($searchText);
         $returns = $this->paginationCompress("caseTypes/", $count, 5 );
         $data['caseTypeRecords'] = $this->CaseType_model->caseTypeList($searchText, $returns["page"], $returns["segment"]);
         $this->global['pageTitle'] = 'Pleader : Case Listing';
         $this->loadViews("admin/case_types", $this->global, $data, NULL);
      }

   }

   /**
   * This function is used to load the add new form
   */
   function addNew(){
      if($this->isAdmin() == TRUE) {
         $this->loadThis();
      }else{
         $this->global['pageTitle'] = 'Pleader : Add New Case Type';
         $this->loadViews("admin/addNewCaseType", $this->global, NULL, NULL);
      }
   }

   /**
   * This function is used to add new user to the system
   */
   function addNewCaseType(){
      if($this->isAdmin() == TRUE){
         $this->loadThis();
      }else{
         $this->load->library('form_validation');
         $this->form_validation->set_rules('case_type_name','Case Type','trim|required|max_length[128]|xss_clean');

         if($this->form_validation->run() == FALSE){
            $this->addNew();
         }else{
            $name = ucwords(strtolower($this->input->post('case_type_name')));

            $caseTypeInfo = array('case_type_name'=>$name);
            $this->load->model('CaseType_model');
            $result = $this->CaseType_model->addNewCaseType($caseTypeInfo);
            if($result > 0){
               $this->session->set_flashdata('success', 'New Case Type added successfully');
            }else{
               $this->session->set_flashdata('error', 'Case Type creation failed');
            }
            redirect('caseTypes');
         }
      }
   }

}
