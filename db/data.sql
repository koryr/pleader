
INSERT INTO orgs (orgId, org_name, org_sufix, is_active)
VALUES (0,'default','df',true);


INSERT INTO roles (roleId, role, function_role) VALUES
   (1, 'System Administrator','administrator'),
   (2, 'Manager','manager'),
   (3, 'Staff','staff'),
   (4, 'Finance','finance'),
   (5, 'Users','user');

 SELECT pg_catalog.setval('roles_roleid_seq', 3, true);


INSERT INTO user_types (user_type_id, roleId, user_type_name) VALUES (1, 3, 'Staff');
INSERT INTO user_types (user_type_id, roleId, user_type_name) VALUES (2, 3, 'Advocate');
INSERT INTO user_types (user_type_id, roleId, user_type_name) VALUES (3, 5, 'Users');
INSERT INTO user_types (user_type_id, roleId, user_type_name) VALUES (4, 5, 'Client');
INSERT INTO user_types (user_type_id, roleId, user_type_name) VALUES (5, 5, 'Insurance Firm');

INSERT INTO users (userId, email, password, name, mobile, user_type_id, roleId, orgId, isDeleted, createdBy, createdDtm,
   updatedBy, updatedDtm) VALUES
(0, 'admin@codeinsect.com', '$2y$10$WQQRBQDkxV/98bqK.24Dp.uMVS6KcztVqdwwTrOBLIWLSeSqE2gii', 'System Administrator', '9890098900', 1, 1, 0, false,
   0, '2015-07-01 18:56:49', 1, '2017-03-03 12:08:39'),
(1, 'manager@codeinsect.com', '$2y$10$quODe6vkNma30rcxbAHbYuKYAZQqUaflBgc4YpV9/90ywd.5Koklm', 'Manager', '9890098900', 1, 2, 0, false,
   1, '2016-12-09 17:49:56', 1, '2017-02-10 17:23:53'),
(2, 'employee@codeinsect.com', '$2y$10$M3ttjnzOV2lZSigBtP0NxuCtKRte70nc8TY5vIczYAQvfG/8syRze', 'Employee', '9890098900', 1, 3, 0, false,
   1, '2016-12-09 17:50:22', NULL, NULL);

   SELECT pg_catalog.setval('users_userid_seq', 2, true);


   INSERT INTO case_types (case_type_id, case_type_name) VALUES (1, 'Crimal Cases');
   INSERT INTO case_types (case_type_id, case_type_name) VALUES (2, 'Civil Cases');
   INSERT INTO case_types (case_type_id, case_type_name) VALUES (3, 'Crimal Appeal');
   INSERT INTO case_types (case_type_id, case_type_name) VALUES (4, 'Civil Appeal');
   INSERT INTO case_types (case_type_id, case_type_name) VALUES (5, 'Election Disputes');
   INSERT INTO case_types (case_type_id, case_type_name) VALUES (6, 'Civil Applications');
   SELECT setval('case_types_case_type_id_seq', 6);



INSERT INTO activity_results (activity_result_id, activity_result_name, appeal, trial, details) VALUES (0, 'Not Heard', true, true, NULL);
INSERT INTO activity_results (activity_result_id, activity_result_name, appeal, trial, details) VALUES (1, 'Order', true, true, NULL);
INSERT INTO activity_results (activity_result_id, activity_result_name, appeal, trial, details) VALUES (2, 'Ruling', true, true, NULL);
INSERT INTO activity_results (activity_result_id, activity_result_name, appeal, trial, details) VALUES (3, 'Judgement', true, true, NULL);
INSERT INTO activity_results (activity_result_id, activity_result_name, appeal, trial, details) VALUES (4, 'Adjourned', true, true, NULL);
INSERT INTO activity_results (activity_result_id, activity_result_name, appeal, trial, details) VALUES (5, 'Adjourned Sine Die', true, true, NULL);
INSERT INTO activity_results (activity_result_id, activity_result_name, appeal, trial, details) VALUES (6, 'Closed Withdrawn', true, true, NULL);
INSERT INTO activity_results (activity_result_id, activity_result_name, appeal, trial, details) VALUES (7, 'Consent Order filed', true, true, NULL);
INSERT INTO activity_results (activity_result_id, activity_result_name, appeal, trial, details) VALUES (8, 'Ruling reserved', true, true, NULL);
INSERT INTO activity_results (activity_result_id, activity_result_name, appeal, trial, details) VALUES (9, 'Change of Judge', true, true, NULL);
INSERT INTO activity_results (activity_result_id, activity_result_name, appeal, trial, details) VALUES (10, 'Grant Appleal', true, true, NULL);
INSERT INTO activity_results (activity_result_id, activity_result_name, appeal, trial, details) VALUES (11, 'Petition Filled', true, true, NULL);
INSERT INTO activity_results (activity_result_id, activity_result_name, appeal, trial, details) VALUES (12, 'Service returned', true, true, NULL);
INSERT INTO activity_results (activity_result_id, activity_result_name, appeal, trial, details) VALUES (14, 'Responded to petition', true, true, NULL);
INSERT INTO activity_results (activity_result_id, activity_result_name, appeal, trial, details) VALUES (15, 'Heard', true, true, NULL);
INSERT INTO activity_results (activity_result_id, activity_result_name, appeal, trial, details) VALUES (16, 'Petition Withdrawn', true, true, NULL);

