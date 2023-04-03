<!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Cases
        <small>cases</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
         <li><a href="dashboard">Dashboard</a></li>
        <li class="active">Cases</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
          <div class="col-xs-12 text-right">
             <div class="form-group">
                  <a href="javascript:void(0);" class="btn btn-primary" data-toggle="modal" data-target="#Modal_Add"><span class="fa fa-plus"></span> Add New</a>
                  <a class="btn btn-primary" href="<?php echo base_url(); ?>newCase"><i class="fa fa-plus"></i> Add New</a>
             </div>
          </div>
      </div>
      <div class="row">
          <div class="col-xs-12">
            <div class="box">
              <div class="box-header">
                  <h3 class="box-title">Case List</h3>
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
                       <th> # </th>
                       <th> Case Title </th>
                       <th> Case Type Name </th>
                       <th> Case Category name </th>
                       <th> County </th>
                       <th> Alleged Crime </th>
                       <th> Date Change </th>
                       <th style="width: 140px;" > Actions </th>
                   </tr>
                     <tbody id="show_data">

                     </tbody>

                </table>

              </div><!-- /.box-body -->
              <div class="box-footer clearfix">
                  <?php echo $this->pagination->create_links(); ?>
              </div>
            </div><!-- /.box -->
          </div>
      </div>

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <script type="text/javascript" src="<?php echo base_url(); ?>assets/js/cases/cases.js" charset="utf-8"></script>
