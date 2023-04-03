<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-plus"></i> Add New Case
        <small>Add / Edit User</small>
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

                    <form role="form" id="addcase" action="<?php echo base_url() ?>addCase" method="post" role="form">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="fname">Case Title</label>
                                        <input type="text" class="form-control required" id="case_title" name="case_title" maxlength="128">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="role">Case Category</label>
                                       <select class="select2 form-control required" id="case_category_id" name="case_category_id">
                                           <option value="0">Select Case Category</option>
                                           <?php
                                           if(!empty($case_category)) {
                                               foreach ($case_category as $ct){
                                                   ?>
                                                   <option value="<?php echo $ct->case_category_id ?>"><?php echo $ct->case_category_name ?></option>
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
                                       <select class="select2 form-control required" id="case_type_id" name="case_type_id">
                                           <option value="0">Select Case Type Name</option>
                                           <?php
                                           if(!empty($case_types)) {
                                               foreach ($case_types as $cs){
                                                   ?>
                                                   <option value="<?php echo $cs->case_type_id ?>"><?php echo $cs->case_type_name ?></option>
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
                                       <select class="select2 form-control required" id="county_id" name="county_id">
                                           <option value="0">Select County Name</option>
                                           <?php
                                           if(!empty($county)) {
                                               foreach ($county as $ct){
                                                   ?>
                                                   <option value="<?php echo $ct->county_id ?>"><?php echo $ct->county_name ?></option>
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
                                    <label>Start Date</label>

                                    <div class="input-group date">
                                    <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                    </div>
                                    <input class=" date form-control pull-right" name="start_date" id="start_date" type="text">
                                    </div>
                                    <!-- /.input group -->
                                    </div>
                                 </div>
                                 <div class="col-md-6">
                                     <div class="form-group">
                                     <label>End Date</label>

                                     <div class="input-group date">
                                     <div class="input-group-addon">
                                     <i class="fa fa-calendar"></i>
                                     </div>
                                     <input class="date form-control pull-right" name="end_date" id="end_date" type="text">
                                     </div>
                                     <!-- /.input group -->
                                     </div>
                                  </div>
                              </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="mobile">Alleged Crime</label>
                                        <textarea name="alleged_crime"  class="form-control" rows="3" placeholder="Alleged Crime"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="fname">File Number</label>
                                       <input type="text" class="form-control required" id="file_number" name="file_number" maxlength="128">
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.box-body -->

                        <div class="box-footer" >
                           <div style="float:right">
                            <input type="submit" class="btn btn-primary" value="Submit" />
                            <input type="reset" class="btn btn-default" value="Reset" />
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
<script src="<?php echo base_url(); ?>assets/dist/js/select2.full.min.js"></script>
<script src="<?php echo base_url(); ?>assets/plugins/datepicker/bootstrap-datepicker.js"></script>
<script>
$('.select2').select2();
$('.date').datepicker({
      autoclose: true
   });
</script>
<script src="<?php echo base_url(); ?>assets/js/addUser.js" type="text/javascript"></script>