SELECT pg_catalog.setval('activity_results_activity_result_id_seq', 16, true);


INSERT INTO activitys (activity_id, activity_name, appeal, trial, ep, show_on_diary, activity_days, activity_hours, details) VALUES (1, 'Hearing', true, true, true, true, 1, 0, NULL);
INSERT INTO activitys (activity_id, activity_name, appeal, trial, ep, show_on_diary, activity_days, activity_hours, details) VALUES (2, 'Application', true, true, false, true, 1, 0, NULL);
INSERT INTO activitys (activity_id, activity_name, appeal, trial, ep, show_on_diary, activity_days, activity_hours, details) VALUES (3, 'Interlocutory Application', true, true, false, true, 1, 0, NULL);
INSERT INTO activitys (activity_id, activity_name, appeal, trial, ep, show_on_diary, activity_days, activity_hours, details) VALUES (4, 'Filing a Suite', true, true, false, true, 1, 0, NULL);
INSERT INTO activitys (activity_id, activity_name, appeal, trial, ep, show_on_diary, activity_days, activity_hours, details) VALUES (5, 'Filing an appleal', true, true, false, true, 1, 0, NULL);
INSERT INTO activitys (activity_id, activity_name, appeal, trial, ep, show_on_diary, activity_days, activity_hours, details) VALUES (6, 'Ruling', true, true, true, true, 1, 0, NULL);
INSERT INTO activitys (activity_id, activity_name, appeal, trial, ep, show_on_diary, activity_days, activity_hours, details) VALUES (7, 'Judgement', true, true, true, true, 1, 0, NULL);
INSERT INTO activitys (activity_id, activity_name, appeal, trial, ep, show_on_diary, activity_days, activity_hours, details) VALUES (8, 'Taking of Plea', true, true, false, true, 1, 0, NULL);
INSERT INTO activitys (activity_id, activity_name, appeal, trial, ep, show_on_diary, activity_days, activity_hours, details) VALUES (9, 'Bail Pending Trial', true, true, false, true, 1, 0, NULL);
INSERT INTO activitys (activity_id, activity_name, appeal, trial, ep, show_on_diary, activity_days, activity_hours, details) VALUES (10, 'Examination-in-Chief', true, true, false, true, 1, 0, NULL);
INSERT INTO activitys (activity_id, activity_name, appeal, trial, ep, show_on_diary, activity_days, activity_hours, details) VALUES (11, 'Cross-Examination', true, true, false, true, 1, 0, NULL);
INSERT INTO activitys (activity_id, activity_name, appeal, trial, ep, show_on_diary, activity_days, activity_hours, details) VALUES (12, 'Re-Examination', true, true, false, true, 1, 0, NULL);
INSERT INTO activitys (activity_id, activity_name, appeal, trial, ep, show_on_diary, activity_days, activity_hours, details) VALUES (13, 'Defence Hearing', true, true, false, true, 1, 0, NULL);
INSERT INTO activitys (activity_id, activity_name, appeal, trial, ep, show_on_diary, activity_days, activity_hours, details) VALUES (14, 'Sentencing', true, true, false, true, 1, 0, NULL);
INSERT INTO activitys (activity_id, activity_name, appeal, trial, ep, show_on_diary, activity_days, activity_hours, details) VALUES (15, 'Filing an election petition', true, true, true, false, 1, 0, NULL);
INSERT INTO activitys (activity_id, activity_name, appeal, trial, ep, show_on_diary, activity_days, activity_hours, details) VALUES (16, 'Return of service', true, true, true, false, 1, 0, NULL);
INSERT INTO activitys (activity_id, activity_name, appeal, trial, ep, show_on_diary, activity_days, activity_hours, details) VALUES (17, 'Response to petition', true, true, true, false, 1, 0, NULL);
INSERT INTO activitys (activity_id, activity_name, appeal, trial, ep, show_on_diary, activity_days, activity_hours, details) VALUES (18, 'Consolidation of election petitions', true, true, true, false, 1, 0, NULL);
INSERT INTO activitys (activity_id, activity_name, appeal, trial, ep, show_on_diary, activity_days, activity_hours, details) VALUES (19, 'Pre-trial conferencing', true, true, true, true, 1, 0, NULL);
INSERT INTO activitys (activity_id, activity_name, appeal, trial, ep, show_on_diary, activity_days, activity_hours, details) VALUES (20, 'Transfer Case', true, true, true, false, 1, 0, NULL);
INSERT INTO activitys (activity_id, activity_name, appeal, trial, ep, show_on_diary, activity_days, activity_hours, details) VALUES (21, 'Withdraw election petition', true, true, true, false, 1, 0, NULL);


--
-- Name: activitys_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('activitys_activity_id_seq', 21, true);


