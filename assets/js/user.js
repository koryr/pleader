$(document).ready(function(){
	show_user();	//call function show all product

	//$('#mydata').dataTable();

	//function show all product
	function show_user(){
		console.log("usseer");
	    $.ajax({
	        type  : 'ajax',
	        url   : baseURL+'user/user_data',
	        async : false,
	        dataType : 'json',
	        success : function(data){
				  console.log(data);
	            var html = '';
	            var i;
	            for(i=0; i<data.length; i++){
	                html += '<tr>'+
	                  		'<td>'+data[i].userid+'</td>'+
	                        '<td>'+data[i].name+'</td>'+
	                        '<td>'+data[i].mobile+'</td>'+
									'<td>'+data[i].email+'</td>'+
									'<td>'+data[i].user_type_name+'</td>'+
	                        '<td style="text-align:right;">'+
                                 '<a href="javascript:void(0);" class="btn btn-info btn-sm item_edit" data-userid="'+data[i].userid+'" data-product_name="'+data[i].name+'" data-price="'+data[i].mobile+'">Edit</a>'+' '+
                                 '<a href="javascript:void(0);" class="btn btn-danger btn-sm item_delete" data-userid="'+data[i].useridd+'">Delete</a>'+
                             '</td>'+
	                        '</tr>';
	            }
	            $('#show_data').html(html);
	        }

	    });
	}

     //Save product
     $('#btn_save').on('click',function(){
         var name = $('#name').val();
         var email = $('#email').val();
         var mobile = $('#mobile').val();

			var a=$('#frmAddUser').serialize();
			console.log(a);
         $.ajax({
				type : "POST",
				url  : baseURL+"user/save/",
				dataType : "JSON",
				data : a,
				success: function(data){
				  $('[name="name"]').val("");
				  $('[name="mobile"]').val("");
				  $('[name="email"]').val("");
				  $('#Modal_Add').modal('hide');
				  show_user();
			  },
			  error: function (request, status, error) {
		        alert(request.responseText);
		    }

         });
         return false;
     });

     //get data for update record
     $('#show_data').on('click','.item_edit',function(){
         var userid = $(this).data('userid');
			console.log(userid);
         var product_name = $(this).data('name');
         var mobile   = $(this).data('mobile');
			$.ajax({
             type : "POST",
             url  : baseURL+"user/get_user_data/",
             dataType : "JSON",
             data : {userid:userid},
             success: function(data){
					 var obj = data[0];
					 $('[name="userid_edit"]').val(obj.userid);
					 $('[name="name_edit"]').val(obj.name);
					 $('[name="mobile_edit"]').val(obj.mobile);
					 $('[name="email_edit"]').val(obj.email);
                $('#Modal_Edit').modal('show');
             }
         });
     });

     //update record to database
      $('#btn_update').on('click',function(){
         var userid = $('#userid_edit').val();
         var name = $('#name_edit').val();
         var mobile = $('#mobile_edit').val();
			var update_data = $('#frmUpdateUser').serialize();
         $.ajax({
             type : "POST",
             url  : baseURL+"user/update",
             dataType : "JSON",
             data : update_data,
             success: function(data){
                 $('[name="userid_edit"]').val("");
                 $('[name="name_edit"]').val("");
                 $('[name="mobile_edit"]').val("");
					  $('[name="email_edit"]').val("");
                 $('#Modal_Edit').modal('hide');
                 show_user();
            }
         });
         return false;
     });

     //get data for delete record
     $('#show_data').on('click','.item_delete',function(){
         var userid = $(this).data('userid');

         $('#Modal_Delete').modal('show');
         $('[name="userid_delete"]').val(userid);
     });

     //delete record to database
      $('#btn_delete').on('click',function(){
         var userid = $('#userid_delete').val();
         $.ajax({
             type : "POST",
             url  : baseURL+"user/delete",
             dataType : "JSON",
             data : {userid:userid},
             success: function(data){
                 $('[name="userid_delete"]').val("");
                 $('#Modal_Delete').modal('hide');
                 show_product();
             }
         });
         return false;
     });

	jQuery('ul.pagination li a').click(function (e) {
		 e.preventDefault();
		 var link = jQuery(this).get(0).href;
		 var value = link.substring(link.lastIndexOf('/') + 1);
		 jQuery("#searchList").attr("action", baseURL + "user/" + value);
		 jQuery("#searchList").submit();
	});

});
