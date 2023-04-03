<div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <section class="content-header">
      <h1>
      <i class="fa fa-gear"></i> Activity Details
      <small>Activity Details</small>
      </h1>
   </section>

    <section class="content">

      <div class="row">

        <!-- /.col -->
        <div class="col-md-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#deails" data-toggle="tab">Details</a></li>
              <li><a href="#orders" data-toggle="tab">Orders</a></li>
              <li class=""><a href="#decision" data-toggle="tab">Decision</a></li>

            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="deails">
                 <section class="content">
                     <div class="row">
                         <div class="col-xs-12 text-right">
                             <div class="form-group">
                                 <a class="btn btn-primary" href="<?php echo base_url(); ?>addcaseactivity/<?php echo $activity_id?>"><i class="fa fa-plus"></i> Save</a>
                             </div>

                         </div>
                     </div>
                     <div class="row">
                         <div class="col-xs-12">
                            <?php
                            if(!empty($activityDetails)) {
                            ?>
                               <form action="<?php echo base_url() ?>userListing" method="POST" id="searchList">
                                  <div class="form-group">
                                     <label>Location:</label>
                                     <select class="form-control select2" style="width: 100%;">
                                       <option selected="selected">Alabama</option>
                                       <option>Alaska</option>
                                       <option>California</option>
                                       <option>Delaware</option>
                                       <option>Tennessee</option>
                                       <option>Texas</option>
                                       <option>Washington</option>
                                    </select>
                                 </div>

                                 <div class="form-group">
                                    <label>Activity:</label>
                                    <select class="form-control select2" style="width: 100%;">
                                      <option selected="selected">Alabama</option>
                                      <option>Alaska</option>
                                      <option>California</option>
                                      <option>Delaware</option>
                                      <option>Tennessee</option>
                                      <option>Texas</option>
                                      <option>Washington</option>
                                   </select>
                                </div>

                                <div class="form-group">
                                    <label>Date masks:</label>
                                    <div class="input-group">
                                       <div class="input-group-addon">
                                         <i class="fa fa-calendar"></i>
                                       </div>
                                       <input class="form-control" value="<?php echo $activityDetails->activity_date?>" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask="" type="text">
                                    </div>
                                     <!-- /.input group -->
                                 </div>
                                 <div class="form-group">
                                     <label>Activity Time:</label>
                                     <div class="input-group">
                                        <div class="input-group-addon">
                                          <i class="fa fa-calendar"></i>
                                        </div>
                                        <input class="form-control" value="<?php echo $activityDetails->activity_time?>" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask="" type="text">
                                     </div>
                                      <!-- /.input group -->
                                  </div>

                                  <div class="form-group">
                                      <label>Finish Time:</label>
                                      <div class="input-group">
                                         <div class="input-group-addon">
                                           <i class="fa fa-calendar"></i>
                                         </div>
                                         <input class="form-control" value="<?php echo $activityDetails->finish_time?>" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask="" type="text">
                                      </div>
                                       <!-- /.input group -->
                                   </div>

                                   <div class="form-group">
                                      <label>Urgency Cert. No.:</label>
                                      <div class="input-group">

                                         <input class="form-control" value="<?php echo $activityDetails->urgency_certificate?>" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask="" type="text">
                                      </div>
                                       <!-- /.input group -->
                                   </div>

                                   <div class="form-group">
                                      <label>Details:</label>
                                         <textarea class="form-control" > <?php echo $activityDetails->details?></textarea>
                                       <!-- /.input group -->
                                   </div>
                                   <div class="form-group">
                                      <label>Order:</label>
                                      <select class="form-control select2" style="width: 100%;">
                                          <option selected="selected"><?php echo $activityDetails->order_type_id?></option>

                                       </select>

                                       <!-- /.input group -->
                                   </div>
                                   <div class="form-group">
                                      <label>Orders Details:</label>
                                         <textarea class="form-control" ><?php echo $activityDetails->order_details?></textarea>

                                       <!-- /.input group -->
                                   </div>
                                   <div class="form-group">
                                     <label>Adjorn Reason :</label>
                                     <select class="form-control select2" style="width: 100%;">
                                         <option selected="selected"><?php echo $activityDetails->adjorn_reason_id?></option>

                                      </select>

                                      <!-- /.input group -->
                                  </div>
                                  <div class="form-group">
                                     <label>Adjorn Details:</label>
                                        <textarea class="form-control" ><?php echo $activityDetails->adjorn_details?> </textarea>

                                      <!-- /.input group -->
                                  </div>
                            </form>
                            <?php } ?>

                         </div>
                     </div>
                 </section>
                <!-- /.post -->
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="orders">
                 <section class="content">
                    <div class="row">
                        <div class="col-xs-12 text-right">
                           <div class="form-group">
                                <a class="btn btn-primary" href="<?php echo base_url(); ?>caseContact/"><i class="fa fa-plus"></i> Add Order</a>
                           </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">

                           <?php
                           if(!empty($activityDetails)) {
                           ?>
                              <form action="<?php echo base_url() ?>userListing" method="POST" id="searchList">
                                 <div class="form-group">
                                   <label>Type :</label>
                                   <select class="form-control select2" >
                                       <option selected="selected"><?php echo $activityDetails->adjorn_reason_id?></option>

                                    </select>

                                    <!-- /.input group -->
                                </div>



                              <div class="form-group">
                                   <label>Tittle:</label>
                                      <input class="form-control" name="title" value="<?php echo $activityDetails->urgency_certificate?>" type="text">

                                    <!-- /.input group -->
                                </div>


                                  <div class="form-group">
                                     <label>Narrative:</label>
                                        <input class="form-control" name="narrative" value="<?php echo $activityDetails->urgency_certificate?>" placeholder="Narrative" type="text">

                                      <!-- /.input group -->
                                  </div>

                                  <div class="form-group">
                                     <label>Details:</label>
                                        <textarea class="form-control" > <?php echo $activityDetails->details?></textarea>
                                      <!-- /.input group -->
                                  </div>


                           </form>
                           <?php } ?>
                           <!-- /.box-body -->

                        </div>
                    </div>
                 </section>
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="decision">
                 <section class="content">
                    <div class="row">
                        <div class="col-xs-12 text-right">
                           <div class="form-group">
                                <a class="btn btn-primary" href="<?php echo base_url(); ?>caseContact/"><i class="fa fa-plus"></i> Add Decision</a>
                           </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">

                           <?php
                           if(!empty($activityDetails)) {
                           ?>
                              <form action="<?php echo base_url() ?>userListing" method="POST" id="searchList">
                                 <div class="form-group">
                                   <label>Decision Type :</label>
                                   <select class="form-control select2" style="width: 100%;">
                                       <option selected="selected"><?php echo $activityDetails->adjorn_reason_id?></option>

                                    </select>

                                    <!-- /.input group -->
                                </div>



                              <div class="form-group">
                                   <label>Judgement Sttatus:</label>
                                   <div class="input-group">

                                      <input class="form-control" value="<?php echo $activityDetails->urgency_certificate?>" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask="" type="text">

                                   </div>
                                    <!-- /.input group -->
                                </div>


                                  <div class="form-group">
                                     <label>Judgement Date:</label>
                                     <div class="input-group">
                                        <div class="input-group">
                                           <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                           </div>
                                           <input class="form-control" value="<?php echo $activityDetails->activity_date?>" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask="" type="text">
                                        </div>
                                     </div>
                                      <!-- /.input group -->
                                  </div>

                                  <div class="form-group">
                                     <label>Decision Summary:</label>
                                        <textarea class="form-control" > <?php echo $activityDetails->details?></textarea>
                                      <!-- /.input group -->
                                  </div>


                           </form>
                           <?php } ?>
                           <!-- /.box-body -->

                        </div>
                    </div>
                 </section>
              </div>
              <!-- /.tab-pane -->

            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    <div>
</div>
</section>
</div>
