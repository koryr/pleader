<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-users"></i> Activity Deffinitions <small>Add, Edit, Delete</small>
      </h1>
    </section>
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#activity" data-toggle="tab">Activity </a></li>
              <li class=""><a href="#adivity_results" data-toggle="tab">Activity Results</a></li>
              <li class=""><a href="#adjorn_reason" data-toggle="tab">Adjorn Reason</a></li>
              <li class=""><a href="#order_types" data-toggle="tab">Order Types</a></li>
            </ul>
            <div class="tab-content">
              <!-- Font Awesome Icons -->
              <div class="tab-pane active" id="activity">
                 <div class="row">
                     <div class="col-xs-12 text-right">
                         <div class="form-group">
                             <a class="btn btn-primary" href="<?php echo base_url(); ?>addCaseType"><i class="fa fa-plus"></i> Add New</a>
                         </div>
                     </div>
                 </div>
                 <div class="row">
                     <div class="col-xs-12">
                       <div class="box">
                         <div class="box-header">
                             <h3 class="box-title">Activities</h3>
                             <div class="box-tools">
                                 <form action="<?php echo base_url() ?>caseTypes" method="POST" id="searchList">
                                     <div class="input-group">
                                       <input type="text" name="searchText" value="" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
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
                                  <th> # </th>
                                  <th> Activity Type </th>
                                  <th style="width: 135px;" > Action </th>
                              </tr>
                             <?php
                             if(!empty($caseTypeRecords)) {
                                 foreach($caseTypeRecords as $record){
                             ?>
                             <tr>
                               <td><?php echo $record->case_type_id ?></td>
                               <td><?php echo $record->case_type_name ?></td>

                               <td class="text-center">
                                   <a class="btn btn-sm btn-info" href="<?php echo base_url().'editOld/'.$record->case_type_id; ?>"><i class="fa fa-pencil"></i></a>
                                   <a class="btn btn-sm btn-danger deleteUser" href="#" data-caseid="<?php echo $record->case_type_id; ?>"><i class="fa fa-trash"></i></a>
                               </td>
                             </tr>
                             <?php
                                 }
                             }
                             ?>
                           </table>

                         </div><!-- /.box-body -->
                         <div class="box-footer clearfix">

                         </div>
                       </div><!-- /.box -->
                     </div>
                 </div>

              </div>
              <!-- /#fa-icons -->

              <!-- glyphicons-->
              <div class="tab-pane" id="adivity_results">


              </div>
              <div class="tab-pane" id="adjorn_reason">


              </div>
              <div class="tab-pane" id="order_types">


              </div>
              <!-- /#ion-icons -->

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
    <section class="content">

    </section>
</div>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/common.js" charset="utf-8"></script>
<script type="text/javascript">
    jQuery(document).ready(function(){
        jQuery('ul.pagination li a').click(function (e) {
            e.preventDefault();
            var link = jQuery(this).get(0).href;
            var value = link.substring(link.lastIndexOf('/') + 1);
            jQuery("#searchList").attr("action", baseURL + "caseTypes/" + value);
            jQuery("#searchList").submit();
        });
    });
</script>
