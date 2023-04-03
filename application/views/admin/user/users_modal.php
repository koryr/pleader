<!-- MODAL ADD -->
   <form id="frmAddUser" method="post">
   <div class="modal fade" id="Modal_Add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-lg" role="document">
       <div class="modal-content">
         <div class="modal-header">
           <h5 class="modal-title" id="exampleModalLabel"><i class="fa fa-user-plus"></i>Add New User</h5>
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span>
           </button>
         </div>
         <div class="modal-body">
            <div class="form-group row">
                <label class="col-md-2 col-form-label">Name</label>
                <div class="col-md-10">
                  <input type="text" name="name" id="name" class="form-control required" placeholder="Full Name">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-2 col-form-label">Mobile</label>
                <div class="col-md-10">
                  <input type="text" name="mobile" id="mobile" class="form-control required" placeholder="Mobile Number">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-2 col-form-label">Email Address</label>
                <div class="col-md-10">
                  <input type="text" name="email" id="email" class="form-control" placeholder="Email Address">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-2 col-form-label">User Role</label>
                <div class="col-md-10">
                   <select class="form-control required" id="roleid" name="roleid">
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
            <div class="form-group row">
                <label class="col-md-2 col-form-label">User Type</label>
                <div class="col-md-10">
                   <select class="form-control required" id="user_type_id" name="user_type_id">
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
            <div class="form-group row">
                <label class="col-md-2 col-form-label">Password</label>
                <div class="col-md-10">
                  <input type="text" name="password" id="password" class="form-control required" placeholder="Password Number">
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
