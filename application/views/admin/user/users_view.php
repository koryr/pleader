<!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>User
        <small>List</small>
        <div class="float-right"><a href="javascript:void(0);" class="btn btn-primary" data-toggle="modal" data-target="#Modal_Add"><span class="fa fa-plus"></span> Add New</a></div>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="dashboard">Dashboard</a></li>
        <li class="active">Users</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Page Heading -->
       <div class="row">
           <div class="col-12">
             <div class="box">
             <div class="box-tools">
                 <form action="<?php echo base_url() ?>user" method="POST" id="searchList">
                     <div class="input-group">
                       <input type="text" name="searchText" value="<?php echo $searchText; ?>" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
                       <div class="input-group-btn">
                        <button class="btn btn-sm btn-default searchList"><i class="fa fa-search"></i></button>
                       </div>
                     </div>
                 </form>
             </div>
             <div class="box-body table-responsive no-padding">
               <table class="table table-hover" id="mydata">
                   <thead>
                       <tr>
                           <th>User Id</th>
                           <th>Name</th>
                           <th>Mobile</th>
                           <th>Email Address</th>
                           <th>User Type</th>
                           <th style="text-align: right;">Actions</th>
                       </tr>
                   </thead>
                   <tbody id="show_data">

                   </tbody>
               </table>
            </div>
            <div class="box-footer clearfix">
               <?php echo $this->pagination->create_links(); ?>
          </div>
         </div>
           </div>

       </div>

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<script type="text/javascript" src="<?php echo base_url();?>assets/plugins/datatables/jquery.dataTables.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/user.js" charset="utf-8"></script>
