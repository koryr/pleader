<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Activity_model extends CI_Model {

   /*------------------Activity------------------------*/
   function getActivity($id) {
      $this->db->where("case_activity_id",$id);
      $query = $this->db->get('vw_case_activity');
      return $query->row();
   }
}
