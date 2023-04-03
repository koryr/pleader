CREATE OR REPLACE VIEW vw_users AS
   SELECT users.userId, users.name, users.password, orgs.orgId, users.is_active, roles.function_role,
   roles.role, orgs.org_name, roles.roleId, users.updatedBy, users.updatedDtm, users.email, users.user_type_id,user_types.user_type_name,
   b.name as created_by_name, users.createdBy, users.mobile, users.dob, users.gender, users.createdDtm,users.isdeleted
   FROM users
   INNER JOIN roles ON roles.roleId = users.roleId
   INNER JOIN orgs ON orgs.orgId = users.orgId
   INNER JOIN user_types ON user_types.user_type_id = users.user_type_id
   LEFT OUTER JOIN users b ON b.userId = users.createdBy;

   CREATE VIEW vw_counties AS
	SELECT regions.region_id, regions.region_name, counties.county_id, counties.county_name, counties.details
	FROM counties INNER JOIN regions ON counties.region_id = regions.region_id;


   CREATE VIEW vw_court_stations AS
   	SELECT vw_counties.region_id, vw_counties.region_name, vw_counties.county_id, vw_counties.county_name,
   		court_ranks.court_rank_id, court_ranks.court_rank_name, court_stations.court_station_id, court_stations.court_station_name,
   		court_stations.orgId, court_stations.court_station_code, court_stations.details,
   		(court_ranks.court_rank_name || ' : ' || court_stations.court_station_name) as court_station
   	FROM court_stations INNER JOIN court_ranks ON court_stations.court_rank_id = court_ranks.court_rank_id
   		INNER JOIN vw_counties ON vw_counties.county_id = court_stations.county_id;

   CREATE VIEW vw_court_divisions AS
   	SELECT vw_court_stations.region_id, vw_court_stations.region_name, vw_court_stations.county_id, vw_court_stations.county_name,
   		vw_court_stations.court_rank_id, vw_court_stations.court_rank_name, vw_court_stations.court_station_id, vw_court_stations.court_station_name,
   		vw_court_stations.court_station_code, vw_court_stations.court_station,
   		division_types.division_type_id, division_types.division_type_name, court_divisions.orgId,
   		court_divisions.court_division_id, court_divisions.court_division_code, court_divisions.court_division_num,
   		court_divisions.details,
   		(vw_court_stations.court_station || ' : ' || division_types.division_type_name) as court_division
   	FROM court_divisions INNER JOIN vw_court_stations ON court_divisions.court_station_id = vw_court_stations.court_station_id
   	INNER JOIN division_types ON court_divisions.division_type_id = division_types.division_type_id;

   CREATE OR REPLACE VIEW vw_case_category AS
   SELECT case_category.case_category_id , case_category.case_category_name ,
   	case_category.case_category_title, case_category.case_category_no , case_category.act_code, case_category.prefix,
   	case_category.death_sentence, case_category.life_sentence, case_category.min_sentence, case_category.max_sentence,
   	case_category.min_fine, case_category.max_fine, case_category.min_canes, case_category.max_canes, case_category.details,
   	case_types.case_type_id,case_types.case_type_name
   	FROM case_category
   	INNER JOIN case_types ON case_types.case_type_id = case_category.case_type_id;

   CREATE OR REPLACE VIEW vw_cases AS
   SELECT cases.case_id, cases.case_title, cases.case_number, cases.file_number, cases.alleged_crime, cases.start_date,
      counties.county_id, counties.county_name, case_types.case_type_id, case_types.case_type_name,
   	case_category.case_category_id, case_category.case_category_name, cases.change_date

      FROM cases
      INNER JOIN counties ON counties.county_id = cases.county_id

   	INNER JOIN case_types ON case_types.case_type_id = cases.case_type_id
   	INNER JOIN case_category ON case_category.case_category_id = cases.case_category_id;


   CREATE OR REPLACE VIEW vw_calendar_events AS
    SELECT calendar_events.calendar_event_id, vw_users.userId, calendar_events.event_title||'\n'||calendar_events.details  as title, vw_users.name ,	calendar_events.url ,calendar_events.start_date as start,	calendar_events.end_date  as end,
   	calendar_events.event_date , calendar_events.backgroundColor as  backgroundColor, calendar_events.allday :: varchar
      FROM calendar_events
      JOIN vw_users ON vw_users.userId = calendar_events.userId;

   CREATE OR REPLACE VIEW vw_case_activity AS
      SELECT case_activity.case_activity_id, case_activity.activity_id, case_activity.order_type_id, case_activity.appeal_case_id,
      case_activity.orgId,  case_activity.activity_date, case_activity.activity_time, case_activity.finish_time, case_activity.shared_hearing,
      case_activity.completed, case_activity.is_active, case_activity.change_by, case_activity.change_date,
      case_activity.urgency_certificate, case_activity.order_title, case_activity.order_narrative,
      case_activity.order_details, case_activity.appeal_details, case_activity.result_details, case_activity.adjorn_details,
      case_activity.details, case_activity.application_date, case_activity.approve_status, case_activity.workflow_table_id,
      case_activity.action_date, vw_cases.case_id, vw_cases.case_title, vw_cases.case_number, vw_cases.file_number,
      vw_cases.alleged_crime, vw_cases.start_date, order_types.order_type_name,
      adjorn_reasons.adjorn_reason_id, adjorn_reasons.adjorn_reason_name, activity_results.activity_result_id,
      activity_results.activity_result_name, activitys.activity_name,orgs.org_name
      FROM case_activity
      INNER JOIN vw_cases ON case_activity.case_id = vw_cases.case_id
      INNER JOIN order_types ON case_activity.order_type_id = order_types.order_type_id
      INNER JOIN adjorn_reasons ON case_activity.adjorn_reason_id = adjorn_reasons.adjorn_reason_id
      INNER JOIN activity_results ON case_activity.activity_result_id = activity_results.activity_result_id
      INNER JOIN activitys ON case_activity.activity_id = activitys.activity_id
      INNER JOIN orgs ON case_activity.orgId = orgs.orgId;

      CREATE OR REPLACE VIEW vw_advocateActivity AS
      SELECT users.userId, users.name, users.password,  orgs.orgId, users.is_active,
         roles.function_role, roles.role,orgs.org_name,roles.roleId,
         users.name as created_by_name, users.createdBy,users.email,users.mobile,users.dob,users.gender
         FROM users
         INNER JOIN roles ON roles.roleId = users.roleId
         INNER JOIN orgs ON orgs.orgId = users.orgId
         INNER JOIN cases ON cases.userId = users.userId;

         CREATE VIEW vw_case_contacts AS
   	SELECT vw_cases.case_type_id, vw_cases.case_type_name,
   		vw_cases.case_category_id, vw_cases.case_category_name,
   		vw_cases.case_number,
   		vw_cases.county_id, vw_cases.county_name,

   		vw_cases.case_id, vw_cases.case_title, vw_cases.file_number, vw_cases.start_date,
   		vw_cases.alleged_crime,
   		vw_users.userId,vw_users.name, vw_users.email,
   		vw_users.gender, vw_users.dob,
   		contact_types.contact_type_id, contact_types.contact_type_name, contact_types.bench,
   		case_contacts.orgId, case_contacts.case_contact_id, case_contacts.case_contact_no,
   		case_contacts.is_active, case_contacts.is_disqualified, case_contacts.change_date, case_contacts.change_by,
   		case_contacts.election_winner, case_contacts.details
   	FROM case_contacts INNER JOIN vw_cases ON case_contacts.case_id = vw_cases.case_id
   		INNER JOIN vw_users ON case_contacts.userId = vw_users.userId
   		INNER JOIN contact_types ON case_contacts.contact_type_id = contact_types.contact_type_id
