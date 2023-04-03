<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-users"></i> Case Contact Type
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
                        <h3 class="box-title">Enter case Contact Details</h3>
                    </div><!-- /.box-header -->
                    <!-- form start -->

                    <form role="form" id="addCaseContact" action="<?php echo base_url() ?>addCaseContact" method="post" role="form">
                        <div class="box-body">
                           <div class="row">
                              <div class="col-md-6">
                                  <div class="form-group">
                                       <label for="role">User Id</label>
                                       <input type="hidden" value="<?php echo $case_id?>"  id="case_id" name="case_id" maxlength="128">
                                       <select class="form-control required" id="user_id" name="user_id">
                                          <option value="0">Select User</option>
                                          <?php
                                          if(!empty($users)) {
                                               foreach ($users as $rl){
                                                   ?>
                                                   <option value="<?php echo $rl->userid ?>"><?php echo $rl->name ?></option>
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
                                        <label for="role">Contact Type</label>
                                        <select class="form-control required" id="contact_type" name="contact_type">
                                            <option value="0">Select Contact Type</option>
                                            <?php
                                            if(!empty($contactType)) {
                                                foreach ($contactType as $rl){
                                                    ?>
                                                    <option value="<?php echo $rl->contact_type_id ?>"><?php echo $rl->contact_type_name ?></option>
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
                                        <label for="mobile">Contact Number : </label>
                                        <input type="text" class="form-control required digits" id="contact_number" name="contact_number" maxlength="10">
                                    </div>
                                </div>

                           </div>

                           <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="password">Details</label>
                                        <input type="text" class="form-control required" id="details"  name="details" maxlength="10">
                                    </div>
                                </div>

                           </div>
                        </div><!-- /.box-body -->

                        <div class="box-footer">
                           <input type="submit" class="btn btn-primary" value="Submit" />
                           <input type="reset" class="btn btn-default" value="Reset" />
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
<script src="<?php echo base_url(); ?>assets/js/addUser.js" type="text/javascript"></script>
