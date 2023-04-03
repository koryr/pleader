CREATE TABLE orgs (
	orgId					   serial primary key,
	org_name				   varchar(50) not null unique,
	org_sufix				varchar(4) not null unique,
	parent				   integer,
	is_active				boolean not null default true,
	logo					   varchar(50),
	pin 					   varchar(50),
	details					text
);

CREATE TABLE regions (
	region_id				serial primary key,
	region_name				varchar(50) not null unique,
	details					text
);
CREATE TABLE counties (
	county_id				serial primary key,
	region_id				integer references regions,
	county_name				varchar(50) not null unique,
	details					text
);
CREATE INDEX counties_region_id ON counties (region_id);

CREATE TABLE rankings (
	ranking_id				serial primary key,
	ranking_name			varchar(50) not null unique,
	rank_initials			varchar(12),
	cap_amounts				real default 0 not null,
	details					text
);

CREATE TABLE division_types (
	division_type_id		serial primary key,
	division_type_name		varchar(50) not null unique,
	details					text
);

CREATE TABLE court_ranks (
	court_rank_id			serial primary key,
	court_rank_name			varchar(50) not null unique,
	details					text
);

CREATE TABLE court_stations (
	court_station_id		serial primary key,
	court_rank_id			integer references court_ranks,
	county_id				integer references counties,
	orgId					integer references orgs,
	court_station_name		varchar(50),
	court_station_code		varchar(50),
	district				varchar(50),
	Details					text
);
CREATE INDEX court_stations_court_rank_id ON court_stations (court_rank_id);
CREATE INDEX court_stations_county_id ON court_stations (county_id);
CREATE INDEX court_Stations_orgId ON court_Stations (orgId);
SELECT setval('court_stations_court_station_id_seq', 100);

CREATE TABLE court_divisions (
	court_division_id		serial primary key,
	court_station_id		integer references court_stations,
	division_type_id		integer references division_types,
	orgId					integer references orgs,
	court_division_code		varchar(16),
	court_division_num		integer default 1 not null,
	details					text,
	UNIQUE(court_station_id, division_type_id)
);
CREATE INDEX court_divisions_court_station_id ON court_divisions (court_station_id);
CREATE INDEX court_divisions_division_type_id ON court_divisions (division_type_id);
CREATE INDEX court_divisions_orgId ON court_divisions (orgId);

CREATE TABLE police_stations (
	police_station_id		serial primary key,
	court_station_id		integer references court_stations,
	orgId					integer references orgs,
	police_station_name		varchar(50) not null,
	police_station_phone	varchar(50),
	details					text
);
CREATE INDEX police_stations_court_station_id ON police_stations (court_station_id);
CREATE INDEX police_stations_orgId ON police_stations (orgId);

CREATE TABLE hearing_locations (
	hearing_location_id		serial primary key,
	court_station_id		integer references court_stations,
	orgId					integer references orgs,
	hearing_location_name	varchar(50),
	Details					text
);
CREATE INDEX hearing_locations_court_station_id ON hearing_locations (court_station_id);
CREATE INDEX hearing_locations_orgId ON hearing_locations (orgId);


CREATE TABLE roles (
   roleId        serial primary key ,
   role          varchar(50) NOT NULL,
   function_role varchar(20)
);

CREATE TABLE user_types (
    user_type_id serial PRIMARY KEY,
    orgId integer,
    user_type_name character varying(50),
    roleId integer references roles,
    use_key integer DEFAULT 0 NOT NULL,
    group_email character varying(120),
    description text,
    details text
);

CREATE INDEX user_types_roleId ON user_types (roleId);

