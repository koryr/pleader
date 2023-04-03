<!-- MODAL ADD -->
   <form id="frmAddCase" method="post">
   <div class="modal fade" id="Modal_Add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-lg" role="document">
       <div class="modal-content">
         <div class="modal-header">
           <h5 class="modal-title" id="exampleModalLabel"><i class="fa fa-user-plus"></i>Add New Case</h5>
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span>
           </button>
         </div>
         <div class="modal-body">
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
           <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
           <button type="button" type="submit" id="btn_save" class="btn btn-primary">Save</button>
         </div>
       </div>
     </div>
   </div>
   </form>
<!--END MODAL ADD-->

     <!-- MODAL EDIT -->
     <form id="frmUpdateUser">
         <div class="modal fade" id="Modal_Edit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
           <div class="modal-dialog modal-lg" role="document">
             <div class="modal-content">
               <div class="modal-header">
                 <h5 class="modal-title" id="exampleModalLabel">Edit User</h5>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                   <span aria-hidden="true">&times;</span>
                 </button>
               </div>
               <div class="modal-body">
                     <div class="form-group row">
                         <label class="col-md-2 col-form-label">User ID</label>
                         <div class="col-md-10">
                           <input type="text" name="userid_edit" id="userid_edit" class="form-control" placeholder="User Id" readonly>
                         </div>
                     </div>
                     <div class="form-group row">
                         <label class="col-md-2 col-form-label">Name</label>
                         <div class="col-md-10">
                           <input type="text" name="name_edit" id="name_edit" class="form-control" placeholder="Name">
                         </div>
                     </div>
                     <div class="form-group row">
                         <label class="col-md-2 col-form-label">Mobile</label>
                         <div class="col-md-10">
                           <input type="text" name="mobile_edit" id="mobile_edit" class="form-control" placeholder="Mobile">
                         </div>
                     </div>
                     <div class="form-group row">
                         <label class="col-md-2 col-form-label">Email Address</label>
                         <div class="col-md-10">
                           <input type="text" name="email_edit" id="email_edit" class="form-control" placeholder="Email Address">
                         </div>
                     </div>
               </div>
               <div class="modal-footer">
                 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                 <button type="button" type="submit" id="btn_update" class="btn btn-primary">Update</button>
               </div>
             </div>
           </div>
         </div>
         </form>
     <!--END MODAL EDIT-->

     <!--MODAL DELETE-->
      <form>
         <div class="modal fade" id="Modal_Delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
           <div class="modal-dialog" role="document">
             <div class="modal-content">
               <div class="modal-header">
                 <h5 class="modal-title" id="exampleModalLabel">Delete User</h5>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                   <span aria-hidden="true">&times;</span>
                 </button>
               </div>
               <div class="modal-body">
                    <strong>Are you sure to delete this record?</strong>
               </div>
               <div class="modal-footer">
                 <input type="hidden" name="userid_delete" id="userid_delete" class="form-control">
                 <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                 <button type="button" type="submit" id="btn_delete" class="btn btn-primary">Yes</button>
               </div>
             </div>
           </div>
         </div>
         </form>
     <!--END MODAL DELETE-->
