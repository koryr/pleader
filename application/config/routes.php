<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/

$route['default_controller'] = "login";
$route['404_override'] = 'error';


/*********** USER DEFINED ROUTES *******************/

$route['auth'] = 'login/auth';
$route['dashboard'] = 'dashboard';
$route['logout'] = 'user/logout';
/*
*--------user routes---------------
*/
//$route['user'] = 'user/userListing';
$route['userListing'] = 'user/userListing';
$route['userListing/(:num)'] = "user/userProfile/$1";
$route['addNew'] = "user/addNew";

/********************Case defined routes *****************/
//$route['cases'] = "cases/caseList";

$route['addNewUser'] = "user/addNewUser";
$route['editOld'] = "user/editOld";
$route['editOld/(:num)'] = "user/editOld/$1";
$route['editUser'] = "user/editUser";
$route['deleteUser'] = "user/deleteUser";
$route['loadChangePass'] = "user/loadChangePass";
$route['changePassword'] = "user/changePassword";
$route['pageNotFound'] = "user/pageNotFound";
$route['checkEmailExists'] = "user/checkEmailExists";

$route['forgotPassword'] = "login/forgotPassword";
$route['resetPasswordUser'] = "login/resetPasswordUser";
$route['resetPasswordConfirmUser'] = "login/resetPasswordConfirmUser";
$route['resetPasswordConfirmUser/(:any)'] = "login/resetPasswordConfirmUser/$1";
$route['resetPasswordConfirmUser/(:any)/(:any)'] = "login/resetPasswordConfirmUser/$1/$2";
$route['createPasswordUser'] = "login/createPasswordUser";
//$route['cases'] = "cases/caseList";
$route['cases/(:num)'] = "cases/caseList/$1";
$route['caseTypes'] = "caseType/caseTypeList";
$route['caseTypes/(:num)'] = "caseType/caseTypeList/$1";

$route['addCaseType'] = "caseType/addNew";

$route['addNewCaseType'] = "caseType/addNewCaseType";

$route['newCase'] = "cases/addNew";
$route['addCase'] = "cases/addNewCase";
$route['editOldCase'] = "cases/editOldCase";
$route['editOldCase/(:num)'] = "cases/editOldCase/$1";
$route['editCase'] = "cases/editCase";
$route['viewCase'] = "caseActivity/viewCase";
$route['viewCase/(:any)'] = "caseActivity/viewCase/$1";
$route['addcaseactivity/(:any)'] = "caseActivity/addCaseActivity/$1";
$route['addNewCaseActivity'] = "CaseActivity/addNewCaseActivity";
$route['caseContact/(:any)'] = "caseActivity/caseContact/$1";
$route['addCaseContact'] = "caseActivity/addCaseContact";

$route['profile/(:any)'] = "user/userProfile/$1";
$route['activity/(:any)'] = "activity/viewActivity/$1";

$route['translate_uri_dashes'] = FALSE;
