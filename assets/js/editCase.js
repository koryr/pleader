/**
 * File : editUser.js
 *
 * This file contain the validation of edit user form
 *
 * @author Kishor Mali
 */
$(document).ready(function(){

	var editCaseForm = $("#editCase");

	var validator = editCaseForm.validate({

		rules:{
			case_title :{ required : true },
			case_type_id : { required : true, selected : true},
			case_category_id : {required : true, selected : true},
			county_id : { required : true, selected : true },
			alleged_crime : { required : true}
		},
		messages:{
			case_title :{ required : "This field is required" },
			case_type_id : { required : "This field is required" },
			case_category_id : {required : "This field is required"},
			county_id : { required : "This field is required"},
			alleged_crime : { required : "This field is required", selected : "Please select atleast one option" }
		}
	});
});
