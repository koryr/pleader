<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-plus"></i> Add Case Activity
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
                        <h3 class="box-title">Enter Case Activity</h3>
                    </div><!-- /.box-header -->
                    <!-- form start -->

                    <form role="form" id="addcaseactivity" action="<?php echo base_url() ?>addNewCaseActivity" method="post" role="form">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="role"> Activity Results</label>
                                       <select  name="activity_result_id" class="select2 form-control required"  id="activity_result_id">
                                           <option value="">--Select Activity Results--</option>
                                           <?php
                                           if(!empty($activity_reasults)) {
                                               foreach ($activity_reasults as $ct){
                                                   ?>
                                                   <option value="<?php echo $ct->activity_result_id ?>"><?php echo $ct->activity_result_name ?></option>
                                                   <?php
                                               }
                                           }
                                           ?>
                                       </select>

                                        <input type="hidden" value="<?php echo $case_id?>"  id="case_id" name="case_id" maxlength="128">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="role">Case Activity</label>
                                       <select  name="activity_id" class="select2 form-control required"  id="activity_id">
                                           <option value="">--Select Case Activity--</option>
                                           <?php
                                           if(!empty($activitys)) {
                                               foreach ($activitys as $ct){
                                                   ?>
                                                   <option value="<?php echo $ct->activity_id ?>"><?php echo $ct->activity_name ?></option>
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
                                       <label for="role">Adjorn Reason</label>
                                       <select class="select2 form-control required" id="adjourn_id" name="adjourn_id">
                                           <option value="0">Select Adjorn Reason</option>
                                           <?php
                                           if(!empty($adjorn_reason)) {
                                               foreach ($adjorn_reason as $cs){
                                                   ?>
                                                   <option value="<?php echo $cs->adjorn_reason_id ?>"><?php echo $cs->adjorn_reason_name ?></option>
                                                   <?php
                                               }
                                            }
                                           ?>
                                       </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="role">Order Type</label>
                                       <select class="select2 form-control required" id="order_type_id" name="order_type_id">
                                           <option value="0">Select County Name</option>
                                           <?php
                                           if(!empty($order_type)) {
                                               foreach ($order_type as $ct){
                                                   ?>
                                                   <option value="<?php echo $ct->order_type_id ?>"><?php echo $ct->order_type_name ?></option>
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
                                     <label>Activity  Time</label>

                                     <div class="input-group timepicker">
                                     <div class="input-group-addon">
                                     <i class="fa fa-calendar"></i>
                                     </div>
                                     <input class=" date form-control pull-right" name="activity_time" id="activity_time" type="text">
                                     </div>
                                     <!-- /.input group -->
                                     </div>
                                  </div>
                                  <div class="col-md-6">
                                      <div class="form-group">
                                      <label>Activity  Finish Time</label>

                                      <div class="input-group timepicker">
                                      <div class="input-group-addon">
                                      <i class="fa fa-calendar"></i>
                                      </div>
                                      <input class="date form-control pull-right" name="finish_time" id="finish_time" type="text">
                                      </div>
                                      <!-- /.input group -->
                                      </div>
                                   </div>
                               </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="mobile">Adjorn Details</label>
                                        <textarea name="adjorn_details"  class="form-control" rows="3" placeholder="Adjorn Details"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="form_control_1">Activity Details</label>
                                       <textarea name="order_details" placeholder="Activity Details" rows="3" class="form-control "></textarea>

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