INSERT INTO adjorn_reasons (adjorn_reason_id, adjorn_reason_name, appeal, trial, details) VALUES (0, 'Not Adjourned', true, true, NULL);
INSERT INTO adjorn_reasons (adjorn_reason_id, adjorn_reason_name, appeal, trial, details) VALUES (1, 'Undetermined', true, true, NULL);
INSERT INTO adjorn_reasons (adjorn_reason_id, adjorn_reason_name, appeal, trial, details) VALUES (2, 'Party Absent', true, true, NULL);
INSERT INTO adjorn_reasons (adjorn_reason_id, adjorn_reason_name, appeal, trial, details) VALUES (3, 'Attorney Absent', true, true, NULL);
INSERT INTO adjorn_reasons (adjorn_reason_id, adjorn_reason_name, appeal, trial, details) VALUES (4, 'Witness Absent', true, true, NULL);
INSERT INTO adjorn_reasons (adjorn_reason_id, adjorn_reason_name, appeal, trial, details) VALUES (5, 'Interpretor Absent', true, true, NULL);
INSERT INTO adjorn_reasons (adjorn_reason_id, adjorn_reason_name, appeal, trial, details) VALUES (6, 'Other reasons', true, true, NULL);


--
-- Name: adjorn_reasons_adjorn_reason_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('adjorn_reasons_adjorn_reason_id_seq', 7, true);



INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (1, 3, 'Criminal Appleal', 'Criminal Appleal', NULL, NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (2, 4, 'Civil Appleal', 'Civil Appleal', NULL, NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (3, 6, 'Civil Applications', 'Clvil Applications', NULL, NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (4, 1, 'Murder', 'Murder, Manslaughter and Infanticide', '1.01', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (5, 1, 'Manslaughter', 'Murder, Manslaughter and Infanticide', '1.02', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (6, 1, 'Manslaughter (Fatal Accident)', 'Murder, Manslaughter and Infanticide', '1.03', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (7, 1, 'Suspicious  Death', 'Murder, Manslaughter and Infanticide', '1.04', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (8, 1, 'Attempted Murder', 'Murder, Manslaughter and Infanticide', '1.05', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (9, 1, 'Infanticide', 'Murder, Manslaughter and Infanticide', '1.06', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (10, 1, 'Abduction', 'Other Serious Violent Offences', '2.01', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (11, 1, 'Act intending to cause GBH', 'Other Serious Violent Offences', '2.02', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (12, 1, 'Assault on a Police Officer', 'Other Serious Violent Offences', '2.03', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (13, 1, 'Assaulting a child', 'Other Serious Violent Offences', '2.04', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (14, 1, 'Grievous Harm', 'Other Serious Violent Offences', '2.05', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (15, 1, 'Grievous Harm (D.V)', 'Other Serious Violent Offences', '2.06', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (16, 1, 'Kidnapping', 'Other Serious Violent Offences', '2.07', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (17, 1, 'Physical abuse', 'Other Serious Violent Offences', '2.08', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (18, 1, 'Wounding', 'Other Serious Violent Offences', '2.09', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (19, 1, 'Wounding (D.V)', 'Other Serious Violent Offences', '2.10', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (20, 1, 'Attempted robbery', 'Robberies', '3.01', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (21, 1, 'Robbery with violence', 'Robberies', '3.02', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (22, 1, 'Robbery of mobile phone', 'Robberies', '3.03', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (23, 1, 'Attempted rape', 'Sexual offences', '4.01', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (24, 1, 'Rape', 'Sexual offences', '4.02', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (25, 1, 'Child abuse', 'Sexual offences', '4.03', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (26, 1, 'Indecent assault', 'Sexual offences', '4.04', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (27, 1, 'Sexual Abuse', 'Sexual offences', '4.05', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (28, 1, 'Sexual assault', 'Sexual offences', '4.06', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (29, 1, 'Sexual interference with a child', 'Sexual offences', '4.07', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (30, 1, 'A.O.A.B.H', 'Other Offences Against the Person', '5.01', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (31, 1, 'A.O.A.B.H (D.V)', 'Other Offences Against the Person', '5.02', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (32, 1, 'Assaulting a child', 'Other Offences Against the Person', '5.03', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (33, 1, 'Assaulting a child (D.V)', 'Other Offences Against the Person', '5.04', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (34, 1, 'Child neglect', 'Other Offences Against the Person', '5.05', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (35, 1, 'Common Assault', 'Other Offences Against the Person', '5.06', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (36, 1, 'Common Assault (D.V)', 'Other Offences Against the Person', '5.07', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (37, 1, 'Indecent act', 'Other Offences Against the Person', '5.08', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (38, 1, 'Obstruction of a Police Officer', 'Other Offences Against the Person', '5.09', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (39, 1, 'Procuring Abortion', 'Other Offences Against the Person', '5.10', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (40, 1, 'Resisting arrest', 'Other Offences Against the Person', '5.11', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (41, 1, 'Seditious offences', 'Other Offences Against the Person', '5.12', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (42, 1, 'Threatening Violence (D.V)', 'Other Offences Against the Person', '5.13', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (43, 1, 'Threatening Violence ', 'Other Offences Against the Person', '5.14', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (44, 1, 'Attempted breaking', 'Property Offences', '6.01', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (45, 1, 'Attempted burglary', 'Property Offences', '6.02', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (46, 1, 'Breaking into a building other than a dwelling', 'Property Offences', '6.03', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (47, 1, 'Breaking into a building other than a dwelling and stealing', 'Property Offences', '6.04', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (48, 1, 'Breaking into a building with intent to commit a felony', 'Property Offences', '6.05', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (49, 1, 'Burglary', 'Property Offences', '6.06', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (50, 1, 'Burglary and stealing', 'Property Offences', '6.07', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (51, 1, 'Entering a dwelling house ', 'Property Offences', '6.08', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (52, 1, 'Entering a dwelling house and stealing', 'Property Offences', '6.09', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (53, 1, 'Entering a dwelling house with intent to commit a felony', 'Property Offences', '6.10', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (54, 1, 'Entering a building with intent to commit a felony', 'Property Offences', '6.11', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (55, 1, 'House breaking ', 'Property Offences', '6.12', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (56, 1, 'House breaking and stealing', 'Property Offences', '6.13', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (57, 1, 'House breaking with intent to commit a felony', 'Property Offences', '6.14', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (58, 1, 'Stealing by servant', 'Property Offences', '6.15', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (59, 1, 'Stealing from vehicle', 'Property Offences', '6.16', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (60, 1, 'Stealing', 'Property Offences', '6.17', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (61, 1, 'Unlawful use of a vehicle', 'Property Offences', '6.18', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (62, 1, 'Unlawful possession of property', 'Property Offences', '6.19', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (63, 1, 'Unlawful use of boat or vessel', 'Property Offences', '6.20', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (64, 1, 'Attempted stealing', 'Theft', '7.01', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (65, 1, 'Beach theft', 'Theft', '7.02', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (66, 1, 'Receiving stolen property', 'Theft', '7.03', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (67, 1, 'Retaining Stolen Property', 'Theft', '7.04', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (68, 1, 'Stealing', 'Theft', '7.05', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (69, 1, 'Stealing by finding', 'Theft', '7.06', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (70, 1, 'Stealing by servant', 'Theft', '7.07', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (71, 1, 'Stealing from boat or vessel', 'Theft', '7.08', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (72, 1, 'Stealing from dwelling house', 'Theft', '7.09', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (73, 1, 'Stealing from hotel room', 'Theft', '7.10', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (74, 1, 'Stealing from person', 'Theft', '7.11', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (75, 1, 'Stealing from vehicle', 'Theft', '7.12', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (76, 1, 'Unlawful possession of property', 'Theft', '7.13', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (77, 1, 'Unlawful use of a vehicle', 'Theft', '7.14', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (78, 1, 'Unlawful use of boat or vessel', 'Theft', '7.15', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (79, 1, 'Arson', 'Arson and criminal damage', '8.01', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (80, 1, 'Attempted Arson', 'Arson and criminal damage', '8.02', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (81, 1, 'Criminal trespass', 'Arson and criminal damage', '8.03', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (82, 1, 'Damaging government property', 'Arson and criminal damage', '8.04', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (83, 1, 'Damaging property', 'Arson and criminal damage', '8.05', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (84, 1, 'Bribery', 'Fraud', '9.01', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (85, 1, 'Extortion ', 'Fraud', '9.02', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (86, 1, 'False accounting', 'Fraud', '9.03', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (87, 1, 'Forgery', 'Fraud', '9.04', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (88, 1, 'Fraud', 'Fraud', '9.05', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (89, 1, 'Giving false information to Govt employee', 'Fraud', '9.06', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (90, 1, 'Importing or purchasing forged notes', 'Fraud', '9.07', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (91, 1, 'Issuing a cheque without provision', 'Fraud', '9.08', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (92, 1, 'Misappropriation of money', 'Fraud', '9.09', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (93, 1, 'Money laundering', 'Fraud', '9.10', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (94, 1, 'Obtaining credit by false pretence', 'Fraud', '9.11', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (95, 1, 'Obtaining fares by false pretence', 'Fraud', '9.12', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (96, 1, 'Obtaining goods by false pretence', 'Fraud', '9.13', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (97, 1, 'Obtaining money by false pretence', 'Fraud', '9.14', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (98, 1, 'Obtaining service by false pretence', 'Fraud', '9.15', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (99, 1, 'Offering a bribe to Govt employee', 'Fraud', '9.16', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (100, 1, 'Perjury', 'Fraud', '9.17', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (101, 1, 'Possession of false/counterfeit currency', 'Fraud', '9.18', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (102, 1, 'Possession of false document', 'Fraud', '9.19', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (103, 1, 'Trading as a contractor without a licence', 'Fraud', '9.20', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (104, 1, 'Trading without a licence', 'Fraud', '9.21', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (105, 1, 'Unlawful possession of forged notes', 'Fraud', '9.22', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (106, 1, 'Uttering false notes', 'Fraud', '9.23', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (107, 1, 'Affray', 'Public Order Offences', '10.01', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (108, 1, 'Attempt to commit negligent act to cause harm', 'Public Order Offences', '10.02', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (109, 1, 'Burning rubbish without permit', 'Public Order Offences', '10.03', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (110, 1, 'Common Nuisance', 'Public Order Offences', '10.04', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (111, 1, 'Consuming alcohol in a public place', 'Public Order Offences', '10.05', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (112, 1, 'Cruelty to animals', 'Public Order Offences', '10.06', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (113, 1, 'Defamation of the President', 'Public Order Offences', '10.07', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (114, 1, 'Disorderly conduct in a Police building', 'Public Order Offences', '10.08', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (115, 1, 'Entering a restricted airport attempting to board', 'Public Order Offences', '10.09', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (116, 1, 'Idle and disorderly (A-i)', 'Public Order Offences', '10.10', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (117, 1, 'Insulting the modesty of a woman', 'Public Order Offences', '10.11', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (118, 1, 'Loitering', 'Public Order Offences', '10.12', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (119, 1, 'Negligent act', 'Public Order Offences', '10.13', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (120, 1, 'Rash and negligent act', 'Public Order Offences', '10.14', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (121, 1, 'Reckless or negligent act', 'Public Order Offences', '10.15', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (122, 1, 'Rogue and vagabond', 'Public Order Offences', '10.16', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (123, 1, 'Unlawful assembly', 'Public Order Offences', '10.17', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (124, 1, 'Throwing litter in a public place', 'Public Order Offences', '10.18', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (125, 1, 'Using obscene and indescent language in public place', 'Public Order Offences', '10.19', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (126, 1, 'Aiding and abetting escape prisoner', 'Offences relating to the administration of justice', '11.01', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (127, 1, 'Attempted escape', 'Offences relating to the administration of justice', '11.02', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (128, 1, 'Breach of court order', 'Offences relating to the administration of justice', '11.03', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (129, 1, 'Contempt of court', 'Offences relating to the administration of justice', '11.04', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (130, 1, 'Escape from lawful custody', 'Offences relating to the administration of justice', '11.05', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (131, 1, 'Failing to comply with bail', 'Offences relating to the administration of justice', '11.06', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (132, 1, 'Refuse to give name', 'Offences relating to the administration of justice', '11.07', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (133, 1, 'Trafficking in hard drugs', 'Offences relating to the administration of justice', '11.08', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (134, 1, 'Cultivation of controlled drugs', 'Drugs', '12.01', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (135, 1, 'Importation of controlled drugs', 'Drugs', '12.02', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (136, 1, 'Possession of controlled drugs', 'Drugs', '12.03', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (137, 1, 'Possession of hard drugs', 'Drugs', '12.04', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (138, 1, 'Poss of syringe for consumption or administration of controlled drugs.', 'Drugs', '12.05', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (139, 1, 'Presumption of Consumption Of Controlled Drugs', 'Drugs', '12.06', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (140, 1, 'Refuse to give control samples', 'Drugs', '12.07', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (141, 1, 'Trafficking controlled drugs', 'Drugs', '12.08', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (142, 1, 'Trafficking in hard drugs', 'Drugs', '12.09', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (143, 1, 'Importation of firearm and ammunition', 'Weapons and Ammunition', '13.01', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (144, 1, 'Possession of explosive(includes Tuna Crackers)', 'Weapons and Ammunition', '13.02', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (145, 1, 'Possession of offensive weapon', 'Weapons and Ammunition', '13.03', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (146, 1, 'Possession of spear gun', 'Weapons and Ammunition', '13.04', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (147, 1, 'Unlawful possession of a firearm', 'Weapons and Ammunition', '13.05', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (148, 1, 'Catching turtle', 'Environment and Fisheries', '14.01', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (149, 1, 'Cutting or selling protected trees without a permit', 'Environment and Fisheries', '14.02', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (150, 1, 'Cutting protected trees without a permit', 'Environment and Fisheries', '14.03', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (151, 1, 'Dealing in nature nuts', 'Environment and Fisheries', '14.04', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (152, 1, 'Illegal fishing in Seychelles territoiral waters', 'Environment and Fisheries', '14.05', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (153, 1, 'Possession of Coco De Mer without a permit', 'Environment and Fisheries', '14.06', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (154, 1, 'Removal of sand without permit', 'Environment and Fisheries', '14.07', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (155, 1, 'Selling Protected trees', 'Environment and Fisheries', '14.08', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (156, 1, 'Stealing protected animals', 'Environment and Fisheries', '14.09', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (157, 1, 'Taking or processing of sea cucumber without a licence', 'Environment and Fisheries', '14.10', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (158, 1, 'Unauthorised catching of sea cucumber in Seychelles', 'Environment and Fisheries', '14.11', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (159, 1, 'Unlawful possession of a turtle meat, turtle shell, dolphin and lobster', 'Environment and Fisheries', '14.12', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (160, 1, 'Piracy', 'Other crimes Not Elsewhere Classified (Miscellaneous)', '15.01', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (161, 1, 'Allowing animals to stray', 'Other crimes Not Elsewhere Classified (Miscellaneous)', '15.02', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (162, 1, 'Bigamy', 'Other crimes Not Elsewhere Classified (Miscellaneous)', '15.03', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (163, 1, 'Endangering the safety of an aircraft', 'Other crimes Not Elsewhere Classified (Miscellaneous)', '15.04', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (164, 1, 'Gamble', 'Other crimes Not Elsewhere Classified (Miscellaneous)', '15.05', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (165, 1, 'Illegal connection of water', 'Other crimes Not Elsewhere Classified (Miscellaneous)', '15.06', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (166, 1, 'Killing of an animal with intent to steal', 'Other crimes Not Elsewhere Classified (Miscellaneous)', '15.07', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (167, 1, 'Possesion of more than 20 litres of baka or lapire without licence', 'Other crimes Not Elsewhere Classified (Miscellaneous)', '15.08', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (168, 1, 'Possession of pornographic materials', 'Other crimes Not Elsewhere Classified (Miscellaneous)', '15.09', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (169, 1, 'Prohibited goods', 'Other crimes Not Elsewhere Classified (Miscellaneous)', '15.10', NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (170, 2, 'Divorce', NULL, NULL, NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (171, 2, 'Civil Ex-Parte', NULL, NULL, NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (172, 2, 'Civil Suit', NULL, NULL, NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (173, 2, 'Petition/Application', NULL, NULL, NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO case_category (case_category_id, case_type_id, case_category_name, case_category_title, case_category_no, act_code, prefix, death_sentence, life_sentence, min_sentence, max_sentence, min_fine, max_fine, min_canes, max_canes, details) VALUES (174, 2, 'Miscellaneous Application', NULL, NULL, NULL, NULL, false, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Name: case_category_case_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('case_category_case_category_id_seq', 174, true);



INSERT INTO contact_types (contact_type_id, contact_type_name, appeal, trial, ep, details, bench_next, bench) VALUES (1, 'Presiding Judge', true, true, true, NULL, false, true);
INSERT INTO contact_types (contact_type_id, contact_type_name, appeal, trial, ep, details, bench_next, bench) VALUES (2, 'Prosecutor', true, true, false, NULL, false, false);
INSERT INTO contact_types (contact_type_id, contact_type_name, appeal, trial, ep, details, bench_next, bench) VALUES (3, 'Prosecution Witness', true, true, false, NULL, false, false);
INSERT INTO contact_types (contact_type_id, contact_type_name, appeal, trial, ep, details, bench_next, bench) VALUES (4, 'Accused', true, true, false, NULL, false, false);
INSERT INTO contact_types (contact_type_id, contact_type_name, appeal, trial, ep, details, bench_next, bench) VALUES (5, 'Plaintiff', true, true, false, NULL, false, false);
INSERT INTO contact_types (contact_type_id, contact_type_name, appeal, trial, ep, details, bench_next, bench) VALUES (6, 'Defendant', true, true, false, NULL, false, false);
INSERT INTO contact_types (contact_type_id, contact_type_name, appeal, trial, ep, details, bench_next, bench) VALUES (7, 'Appellant', true, true, false, NULL, false, false);
INSERT INTO contact_types (contact_type_id, contact_type_name, appeal, trial, ep, details, bench_next, bench) VALUES (8, 'Respondent', true, true, true, NULL, false, false);
INSERT INTO contact_types (contact_type_id, contact_type_name, appeal, trial, ep, details, bench_next, bench) VALUES (9, 'Applicant', true, true, false, NULL, false, false);
INSERT INTO contact_types (contact_type_id, contact_type_name, appeal, trial, ep, details, bench_next, bench) VALUES (10, 'Petitioner', true, true, true, NULL, false, false);
INSERT INTO contact_types (contact_type_id, contact_type_name, appeal, trial, ep, details, bench_next, bench) VALUES (11, 'Advocate of the Plaintiff', true, true, false, NULL, false, false);
INSERT INTO contact_types (contact_type_id, contact_type_name, appeal, trial, ep, details, bench_next, bench) VALUES (12, 'Advocate of the Defendant', true, true, false, NULL, false, false);
INSERT INTO contact_types (contact_type_id, contact_type_name, appeal, trial, ep, details, bench_next, bench) VALUES (13, 'Advocate of the Petitioner', true, true, true, NULL, false, false);
INSERT INTO contact_types (contact_type_id, contact_type_name, appeal, trial, ep, details, bench_next, bench) VALUES (14, 'Advocate of the Respondent', true, true, true, NULL, false, false);
INSERT INTO contact_types (contact_type_id, contact_type_name, appeal, trial, ep, details, bench_next, bench) VALUES (15, 'Defence Witness', true, true, false, NULL, false, false);
INSERT INTO contact_types (contact_type_id, contact_type_name, appeal, trial, ep, details, bench_next, bench) VALUES (16, 'Petitioner Witness', true, true, true, NULL, false, false);
INSERT INTO contact_types (contact_type_id, contact_type_name, appeal, trial, ep, details, bench_next, bench) VALUES (17, 'Respondent Witness', true, true, true, NULL, false, false);


--
-- Name: contact_types_contact_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contact_types_contact_type_id_seq', 18, true);

INSERT INTO regions (region_id, region_name, details) VALUES (1, 'Nairobi', NULL);
INSERT INTO regions (region_id, region_name, details) VALUES (2, 'Rift Valley', NULL);
INSERT INTO regions (region_id, region_name, details) VALUES (3, 'Eastern', NULL);
INSERT INTO regions (region_id, region_name, details) VALUES (4, 'Nyanza', NULL);
INSERT INTO regions (region_id, region_name, details) VALUES (5, 'Coast', NULL);
INSERT INTO regions (region_id, region_name, details) VALUES (6, 'Central', NULL);
INSERT INTO regions (region_id, region_name, details) VALUES (7, 'Western', NULL);
INSERT INTO regions (region_id, region_name, details) VALUES (8, 'North-Eastern', NULL);


--
-- Name: regions_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('regions_region_id_seq', 9, true);


INSERT INTO counties (county_id, region_id, county_name, details) VALUES (1, 1, 'Nairobi', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (2, 2, 'Narok', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (3, 2, 'Turkana', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (4, 2, 'Elgeyo Marakwet', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (5, 2, 'Trans Nzoia', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (6, 2, 'Uasin Gishu', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (7, 2, 'Nandi', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (8, 2, 'Kericho', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (9, 2, 'Bomet', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (10, 2, 'Baringo', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (11, 2, 'Nakuru', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (12, 2, 'Samburu', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (13, 2, 'Laikipia', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (14, 2, 'Kajiado', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (15, 2, 'West Pokot', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (16, 3, 'Makueni', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (17, 3, 'Machakos', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (18, 3, 'Meru', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (19, 3, 'Tharaka Nithi', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (20, 3, 'Embu', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (21, 3, 'Isiolo', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (22, 3, 'Marsabit', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (23, 3, 'Kitui', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (24, 4, 'Siaya', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (25, 4, 'Kisii', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (26, 4, 'Nyamira', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (27, 4, 'Kisumu', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (28, 4, 'Homa Bay', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (29, 4, 'Migori', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (30, 5, 'Kwale', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (31, 5, 'Mombasa', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (32, 5, 'Taita Taveta', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (33, 5, 'Kilifi', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (34, 5, 'Lamu', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (35, 5, 'Tana River', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (36, 6, 'Kiambu', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (37, 6, 'Muranga', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (38, 6, 'Nyandarua', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (39, 6, 'Nyeri', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (40, 6, 'Kirinyaga', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (41, 7, 'Busia', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (42, 7, 'Bungoma', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (43, 7, 'Kakamega', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (44, 7, 'Vihiga', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (45, 8, 'Garissa', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (46, 8, 'Mandera', NULL);
INSERT INTO counties (county_id, region_id, county_name, details) VALUES (47, 8, 'Wajir', NULL);


--
-- Name: counties_county_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('counties_county_id_seq', 48, true);


INSERT INTO decision_types (decision_type_id, decision_type_name, details) VALUES (1, 'Ruling', NULL);
INSERT INTO decision_types (decision_type_id, decision_type_name, details) VALUES (2, 'Interlocutory Judgment', NULL);
INSERT INTO decision_types (decision_type_id, decision_type_name, details) VALUES (3, 'Final Judgment', NULL);
INSERT INTO decision_types (decision_type_id, decision_type_name, details) VALUES (4, 'Sentencing', NULL);
INSERT INTO decision_types (decision_type_id, decision_type_name, details) VALUES (5, 'Decree', NULL);


--
-- Name: decision_types_decision_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('decision_types_decision_type_id_seq', 6, true);


INSERT INTO judgment_status (judgment_status_id, judgment_status_name) VALUES (1, 'Active');
INSERT INTO judgment_status (judgment_status_id, judgment_status_name) VALUES (2, 'Dormant');
INSERT INTO judgment_status (judgment_status_id, judgment_status_name) VALUES (3, 'Satisfied');
INSERT INTO judgment_status (judgment_status_id, judgment_status_name) VALUES (4, 'Partially satisfied');
INSERT INTO judgment_status (judgment_status_id, judgment_status_name) VALUES (5, 'Expired');
SELECT setval('judgment_status_judgment_status_id_seq', 6);


INSERT INTO division_types (division_type_id, division_type_name) VALUES (1, 'Crimal');
INSERT INTO division_types (division_type_id, division_type_name) VALUES (2, 'Civil');
INSERT INTO division_types (division_type_id, division_type_name) VALUES (3, 'Family');
INSERT INTO division_types (division_type_id, division_type_name) VALUES (4, 'Constitutional');
INSERT INTO division_types (division_type_id, division_type_name) VALUES (5, 'Land and Environment');
INSERT INTO division_types (division_type_id, division_type_name) VALUES (7, 'Election Disputes');
SELECT setval('division_types_division_type_id_seq', 8);

INSERT INTO rankings (ranking_id, ranking_name) VALUES (1, 'Chief Justice');
INSERT INTO rankings (ranking_id, ranking_name) VALUES (2, 'Supreme Court Judge');
INSERT INTO rankings (ranking_id, ranking_name) VALUES (3, 'Court of Appeal Judge');
INSERT INTO rankings (ranking_id, ranking_name) VALUES (4, 'High Court Judge');
INSERT INTO rankings (ranking_id, ranking_name) VALUES (5, 'Chief Magistrate');
INSERT INTO rankings (ranking_id, ranking_name) VALUES (6, 'Senior Principal Magistrate');
INSERT INTO rankings (ranking_id, ranking_name) VALUES (7, 'Principal Magistrate');
INSERT INTO rankings (ranking_id, ranking_name) VALUES (8, 'Senior Resident Magistrate');
INSERT INTO rankings (ranking_id, ranking_name) VALUES (9, 'Resident Magistrate');
SELECT setval('rankings_ranking_id_seq', 10);

INSERT INTO court_ranks (court_rank_id, court_rank_name) VALUES (1, 'Supreme Court');
INSERT INTO court_ranks (court_rank_id, court_rank_name) VALUES (2, 'Court of Appeal');
INSERT INTO court_ranks (court_rank_id, court_rank_name) VALUES (3, 'High Court');
INSERT INTO court_ranks (court_rank_id, court_rank_name) VALUES (4, 'Constitutional Court');
INSERT INTO court_ranks (court_rank_id, court_rank_name) VALUES (5, 'Magistrate Court');
INSERT INTO court_ranks (court_rank_id, court_rank_name) VALUES (6, 'Khadhis Court');
SELECT setval('court_ranks_court_rank_id_seq', 6);

INSERT INTO case_subjects (case_subject_id, case_subject_name) VALUES (1, 'Commercial');
INSERT INTO case_subjects (case_subject_id, case_subject_name) VALUES (2, 'Family');
INSERT INTO case_subjects (case_subject_id, case_subject_name) VALUES (3, 'Insurance');
INSERT INTO case_subjects (case_subject_id, case_subject_name) VALUES (4, 'Constitution');
INSERT INTO case_subjects (case_subject_id, case_subject_name) VALUES (5, 'Contract');
INSERT INTO case_subjects (case_subject_id, case_subject_name, ep) VALUES (6, 'Electoral Disputes', true);
INSERT INTO case_subjects (case_subject_id, case_subject_name) VALUES (7, 'Criminal');
SELECT setval('case_subjects_case_subject_id_seq', 8);







INSERT INTO order_types (order_type_id, order_type_name, details) VALUES (1, 'Witness Summons', NULL);
INSERT INTO order_types (order_type_id, order_type_name, details) VALUES (2, 'Warrant of Arrest', NULL);
INSERT INTO order_types (order_type_id, order_type_name, details) VALUES (3, 'Warrant of Commitment to Civil Jail', NULL);
INSERT INTO order_types (order_type_id, order_type_name, details) VALUES (4, 'Language Understood by Accused', NULL);
INSERT INTO order_types (order_type_id, order_type_name, details) VALUES (5, 'Release Order - where cash bail has been paid', NULL);
INSERT INTO order_types (order_type_id, order_type_name, details) VALUES (6, 'Release Order - where surety has signed bond', NULL);
INSERT INTO order_types (order_type_id, order_type_name, details) VALUES (7, 'Release Order', NULL);
INSERT INTO order_types (order_type_id, order_type_name, details) VALUES (8, 'Committal Warrant to Medical Institution/Mathare Mental Hospital', NULL);
INSERT INTO order_types (order_type_id, order_type_name, details) VALUES (9, 'Escort to Hospital for treatment, Age assessment or mental assessment', NULL);
INSERT INTO order_types (order_type_id, order_type_name, details) VALUES (10, 'Judgment Extraction', NULL);
INSERT INTO order_types (order_type_id, order_type_name, details) VALUES (11, 'Particulars of Surety', NULL);
INSERT INTO order_types (order_type_id, order_type_name, details) VALUES (12, 'Others', NULL);
INSERT INTO order_types (order_type_id, order_type_name, details) VALUES (14, 'Warrant of commitment on remand', NULL);


--
-- Name: order_types_order_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('order_types_order_type_id_seq', 15, true);


INSERT INTO payment_types (payment_type_id, payment_type_name, cash, non_cash, for_credit_note, for_refund, details) VALUES (1, 'Cash Receipt', true, false, false, false, NULL);
INSERT INTO payment_types (payment_type_id, payment_type_name, cash, non_cash, for_credit_note, for_refund, details) VALUES (2, 'KCB Bank Payment', false, false, false, false, NULL);
INSERT INTO payment_types (payment_type_id, payment_type_name, cash, non_cash, for_credit_note, for_refund, details) VALUES (3, 'Credit Note', false, false, true, false, NULL);
INSERT INTO payment_types (payment_type_id, payment_type_name, cash, non_cash, for_credit_note, for_refund, details) VALUES (4, 'Refund', false, false, false, true, NULL);


--
-- Name: payment_types_payment_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('payment_types_payment_type_id_seq', 5, true);



INSERT INTO receipt_types (receipt_type_id, receipt_type_name, receipt_type_code, require_refund, details) VALUES (1, 'Traffic Fine', 'TR', false, NULL);
INSERT INTO receipt_types (receipt_type_id, receipt_type_name, receipt_type_code, require_refund, details) VALUES (2, 'Criminal Fine', 'CR', false, NULL);
INSERT INTO receipt_types (receipt_type_id, receipt_type_name, receipt_type_code, require_refund, details) VALUES (3, 'Filing Fee', 'FF', false, NULL);


--
-- Name: receipt_types_receipt_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('receipt_types_receipt_type_id_seq', 4, true);
