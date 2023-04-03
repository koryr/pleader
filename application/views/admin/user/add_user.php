
<div class="modal modal-default fade" id="addUser">
 <div class="modal-dialog">
   <div class="modal-content">
     <div class="modal-header">
       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
         <span aria-hidden="true">&times;</span></button>
       <h4 class="modal-title">Add New User</h4>
     </div>
     <div class="modal-body">


       <div class="row">
           <!-- left column -->
           <div class="col-md-12">
             <!-- general form elements -->
               <div class="box box-primary">
                   <div class="box-header">
                       <h3 class="box-title">Enter User Details</h3>
                   </div><!-- /.box-header -->
                   <!-- form start -->

                   <form role="form" id="addUser" action="<?php echo base_url() ?>addNewUser" method="post" role="form">
                       <div class="box-body">
                           <div class="row">
                               <div class="col-md-6">
                                   <div class="form-group">
                                       <label for="fname">Full Name</label>
                                       <input type="text" class="form-control required" id="fname" name="fname" maxlength="128">
                                   </div>
                               </div>
                               <div class="col-md-6">
                                   <div class="form-group">
                                       <label for="email">Email address</label>
                                       <input type="text" class="form-control required email" id="email"  name="email" maxlength="128">
                                   </div>
                               </div>
                           </div>

                           <div class="row">
                               <div class="col-md-6">
                                   <div class="form-group">
                                       <label for="mobile">Mobile Number</label>
                                       <input type="text" class="form-control required digits" id="mobile" name="mobile" maxlength="10">
                                   </div>
                               </div>
                               <div class="col-md-6">
                                   <div class="form-group">
                                       <label for="role">Role</label>
                                       <select class="form-control required" id="role" name="role">
                                           <option value="0">Select Role</option>
                                           <?php
                                           if(!empty($roles)) {
                                               foreach ($roles as $rl){
                                                   ?>
                                                   <option value="<?php echo $rl->roleid ?>"><?php echo $rl->role ?></option>
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
                                       <label for="role">User Type</label>
                                       <select class="form-control required" id="role" name="role">
                                           <option value="0">Select User Type</option>
                                           <?php
                                           if(!empty($usertype)) {
                                               foreach ($usertype as $rl){
                                                   ?>
                                                   <option value="<?php echo $rl->user_type_id ?>"><?php echo $rl->user_type_name ?></option>
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
                                       <label for="password">Password</label>
                                       <input type="password" class="form-control required" id="password"  name="password" maxlength="10">
                                   </div>
                               </div>
                               <div class="col-md-6">
                                   <div class="form-group">
                                       <label for="cpassword">Confirm Password</label>
                                       <input type="password" class="form-control required equalTo" id="cpassword" name="cpassword" maxlength="10">
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
     </div>
     <div class="modal-footer">
       <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
       <button type="button" class="btn btn-outline">Save changes</button>
     </div>
   </div>
   <!-- /.modal-content -->
 </div>
 <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
