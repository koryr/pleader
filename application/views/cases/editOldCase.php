<?php

$caseId = '';
$case_title = '';
$case_category_id = '';
$case_type_id = '';
$county_id = '';
$alleged_crime = '';
$file_number = '';

if(!empty($caseInfo)){
   foreach ($caseInfo as $cf){
      $caseId = $cf->case_id;
      $case_title = $cf->case_title;
      $case_category_id = $cf->case_category_id;
      $case_type_id = $cf->case_type_id;
      $county_id = $cf->county_id;
      $alleged_crime = $cf->alleged_crime;
      $file_number = $cf->file_number;
   }
}
?>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-plus"></i> Edit Case
        <small>Edit Case</small>
      </h1>
    </section>

    <section class="content">

        <div class="row">
            <!-- left column -->
            <div class="col-md-12">
              <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Enter Case Details</h3>
                    </div><!-- /.box-header -->
                    <!-- form start -->

                    <form role="form" id="editCase" action="<?php echo base_url() ?>editCase" method="post" role="form">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="fname">Case Title</label>
                                        <input type="text" class="form-control required" value="<?php echo $case_title; ?>" id="case_title" name="case_title" maxlength="128">
                                        <input type="hidden" value="<?php echo $caseId; ?>" name="caseId" id="caseId" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="role">Case Category</label>
                                       <select class="form-control required" id="case_category_id" name="case_category_id">
                                           <option value="0">Select Case Category</option>
                                           <?php
                                           if(!empty($case_category)) {
                                               foreach ($case_category as $ct){
                                                   ?>
                                                    <option value="<?php echo $ct->case_category_id; ?>" <?php if($ct->case_category_id == $case_category_id) {echo "selected=selected";} ?>><?php echo $ct->case_category_name ?></option>
                                                   <?php
                                               }
                                           }
                                           ?>
                                       </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="role">Case Type Name</label>
                                       <select class="form-control required" id="case_type_id" name="case_type_id">
                                           <option value="0">Select Case Type Name</option>
                                           <?php
                                           if(!empty($case_types)) {
                                               foreach ($case_types as $cs){
                                                   ?>
                                                    <option value="<?php echo $cs->case_type_id; ?>" <?php if($cs->case_type_id == $case_type_id) {echo "selected=selected";} ?>><?php echo $cs->case_type_name ?></option>
                                                   <?php
                                               }
                                            }
                                           ?>
                                       </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="role">County</label>
                                       <select class="form-control required" id="county_id" name="county_id">
                                           <option value="0">Select County Name</option>
                                           <?php
                                           if(!empty($county)) {
                                               foreach ($county as $ct){
                                                   ?>
                                                    <option value="<?php echo $ct->county_id; ?>" <?php if($ct->county_id == $county_id) {echo "selected=selected";} ?>><?php echo $ct->county_name ?></option>
                                                   <?php
                                               }
                                           }
                                           ?>
                                       </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="mobile">Alleged Crime</label>
                                        <textarea name="alleged_crime"  class="form-control" rows="3" placeholder="Alleged Crime"><?php echo $alleged_crime; ?></textarea>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="fname">File Number</label>
                                       <input type="text" class="form-control required" value="<?php echo $file_number; ?>" id="file_number" name="file_number" maxlength="128">
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.box-body -->

                        <div class="box-footer" >
                           <div style="float:right">
                            <input type="submit" class="btn btn-primary" value="Update" />
                            <input type="reset" class="btn btn-default" value="Cancel" />
                         </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-4">
                <?php
                    $this->load->helper('form');
                    $error = $this->session->flashdata('error');
                    if($error){
                ?>
                <div class="alert alert-danger alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <?php echo $this->session->flashdata('error'); ?>
                </div>
                <?php } ?>
                <?php
                    $success = $this->session->flashdata('success');
                    if($success){
                ?>
                <div class="alert alert-success alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <?php echo $this->session->flashdata('success'); ?>
                </div>
                <?php } ?>

                <div class="row">
                    <div class="col-md-12">
                        <?php echo validation_errors('<div class="alert alert-danger alert-dismissable">', ' <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button></div>'); ?>
                    </div>
                </div>
            </div>
        </div>
    </section>

</div>
<script src="<?php echo base_url(); ?>assets/js/editCase.js" type="text/javascript"></script>