CREATE TABLE users (
   userId      serial PRIMARY KEY,
   email       varchar(128) NOT NULL,
   password    varchar(128) NOT NULL ,
   name        varchar(128) DEFAULT NULL ,
   mobile      varchar(20) DEFAULT NULL,
	roleId       integer references roles,
   orgId       integer references orgs,
	user_type_id integer references user_types,
   gender      varchar(12),
   dob 			date,
   isDeleted   boolean NOT NULL DEFAULT false,
   is_active   boolean NOT NULL DEFAULT false,
   createdBy   integer NOT NULL,
   createdDtm  timestamp NOT NULL,
   updatedBy   integer  DEFAULT NULL,
   updatedDtm  timestamp DEFAULT NULL,
   UNIQUE (email)
);
CREATE INDEX users_roleId ON users (roleId);
CREATE INDEX users_user_type_id ON users (user_type_id);
CREATE INDEX users_orgId ON users (orgId);


CREATE TABLE reset_password (
	id 				serial PRIMARY KEY,
	email 			varchar(128) NOT NULL,
	activation_id 	varchar(32) NOT NULL,
	agent 			varchar(512) NOT NULL,
	client_ip 		varchar(32) NOT NULL,
	isDeleted 		boolean NOT NULL DEFAULT false,
	createdBy 		integer NOT NULL DEFAULT '1',
	createdDtm 		timestamp NOT NULL,
	updatedBy 		integer DEFAULT NULL,
	updatedDtm 		timestamp DEFAULT NULL
);


CREATE TABLE client_category (
	client_category_id			serial primary key,
	client_category_name			varchar(100) not null unique,
	client_category_code			varchar(100) not null unique,
	details							text
);

CREATE TABLE case_subjects (
	case_subject_id			serial primary key,
	case_subject_name		varchar(320) not null unique,
	ep						boolean default false not null,
	criminal				boolean default false not null,
	civil					boolean default false not null,
	details					text
);


CREATE TABLE judgment_status (
	judgment_status_id		serial primary key,
	judgment_status_name	varchar(320),
	details					text
);

CREATE TABLE adjorn_reasons (
	adjorn_reason_id		serial primary key,
	adjorn_reason_name		varchar(320) not null unique,
	appeal					boolean default true not null,
	trial					boolean default true not null,
	details					text
);

CREATE TABLE order_types (
	order_type_id			serial primary key,
	order_type_name			varchar(320) not null unique,
	details					text
);



CREATE TABLE case_types (
	case_type_id				serial primary key,
	case_type_name				varchar(320) not null unique,
	duration_unacceptable	integer,
	duration_serious			integer,
	duration_normal			integer,
	duration_low				integer,
	activity_unacceptable	integer,
	activity_serious			integer,
	activity_normal			integer,
	activity_low				integer,
	details						text
);

CREATE TABLE case_category (
	case_category_id			serial primary key,
	case_type_id				integer references case_types,
	case_category_name		varchar(320) not null,
	case_category_title		varchar(320),
	case_category_no			varchar(12),
	act_code						varchar(64),
	prefix						varchar(12),
	death_sentence				boolean default false not null,
	life_sentence				boolean default false not null,
	min_sentence				integer,
	max_sentence				integer,
	min_fine						real,
	max_fine						real,
	min_canes					integer,
	max_canes					integer,
	Details						text
);
CREATE INDEX case_category_case_type_id ON case_category (case_type_id);

CREATE TABLE contact_types (
	contact_type_id			serial primary key,
	contact_type_name		varchar(320),
	bench					boolean default false not null,
	bench_next 			boolean DEFAULT false not null,
	appeal					boolean default true not null,
	trial					boolean default true not null,
	ep						boolean default false not null,
	details					text
);



