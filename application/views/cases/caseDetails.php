<div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <section class="content-header">
      <h1>
      <i class="fa fa-plus"></i> Case Details
      <small>Case contacts </small>
      </h1>
   </section>

    <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
             <p>Case Details</p>

              <?php
              if(!empty($caseDetails)) {
                  foreach($caseDetails as $record){
              ?>
              <b>Case Title :</b>  <?php echo $record->case_title ?></br>

              <b>Case Type Name :</b> <?php echo $record->case_type_name ?></br>
              <b>Start Date :</b>  <?php echo $record->start_date ?></br>
              <?php
                  }
              }
              ?>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->


          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#activity" data-toggle="tab">Activity</a></li>
              <li><a href="#timeline" data-toggle="tab">Parties</a></li>

            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="activity">
                 <section class="content">
                     <div class="row">
                         <div class="col-xs-12 text-right">
                             <div class="form-group">
                                 <a class="btn btn-primary" href="<?php echo base_url(); ?>addcaseactivity/<?php echo $case_id?>"><i class="fa fa-plus"></i> Add Case Activity</a>
                             </div>

                         </div>
                     </div>
                     <div class="row">
                         <div class="col-xs-12">
                           <div class="box">
                             <div class="box-header">
                                 <h3 class="box-title">Case Activity List</h3>
                                 <div class="box-tools">
                                     <form action="<?php echo base_url() ?>userListing" method="POST" id="searchList">
                                         <div class="input-group">
                                           <input type="text" name="searchText" value="<?php echo $searchText; ?>" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
                                           <div class="input-group-btn">
                                             <button class="btn btn-sm btn-default searchList"><i class="fa fa-search"></i></button>
                                           </div>
                                         </div>
                                     </form>
                                 </div>
                             </div><!-- /.box-header -->
                             <div class="box-body table-responsive no-padding">
                               <table class="table table-hover">
                                  <tr>
                                     <th>Activity Case Id</th>
                                     <th>Activity </th>
                                     <th>Adjorn Reason </th>
                                     <th>Date </th>
                                     <th>Time </th>
                							 <th style="width: 140px;" > Actions </th>
                						</tr>
                                 <?php
                                 if(!empty($activityRecords)) {
                                     foreach($activityRecords as $record){
                                 ?>
                                 <tr>
                                   <td><?php echo $record->case_activity_id ?></td>
                                   <td><?php echo $record->activity_name ?></td>
                                   <td><?php echo $record->adjorn_reason_name ?></td>
                                    <td><?php echo $record->activity_date ?></td>
                                   <td><?php echo $record->activity_time ?></td>

                                   <td class="text-center">
                                       <a class="btn btn-sm btn-success" href="<?php echo base_url().'activity/'.$record->case_activity_id; ?>"><i class="fa fa-arrow-right"></i></a>
                                       <a class="btn btn-sm btn-info" href="<?php echo base_url().'editOldCase/'.$record->case_id; ?>"><i class="fa fa-pencil"></i></a>
                                       <a class="btn btn-sm btn-danger deleteCase" href="#" data-caseid="<?php echo $record->case_id; ?>"><i class="fa fa-trash"></i></a>
                                   </td>
                                 </tr>
                                 <?php
                                     }
                                 }
                                 ?>
                               </table>

                             </div><!-- /.box-body -->
                             <div class="box-footer clearfix">
                                 <?php echo $this->pagination->create_links(); ?>
                             </div>
                           </div><!-- /.box -->
                         </div>
                     </div>
                 </section>
                <!-- /.post -->
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="timeline">
                 <section class="content">
                    <div class="row">
                        <div class="col-xs-12 text-right">
                           <div class="form-group">
                                <a class="btn btn-primary" href="<?php echo base_url(); ?>caseContact/<?php echo $case_id?>"><i class="fa fa-plus"></i> Add Case Contact</a>
                           </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                          <div class="box">
                           <div class="box-header">
                                <h3 class="box-title">Case Contact List</h3>
                                <div class="box-tools">
                                    <form action="<?php echo base_url() ?>contactListing" method="POST" id="searchList">
                                        <div class="input-group">
                                          <input type="text" name="searchText" value="<?php echo $searchText; ?>" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
                                          <div class="input-group-btn">
                                            <button class="btn btn-sm btn-default searchList"><i class="fa fa-search"></i></button>
                                          </div>
                                        </div>
                                    </form>
                                </div>
                           </div><!-- /.box-header -->
                           <div class="box-body table-responsive no-padding">
                              <table class="table table-hover">
                                 <tr>
                                    <th>Contact Type Name</th>
                                    <th>Contat Name </th>
                                    <th>Case Contact Number </th>
                                    <th style="width: 140px;" > Actions </th>
                                </tr>
                                <?php
                                if(!empty($contacts)) {
                                    foreach($contacts as $record){
                                ?>
                                <tr>
                                 <td><?php echo $record->contact_type_name ?></td>
                                 <td><?php echo $record->name ?></td>
                                 <td><?php echo $record->case_contact_no ?></td>

                                 <td class="text-center">
                                      <a class="btn btn-sm btn-success" href="<?php echo base_url().'viewCase/'.$record->case_contact_id; ?>"><i class="fa fa-arrow-right"></i></a>
                                      <a class="btn btn-sm btn-info" href="<?php echo base_url().'editOldCase/'.$record->case_id; ?>"><i class="fa fa-pencil"></i></a>
                                      <a class="btn btn-sm btn-danger deleteCase" href="#" data-caseid="<?php echo $record->case_id; ?>"><i class="fa fa-trash"></i></a>
                                 </td>
                                </tr>
                                <?php
                                    }
                                }
                                ?>
                              </table>

                           </div><!-- /.box-body -->
                           <div class="box-footer clearfix">
                                <?php echo $this->pagination->create_links(); ?>
                           </div>
                          </div><!-- /.box -->
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
