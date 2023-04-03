$(document).ready(function(){
   $('.select2').select2();
   $('.date').datepicker({
         autoclose: true
      });
   show_cases();
   //function show all cases
	function show_cases(){
	    $.ajax({
	        type  : 'ajax',
	        url   : baseURL+'cases/case_data',
	        async : false,
	        dataType : 'json',
	        success : function(data){
				  console.log(data);
	            var html = '';
	            var i;
	            for(i=0; i<data.length; i++){
	                html += '<tr>'+
	                  		'<td>'+data[i].case_id+'</td>'+
	                        '<td>'+data[i].case_title+'</td>'+
	                        '<td>'+data[i].case_type_name+'</td>'+
									'<td>'+data[i].case_category_name+'</td>'+
									'<td>'+data[i].county_name+'</td>'+
                           '<td>'+data[i].alleged_crime+'</td>'+
                           '<td>'+data[i].change_date+'</td>'+
	                        '<td style="text-align:right;">'+
                                 '<a href="javascript:void(0);" class="btn btn-info btn-sm item_edit" data-userid="'+data[i].case_id+'" >Edit</a>'+
                                 '<a href="javascript:void(0);" class="btn btn-danger btn-sm item_delete" data-userid="'+data[i].case_id+'">Delete</a>'+
                             '</td>'+
	                        '</tr>';
	            }
	            $('#show_data').html(html);
	        }

	    });
	}
});