CREATE TABLE cases (
	case_id					serial primary key,
	case_category_id		integer not null references case_category,
	-- court_division_id		integer not null references court_divisions,
	police_station_id		integer references police_stations,
	county_id				integer references counties,
	orgId					integer references orgs,
	userId 				integer references users,
	case_type_id			integer references case_types,
	new_case_id				integer references cases,
	old_case_id				integer references cases,
	case_title				varchar(320) not null,
	public_citation			varchar(320),
	case_number				varchar(50),
	file_number				varchar(50) not null,
	date_of_arrest			date,
	ob_number				varchar(120),
	holding_prison			varchar(120),
	warrant_of_arrest		boolean default false not null,
	alleged_crime			text,
	start_date				date not null,
	original_case_date		date,
	end_date				date,
	nature_of_claim			varchar(320),
	value_of_claim			real,
	closed					boolean default false not null,
	case_locked				boolean default false not null,
	consolidate_cases		boolean default false not null,
	final_decision	 		varchar(1024),
	change_by				integer,
	change_date				timestamp default now(),
	detail					text
);
CREATE INDEX cases_case_category_id ON cases (case_category_id);
CREATE INDEX cases_county_id ON cases (county_id);
CREATE INDEX cases_orgId ON cases (orgId);
CREATE INDEX cases_case_type_id ON cases (case_type_id);
CREATE INDEX cases_userId ON cases (userId);
CREATE INDEX cases_new_case_id ON cases (new_case_id);
CREATE INDEX cases_old_case_id ON cases (old_case_id);
-- CREATE INDEX cases_court_division_id ON cases (court_division_id);
CREATE INDEX cases_police_station_id ON cases (police_station_id);

CREATE TABLE activitys (
	activity_id				serial primary key,
	activity_name			varchar(320) not null unique,
	appeal					boolean default true not null,
	trial					boolean default true not null,
	ep						boolean default false not null,
	show_on_diary			boolean default true not null,
	activity_days			integer default 1,
	activity_hours			integer default 0,
	details					text
);

CREATE TABLE activity_results (
	activity_result_id		serial primary key,
	activity_result_name	varchar(320) not null unique,
	appeal					boolean default true not null,
	trial					boolean default true not null,
	details					text
);

CREATE TABLE case_activity (
	case_activity_id		serial primary key,
	case_id					integer not null references cases,
	activity_id				integer not null references activitys,
	activity_result_id		integer references activity_results,
	adjorn_reason_id		integer references adjorn_reasons,
	order_type_id			integer references order_types,
	appeal_case_id			integer references cases,
	orgId					integer references orgs,
	activity_date			date not null,
	activity_time			time not null,
	finish_time				time not null,
	shared_hearing			boolean default false not null,
	completed				boolean default false not null,
	is_active				boolean default true not null,
	change_by				integer,
	change_date				timestamp default now(),
	urgency_certificate		varchar(50),
	order_title				varchar(320),
	order_narrative			varchar(320),
	order_details			text,
	appeal_details			text,
	result_details			text,
	adjorn_details			text,
	details					text,

	application_date		timestamp default now(),
	approve_status			varchar(16) default 'Completed' not null,
	workflow_table_id		integer,
	action_date				timestamp
);
CREATE INDEX case_activity_case_id ON case_activity (case_id);
CREATE INDEX case_activity_activity_id ON case_activity (activity_id);
CREATE INDEX case_activity_activity_result_id ON case_activity (activity_result_id);
CREATE INDEX case_activity_adjorn_reason_id ON case_activity (adjorn_reason_id);
CREATE INDEX case_activity_order_type_id ON case_activity (order_type_id);
CREATE INDEX case_activity_orgId ON case_activity (orgId);

CREATE TABLE case_notes (
	case_note_id			serial primary key,
	case_activity_id		integer references case_activity,
	userId				integer not null references users,
	orgId					integer references orgs,
	case_note_title			varchar(320),
	change_date				timestamp default now(),
	details					text
);
CREATE INDEX case_notes_case_activity_id ON case_notes (case_activity_id);
CREATE INDEX case_notes_entity_id ON case_notes (userId);
CREATE INDEX case_notes_orgId ON case_notes (orgId);




CREATE TABLE case_contacts (
	case_contact_id			serial primary key,
	case_id					integer not null references cases,
	userId					integer not null references users,
	contact_type_id			integer not null references contact_types,
	orgId					integer references orgs,
	case_contact_no			integer,
	election_winner			boolean default false not null,
	is_disqualified			boolean default false not null,
	is_active				boolean default true not null,
	change_by				integer,
	change_date				timestamp default now(),
	details					text,
	UNIQUE(case_id, userId)
);
CREATE INDEX case_contacts_case_id ON case_contacts (case_id);
CREATE INDEX case_contacts_userId ON case_contacts (userId);
CREATE INDEX case_contacts_contact_type_id ON case_contacts (contact_type_id);
CREATE INDEX case_contacts_orgId ON case_contacts (orgId);

CREATE TABLE case_counts (
	case_count_id			serial primary key,
	case_contact_id			integer not null references case_contacts,
	case_category_id		integer not null references case_category,
	orgId					integer references orgs,
	narrative				varchar(320),
	is_active				boolean default true not null,
	change_by				integer,
	change_date				timestamp default now(),
	detail					text,
	UNIQUE(case_contact_id, case_category_id)
);
CREATE INDEX case_counts_case_contact_id ON case_counts (case_contact_id);
CREATE INDEX case_counts_case_category_id ON case_counts (case_category_id);
CREATE INDEX case_counts_orgId ON case_counts (orgId);

CREATE TABLE decision_types (
	decision_type_id		serial primary key,
	decision_type_name		varchar(320) not null unique,
	details					text
);

CREATE TABLE case_decisions (
	case_decision_id		serial primary key,
	case_id					integer references cases,
	case_activity_id		integer references case_activity,
	case_count_id			integer references case_counts,
	decision_type_id		integer references decision_types,
	judgment_status_id		integer references judgment_status,
	orgId					integer references orgs,
	decision_summary 		varchar(1024),
	judgement				text,
	judgement_date			date,
	death_sentence			boolean default false not null,
	life_sentence			boolean default false not null,
	jail_years				integer,
	jail_days				integer,
	fine_amount				real,
	fine_jail				integer,
	canes					integer,
	is_active				boolean default true not null,
	change_by				integer,
	change_date				timestamp default now(),
	detail					text
);
CREATE INDEX case_decisions_case_id ON case_decisions (case_id);
CREATE INDEX case_decisions_case_activity_id ON case_decisions (case_activity_id);
CREATE INDEX case_decisions_case_count_id ON case_decisions (case_count_id);
CREATE INDEX case_decisions_decision_type_id ON case_decisions (decision_type_id);
CREATE INDEX case_decisions_judgment_status_id ON case_decisions (judgment_status_id);
CREATE INDEX case_decisions_orgId ON case_decisions (orgId);


CREATE TABLE receipt_types (
	receipt_type_id			serial primary key,
	receipt_type_name		varchar(320) not null,
	receipt_type_code		varchar(12) not null,
	require_refund			boolean default false not null,
	details					text
);

CREATE TABLE receipts (
	receipt_id				serial primary key,
	case_id					integer references cases,
	case_decision_id		integer references case_decisions,
	receipt_type_id			integer not null references receipt_types,
	orgId					integer references orgs,
	receipt_for				varchar(320),
	case_number				varchar(50) not null,
	receipt_date			date,
	amount					real not null,
	for_process				boolean default false not null,
	approved				boolean default false not null,
	refund_approved			boolean default false not null,
	is_active				boolean default true not null,
	change_by				integer,
	change_date				timestamp default now(),
	details					text
);
CREATE INDEX receipts_receipt_case_id ON receipts (case_id);
CREATE INDEX receipts_receipt_case_decision_id ON receipts (case_decision_id);
CREATE INDEX receipts_receipt_type_id ON receipts (receipt_type_id);
CREATE INDEX receipts_orgId ON receipts (orgId);

CREATE TABLE payment_types (
	payment_type_id			serial primary key,
	payment_type_name		varchar(320) not null unique,
	cash					boolean default false not null,
	non_cash				boolean default false not null,
	for_credit_note			boolean default false not null,
	for_refund				boolean default false not null,
	details					text
);



CREATE TABLE calendar_events (
	calendar_event_id  		serial PRIMARY KEY,
	userId 						integer REFERENCES users,
	event_title  				varchar(100),
	details  					text,
	url 							text,
	start_date 					date,
	end_date  					date,
	event_date 					date,
	backgroundColor 			varchar(50),
	allday boolean default false
);
CREATE INDEX calendar_events_userId ON calendar_events (userId);
