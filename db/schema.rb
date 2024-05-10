# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_04_25_095249) do
  create_table "acc_acccombination", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.integer "combination_no", null: false
    t.string "combination_name", limit: 100, null: false
    t.integer "group1"
    t.integer "group2"
    t.integer "group3"
    t.integer "group4"
    t.integer "group5"
    t.string "remark", limit: 999
    t.datetime "update_time", precision: nil
    t.integer "area_id", null: false
    t.char "company_id", limit: 32
    t.index ["area_id", "combination_no"], name: "acc_acccombination_area_id_combination_no_619eb4f5_uniq", unique: true
    t.index ["area_id"], name: "acc_acccombination_area_id_0d22c34e"
    t.index ["company_id"], name: "acc_acccombination_company_id_700e5a90"
  end

  create_table "acc_accgroups", id: :integer, force: :cascade do |t|
    t.integer "group_no", null: false
    t.string "group_name", limit: 100, null: false
    t.integer "verify_mode", null: false
    t.integer "timezone1"
    t.integer "timezone2"
    t.integer "timezone3"
    t.integer "is_include_holiday", limit: 2, null: false
    t.datetime "update_time", precision: nil
    t.integer "area_id", null: false
    t.char "company_id", limit: 32
    t.index ["area_id", "group_no"], name: "acc_accgroups_area_id_group_no_5130a89c_uniq", unique: true
    t.index ["area_id"], name: "acc_accgroups_area_id_b83745c3"
    t.index ["company_id"], name: "acc_accgroups_company_id_ac234eff"
  end

  create_table "acc_accholiday", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.datetime "update_time", precision: nil
    t.integer "area_id", null: false
    t.char "company_id", limit: 32
    t.integer "holiday_id", null: false
    t.integer "timezone_id", null: false
    t.index ["area_id", "holiday_id"], name: "acc_accholiday_area_id_holiday_id_6630c2eb_uniq", unique: true
    t.index ["area_id"], name: "acc_accholiday_area_id_d15c19da"
    t.index ["company_id"], name: "acc_accholiday_company_id_e4214e28"
    t.index ["holiday_id"], name: "acc_accholiday_holiday_id_a9efe924"
    t.index ["timezone_id"], name: "acc_accholiday_timezone_id_450d2d1e"
  end

  create_table "acc_accprivilege", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.integer "is_group_timezone", limit: 2, null: false
    t.integer "timezone1"
    t.integer "timezone2"
    t.integer "timezone3"
    t.integer "is_group_verifycode", limit: 2, null: false
    t.integer "verify_mode"
    t.datetime "update_time", precision: nil
    t.integer "area_id", null: false
    t.char "company_id", limit: 32
    t.string "employee_id", limit: 36, null: false
    t.integer "group_id", null: false
    t.index ["area_id", "employee_id", "group_id"], name: "acc_accprivilege_area_id_employee_id_group_id_f3b297d8_uniq", unique: true
    t.index ["area_id"], name: "acc_accprivilege_area_id_2123ff6f"
    t.index ["company_id"], name: "acc_accprivilege_company_id_8e2fcb81"
    t.index ["employee_id"], name: "acc_accprivilege_employee_id_5fc55f95"
    t.index ["group_id"], name: "acc_accprivilege_group_id_c5ed7003"
  end

  create_table "acc_accterminal", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.string "door_name", limit: 50
    t.integer "door_lock_delay", null: false
    t.integer "door_sensor_delay", null: false
    t.integer "door_sensor_type", limit: 2, null: false
    t.integer "door_alarm_delay", null: false
    t.integer "retry_times", limit: 2, null: false
    t.integer "valid_holiday", limit: 2, null: false
    t.integer "nc_time_period", null: false
    t.integer "no_time_period", null: false
    t.integer "speaker_alarm", limit: 2, null: false
    t.integer "duress_fun_on", limit: 2, null: false
    t.integer "alarm_1_1", limit: 2, null: false
    t.integer "alarm_1_n", limit: 2, null: false
    t.integer "alarm_password", limit: 2, null: false
    t.integer "duress_alarm_delay", null: false
    t.integer "anti_passback_mode", limit: 2, null: false
    t.integer "anti_door_direction", limit: 2, null: false
    t.integer "verify_mode_485", limit: 2, null: false
    t.datetime "push_time", precision: nil
    t.integer "terminal_id", null: false
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "acc_accterminal_company_id_4bc45d50"
    t.index ["terminal_id"], name: "acc_accterminal_terminal_id_fc92cce2"
  end

  create_table "acc_acctimezone", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.integer "timezone_no", null: false
    t.string "timezone_name", limit: 100, null: false
    t.datetime "sun_start", precision: nil, null: false
    t.datetime "sun_end", precision: nil, null: false
    t.integer "sun_on", limit: 2
    t.datetime "mon_start", precision: nil, null: false
    t.datetime "mon_end", precision: nil, null: false
    t.integer "mon_on", limit: 2
    t.datetime "tue_start", precision: nil, null: false
    t.datetime "tue_end", precision: nil, null: false
    t.integer "tue_on", limit: 2
    t.datetime "wed_start", precision: nil, null: false
    t.datetime "wed_end", precision: nil, null: false
    t.integer "wed_on", limit: 2
    t.datetime "thu_start", precision: nil, null: false
    t.datetime "thu_end", precision: nil, null: false
    t.integer "thu_on", limit: 2
    t.datetime "fri_start", precision: nil, null: false
    t.datetime "fri_end", precision: nil, null: false
    t.integer "fri_on", limit: 2
    t.datetime "sat_start", precision: nil, null: false
    t.datetime "sat_end", precision: nil, null: false
    t.integer "sat_on", limit: 2
    t.string "remark", limit: 999
    t.datetime "update_time", precision: nil
    t.integer "area_id", null: false
    t.char "company_id", limit: 32
    t.index ["area_id", "timezone_no"], name: "acc_acctimezone_area_id_timezone_no_0cb8250f_uniq", unique: true
    t.index ["area_id"], name: "acc_acctimezone_area_id_e9ce7a7a"
    t.index ["company_id"], name: "acc_acctimezone_company_id_143aa9c1"
  end

  create_table "att_attcalclog", id: :integer, force: :cascade do |t|
    t.integer "dept_id"
    t.integer "emp_id"
    t.datetime "start_date", precision: nil, null: false
    t.datetime "end_date", precision: nil, null: false
    t.datetime "update_time", precision: nil, null: false
    t.integer "log_type", null: false
  end

  create_table "att_attreportsetting", id: :integer, force: :cascade do |t|
    t.integer "resign_emp", limit: 2, null: false
    t.integer "short_date", limit: 2, null: false
    t.integer "short_time", limit: 2, null: false
    t.text "func_key"
    t.text "att_item"
    t.char "company_id", limit: 32
    t.integer "work_day_related_display", limit: 2
    t.index ["company_id"], name: "att_attreportsetting_company_id_6be84335"
  end

  create_table "att_attrule", primary_key: "param_name", id: { type: :string, limit: 56 }, force: :cascade do |t|
    t.text "param_value", null: false
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "att_attrule_company_id_e4904421"
  end

  create_table "att_attschedule", id: :integer, force: :cascade do |t|
    t.datetime "start_date", precision: nil, null: false
    t.datetime "end_date", precision: nil, null: false
    t.string "employee_id", limit: 36, null: false
    t.integer "shift_id", null: false
    t.index ["employee_id"], name: "att_attschedule_employee_id_caa61686"
    t.index ["shift_id"], name: "att_attschedule_shift_id_13d2db9a"
  end

  create_table "att_attshift", id: :integer, force: :cascade do |t|
    t.string "alias", limit: 50, null: false
    t.integer "cycle_unit", limit: 2, null: false
    t.integer "shift_cycle", null: false
    t.boolean "work_weekend", null: false
    t.integer "weekend_type", limit: 2, null: false
    t.boolean "work_day_off", null: false
    t.integer "day_off_type", limit: 2, null: false
    t.integer "auto_shift", limit: 2, null: false
    t.char "company_id", limit: 32
    t.boolean "is_default", null: false
    t.index ["company_id"], name: "att_attshift_company_id_2c0a4f56"
  end

  create_table "att_breaktime", id: :integer, force: :cascade do |t|
    t.string "alias", limit: 50, null: false
    t.datetime "period_start", precision: nil, null: false
    t.integer "duration", null: false
    t.integer "end_margin", null: false
    t.integer "func_key", limit: 2, null: false
    t.integer "available_interval_type", limit: 2, null: false
    t.integer "available_interval", null: false
    t.integer "multiple_punch", limit: 2, null: false
    t.integer "calc_type", limit: 2, null: false
    t.integer "minimum_duration"
    t.integer "early_in", limit: 2, null: false
    t.integer "min_early_in", null: false
    t.integer "late_in", limit: 2, null: false
    t.integer "min_late_in", null: false
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "att_breaktime_company_id_fbb9a2b7"
  end

  create_table "att_changeschedule", primary_key: "abstractexception_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.datetime "att_date", precision: nil, null: false
    t.string "previous_timeinterval", limit: 100
    t.datetime "apply_time", precision: nil, null: false
    t.string "apply_reason", limit: 200
    t.text "audit_reason"
    t.datetime "audit_time", precision: nil
    t.string "approver", limit: 50
    t.datetime "start_time", precision: nil, null: false
    t.datetime "end_time", precision: nil, null: false
    t.string "employee_id", limit: 36, null: false
    t.integer "timeinterval_id", null: false
    t.index ["employee_id"], name: "att_changeschedule_employee_id_7871a2b6"
    t.index ["timeinterval_id"], name: "att_changeschedule_timeinterval_id_d41ac077"
  end

  create_table "att_clientdetails", id: :integer, force: :cascade do |t|
    t.string "client_id", limit: 55, null: false
    t.string "company_name", limit: 55, null: false
    t.text "address", null: false
    t.string "branch", limit: 55, null: false
    t.string "contact_person", limit: 55, null: false
    t.string "mobile", limit: 15, null: false
    t.integer "distance", null: false
    t.float "longitude", null: false
    t.float "latitude", null: false
    t.float "punch_location_radius", null: false
    t.string "logo", limit: 200
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "att_clientdetails_company_id_11b1619a"
  end

  create_table "att_departmentschedule", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.datetime "start_date", precision: nil, null: false
    t.datetime "end_date", precision: nil, null: false
    t.integer "department_id", null: false
    t.integer "shift_id", null: false
    t.index ["department_id"], name: "att_departmentschedule_department_id_c68fca3d"
    t.index ["shift_id"], name: "att_departmentschedule_shift_id_c37d5ade"
  end

  create_table "att_deptattrule", id: :integer, force: :cascade do |t|
    t.string "alias", limit: 50, null: false
    t.text "rule"
    t.char "company_id", limit: 32
    t.integer "department_id", null: false
    t.index ["company_id"], name: "att_deptattrule_company_id_420199ab"
    t.index ["department_id"], name: "att_deptattrule_department_id_f333c8f0"
  end

  create_table "att_holiday", id: :integer, force: :cascade do |t|
    t.string "alias", limit: 50, null: false
    t.datetime "start_date", precision: nil, null: false
    t.integer "duration_day", limit: 2, null: false
    t.integer "work_type", limit: 2, null: false
    t.float "overtime_lv1", null: false
    t.float "overtime_lv2", null: false
    t.float "overtime_lv3", null: false
    t.char "company_id", limit: 32
    t.integer "department_id"
    t.integer "location_id"
    t.index ["company_id"], name: "att_holiday_company_id_4c395f52"
    t.index ["department_id"], name: "att_holiday_department_id_fbbbd185"
    t.index ["location_id"], name: "att_holiday_location_id_7bd552a5"
  end

  create_table "att_leave", primary_key: "abstractexception_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.datetime "start_time", precision: nil
    t.datetime "end_time", precision: nil
    t.text "apply_reason"
    t.datetime "apply_time", precision: nil, null: false
    t.text "audit_reason"
    t.datetime "audit_time", precision: nil
    t.integer "approval_level", limit: 2
    t.string "audit_user_id", limit: 100
    t.string "approver", limit: 50
    t.integer "day_type", limit: 2
    t.float "days"
    t.integer "leave_payment_type", limit: 2
    t.text "leave_schedule"
    t.string "revoke_type", limit: 1, null: false
    t.text "leave_applied_data"
    t.integer "category_id", null: false
    t.string "employee_id", limit: 36, null: false
    t.index ["category_id"], name: "att_leave_category_id_bbba39ba"
    t.index ["employee_id"], name: "att_leave_employee_id_bb231627"
  end

  create_table "att_leavecategory", id: :integer, force: :cascade do |t|
    t.string "category_name", limit: 50, null: false
    t.float "minimum_unit", null: false
    t.integer "unit", limit: 2, null: false
    t.integer "round_off", limit: 2, null: false
    t.string "report_symbol", limit: 5, null: false
    t.char "company_id", limit: 32
    t.integer "prefix", limit: 2
    t.integer "suffix", limit: 2
    t.index ["company_id"], name: "att_leavecategory_company_id_e8169be2"
  end

  create_table "att_leaveschedule", id: :integer, force: :cascade do |t|
    t.text "leave_details"
    t.char "company_id", limit: 32
    t.string "employee_id", limit: 36, null: false
    t.text "monthly_leave_details"
    t.index ["company_id"], name: "att_leaveschedule_company_id_e9e8f83c"
    t.index ["employee_id"], name: "att_leaveschedule_employee_id_d0b947bc"
  end

  create_table "att_leavesettings", id: :integer, force: :cascade do |t|
    t.integer "allotment_type", limit: 2, null: false
    t.datetime "effective_date", precision: nil, null: false
    t.datetime "increment_date", precision: nil
    t.float "days", null: false
    t.float "max_leave_per_month", null: false
    t.float "leave_balance", null: false
    t.float "carry_forward_limit", null: false
    t.integer "auto_deduct", limit: 2, null: false
    t.char "company_id", limit: 32
    t.string "employee_id", limit: 36, null: false
    t.index ["company_id"], name: "att_leavesettings_company_id_22b94e3e"
    t.index ["employee_id"], name: "att_leavesettings_employee_id_499b08f8"
  end

  create_table "att_manuallog", primary_key: "abstractexception_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.datetime "punch_time", precision: nil, null: false
    t.integer "punch_state", null: false
    t.string "work_code", limit: 20
    t.text "apply_reason"
    t.datetime "apply_time", precision: nil, null: false
    t.text "audit_reason"
    t.datetime "audit_time", precision: nil
    t.integer "approval_level", limit: 2
    t.string "audit_user_id", limit: 100
    t.string "approver", limit: 50
    t.string "employee_id", limit: 36, null: false
    t.index ["employee_id"], name: "att_manuallog_employee_id_dc8cc2ad"
  end

  create_table "att_outdooremployeeschedule", id: :integer, force: :cascade do |t|
    t.datetime "start_date", precision: nil, null: false
    t.datetime "end_date", precision: nil, null: false
    t.string "assigned_by", limit: 55
    t.char "company_id", limit: 32
    t.string "employee_id", limit: 36, null: false
    t.integer "schedule_planner_id", null: false
    t.index ["company_id"], name: "att_outdooremployeeschedule_company_id_3d89bc1d"
    t.index ["employee_id"], name: "att_outdooremployeeschedule_employee_id_d1d04c44"
    t.index ["schedule_planner_id"], name: "att_outdooremployeeschedule_schedule_planner_id_7f6c2124"
  end

  create_table "att_outdoorscheduleplanner", id: :integer, force: :cascade do |t|
    t.string "schedule_name", limit: 55, null: false
    t.text "schedule_details"
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "att_outdoorscheduleplanner_company_id_d3e68ba0"
  end

  create_table "att_outdoortrack", id: :integer, force: :cascade do |t|
    t.integer "schedule_type", limit: 2, null: false
    t.datetime "date", precision: nil, null: false
    t.datetime "checkin", precision: nil
    t.datetime "checkout", precision: nil
    t.float "checkin_latitude"
    t.float "checkout_latitude"
    t.float "checkin_longitude"
    t.float "checkout_longitude"
    t.text "checkin_capture"
    t.text "checkout_capture"
    t.text "summary"
    t.integer "client_id"
    t.string "employee_id", limit: 36, null: false
    t.integer "schedule_id"
    t.char "company_id", limit: 32
    t.text "checkin_address"
    t.text "checkout_address"
    t.text "client_name"
    t.index ["client_id"], name: "att_outdoortrack_client_id_685e3c3b"
    t.index ["company_id"], name: "att_outdoortrack_company_id_0f25e1bc"
    t.index ["employee_id"], name: "att_outdoortrack_employee_id_93263c5c"
    t.index ["schedule_id"], name: "att_outdoortrack_schedule_id_a9af11fb"
  end

  create_table "att_overtime", primary_key: "abstractexception_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "overtime_type", limit: 2, null: false
    t.datetime "start_time", precision: nil, null: false
    t.datetime "end_time", precision: nil, null: false
    t.text "apply_reason"
    t.datetime "apply_time", precision: nil, null: false
    t.text "audit_reason"
    t.datetime "audit_time", precision: nil
    t.integer "approval_level", limit: 2
    t.string "audit_user_id", limit: 100
    t.string "approver", limit: 50
    t.string "employee_id", limit: 36, null: false
    t.index ["employee_id"], name: "att_overtime_employee_id_0c0d39dc"
  end

  create_table "att_payloadbase", primary_key: "uuid", id: { type: :string, limit: 36 }, force: :cascade do |t|
    t.datetime "att_date", precision: nil
    t.integer "weekday", limit: 2
    t.datetime "check_in", precision: nil
    t.datetime "check_out", precision: nil
    t.integer "duration"
    t.integer "duty_duration"
    t.float "work_day", null: false
    t.datetime "clock_in", precision: nil
    t.datetime "clock_out", precision: nil
    t.integer "total_time"
    t.integer "half_day"
    t.integer "duty_worked"
    t.integer "actual_worked"
    t.integer "unscheduled"
    t.integer "remaining"
    t.integer "total_worked"
    t.integer "late"
    t.integer "early_leave"
    t.integer "short"
    t.integer "absent"
    t.integer "leave"
    t.string "exception", limit: 50
    t.integer "day_off", limit: 2, null: false
    t.string "break_time_id", limit: 36
    t.string "emp_id", limit: 36, null: false
    t.string "overtime_id", limit: 36
    t.integer "timetable_id"
    t.integer "whole_day_duration"
    t.index ["break_time_id"], name: "UQ__att_payl__3C490B12CA612652", unique: true
    t.index ["emp_id"], name: "att_payloadbase_emp_id_2c0f6a7b"
    t.index ["overtime_id"], name: "UQ__att_payl__B846E8107999A50A", unique: true
    t.index ["timetable_id"], name: "att_payloadbase_timetable_id_a389e3d8"
  end

  create_table "att_payloadbreak", primary_key: "uuid", id: { type: :string, limit: 36 }, force: :cascade do |t|
    t.datetime "break_out", precision: nil
    t.datetime "break_in", precision: nil
    t.integer "duration"
    t.integer "taken"
    t.integer "actual_duration"
    t.integer "early_in"
    t.integer "late_in"
    t.integer "late"
    t.integer "early_leave"
    t.integer "absent"
    t.integer "work_time"
    t.integer "overtime"
    t.integer "weekend_ot"
    t.integer "holiday_ot"
  end

  create_table "att_payloadexception", primary_key: "uuid", id: { type: :string, limit: 36 }, force: :cascade do |t|
    t.datetime "start_time", precision: nil, null: false
    t.datetime "end_time", precision: nil, null: false
    t.integer "duration"
    t.float "days"
    t.integer "data_type", limit: 2, null: false
    t.string "description", limit: 50
    t.integer "item_id"
    t.string "skd_id", limit: 36
    t.index ["item_id"], name: "att_payloadexception_item_id_a08bfe48"
    t.index ["skd_id"], name: "att_payloadexception_skd_id_b2e9ecaa"
  end

  create_table "att_payloadmulpunchset", id: :integer, force: :cascade do |t|
    t.datetime "att_date", precision: nil, null: false
    t.integer "weekday", limit: 2
    t.integer "data_index", limit: 2, null: false
    t.datetime "clock_in", precision: nil
    t.integer "in_id"
    t.datetime "clock_out", precision: nil
    t.integer "out_id"
    t.integer "total_time"
    t.integer "worked_time"
    t.integer "data_type", limit: 2, null: false
    t.string "emp_id", limit: 36, null: false
    t.integer "timetable_id"
    t.index ["emp_id"], name: "att_payloadmulpunchset_emp_id_f47610c8"
    t.index ["timetable_id"], name: "att_payloadmulpunchset_timetable_id_9a439a09"
  end

  create_table "att_payloadovertime", primary_key: "uuid", id: { type: :string, limit: 36 }, force: :cascade do |t|
    t.integer "normal_wt"
    t.integer "normal_ot"
    t.integer "weekend_ot"
    t.integer "holiday_ot"
    t.integer "ot_lv1"
    t.integer "ot_lv2"
    t.integer "ot_lv3"
    t.integer "total_ot"
  end

  create_table "att_payloadpunch", primary_key: "uuid", id: { type: :string, limit: 36 }, force: :cascade do |t|
    t.datetime "att_date", precision: nil
    t.string "correct_state", limit: 3
    t.string "emp_id", limit: 36, null: false
    t.integer "orig_id"
    t.string "skd_id", limit: 36
    t.index ["emp_id"], name: "att_payloadpunch_emp_id_053da2f0"
    t.index ["orig_id"], name: "att_payloadpunch_orig_id_16b26416"
    t.index ["skd_id"], name: "att_payloadpunch_skd_id_17596d82"
  end

  create_table "att_reportparam", id: :integer, force: :cascade do |t|
    t.string "param_name", limit: 20, null: false
    t.text "param_value", null: false
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "att_reportparam_company_id_e1078d08"
  end

  create_table "att_shiftdetail", id: :integer, force: :cascade do |t|
    t.datetime "in_time", precision: nil, null: false
    t.datetime "out_time", precision: nil, null: false
    t.integer "day_index", null: false
    t.integer "shift_id", null: false
    t.integer "time_interval_id"
    t.integer "weekend_day", limit: 2
    t.index ["shift_id"], name: "att_shiftdetail_shift_id_7d694501"
    t.index ["time_interval_id"], name: "att_shiftdetail_time_interval_id_777dde8f"
  end

  create_table "att_tempschedule", id: :integer, force: :cascade do |t|
    t.datetime "start_time", precision: nil, null: false
    t.datetime "end_time", precision: nil, null: false
    t.integer "rule_flag", limit: 2, null: false
    t.integer "work_type", limit: 2, null: false
    t.string "employee_id", limit: 36, null: false
    t.integer "time_interval_id"
    t.index ["employee_id"], name: "att_tempschedule_employee_id_b89c7e54"
    t.index ["time_interval_id"], name: "att_tempschedule_time_interval_id_08dd8eb3"
  end

  create_table "att_timeinterval", id: :integer, force: :cascade do |t|
    t.string "alias", limit: 50, null: false
    t.integer "use_mode", limit: 2, null: false
    t.datetime "in_time", precision: nil, null: false
    t.integer "in_ahead_margin", null: false
    t.integer "in_above_margin", null: false
    t.integer "out_ahead_margin", null: false
    t.integer "out_above_margin", null: false
    t.integer "duration", null: false
    t.integer "in_required", limit: 2, null: false
    t.integer "out_required", limit: 2, null: false
    t.integer "allow_late", null: false
    t.integer "allow_leave_early", null: false
    t.float "work_day", null: false
    t.integer "early_in", limit: 2, null: false
    t.integer "min_early_in", null: false
    t.integer "late_out", limit: 2, null: false
    t.integer "min_late_out", null: false
    t.integer "overtime_lv", limit: 2, null: false
    t.float "overtime_lv1", null: false
    t.float "overtime_lv2", null: false
    t.float "overtime_lv3", null: false
    t.integer "multiple_punch", limit: 2, null: false
    t.integer "available_interval_type", limit: 2, null: false
    t.integer "available_interval", null: false
    t.integer "work_time_duration", null: false
    t.integer "func_key", limit: 2, null: false
    t.integer "work_type", limit: 2, null: false
    t.datetime "day_change", precision: nil, null: false
    t.datetime "first_half_out_time", precision: nil, null: false
    t.datetime "second_half_in_time", precision: nil, null: false
    t.char "company_id", limit: 32
    t.boolean "is_default", null: false
    t.index ["company_id"], name: "att_timeinterval_company_id_9824d651"
    t.check_constraint "[allow_late]>=(0)", name: "att_timeinterval_allow_late_6e1cad71_check"
    t.check_constraint "[allow_leave_early]>=(0)", name: "att_timeinterval_allow_leave_early_87b1fab4_check"
  end

  create_table "att_timeinterval_break_time", id: :integer, force: :cascade do |t|
    t.integer "timeinterval_id", null: false
    t.integer "breaktime_id", null: false
    t.index ["breaktime_id"], name: "att_timeinterval_break_time_breaktime_id_08462308"
    t.index ["timeinterval_id", "breaktime_id"], name: "att_timeinterval_break_time_timeinterval_id_breaktime_id_6e1bfb4e_uniq", unique: true
    t.index ["timeinterval_id"], name: "att_timeinterval_break_time_timeinterval_id_2287017e"
  end

  create_table "att_training", primary_key: "abstractexception_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.datetime "start_time", precision: nil, null: false
    t.datetime "end_time", precision: nil, null: false
    t.text "apply_reason"
    t.datetime "apply_time", precision: nil, null: false
    t.text "audit_reason"
    t.datetime "audit_time", precision: nil
    t.integer "approval_level", limit: 2
    t.string "audit_user_id", limit: 100
    t.string "approver", limit: 50
    t.integer "category_id", null: false
    t.string "employee_id", limit: 36, null: false
    t.index ["category_id"], name: "att_training_category_id_fb38e891"
    t.index ["employee_id"], name: "att_training_employee_id_44af8319"
  end

  create_table "att_trainingcategory", id: :integer, force: :cascade do |t|
    t.string "category_name", limit: 50, null: false
    t.float "minimum_unit", null: false
    t.integer "unit", limit: 2, null: false
    t.integer "round_off", limit: 2, null: false
    t.string "report_symbol", limit: 5, null: false
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "att_trainingcategory_company_id_b2cdea87"
    t.index ["report_symbol", "company_id"], name: "att_trainingcategory_report_symbol_company_id_b7e40e96_uniq", unique: true
  end

  create_table "auth_group", id: :integer, force: :cascade do |t|
    t.string "name", limit: 80, null: false
    t.index ["name"], name: "UQ__auth_gro__72E12F1B8D764E7C", unique: true
  end

  create_table "auth_group_permissions", id: :integer, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "permission_id", null: false
    t.index ["group_id", "permission_id"], name: "auth_group_permissions_group_id_permission_id_0cd325b0_uniq", unique: true
    t.index ["group_id"], name: "auth_group_permissions_group_id_b120cbf9"
    t.index ["permission_id"], name: "auth_group_permissions_permission_id_84c5c92e"
  end

  create_table "auth_group_profile", primary_key: "group_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "auth_group_profile_company_id_5b832dad"
  end

  create_table "auth_group_profile_group_user", id: :integer, force: :cascade do |t|
    t.integer "groupprofile_id", null: false
    t.string "myuser_id", limit: 36, null: false
    t.index ["groupprofile_id", "myuser_id"], name: "auth_group_profile_group_user_groupprofile_id_myuser_id_d36733d1_uniq", unique: true
    t.index ["groupprofile_id"], name: "auth_group_profile_group_user_groupprofile_id_ff65a508"
    t.index ["myuser_id"], name: "auth_group_profile_group_user_myuser_id_43d03228"
  end

  create_table "auth_permission", id: :integer, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "content_type_id", null: false
    t.string "codename", limit: 100, null: false
    t.index ["content_type_id", "codename"], name: "auth_permission_content_type_id_codename_01ab375a_uniq", unique: true
    t.index ["content_type_id"], name: "auth_permission_content_type_id_2f476e4b"
  end

  create_table "auth_user", id: { type: :string, limit: 36 }, force: :cascade do |t|
    t.string "username", limit: 30, null: false
    t.string "password", limit: 128, null: false
    t.string "first_name", limit: 30, null: false
    t.string "last_name", limit: 30, null: false
    t.string "emp_pin", limit: 30
    t.string "email", limit: 254, null: false
    t.string "tel_phone", limit: 30
    t.integer "auth_time_dept"
    t.integer "login_id"
    t.integer "login_type"
    t.integer "login_count"
    t.boolean "is_staff", null: false
    t.boolean "is_active", null: false
    t.boolean "is_public", null: false
    t.boolean "can_manage_all_dept", null: false
    t.integer "del_flag"
    t.datetime "date_joined", precision: nil, null: false
    t.datetime "last_login", precision: nil
    t.string "login_name", limit: 30, null: false
    t.text "pin_tabs", null: false
    t.text "disabled_fields", null: false
    t.text "column_order", null: false
    t.text "preferences", null: false
    t.string "current_company", limit: 36
    t.string "recent_company", limit: 36
    t.string "nickname", limit: 30, null: false
    t.string "mobile", limit: 20
    t.index ["username"], name: "UQ__auth_use__F3DBC572319C230E", unique: true
  end

  create_table "auth_user_groups", id: :integer, force: :cascade do |t|
    t.string "myuser_id", limit: 36, null: false
    t.integer "group_id", null: false
    t.index ["group_id"], name: "auth_user_groups_group_id_97559544"
    t.index ["myuser_id", "group_id"], name: "auth_user_groups_myuser_id_group_id_664bdfc3_uniq", unique: true
    t.index ["myuser_id"], name: "auth_user_groups_myuser_id_d03e8dcc"
  end

  create_table "auth_user_user_permissions", id: :integer, force: :cascade do |t|
    t.string "myuser_id", limit: 36, null: false
    t.integer "permission_id", null: false
    t.index ["myuser_id", "permission_id"], name: "auth_user_user_permissions_myuser_id_permission_id_a558717f_uniq", unique: true
    t.index ["myuser_id"], name: "auth_user_user_permissions_myuser_id_679b1527"
    t.index ["permission_id"], name: "auth_user_user_permissions_permission_id_1fbb5f2c"
  end

  create_table "authtoken_token", primary_key: "key", id: { type: :string, limit: 40 }, force: :cascade do |t|
    t.datetime "created", precision: nil, null: false
    t.string "user_id", limit: 36, null: false
    t.index ["user_id"], name: "UQ__authtoke__B9BE370E7B70BFC2", unique: true
  end

  create_table "base_adminlog", id: :integer, force: :cascade do |t|
    t.string "action", limit: 50, null: false
    t.text "targets"
    t.text "targets_repr"
    t.integer "action_status", limit: 2, null: false
    t.text "description"
    t.string "ip_address", limit: 39
    t.boolean "can_routable", null: false
    t.datetime "op_time", precision: nil, null: false
    t.char "company_id", limit: 32
    t.integer "content_type_id"
    t.string "user_id", limit: 36, null: false
    t.index ["company_id"], name: "base_adminlog_company_id_bc0e756f"
    t.index ["content_type_id"], name: "base_adminlog_content_type_id_3e553c30"
    t.index ["user_id"], name: "base_adminlog_user_id_ecf659f8"
  end

  create_table "base_autoexporttask", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.string "task_code", limit: 30, null: false
    t.string "task_name", limit: 30, null: false
    t.text "params"
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "base_autoexporttask_company_id_efb12456"
  end

  create_table "base_bookmark", id: :integer, force: :cascade do |t|
    t.string "title", limit: 128, null: false
    t.string "filters", limit: 1000, null: false
    t.boolean "is_share", null: false
    t.datetime "time_saved", precision: nil, null: false
    t.char "company_id", limit: 32
    t.integer "content_type_id", null: false
    t.string "user_id", limit: 36
    t.index ["company_id"], name: "base_bookmark_company_id_67ca1aa0"
    t.index ["content_type_id"], name: "base_bookmark_content_type_id_b6a0e799"
    t.index ["user_id"], name: "base_bookmark_user_id_5f2d5ca2"
  end

  create_table "base_dbbackuplog", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.string "db_type", limit: 50, null: false
    t.string "db_name", limit: 50, null: false
    t.string "operator", limit: 50
    t.string "backup_file", limit: 100, null: false
    t.datetime "backup_time", precision: nil, null: false
    t.integer "status", limit: 2, null: false
    t.integer "backup_status", limit: 2, null: false
    t.text "remark"
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "base_dbbackuplog_company_id_8f93ee2e"
  end

  create_table "base_dbmigrate", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.string "name", limit: 30, null: false
    t.text "value", null: false
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "base_dbmigrate_company_id_e1709280"
  end

  create_table "base_linenotifysetting", id: :integer, force: :cascade do |t|
    t.integer "include_sub_department"
    t.string "line_notify_token", limit: 200
    t.integer "message_type"
    t.string "message_head", limit: 100
    t.string "message_tail", limit: 100
    t.datetime "push_time", precision: nil
    t.integer "is_valid"
    t.string "remark", limit: 200
    t.integer "line_notify_dept_id"
    t.index ["line_notify_dept_id", "line_notify_token", "message_type"], name: "base_linenotifysetting_line_notify_dept_id_line_notify_token_message_type_dd79374f_uniq", unique: true
    t.index ["line_notify_dept_id"], name: "base_linenotifysetting_line_notify_dept_id_0643a5ed"
  end

  create_table "base_membership", id: :integer, force: :cascade do |t|
    t.integer "role", limit: 2, null: false
    t.char "company_id", limit: 32, null: false
    t.string "user_id", limit: 36, null: false
    t.char "vendor_company_id", limit: 32
    t.index ["company_id"], name: "base_membership_company_id_a76e12ab"
    t.index ["user_id", "company_id"], name: "base_membership_user_id_company_id_9c31ff9c_uniq", unique: true
    t.index ["user_id"], name: "base_membership_user_id_41d22f2f"
    t.index ["vendor_company_id"], name: "base_membership_vendor_company_id_05daafa1"
  end

  create_table "base_membership_auth_area", id: :integer, force: :cascade do |t|
    t.integer "membership_id", null: false
    t.integer "area_id", null: false
    t.index ["area_id"], name: "base_membership_auth_area_area_id_e58abb05"
    t.index ["membership_id", "area_id"], name: "base_membership_auth_area_membership_id_area_id_deb05fe8_uniq", unique: true
    t.index ["membership_id"], name: "base_membership_auth_area_membership_id_83d2efbb"
  end

  create_table "base_membership_auth_dept", id: :integer, force: :cascade do |t|
    t.integer "membership_id", null: false
    t.integer "department_id", null: false
    t.index ["department_id"], name: "base_membership_auth_dept_department_id_c1d95e5b"
    t.index ["membership_id", "department_id"], name: "base_membership_auth_dept_membership_id_department_id_b765f207_uniq", unique: true
    t.index ["membership_id"], name: "base_membership_auth_dept_membership_id_22e9a747"
  end

  create_table "base_membership_auth_pos", id: :integer, force: :cascade do |t|
    t.integer "membership_id", null: false
    t.integer "position_id", null: false
    t.index ["membership_id", "position_id"], name: "base_membership_auth_pos_membership_id_position_id_0f773054_uniq", unique: true
    t.index ["membership_id"], name: "base_membership_auth_pos_membership_id_82d704d4"
    t.index ["position_id"], name: "base_membership_auth_pos_position_id_ae22a7d3"
  end

  create_table "base_paralleldb", id: :integer, force: :cascade do |t|
    t.string "database", limit: 50, null: false
    t.string "ip_address", limit: 50, null: false
    t.string "port", limit: 50, null: false
    t.string "database_name", limit: 50, null: false
    t.string "user", limit: 50, null: false
    t.string "password", limit: 50, null: false
    t.integer "service_type", limit: 2
    t.integer "duplicate_punch"
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "base_paralleldb_company_id_2842487e"
  end

  create_table "base_paralleldbexport", id: :integer, force: :cascade do |t|
    t.string "table_name", limit: 100
    t.string "emp_code", limit: 50
    t.string "punch_time", limit: 50
    t.integer "time_format"
    t.string "punch_date_time", limit: 50
    t.string "punch_date", limit: 50
    t.string "punch_state", limit: 50
    t.string "punch_states", limit: 50
    t.string "verify_type", limit: 50
    t.string "verify_types", limit: 50
    t.string "terminal_sn", limit: 100
    t.string "terminal_alias", limit: 100
    t.string "area_alias", limit: 100
    t.string "work_code", limit: 100
    t.string "upload_time", limit: 50
    t.string "purpose", limit: 50
    t.string "emp_id", limit: 50
    t.string "terminal_id", limit: 50
    t.string "source", limit: 50
    t.string "temperature", limit: 50
    t.string "mask_flag", limit: 50
    t.string "terminal_ip", limit: 50
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "base_paralleldbexport_company_id_4028fc3e"
  end

  create_table "base_sftpsetting", id: :integer, force: :cascade do |t|
    t.string "host", limit: 39, null: false
    t.integer "port", null: false
    t.integer "auth_method", null: false
    t.string "user_name", limit: 30, null: false
    t.string "user_password", limit: 128
    t.text "user_key"
    t.string "key_password", limit: 128
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "base_sftpsetting_company_id_f270bcdb"
    t.index ["user_name", "host"], name: "base_sftpsetting_user_name_host_f95e6bd9_uniq", unique: true
  end

  create_table "base_sysparam", id: :integer, force: :cascade do |t|
    t.string "para_name", limit: 30, null: false
    t.string "para_type", limit: 10
    t.string "para_value", limit: 250
    t.index ["para_name", "para_type"], name: "base_sysparam_para_name_para_type_3086789a_uniq", unique: true
  end

  create_table "base_sysparamdept", id: :integer, force: :cascade do |t|
    t.string "rule_name", limit: 40, null: false
    t.integer "dept_id", null: false
    t.string "operator", limit: 20
    t.datetime "op_time", precision: nil
    t.index ["rule_name"], name: "UQ__base_sys__B9ADD0FA7AD988C4", unique: true
  end

  create_table "base_systemsetting", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.string "name", limit: 30, null: false
    t.text "value", null: false
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "base_systemsetting_company_id_e59b9b82"
  end

  create_table "base_taskresultlog", id: :integer, force: :cascade do |t|
    t.string "task", limit: 50, null: false
    t.string "status", limit: 10, null: false
    t.string "result", limit: 500, null: false
    t.datetime "time", precision: nil, null: false
  end

  create_table "base_tempuser", id: { type: :char, limit: 32 }, force: :cascade do |t|
    t.string "email", limit: 254, null: false
    t.string "company_name", limit: 25, null: false
    t.string "user_name", limit: 25, null: false
  end

  create_table "celery_taskmeta", id: :integer, force: :cascade do |t|
    t.string "task_id", limit: 255, null: false
    t.string "status", limit: 50, null: false
    t.text "result"
    t.datetime "date_done", precision: nil, null: false
    t.text "traceback"
    t.boolean "hidden", null: false
    t.text "meta"
    t.index ["hidden"], name: "celery_taskmeta_hidden_23fd02dc"
    t.index ["task_id"], name: "UQ__celery_t__0492148C534ACF3D", unique: true
  end

  create_table "celery_tasksetmeta", id: :integer, force: :cascade do |t|
    t.string "taskset_id", limit: 255, null: false
    t.text "result", null: false
    t.datetime "date_done", precision: nil, null: false
    t.boolean "hidden", null: false
    t.index ["hidden"], name: "celery_tasksetmeta_hidden_593cfc24"
    t.index ["taskset_id"], name: "UQ__celery_t__45DBBA5BC9D04CDE", unique: true
  end

  create_table "cloud_discount", id: :integer, force: :cascade do |t|
    t.boolean "effective_status", null: false
    t.float "discount_ratio", null: false
    t.datetime "create_time", precision: nil, null: false
    t.string "create_user_id", limit: 36, null: false
    t.index ["create_user_id"], name: "cloud_discount_create_user_id_0506f480"
  end

  create_table "cloud_feature", id: :integer, force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.integer "type", limit: 2, null: false
    t.string "country", limit: 2, null: false
    t.string "currency", limit: 4
    t.string "description", limit: 200
    t.boolean "display_status", null: false
    t.boolean "effective_status", null: false
    t.float "price"
  end

  create_table "cloud_order", id: :integer, force: :cascade do |t|
    t.string "number", limit: 25, null: false
    t.integer "subscription_duration", null: false
    t.integer "employees_count", null: false
    t.integer "devices_count", null: false
    t.integer "transactions_count"
    t.integer "mobile_applications_count"
    t.integer "whatsapp_push_count"
    t.float "original_price", null: false
    t.float "discount_price", null: false
    t.float "payment_price", null: false
    t.integer "payment_status", null: false
    t.datetime "create_time", precision: nil, null: false
    t.char "company_id", limit: 32, null: false
    t.string "create_user_id", limit: 36, null: false
    t.integer "price_strategy_id", null: false
    t.index ["company_id"], name: "cloud_order_company_id_a339bfc4"
    t.index ["create_user_id"], name: "cloud_order_create_user_id_1c5f3fc4"
    t.index ["price_strategy_id"], name: "cloud_order_price_strategy_id_237d5d03"
  end

  create_table "cloud_order_feature", id: :integer, force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "feature_id", null: false
    t.index ["feature_id"], name: "cloud_order_feature_feature_id_dd677eee"
    t.index ["order_id", "feature_id"], name: "cloud_order_feature_order_id_feature_id_afaec13c_uniq", unique: true
    t.index ["order_id"], name: "cloud_order_feature_order_id_ceff3969"
  end

  create_table "cloud_paymentrecord", id: :integer, force: :cascade do |t|
    t.datetime "txn_date", precision: nil, null: false
    t.string "txn_id", limit: 50, null: false
    t.float "tnx_amount", null: false
    t.string "bank_txn_id", limit: 50
    t.string "bank_name", limit: 50
    t.integer "resp_code"
    t.string "payment_mode", limit: 10
    t.string "currency", limit: 4
    t.string "gateway_name", limit: 30
    t.string "mid", limit: 40, null: false
    t.text "resp_msg"
    t.string "status", limit: 12, null: false
    t.integer "order_id", null: false
    t.string "payer_id", limit: 35
    t.string "payment_id", limit: 35
    t.integer "payment_method", limit: 2, null: false
    t.index ["order_id"], name: "cloud_paymentrecord_order_id_296426c6"
  end

  create_table "cloud_pricestrategy", id: :integer, force: :cascade do |t|
    t.integer "type", limit: 2, null: false
    t.float "subscription_duration_unit_price_pre_month", null: false
    t.integer "employee_threshold", null: false
    t.float "employee_unit_price", null: false
    t.integer "device_threshold", null: false
    t.float "device_unit_price", null: false
    t.boolean "whatsapp_push_counts_limit_status", null: false
    t.integer "whatsapp_push_threshold"
    t.float "whatsapp_push_unit_price"
    t.boolean "mobile_app_counts_limit_status", null: false
    t.integer "mobile_applications_threshold"
    t.float "mobile_applications_unit_price"
    t.boolean "transaction_counts_limit_status", null: false
    t.integer "transaction_threshold", null: false
    t.float "transaction_unit_price", null: false
    t.string "country", limit: 2, null: false
    t.string "currency", limit: 4, null: false
    t.datetime "create_time", precision: nil, null: false
    t.boolean "effective_status", null: false
    t.string "create_user_id", limit: 36, null: false
    t.integer "discount_id", null: false
    t.char "vendor_id", limit: 32
    t.index ["create_user_id"], name: "cloud_pricestrategy_create_user_id_e5b9e9d1"
    t.index ["discount_id"], name: "cloud_pricestrategy_discount_id_fbf0d75e"
    t.index ["vendor_id"], name: "cloud_pricestrategy_vendor_id_427cf2a3"
  end

  create_table "cloud_pricestrategy_feature", id: :integer, force: :cascade do |t|
    t.integer "pricestrategy_id", null: false
    t.integer "feature_id", null: false
    t.index ["feature_id"], name: "cloud_pricestrategy_feature_feature_id_574f3192"
    t.index ["pricestrategy_id", "feature_id"], name: "cloud_pricestrategy_feature_pricestrategy_id_feature_id_c129f779_uniq", unique: true
    t.index ["pricestrategy_id"], name: "cloud_pricestrategy_feature_pricestrategy_id_79e0e309"
  end

  create_table "django_admin_log", id: :integer, force: :cascade do |t|
    t.datetime "action_time", precision: nil, null: false
    t.text "object_id"
    t.string "object_repr", limit: 200, null: false
    t.integer "action_flag", limit: 2, null: false
    t.text "change_message", null: false
    t.integer "content_type_id"
    t.string "user_id", limit: 36, null: false
    t.index ["content_type_id"], name: "django_admin_log_content_type_id_c4bce8eb"
    t.index ["user_id"], name: "django_admin_log_user_id_c564eba6"
    t.check_constraint "[action_flag]>=(0)", name: "django_admin_log_action_flag_a8637d59_check"
  end

  create_table "django_content_type", id: :integer, force: :cascade do |t|
    t.string "app_label", limit: 100, null: false
    t.string "model", limit: 100, null: false
    t.index ["app_label", "model"], name: "django_content_type_app_label_model_76bd3d3b_uniq", unique: true
  end

  create_table "django_migrations", id: :integer, force: :cascade do |t|
    t.string "app", limit: 255, null: false
    t.string "name", limit: 255, null: false
    t.datetime "applied", precision: nil, null: false
  end

  create_table "django_session", primary_key: "session_key", id: { type: :string, limit: 40 }, force: :cascade do |t|
    t.text "session_data", null: false
    t.datetime "expire_date", precision: nil, null: false
    t.index ["expire_date"], name: "django_session_expire_date_a5c62663"
  end

  create_table "djcelery_crontabschedule", id: :integer, force: :cascade do |t|
    t.string "minute", limit: 64, null: false
    t.string "hour", limit: 64, null: false
    t.string "day_of_week", limit: 64, null: false
    t.string "day_of_month", limit: 64, null: false
    t.string "month_of_year", limit: 64, null: false
  end

  create_table "djcelery_intervalschedule", id: :integer, force: :cascade do |t|
    t.integer "every", null: false
    t.string "period", limit: 24, null: false
  end

  create_table "djcelery_periodictask", id: :integer, force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.string "task", limit: 200, null: false
    t.text "args", null: false
    t.text "kwargs", null: false
    t.string "queue", limit: 200
    t.string "exchange", limit: 200
    t.string "routing_key", limit: 200
    t.datetime "expires", precision: nil
    t.boolean "enabled", null: false
    t.datetime "last_run_at", precision: nil
    t.integer "total_run_count", null: false
    t.datetime "date_changed", precision: nil, null: false
    t.text "description", null: false
    t.integer "crontab_id"
    t.integer "interval_id"
    t.index ["crontab_id"], name: "djcelery_periodictask_crontab_id_75609bab"
    t.index ["interval_id"], name: "djcelery_periodictask_interval_id_b426ab02"
    t.index ["name"], name: "UQ__djcelery__72E12F1BFF7006E4", unique: true
    t.check_constraint "[total_run_count]>=(0)", name: "djcelery_periodictask_total_run_count_8049951f_check"
  end

  create_table "djcelery_periodictasks", primary_key: "ident", id: { type: :integer, limit: 2, default: nil }, force: :cascade do |t|
    t.datetime "last_update", precision: nil, null: false
  end

  create_table "djcelery_taskstate", id: :integer, force: :cascade do |t|
    t.string "state", limit: 64, null: false
    t.string "task_id", limit: 36, null: false
    t.string "name", limit: 200
    t.datetime "tstamp", precision: nil, null: false
    t.text "args"
    t.text "kwargs"
    t.datetime "eta", precision: nil
    t.datetime "expires", precision: nil
    t.text "result"
    t.text "traceback"
    t.float "runtime"
    t.integer "retries", null: false
    t.boolean "hidden", null: false
    t.integer "worker_id"
    t.index ["hidden"], name: "djcelery_taskstate_hidden_c3905e57"
    t.index ["name"], name: "djcelery_taskstate_name_8af9eded"
    t.index ["state"], name: "djcelery_taskstate_state_53543be4"
    t.index ["task_id"], name: "UQ__djcelery__0492148CB63DCA4B", unique: true
    t.index ["tstamp"], name: "djcelery_taskstate_tstamp_4c3f93a1"
    t.index ["worker_id"], name: "djcelery_taskstate_worker_id_f7f57a05"
  end

  create_table "djcelery_workerstate", id: :integer, force: :cascade do |t|
    t.string "hostname", limit: 255, null: false
    t.datetime "last_heartbeat", precision: nil
    t.index ["hostname"], name: "UQ__djcelery__DA92E43311A4302A", unique: true
    t.index ["last_heartbeat"], name: "djcelery_workerstate_last_heartbeat_4539b544"
  end

  create_table "greythr", id: false, force: :cascade do |t|
    t.string "emp_code", limit: 20
    t.string "emp_first_name", limit: 100
    t.string "card_number", limit: 100
    t.datetime "punch_time", precision: nil
    t.string "device_name", limit: 100
  end

  create_table "guardian_groupobjectpermission", id: :integer, force: :cascade do |t|
    t.string "object_pk", limit: 255, null: false
    t.integer "content_type_id", null: false
    t.integer "group_id", null: false
    t.integer "permission_id", null: false
    t.index ["content_type_id"], name: "guardian_groupobjectpermission_content_type_id_7ade36b8"
    t.index ["group_id", "permission_id", "object_pk"], name: "guardian_groupobjectpermission_group_id_permission_id_object_pk_3f189f7c_uniq", unique: true
    t.index ["group_id"], name: "guardian_groupobjectpermission_group_id_4bbbfb62"
    t.index ["permission_id"], name: "guardian_groupobjectpermission_permission_id_36572738"
  end

  create_table "guardian_userobjectpermission", id: :integer, force: :cascade do |t|
    t.string "object_pk", limit: 255, null: false
    t.integer "content_type_id", null: false
    t.integer "permission_id", null: false
    t.string "user_id", limit: 36, null: false
    t.index ["content_type_id"], name: "guardian_userobjectpermission_content_type_id_2e892405"
    t.index ["permission_id"], name: "guardian_userobjectpermission_permission_id_71807bfc"
    t.index ["user_id", "permission_id", "object_pk"], name: "guardian_userobjectpermission_user_id_permission_id_object_pk_b0b3d2fc_uniq", unique: true
    t.index ["user_id"], name: "guardian_userobjectpermission_user_id_d5c1e964"
  end

  create_table "iclock_biodata", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.text "bio_tmp", null: false
    t.integer "bio_no"
    t.integer "bio_index"
    t.integer "bio_type", null: false
    t.string "major_ver", limit: 30, null: false
    t.string "minor_ver", limit: 30
    t.integer "bio_format"
    t.integer "valid", null: false
    t.integer "duress", null: false
    t.datetime "update_time", precision: nil
    t.string "sn", limit: 50
    t.string "employee_id", limit: 36, null: false
    t.index ["employee_id", "bio_no", "bio_index", "bio_type", "bio_format", "major_ver"], name: "iclock_biodata_employee_id_bio_no_bio_index_bio_type_bio_format_major_ver_b71b2ca9_uniq", unique: true
    t.index ["employee_id"], name: "iclock_biodata_employee_id_ff748ea7"
  end

  create_table "iclock_biophoto", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.string "first_name", limit: 100
    t.string "last_name", limit: 25
    t.string "email", limit: 254
    t.string "enroll_sn", limit: 50
    t.string "register_photo", limit: 100, null: false
    t.datetime "register_time", precision: nil, null: false
    t.string "approval_photo", limit: 100
    t.integer "approval_state", limit: 2, null: false
    t.datetime "approval_time", precision: nil
    t.string "remark", limit: 100
    t.string "employee_id", limit: 36, null: false
    t.index ["employee_id"], name: "iclock_biophoto_employee_id_3dba5819"
  end

  create_table "iclock_deviceconfig", primary_key: "uuid", id: { type: :string, limit: 36 }, force: :cascade do |t|
    t.boolean "enable_registration", null: false
    t.boolean "enable_resigned_filter", null: false
    t.boolean "enable_auto_add", null: false
    t.boolean "enable_employee_upload", null: false
    t.boolean "enable_name_upload", null: false
    t.boolean "enable_card_upload", null: false
    t.integer "transaction_retention", null: false
    t.integer "command_retention", null: false
    t.integer "dev_log_retention", null: false
    t.integer "upload_log_retention", null: false
    t.integer "edit_policy", limit: 2, null: false
    t.integer "import_policy", limit: 2, null: false
    t.integer "mobile_policy", limit: 2, null: false
    t.integer "device_policy", limit: 2, null: false
    t.char "company_id", limit: 32
    t.boolean "enable_synchronization_data", null: false
    t.index ["company_id"], name: "iclock_deviceconfig_company_id_0fec1982"
  end

  create_table "iclock_errorcommandlog", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.string "error_code", limit: 16
    t.string "error_msg", limit: 50
    t.text "data_origin"
    t.string "cmd", limit: 50
    t.text "additional"
    t.datetime "upload_time", precision: nil, null: false
    t.integer "terminal_id", null: false
    t.index ["terminal_id"], name: "iclock_errorcommandlog_terminal_id_3b2d7cbd"
  end

  create_table "iclock_events", id: :integer, force: :cascade do |t|
    t.string "event", limit: 55, null: false
    t.string "organizer", limit: 55, null: false
    t.datetime "event_time", precision: nil, null: false
    t.text "location", null: false
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "iclock_events_company_id_98a3c764"
  end

  create_table "iclock_privatemessage", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.string "uid", limit: 36
    t.datetime "start_time", precision: nil, null: false
    t.integer "duration", null: false
    t.text "content", null: false
    t.datetime "last_send", precision: nil
    t.string "employee_id", limit: 36, null: false
    t.index ["employee_id"], name: "iclock_privatemessage_employee_id_e84a34c0"
  end

  create_table "iclock_products", id: :integer, force: :cascade do |t|
    t.string "device_model", limit: 255
    t.string "device_category", limit: 255
    t.string "firmware_version", limit: 55
    t.datetime "firmware_release_date", precision: nil, null: false
    t.string "firmware_file", limit: 200
    t.datetime "create_time", precision: nil, null: false
    t.integer "bug_fix"
    t.integer "major_version"
    t.integer "minor_version"
  end

  create_table "iclock_publicmessage", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.string "uid", limit: 36
    t.datetime "start_time", precision: nil, null: false
    t.integer "duration", null: false
    t.text "content", null: false
    t.datetime "last_send", precision: nil
    t.integer "terminal_id", null: false
    t.index ["terminal_id"], name: "iclock_publicmessage_terminal_id_c3b5e4cf"
  end

  create_table "iclock_terminal", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.string "sn", limit: 50, null: false
    t.string "alias", limit: 50, null: false
    t.string "ip_address", limit: 39
    t.string "real_ip", limit: 39
    t.integer "state", null: false
    t.integer "terminal_tz", limit: 2, null: false
    t.integer "heartbeat", null: false
    t.integer "transfer_mode", limit: 2, null: false
    t.integer "transfer_interval", null: false
    t.string "transfer_time", limit: 100, null: false
    t.integer "product_type", limit: 2
    t.integer "is_attendance", limit: 2, null: false
    t.integer "is_registration", limit: 2, null: false
    t.integer "purpose", limit: 2
    t.integer "controller_type", limit: 2
    t.integer "authentication", limit: 2, null: false
    t.string "style", limit: 20
    t.string "upload_flag", limit: 10
    t.string "fw_ver", limit: 100
    t.string "push_protocol", limit: 30, null: false
    t.string "push_ver", limit: 30
    t.integer "language"
    t.boolean "is_tft", null: false
    t.string "terminal_name", limit: 30
    t.string "platform", limit: 30
    t.string "oem_vendor", limit: 50
    t.string "log_stamp", limit: 30
    t.string "op_log_stamp", limit: 30
    t.string "capture_stamp", limit: 30
    t.integer "user_count"
    t.integer "user_capacity"
    t.boolean "photo_func_on", null: false
    t.integer "transaction_count"
    t.integer "transaction_capacity"
    t.boolean "fp_func_on", null: false
    t.integer "fp_count"
    t.integer "fp_capacity"
    t.string "fp_alg_ver", limit: 10
    t.boolean "face_func_on", null: false
    t.integer "face_count"
    t.integer "face_capacity"
    t.string "face_alg_ver", limit: 10
    t.boolean "fv_func_on", null: false
    t.integer "fv_count"
    t.integer "fv_capacity"
    t.string "fv_alg_ver", limit: 10
    t.boolean "palm_func_on", null: false
    t.integer "palm_count"
    t.integer "palm_capacity"
    t.string "palm_alg_ver", limit: 10
    t.integer "lock_func", limit: 2, null: false
    t.datetime "last_activity", precision: nil
    t.datetime "upload_time", precision: nil
    t.datetime "push_time", precision: nil
    t.integer "is_access", limit: 2, null: false
    t.string "gps_location", limit: 50
    t.integer "area_id"
    t.char "company_id", limit: 32
    t.integer "device_direction", limit: 2
    t.index ["area_id"], name: "iclock_terminal_area_id_c019c6f0"
    t.index ["company_id"], name: "iclock_terminal_company_id_f2ecaaba"
    t.index ["sn"], name: "UQ__iclock_t__3214186D20EEF95F", unique: true
  end

  create_table "iclock_terminalcommand", id: :integer, force: :cascade do |t|
    t.text "content", null: false
    t.datetime "commit_time", precision: nil, null: false
    t.datetime "transfer_time", precision: nil
    t.datetime "return_time", precision: nil
    t.integer "return_value"
    t.integer "terminal_id", null: false
    t.index ["terminal_id", "transfer_time", "return_value"], name: "iclock_terminalcommand_terminal_id_transfer_time_return_value_495f0cc3_idx"
    t.index ["terminal_id"], name: "iclock_terminalcommand_terminal_id_3dcf836f"
  end

  create_table "iclock_terminalemployee", id: :integer, force: :cascade do |t|
    t.string "terminal_sn", limit: 50, null: false
    t.string "emp_code", limit: 20, null: false
    t.integer "privilege", limit: 2, null: false
  end

  create_table "iclock_terminallocation", id: :integer, force: :cascade do |t|
    t.datetime "gps_time", precision: nil, null: false
    t.string "latitude", limit: 25, null: false
    t.string "longitude", limit: 25, null: false
    t.integer "terminal_id", null: false
    t.index ["terminal_id", "gps_time"], name: "iclock_terminallocation_terminal_id_gps_time_e8a21dce_uniq", unique: true
    t.index ["terminal_id"], name: "iclock_terminallocation_terminal_id_effc55a3"
  end

  create_table "iclock_terminallog", id: :integer, force: :cascade do |t|
    t.integer "terminal_tz", limit: 2
    t.string "admin", limit: 50
    t.integer "action_name", limit: 2
    t.datetime "action_time", precision: nil
    t.string "object", limit: 50
    t.integer "param1"
    t.integer "param2"
    t.integer "param3"
    t.datetime "upload_time", precision: nil
    t.integer "terminal_id", null: false
    t.index ["terminal_id"], name: "iclock_terminallog_terminal_id_667b3ea7"
  end

  create_table "iclock_terminalparameter", id: :integer, force: :cascade do |t|
    t.string "param_type", limit: 10
    t.string "param_name", limit: 30, null: false
    t.string "param_value", limit: 100, null: false
    t.integer "terminal_id", null: false
    t.index ["terminal_id", "param_name"], name: "iclock_terminalparameter_terminal_id_param_name_8abbb5c0_uniq", unique: true
    t.index ["terminal_id"], name: "iclock_terminalparameter_terminal_id_443872e3"
  end

  create_table "iclock_terminaluploadlog", id: :integer, force: :cascade do |t|
    t.string "event", limit: 80, null: false
    t.string "content", limit: 80, null: false
    t.integer "upload_count", null: false
    t.integer "error_count", null: false
    t.datetime "upload_time", precision: nil, null: false
    t.integer "terminal_id", null: false
    t.index ["terminal_id"], name: "iclock_terminaluploadlog_terminal_id_9c9a7664"
  end

  create_table "iclock_terminalworkcode", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.string "code", limit: 8, null: false
    t.string "alias", limit: 24, null: false
    t.datetime "last_activity", precision: nil
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "iclock_terminalworkcode_company_id_77625f26"
  end

  create_table "iclock_transaction", id: :integer, force: :cascade do |t|
    t.string "emp_code", limit: 20, null: false
    t.datetime "punch_time", precision: nil, null: false
    t.string "punch_state", limit: 5, null: false
    t.integer "verify_type", null: false
    t.string "work_code", limit: 20
    t.string "terminal_sn", limit: 50
    t.string "terminal_alias", limit: 50
    t.string "area_alias", limit: 120
    t.float "longitude"
    t.float "latitude"
    t.text "gps_location"
    t.string "mobile", limit: 50
    t.integer "source", limit: 2
    t.integer "purpose", limit: 2
    t.string "crc", limit: 100
    t.integer "is_attendance", limit: 2
    t.string "reserved", limit: 100
    t.datetime "upload_time", precision: nil
    t.integer "sync_status", limit: 2
    t.datetime "sync_time", precision: nil
    t.string "emp_id", limit: 36
    t.integer "terminal_id"
    t.char "company_id", limit: 32
    t.integer "mask_flag"
    t.decimal "temperature", precision: 4, scale: 2
    t.index ["company_id", "punch_time"], name: "iclock_transaction_company_id_punch_time_3890bb01_idx"
    t.index ["company_id"], name: "iclock_transaction_company_id_e7aede63"
    t.index ["emp_code", "punch_time", "terminal_sn", "company_id"], name: "iclock_transaction_emp_code_punch_time_terminal_sn_company_id_01210dcc_uniq", unique: true
    t.index ["emp_id"], name: "iclock_transaction_emp_id_60fa3521"
    t.index ["terminal_id"], name: "iclock_transaction_terminal_id_451c81c2"
  end

  create_table "iclock_transactionproofcmd", id: :integer, force: :cascade do |t|
    t.datetime "action_time", precision: nil, null: false
    t.datetime "start_time", precision: nil, null: false
    t.datetime "end_time", precision: nil, null: false
    t.integer "terminal_count"
    t.integer "server_count"
    t.integer "flag", limit: 2
    t.integer "reserved_init"
    t.float "reserved_float"
    t.string "reserved_char", limit: 30
    t.integer "terminal_id", null: false
    t.index ["terminal_id"], name: "iclock_transactionproofcmd_terminal_id_08b81e1e"
  end

  create_table "iclock_unregister", id: :integer, force: :cascade do |t|
    t.string "emp_code", limit: 20
    t.datetime "punch_time", precision: nil, null: false
    t.string "punch_state", limit: 5, null: false
    t.integer "verify_type", null: false
    t.string "work_code", limit: 20
    t.string "terminal_sn", limit: 50
    t.string "terminal_alias", limit: 50
    t.string "area_alias", limit: 120
    t.float "longitude"
    t.float "latitude"
    t.text "gps_location"
    t.string "mobile", limit: 50
    t.integer "source", limit: 2
    t.integer "purpose", limit: 2
    t.string "crc", limit: 100
    t.integer "is_attendance", limit: 2
    t.string "reserved", limit: 100
    t.datetime "upload_time", precision: nil
    t.integer "sync_status", limit: 2
    t.datetime "sync_time", precision: nil
    t.decimal "temperature", precision: 4, scale: 2
    t.integer "mask_flag"
    t.char "company_id", limit: 32
    t.string "emp_id", limit: 36
    t.integer "terminal_id"
    t.index ["company_id"], name: "iclock_unregister_company_id_e76c1e27"
    t.index ["emp_id"], name: "iclock_unregister_emp_id_e51e996d"
    t.index ["punch_time", "company_id", "terminal_sn"], name: "iclock_unregister_punch_time_company_id_terminal_sn_85f5d01c_uniq", unique: true
    t.index ["terminal_id"], name: "iclock_unregister_terminal_id_7c0e4a51"
  end

  create_table "mobile_announcement", id: :integer, force: :cascade do |t|
    t.string "subject", limit: 100, null: false
    t.text "content", null: false
    t.integer "category", limit: 2, null: false
    t.string "sender", limit: 50
    t.string "system_sender", limit: 50
    t.datetime "create_time", precision: nil
    t.string "receiver_id", limit: 36
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "mobile_announcement_company_id_46c8203d"
    t.index ["receiver_id"], name: "mobile_announcement_receiver_id_ddf2a860"
  end

  create_table "mobile_appactionlog", id: :integer, force: :cascade do |t|
    t.string "user", limit: 50, null: false
    t.string "client", limit: 50
    t.string "action", limit: 50
    t.text "params"
    t.text "describe"
    t.integer "request_status", limit: 2, null: false
    t.datetime "action_time", precision: nil, null: false
    t.string "remote_ip", limit: 20
  end

  create_table "mobile_applist", id: :integer, force: :cascade do |t|
    t.string "username", limit: 50, null: false
    t.datetime "login_time", precision: nil, null: false
    t.datetime "last_active", precision: nil, null: false
    t.string "token", limit: 100, null: false
    t.text "device_token", null: false
    t.string "client_id", limit: 100, null: false
    t.integer "client_category", limit: 2, null: false
    t.integer "active", limit: 2
    t.integer "enable", limit: 2
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "mobile_applist_company_id_5a52be94"
  end

  create_table "mobile_appnotification", id: :integer, force: :cascade do |t|
    t.string "sender", limit: 50
    t.string "system_sender", limit: 50
    t.integer "category", limit: 2, null: false
    t.integer "sub_category"
    t.text "content"
    t.integer "source"
    t.datetime "notification_time", precision: nil, null: false
    t.integer "read_status", limit: 2, null: false
    t.datetime "read_time", precision: nil
    t.string "receiver_id", limit: 36, null: false
    t.index ["receiver_id"], name: "mobile_appnotification_receiver_id_90c4a355"
  end

  create_table "mobile_apptempregistraion", id: :integer, force: :cascade do |t|
    t.string "company", limit: 55, null: false
    t.string "email", limit: 254, null: false
    t.string "mobile", limit: 20, null: false
    t.string "otp", limit: 8, null: false
    t.integer "verified_user", null: false
  end

  create_table "mobile_gpsfordepartment", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.string "location", limit: 255, null: false
    t.float "longitude", null: false
    t.float "latitude", null: false
    t.integer "distance", null: false
    t.datetime "start_date", precision: nil, null: false
    t.datetime "end_date", precision: nil, null: false
    t.integer "department_id", null: false
    t.index ["department_id"], name: "mobile_gpsfordepartment_department_id_988ccf22"
  end

  create_table "mobile_gpsforemployee", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.string "location", limit: 255, null: false
    t.float "longitude", null: false
    t.float "latitude", null: false
    t.integer "distance", null: false
    t.datetime "start_date", precision: nil, null: false
    t.datetime "end_date", precision: nil, null: false
    t.string "employee_id", limit: 36, null: false
    t.index ["employee_id"], name: "mobile_gpsforemployee_employee_id_982b7cef"
  end

  create_table "notifications_notification", id: :integer, force: :cascade do |t|
    t.string "content", limit: 999
    t.boolean "is_sent", null: false
    t.integer "event", limit: 2
    t.datetime "commit_time", precision: nil, null: false
    t.datetime "send_time", precision: nil
    t.string "exception_id", limit: 255
    t.string "content_type_id", limit: 255
  end

  create_table "payroll_allowancetype", id: :integer, force: :cascade do |t|
    t.string "allowance_code", limit: 25, null: false
    t.string "allowance_name", limit: 25, null: false
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "payroll_allowancetype_company_id_4eb737ec"
  end

  create_table "payroll_deductionformula", id: :integer, force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.string "formula", limit: 100, null: false
    t.text "remark"
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "payroll_deductionformula_company_id_0a591c19"
  end

  create_table "payroll_emploan", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.float "loan_amount", null: false
    t.datetime "loan_time", precision: nil, null: false
    t.integer "refund_cycle", limit: 2, null: false
    t.float "per_cycle_refund", null: false
    t.datetime "loan_clean_time", precision: nil
    t.string "remark", limit: 300
    t.string "employee_id", limit: 36
    t.index ["employee_id"], name: "payroll_emploan_employee_id_97a251ef"
  end

  create_table "payroll_emppayrollprofile", id: :integer, force: :cascade do |t|
    t.integer "payment_mode", limit: 2
    t.integer "payment_type", limit: 2
    t.string "bank_name", limit: 30
    t.string "bank_account", limit: 30
    t.string "personnel_id", limit: 30
    t.string "agent_id", limit: 30
    t.string "agent_account", limit: 30
    t.string "employee_id", limit: 36, null: false
    t.index ["employee_id"], name: "UQ__payroll___C52E0BA9EDCF1BB1", unique: true
  end

  create_table "payroll_exceptionformula", id: :integer, force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.integer "exception_type", limit: 2, null: false
    t.string "formula", limit: 100, null: false
    t.text "remark"
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "payroll_exceptionformula_company_id_0541a53f"
  end

  create_table "payroll_extradeduction", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.float "amount", null: false
    t.datetime "issued_time", precision: nil, null: false
    t.string "remark", limit: 300
    t.string "employee_id", limit: 36
    t.index ["employee_id"], name: "payroll_extradeduction_employee_id_53072441"
  end

  create_table "payroll_extraincrease", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.float "amount", null: false
    t.datetime "issued_time", precision: nil, null: false
    t.string "remark", limit: 300
    t.string "employee_id", limit: 36
    t.index ["employee_id"], name: "payroll_extraincrease_employee_id_f902e6bb"
  end

  create_table "payroll_increasementformula", id: :integer, force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.string "formula", limit: 100, null: false
    t.text "remark"
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "payroll_increasementformula_company_id_2fdef254"
  end

  create_table "payroll_leaveformula", id: :integer, force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.string "formula", limit: 100, null: false
    t.text "remark"
    t.integer "category_id", null: false
    t.char "company_id", limit: 32
    t.index ["category_id"], name: "payroll_leaveformula_category_id_945b2054"
    t.index ["company_id"], name: "payroll_leaveformula_company_id_a4d269d1"
  end

  create_table "payroll_monthlysalary", id: :integer, force: :cascade do |t|
    t.datetime "calc_time", precision: nil
    t.float "basic_salary"
    t.datetime "effective_date", precision: nil
    t.text "format_dict"
    t.float "ot1"
    t.float "ot2"
    t.float "ot3"
    t.float "normal_ot"
    t.float "weekend_ot"
    t.float "holiday_ot"
    t.float "late_time"
    t.float "early_leave"
    t.float "absent_time"
    t.float "increase"
    t.float "deduction"
    t.text "leave"
    t.text "ot1_formula"
    t.text "ot2_formula"
    t.text "ot3_formula"
    t.text "normal_ot_formula"
    t.text "weekend_ot_formula"
    t.text "holiday_ot_formula"
    t.text "late_time_formula"
    t.text "early_leave_formula"
    t.text "absent_time_formula"
    t.text "increase_formula"
    t.text "deduction_formula"
    t.text "leave_formula"
    t.text "ot1_formula_name"
    t.text "ot2_formula_name"
    t.text "ot3_formula_name"
    t.text "normal_ot_formula_name"
    t.text "weekend_ot_formula_name"
    t.text "holiday_ot_formula_name"
    t.text "late_time_formula_name"
    t.text "early_leave_formula_name"
    t.text "absent_time_formula_name"
    t.text "increase_formula_name"
    t.text "deduction_formula_name"
    t.text "leave_formula_name"
    t.float "extra_increase"
    t.float "extra_deduction"
    t.float "total_loan_amount"
    t.float "refund_loan_amount"
    t.float "unrefund_loan_amount"
    t.float "loan_deduction"
    t.float "loan_increase"
    t.float "advance_increase"
    t.float "advance_deduction"
    t.float "reimbursement"
    t.text "total_increase_formula"
    t.text "total_increase_formula_name"
    t.text "total_increase_expression"
    t.float "total_increase"
    t.text "total_deduction_formula"
    t.text "total_deduction_formula_name"
    t.text "total_deduction_expression"
    t.float "total_deduction"
    t.text "total_salary_expression"
    t.float "total_salary"
    t.string "employee_id", limit: 36, null: false
    t.index ["employee_id"], name: "payroll_monthlysalary_employee_id_97fdc6a9"
  end

  create_table "payroll_overtimeformula", id: :integer, force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.integer "overtime_level", limit: 2, null: false
    t.string "formula", limit: 100, null: false
    t.text "remark"
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "payroll_overtimeformula_company_id_f55f42e4"
  end

  create_table "payroll_purposetype", id: :integer, force: :cascade do |t|
    t.string "purpose_code", limit: 25, null: false
    t.string "purpose_name", limit: 255, null: false
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "payroll_purposetype_company_id_12048ee6"
  end

  create_table "payroll_reimbursement", id: :integer, force: :cascade do |t|
    t.float "rmb_amount", null: false
    t.string "rmb_file", limit: 200
    t.string "rmb_remark", limit: 300
    t.string "employee_id", limit: 36
    t.text "additional_employee"
    t.datetime "apply_time", precision: nil, null: false
    t.integer "approval_level", limit: 2
    t.string "approver", limit: 50
    t.text "audit_reason"
    t.datetime "audit_time", precision: nil
    t.string "audit_user_id", limit: 100
    t.char "company_id", limit: 32
    t.datetime "rmb_end_date", precision: nil, null: false
    t.datetime "rmb_start_date", precision: nil, null: false
    t.integer "allowance_type_id"
    t.integer "purpose_type_id"
    t.integer "workflow_abstractException_id"
    t.index ["allowance_type_id"], name: "payroll_reimbursement_allowance_type_id_e5d0c005"
    t.index ["company_id"], name: "payroll_reimbursement_company_id_55bbbb1b"
    t.index ["employee_id"], name: "payroll_reimbursement_employee_id_c4bbde36"
    t.index ["purpose_type_id"], name: "payroll_reimbursement_purpose_type_id_b32cc304"
    t.index ["workflow_abstractException_id"], name: "payroll_reimbursement_workflow_abstractException_id_1c15b3c1"
  end

  create_table "payroll_salaryadvance", id: :integer, force: :cascade do |t|
    t.float "advance_amount", null: false
    t.datetime "advance_time", precision: nil, null: false
    t.string "advance_remark", limit: 300
    t.string "employee_id", limit: 36
    t.index ["employee_id"], name: "payroll_salaryadvance_employee_id_2abd43e5"
  end

  create_table "payroll_salarystructure", id: :integer, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.float "salary_amount", null: false
    t.datetime "effective_date", precision: nil, null: false
    t.string "salary_remark", limit: 300
    t.string "employee_id", limit: 36
    t.index ["employee_id"], name: "payroll_salarystructure_employee_id_98996e15"
  end

  create_table "payroll_salarystructure_deductionformula", id: :integer, force: :cascade do |t|
    t.integer "salarystructure_id", null: false
    t.integer "deductionformula_id", null: false
    t.index ["deductionformula_id"], name: "payroll_salarystructure_deductionformula_deductionformula_id_b174d5b6"
    t.index ["salarystructure_id", "deductionformula_id"], name: "payroll_salarystructure_deductionformula_salarystructure_id_deductionformula_id_794e8449_uniq", unique: true
    t.index ["salarystructure_id"], name: "payroll_salarystructure_deductionformula_salarystructure_id_5ca7cdb5"
  end

  create_table "payroll_salarystructure_exceptionformula", id: :integer, force: :cascade do |t|
    t.integer "salarystructure_id", null: false
    t.integer "exceptionformula_id", null: false
    t.index ["exceptionformula_id"], name: "payroll_salarystructure_exceptionformula_exceptionformula_id_8f6dadb3"
    t.index ["salarystructure_id", "exceptionformula_id"], name: "payroll_salarystructure_exceptionformula_salarystructure_id_exceptionformula_id_a5e869ff_uniq", unique: true
    t.index ["salarystructure_id"], name: "payroll_salarystructure_exceptionformula_salarystructure_id_3c087208"
  end

  create_table "payroll_salarystructure_increasementformula", id: :integer, force: :cascade do |t|
    t.integer "salarystructure_id", null: false
    t.integer "increasementformula_id", null: false
    t.index ["increasementformula_id"], name: "payroll_salarystructure_increasementformula_increasementformula_id_3cd77082"
    t.index ["salarystructure_id", "increasementformula_id"], name: "payroll_salarystructure_increasementformula_salarystructure_id_increasementformula_id_749132b3_uniq", unique: true
    t.index ["salarystructure_id"], name: "payroll_salarystructure_increasementformula_salarystructure_id_8752401c"
  end

  create_table "payroll_salarystructure_leaveformula", id: :integer, force: :cascade do |t|
    t.integer "salarystructure_id", null: false
    t.integer "leaveformula_id", null: false
    t.index ["leaveformula_id"], name: "payroll_salarystructure_leaveformula_leaveformula_id_049f9024"
    t.index ["salarystructure_id", "leaveformula_id"], name: "payroll_salarystructure_leaveformula_salarystructure_id_leaveformula_id_4efdce30_uniq", unique: true
    t.index ["salarystructure_id"], name: "payroll_salarystructure_leaveformula_salarystructure_id_cf98fdd7"
  end

  create_table "payroll_salarystructure_overtimeformula", id: :integer, force: :cascade do |t|
    t.integer "salarystructure_id", null: false
    t.integer "overtimeformula_id", null: false
    t.index ["overtimeformula_id"], name: "payroll_salarystructure_overtimeformula_overtimeformula_id_40ad89ef"
    t.index ["salarystructure_id", "overtimeformula_id"], name: "payroll_salarystructure_overtimeformula_salarystructure_id_overtimeformula_id_0d0a0e81_uniq", unique: true
    t.index ["salarystructure_id"], name: "payroll_salarystructure_overtimeformula_salarystructure_id_64f75042"
  end

  create_table "personnel_area", id: :integer, force: :cascade do |t|
    t.string "area_code", limit: 100, null: false
    t.string "area_name", limit: 120, null: false
    t.boolean "is_default", null: false
    t.char "company_id", limit: 32
    t.integer "parent_area_id"
    t.index ["area_code", "company_id"], name: "personnel_area_area_code_company_id_282f2b57_uniq", unique: true
    t.index ["company_id"], name: "personnel_area_company_id_59750eb5"
    t.index ["parent_area_id"], name: "personnel_area_parent_area_id_39028fda"
  end

  create_table "personnel_certification", id: :integer, force: :cascade do |t|
    t.string "cert_code", limit: 20, null: false
    t.string "cert_name", limit: 50, null: false
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "personnel_certification_company_id_c1b1bd00"
  end

  create_table "personnel_company", id: { type: :char, limit: 32 }, force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "sub_domain", limit: 50, null: false
    t.string "address_1", limit: 250, null: false
    t.string "country", limit: 2, null: false
    t.string "city", limit: 100, null: false
    t.integer "payment_type", null: false
    t.datetime "subscription_start_date", precision: nil, null: false
    t.datetime "subscription_end_date", precision: nil, null: false
    t.integer "max_employees_limit", null: false
    t.string "company_address", limit: 250
    t.string "company_phone", limit: 20
    t.string "company_cnr", limit: 50
    t.string "owner_name", limit: 20
    t.string "owner_phone", limit: 20
    t.string "contact_name", limit: 20
    t.string "contact_phone", limit: 20
    t.string "business_type", limit: 5
    t.string "parent_vendor", limit: 36
    t.string "province", limit: 100
    t.integer "max_devices_limit"
    t.integer "max_mobile_applications_limit"
    t.integer "max_transactions_limit"
    t.integer "max_whatsapp_push_limit"
    t.string "parent_vendor_company_logo", limit: 200
    t.string "parent_vendor_software_logo", limit: 200
    t.index ["name"], name: "UQ__personne__72E12F1B11E501E9", unique: true
  end

  create_table "personnel_company_feature", id: :integer, force: :cascade do |t|
    t.char "company_id", limit: 32, null: false
    t.integer "feature_id", null: false
    t.index ["company_id", "feature_id"], name: "personnel_company_feature_company_id_feature_id_8a62fad7_uniq", unique: true
    t.index ["company_id"], name: "personnel_company_feature_company_id_d330e85b"
    t.index ["feature_id"], name: "personnel_company_feature_feature_id_67123392"
  end

  create_table "personnel_department", id: :integer, force: :cascade do |t|
    t.string "dept_code", limit: 50, null: false
    t.string "dept_name", limit: 100, null: false
    t.boolean "is_default", null: false
    t.char "company_id", limit: 32
    t.integer "parent_dept_id"
    t.index ["company_id"], name: "personnel_department_company_id_00867fd8"
    t.index ["dept_code", "company_id"], name: "personnel_department_dept_code_company_id_4275b710_uniq", unique: true
    t.index ["parent_dept_id"], name: "personnel_department_parent_dept_id_d0b44024"
  end

  create_table "personnel_employee", id: { type: :string, limit: 36 }, force: :cascade do |t|
    t.datetime "create_time", precision: nil
    t.string "create_user", limit: 150
    t.datetime "change_time", precision: nil
    t.string "change_user", limit: 150
    t.integer "status", limit: 2, null: false
    t.string "emp_code", limit: 20, null: false
    t.string "first_name", limit: 100
    t.string "last_name", limit: 25
    t.string "nickname", limit: 100
    t.string "passport", limit: 30
    t.string "driver_license_automobile", limit: 30
    t.string "driver_license_motorcycle", limit: 30
    t.integer "enable_outdoor_management", limit: 2
    t.string "photo", limit: 200
    t.string "self_password", limit: 128
    t.string "device_password", limit: 20
    t.integer "dev_privilege"
    t.string "card_no", limit: 20
    t.string "acc_group", limit: 5
    t.string "acc_timezone", limit: 20
    t.string "gender", limit: 1
    t.datetime "birthday", precision: nil
    t.string "address", limit: 200
    t.string "postcode", limit: 10
    t.string "office_tel", limit: 20
    t.string "contact_tel", limit: 20
    t.string "mobile", limit: 20
    t.string "national", limit: 50
    t.string "religion", limit: 20
    t.string "title", limit: 20
    t.string "enroll_sn", limit: 20
    t.string "ssn", limit: 20
    t.datetime "update_time", precision: nil
    t.datetime "hire_date", precision: nil
    t.integer "verify_mode"
    t.string "city", limit: 20
    t.boolean "is_admin", null: false
    t.integer "emp_type"
    t.boolean "enable_att", null: false
    t.boolean "enable_payroll", null: false
    t.boolean "enable_overtime", null: false
    t.boolean "enable_holiday", null: false
    t.boolean "enable_whatsapp", null: false
    t.boolean "whatsapp_exception", null: false
    t.boolean "whatsapp_punch", null: false
    t.boolean "deleted", null: false
    t.integer "reserved"
    t.integer "del_tag"
    t.integer "app_status", limit: 2
    t.integer "app_role", limit: 2
    t.string "email", limit: 50
    t.boolean "enable_sms", null: false
    t.boolean "sms_exception", null: false
    t.boolean "sms_punch", null: false
    t.datetime "last_login", precision: nil
    t.boolean "is_active", null: false
    t.integer "department_id"
    t.integer "location_id"
    t.integer "position_id"
    t.char "company_id", limit: 32
    t.string "otp", limit: 8
    t.integer "verified_employee"
    t.integer "app_punch_status", limit: 2
    t.index ["company_id", "department_id", "emp_code"], name: "personnel_employee_company_id_department_id_emp_code_2c555933_idx"
    t.index ["company_id"], name: "personnel_employee_company_id_95b3fd72"
    t.index ["department_id"], name: "personnel_employee_department_id_068bbd08"
    t.index ["emp_code", "company_id"], name: "personnel_employee_emp_code_company_id_4d787b9f_uniq", unique: true
    t.index ["location_id"], name: "personnel_employee_location_id_494a1f8d"
    t.index ["position_id"], name: "personnel_employee_position_id_c9321343"
  end

  create_table "personnel_employee_area", id: :integer, force: :cascade do |t|
    t.string "employee_id", limit: 36, null: false
    t.integer "area_id", null: false
    t.index ["area_id"], name: "personnel_employee_area_area_id_64c21925"
    t.index ["employee_id", "area_id"], name: "personnel_employee_area_employee_id_area_id_00b3d777_uniq", unique: true
    t.index ["employee_id"], name: "personnel_employee_area_employee_id_8e5cec21"
  end

  create_table "personnel_employee_flow_role", id: :integer, force: :cascade do |t|
    t.string "employee_id", limit: 36, null: false
    t.integer "workflowrole_id", null: false
    t.index ["employee_id", "workflowrole_id"], name: "personnel_employee_flow_role_employee_id_workflowrole_id_46b0e5e0_uniq", unique: true
    t.index ["employee_id"], name: "personnel_employee_flow_role_employee_id_c27f8a56"
    t.index ["workflowrole_id"], name: "personnel_employee_flow_role_workflowrole_id_4704db32"
  end

  create_table "personnel_employeecertification", id: :integer, force: :cascade do |t|
    t.datetime "expire_on", precision: nil
    t.boolean "email_alert", null: false
    t.integer "before"
    t.integer "certification_id", null: false
    t.string "employee_id", limit: 36, null: false
    t.string "file", limit: 200
    t.string "file_name", limit: 200
    t.index ["certification_id"], name: "personnel_employeecertification_certification_id_faabed40"
    t.index ["employee_id", "certification_id"], name: "personnel_employeecertification_employee_id_certification_id_7bcf4c7d_uniq", unique: true
    t.index ["employee_id"], name: "personnel_employeecertification_employee_id_b7bd3867"
  end

  create_table "personnel_employeeprofile", id: :integer, force: :cascade do |t|
    t.text "column_order", null: false
    t.text "preferences", null: false
    t.string "emp_id", limit: 36, null: false
    t.index ["emp_id"], name: "UQ__personne__1299A860E257DD65", unique: true
  end

  create_table "personnel_location", id: :integer, force: :cascade do |t|
    t.string "location_code", limit: 30, null: false
    t.string "location_name", limit: 30, null: false
    t.boolean "is_default", null: false
    t.char "company_id", limit: 32
    t.integer "parent_location_id"
    t.index ["company_id"], name: "personnel_location_company_id_46ad1d50"
    t.index ["parent_location_id"], name: "personnel_location_parent_location_id_667cb9ac"
  end

  create_table "personnel_position", id: :integer, force: :cascade do |t|
    t.string "position_code", limit: 50, null: false
    t.string "position_name", limit: 100, null: false
    t.boolean "is_default", null: false
    t.char "company_id", limit: 32
    t.integer "parent_position_id"
    t.index ["company_id"], name: "personnel_position_company_id_f06c5d2a"
    t.index ["parent_position_id"], name: "personnel_position_parent_position_id_a496a36b"
    t.index ["position_code", "company_id"], name: "personnel_position_position_code_company_id_28d3a7e2_uniq", unique: true
  end

  create_table "personnel_resign", id: :integer, force: :cascade do |t|
    t.datetime "resign_date", precision: nil, null: false
    t.datetime "report_generation_end_date", precision: nil, null: false
    t.integer "resign_type"
    t.boolean "disableatt", null: false
    t.string "reason", limit: 200
    t.string "employee_id", limit: 36, null: false
    t.index ["employee_id"], name: "UQ__personne__C52E0BA9B3D9668A", unique: true
  end

  create_table "staff_stafftoken", primary_key: "key", id: { type: :string, limit: 40 }, force: :cascade do |t|
    t.datetime "created", precision: nil, null: false
    t.string "user_id", limit: 36, null: false
    t.index ["user_id"], name: "UQ__staff_st__B9BE370E982B6599", unique: true
  end

  create_table "sync_area", id: :integer, force: :cascade do |t|
    t.datetime "post_time", precision: nil
    t.integer "flag", limit: 2, null: false
    t.datetime "update_time", precision: nil
    t.string "sync_ret", limit: 200
    t.string "area_code", limit: 100, null: false
    t.string "area_name", limit: 120, null: false
    t.index ["area_code", "area_name"], name: "sync_area_area_code_area_name_200046d1_uniq", unique: true
  end

  create_table "sync_department", id: :integer, force: :cascade do |t|
    t.datetime "post_time", precision: nil
    t.integer "flag", limit: 2, null: false
    t.datetime "update_time", precision: nil
    t.string "sync_ret", limit: 200
    t.string "dept_code", limit: 50, null: false
    t.string "dept_name", limit: 100, null: false
    t.index ["dept_code", "dept_name"], name: "sync_department_dept_code_dept_name_93923213_uniq", unique: true
  end

  create_table "sync_employee", id: :integer, force: :cascade do |t|
    t.datetime "post_time", precision: nil
    t.integer "flag", limit: 2, null: false
    t.datetime "update_time", precision: nil
    t.string "sync_ret", limit: 200
    t.string "emp_code", limit: 20, null: false
    t.string "first_name", limit: 100
    t.string "last_name", limit: 25
    t.string "dept_code", limit: 50
    t.string "dept_name", limit: 100
    t.string "job_code", limit: 50
    t.string "job_name", limit: 100
    t.string "area_code", limit: 100
    t.string "area_name", limit: 120
    t.string "card_no", limit: 20
    t.boolean "multi_area", null: false
    t.datetime "hire_date", precision: nil
    t.string "gender", limit: 2
    t.datetime "birthday", precision: nil
    t.string "email", limit: 100
    t.boolean "active_status", null: false
    t.index ["emp_code"], name: "sync_employee_emp_code_521bf06d_uniq", unique: true
  end

  create_table "sync_job", id: :integer, force: :cascade do |t|
    t.datetime "post_time", precision: nil
    t.integer "flag", limit: 2, null: false
    t.datetime "update_time", precision: nil
    t.string "sync_ret", limit: 200
    t.string "job_code", limit: 50, null: false
    t.string "job_name", limit: 100, null: false
    t.index ["job_code", "job_name"], name: "sync_job_job_code_job_name_4ec5619e_uniq", unique: true
  end

  create_table "work_flow_workflowengines", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_flow_workflowroles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workflow_abstractexception", id: :integer, force: :cascade do |t|
    t.integer "audit_status", limit: 2, null: false
    t.text "revoke_reason"
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "workflow_abstractexception_company_id_0bf5003a"
  end

  create_table "workflow_nodeinstance", id: :integer, force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.integer "order", limit: 2, null: false
    t.integer "state", limit: 2, null: false
    t.boolean "is_last_node", null: false
    t.boolean "is_next_node", null: false
    t.string "remark", limit: 255
    t.datetime "apply_time", precision: nil
    t.string "approver_admin_id", limit: 36
    t.string "approver_employee_id", limit: 36
    t.integer "departments_id"
    t.integer "node_engine_id"
    t.integer "workflow_instance_id"
    t.index ["approver_admin_id"], name: "workflow_nodeinstance_approver_admin_id_dff58806"
    t.index ["approver_employee_id"], name: "workflow_nodeinstance_approver_employee_id_d36cd45d"
    t.index ["departments_id"], name: "workflow_nodeinstance_departments_id_b0dc2bdb"
    t.index ["node_engine_id"], name: "workflow_nodeinstance_node_engine_id_4533f12d"
    t.index ["workflow_instance_id"], name: "workflow_nodeinstance_workflow_instance_id_afe84fe4"
  end

  create_table "workflow_workflowengine", id: :integer, force: :cascade do |t|
    t.string "workflow_code", limit: 50, null: false
    t.string "workflow_name", limit: 50, null: false
    t.datetime "start_date", precision: nil, null: false
    t.datetime "end_date", precision: nil, null: false
    t.string "description", limit: 50, null: false
    t.integer "workflow_type", limit: 2, null: false
    t.integer "inform_type", limit: 2, null: false
    t.integer "del_flag", limit: 2
    t.integer "applicant_position_id"
    t.char "company_id", limit: 32
    t.integer "content_type_id", null: false
    t.integer "departments_id"
    t.index ["applicant_position_id"], name: "workflow_workflowengine_applicant_position_id_8a65e03a"
    t.index ["company_id"], name: "workflow_workflowengine_company_id_c42adcb0"
    t.index ["content_type_id"], name: "workflow_workflowengine_content_type_id_f7345c20_idx"
    t.index ["departments_id"], name: "workflow_workflowengine_departments_id_0f06d4c7"
    t.index ["workflow_code", "company_id"], name: "workflow_workflowengine_workflow_code_company_id_8f99f5dd_uniq", unique: true
  end

  create_table "workflow_workflowengine_employee", id: :integer, force: :cascade do |t|
    t.integer "workflowengine_id", null: false
    t.string "employee_id", limit: 36, null: false
    t.index ["employee_id"], name: "workflow_workflowengine_employee_employee_id_803a409e"
    t.index ["workflowengine_id", "employee_id"], name: "workflow_workflowengine_employee_workflowengine_id_employee_id_8128deb2_uniq", unique: true
    t.index ["workflowengine_id"], name: "workflow_workflowengine_employee_workflowengine_id_6ebcc5f2"
  end

  create_table "workflow_workflowinstance", id: :integer, force: :cascade do |t|
    t.string "workflow_code", limit: 255, null: false
    t.string "workflow_name", limit: 255, null: false
    t.datetime "start_date", precision: nil, null: false
    t.datetime "end_date", precision: nil, null: false
    t.datetime "issue_date", precision: nil, null: false
    t.string "description", limit: 255, null: false
    t.integer "content_type", null: false
    t.integer "inform_type", limit: 2, null: false
    t.boolean "del_flag", null: false
    t.string "employee_id", limit: 36, null: false
    t.integer "exception_id"
    t.integer "workflow_engine_id"
    t.index ["employee_id"], name: "workflow_workflowinstance_employee_id_c7cff08e"
    t.index ["exception_id"], name: "UQ__workflow__C42DECC3DECE8464", unique: true
    t.index ["workflow_engine_id"], name: "workflow_workflowinstance_workflow_engine_id_1e6ac40f"
  end

  create_table "workflow_workflowinstances", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workflow_workflownode", id: :integer, force: :cascade do |t|
    t.string "node_code", limit: 30, null: false
    t.string "node_name", limit: 30, null: false
    t.integer "order_id", null: false
    t.integer "approver_type", limit: 2
    t.integer "notifier_type", limit: 2
    t.boolean "approver_by_overall", null: false
    t.boolean "notify_by_overall", null: false
    t.integer "workflow_engine", null: false
    t.string "workflow_engine_name", limit: 50, null: false
    t.char "company_id", limit: 32
    t.text "approve_scope", null: false
    t.text "notify_scope", null: false
    t.index ["company_id"], name: "workflow_workflownode_company_id_44989997"
  end

  create_table "workflow_workflownode_approver", id: :integer, force: :cascade do |t|
    t.integer "workflownode_id", null: false
    t.integer "workflowrole_id", null: false
    t.index ["workflownode_id", "workflowrole_id"], name: "workflow_workflownode_approver_workflownode_id_workflowrole_id_7543ba37_uniq", unique: true
    t.index ["workflownode_id"], name: "workflow_workflownode_approver_workflownode_id_d814c941"
    t.index ["workflowrole_id"], name: "workflow_workflownode_approver_workflowrole_id_c8e00d42"
  end

  create_table "workflow_workflownode_notifier", id: :integer, force: :cascade do |t|
    t.integer "workflownode_id", null: false
    t.integer "workflowrole_id", null: false
    t.index ["workflownode_id", "workflowrole_id"], name: "workflow_workflownode_notifier_workflownode_id_workflowrole_id_cac02b37_uniq", unique: true
    t.index ["workflownode_id"], name: "workflow_workflownode_notifier_workflownode_id_57298016"
    t.index ["workflowrole_id"], name: "workflow_workflownode_notifier_workflowrole_id_73de7fc2"
  end

  create_table "workflow_workflowrole", id: :integer, force: :cascade do |t|
    t.string "role_code", limit: 30, null: false
    t.string "role_name", limit: 50, null: false
    t.string "description", limit: 200
    t.char "company_id", limit: 32
    t.index ["company_id"], name: "workflow_workflowrole_company_id_bbb75590"
  end

  add_foreign_key "acc_acccombination", "personnel_area", column: "area_id", name: "acc_acccombination_area_id_0d22c34e_fk_personnel_area_id"
  add_foreign_key "acc_acccombination", "personnel_company", column: "company_id", name: "acc_acccombination_company_id_700e5a90_fk_personnel_company_id"
  add_foreign_key "acc_accgroups", "personnel_area", column: "area_id", name: "acc_accgroups_area_id_b83745c3_fk_personnel_area_id"
  add_foreign_key "acc_accgroups", "personnel_company", column: "company_id", name: "acc_accgroups_company_id_ac234eff_fk_personnel_company_id"
  add_foreign_key "acc_accholiday", "acc_acctimezone", column: "timezone_id", name: "acc_accholiday_timezone_id_450d2d1e_fk_acc_acctimezone_id"
  add_foreign_key "acc_accholiday", "att_holiday", column: "holiday_id", name: "acc_accholiday_holiday_id_a9efe924_fk_att_holiday_id"
  add_foreign_key "acc_accholiday", "personnel_area", column: "area_id", name: "acc_accholiday_area_id_d15c19da_fk_personnel_area_id"
  add_foreign_key "acc_accholiday", "personnel_company", column: "company_id", name: "acc_accholiday_company_id_e4214e28_fk_personnel_company_id"
  add_foreign_key "acc_accprivilege", "acc_accgroups", column: "group_id", name: "acc_accprivilege_group_id_c5ed7003_fk_acc_accgroups_id"
  add_foreign_key "acc_accprivilege", "personnel_area", column: "area_id", name: "acc_accprivilege_area_id_2123ff6f_fk_personnel_area_id"
  add_foreign_key "acc_accprivilege", "personnel_company", column: "company_id", name: "acc_accprivilege_company_id_8e2fcb81_fk_personnel_company_id"
  add_foreign_key "acc_accprivilege", "personnel_employee", column: "employee_id", name: "acc_accprivilege_employee_id_5fc55f95_fk_personnel_employee_id"
  add_foreign_key "acc_accterminal", "iclock_terminal", column: "terminal_id", name: "acc_accterminal_terminal_id_fc92cce2_fk_iclock_terminal_id"
  add_foreign_key "acc_accterminal", "personnel_company", column: "company_id", name: "acc_accterminal_company_id_4bc45d50_fk_personnel_company_id"
  add_foreign_key "acc_acctimezone", "personnel_area", column: "area_id", name: "acc_acctimezone_area_id_e9ce7a7a_fk_personnel_area_id"
  add_foreign_key "acc_acctimezone", "personnel_company", column: "company_id", name: "acc_acctimezone_company_id_143aa9c1_fk_personnel_company_id"
  add_foreign_key "att_attreportsetting", "personnel_company", column: "company_id", name: "att_attreportsetting_company_id_6be84335_fk_personnel_company_id"
  add_foreign_key "att_attrule", "personnel_company", column: "company_id", name: "att_attrule_company_id_e4904421_fk_personnel_company_id"
  add_foreign_key "att_attschedule", "att_attshift", column: "shift_id", name: "att_attschedule_shift_id_13d2db9a_fk_att_attshift_id"
  add_foreign_key "att_attschedule", "personnel_employee", column: "employee_id", name: "att_attschedule_employee_id_caa61686_fk_personnel_employee_id"
  add_foreign_key "att_attshift", "personnel_company", column: "company_id", name: "att_attshift_company_id_2c0a4f56_fk_personnel_company_id"
  add_foreign_key "att_breaktime", "personnel_company", column: "company_id", name: "att_breaktime_company_id_fbb9a2b7_fk_personnel_company_id"
  add_foreign_key "att_changeschedule", "att_timeinterval", column: "timeinterval_id", name: "att_changeschedule_timeinterval_id_d41ac077_fk_att_timeinterval_id"
  add_foreign_key "att_changeschedule", "personnel_employee", column: "employee_id", name: "att_changeschedule_employee_id_7871a2b6_fk_personnel_employee_id"
  add_foreign_key "att_changeschedule", "workflow_abstractexception", column: "abstractexception_ptr_id", name: "att_changeschedule_abstractexception_ptr_id_6bf48cd8_fk_workflow_abstractexception_id"
  add_foreign_key "att_clientdetails", "personnel_company", column: "company_id", name: "att_clientdetails_company_id_11b1619a_fk_personnel_company_id"
  add_foreign_key "att_departmentschedule", "att_attshift", column: "shift_id", name: "att_departmentschedule_shift_id_c37d5ade_fk_att_attshift_id"
  add_foreign_key "att_departmentschedule", "personnel_department", column: "department_id", name: "att_departmentschedule_department_id_c68fca3d_fk_personnel_department_id"
  add_foreign_key "att_deptattrule", "personnel_company", column: "company_id", name: "att_deptattrule_company_id_420199ab_fk_personnel_company_id"
  add_foreign_key "att_deptattrule", "personnel_department", column: "department_id", name: "att_deptattrule_department_id_f333c8f0_fk_personnel_department_id"
  add_foreign_key "att_holiday", "personnel_company", column: "company_id", name: "att_holiday_company_id_4c395f52_fk_personnel_company_id"
  add_foreign_key "att_holiday", "personnel_department", column: "department_id", name: "att_holiday_department_id_fbbbd185_fk_personnel_department_id"
  add_foreign_key "att_holiday", "personnel_location", column: "location_id", name: "att_holiday_location_id_7bd552a5_fk_personnel_location_id"
  add_foreign_key "att_leave", "att_leavecategory", column: "category_id", name: "att_leave_category_id_bbba39ba_fk_att_leavecategory_id"
  add_foreign_key "att_leave", "personnel_employee", column: "employee_id", name: "att_leave_employee_id_bb231627_fk_personnel_employee_id"
  add_foreign_key "att_leave", "workflow_abstractexception", column: "abstractexception_ptr_id", name: "att_leave_abstractexception_ptr_id_7d182abd_fk_workflow_abstractexception_id"
  add_foreign_key "att_leavecategory", "personnel_company", column: "company_id", name: "att_leavecategory_company_id_e8169be2_fk_personnel_company_id"
  add_foreign_key "att_leaveschedule", "personnel_company", column: "company_id", name: "att_leaveschedule_company_id_e9e8f83c_fk_personnel_company_id"
  add_foreign_key "att_leaveschedule", "personnel_employee", column: "employee_id", name: "att_leaveschedule_employee_id_d0b947bc_fk_personnel_employee_id"
  add_foreign_key "att_leavesettings", "personnel_company", column: "company_id", name: "att_leavesettings_company_id_22b94e3e_fk_personnel_company_id"
  add_foreign_key "att_leavesettings", "personnel_employee", column: "employee_id", name: "att_leavesettings_employee_id_499b08f8_fk_personnel_employee_id"
  add_foreign_key "att_manuallog", "personnel_employee", column: "employee_id", name: "att_manuallog_employee_id_dc8cc2ad_fk_personnel_employee_id"
  add_foreign_key "att_manuallog", "workflow_abstractexception", column: "abstractexception_ptr_id", name: "att_manuallog_abstractexception_ptr_id_f1e1b292_fk_workflow_abstractexception_id"
  add_foreign_key "att_outdooremployeeschedule", "att_outdoorscheduleplanner", column: "schedule_planner_id", name: "att_outdooremployeeschedule_schedule_planner_id_7f6c2124_fk_att_outdoorscheduleplanner_id"
  add_foreign_key "att_outdooremployeeschedule", "personnel_company", column: "company_id", name: "att_outdooremployeeschedule_company_id_3d89bc1d_fk_personnel_company_id"
  add_foreign_key "att_outdooremployeeschedule", "personnel_employee", column: "employee_id", name: "att_outdooremployeeschedule_employee_id_d1d04c44_fk_personnel_employee_id"
  add_foreign_key "att_outdoorscheduleplanner", "personnel_company", column: "company_id", name: "att_outdoorscheduleplanner_company_id_d3e68ba0_fk_personnel_company_id"
  add_foreign_key "att_outdoortrack", "att_clientdetails", column: "client_id", name: "att_outdoortrack_client_id_685e3c3b_fk_att_clientdetails_id"
  add_foreign_key "att_outdoortrack", "att_outdoorscheduleplanner", column: "schedule_id", name: "att_outdoortrack_schedule_id_a9af11fb_fk_att_outdoorscheduleplanner_id"
  add_foreign_key "att_outdoortrack", "personnel_company", column: "company_id", name: "att_outdoortrack_company_id_0f25e1bc_fk_personnel_company_id"
  add_foreign_key "att_outdoortrack", "personnel_employee", column: "employee_id", name: "att_outdoortrack_employee_id_93263c5c_fk_personnel_employee_id"
  add_foreign_key "att_overtime", "personnel_employee", column: "employee_id", name: "att_overtime_employee_id_0c0d39dc_fk_personnel_employee_id"
  add_foreign_key "att_overtime", "workflow_abstractexception", column: "abstractexception_ptr_id", name: "att_overtime_abstractexception_ptr_id_94834697_fk_workflow_abstractexception_id"
  add_foreign_key "att_payloadbase", "att_timeinterval", column: "timetable_id", name: "att_payloadbase_timetable_id_a389e3d8_fk_att_timeinterval_id"
  add_foreign_key "att_payloadbase", "personnel_employee", column: "emp_id", name: "att_payloadbase_emp_id_2c0f6a7b_fk_personnel_employee_id"
  add_foreign_key "att_payloadexception", "att_leave", column: "item_id", primary_key: "abstractexception_ptr_id", name: "att_payloadexception_item_id_a08bfe48_fk_att_leave_abstractexception_ptr_id"
  add_foreign_key "att_payloadmulpunchset", "personnel_employee", column: "emp_id", name: "att_payloadmulpunchset_emp_id_f47610c8_fk_personnel_employee_id"
  add_foreign_key "att_payloadpunch", "iclock_transaction", column: "orig_id", name: "att_payloadpunch_orig_id_16b26416_fk_iclock_transaction_id"
  add_foreign_key "att_payloadpunch", "personnel_employee", column: "emp_id", name: "att_payloadpunch_emp_id_053da2f0_fk_personnel_employee_id"
  add_foreign_key "att_reportparam", "personnel_company", column: "company_id", name: "att_reportparam_company_id_e1078d08_fk_personnel_company_id"
  add_foreign_key "att_shiftdetail", "att_attshift", column: "shift_id", name: "att_shiftdetail_shift_id_7d694501_fk_att_attshift_id"
  add_foreign_key "att_shiftdetail", "att_timeinterval", column: "time_interval_id", name: "att_shiftdetail_time_interval_id_777dde8f_fk_att_timeinterval_id"
  add_foreign_key "att_tempschedule", "personnel_employee", column: "employee_id", name: "att_tempschedule_employee_id_b89c7e54_fk_personnel_employee_id"
  add_foreign_key "att_timeinterval", "personnel_company", column: "company_id", name: "att_timeinterval_company_id_9824d651_fk_personnel_company_id"
  add_foreign_key "att_timeinterval_break_time", "att_breaktime", column: "breaktime_id", name: "att_timeinterval_break_time_breaktime_id_08462308_fk_att_breaktime_id"
  add_foreign_key "att_timeinterval_break_time", "att_timeinterval", column: "timeinterval_id", name: "att_timeinterval_break_time_timeinterval_id_2287017e_fk_att_timeinterval_id"
  add_foreign_key "att_training", "att_trainingcategory", column: "category_id", name: "att_training_category_id_fb38e891_fk_att_trainingcategory_id"
  add_foreign_key "att_training", "personnel_employee", column: "employee_id", name: "att_training_employee_id_44af8319_fk_personnel_employee_id"
  add_foreign_key "att_training", "workflow_abstractexception", column: "abstractexception_ptr_id", name: "att_training_abstractexception_ptr_id_60a3e8f3_fk_workflow_abstractexception_id"
  add_foreign_key "att_trainingcategory", "personnel_company", column: "company_id", name: "att_trainingcategory_company_id_b2cdea87_fk_personnel_company_id"
  add_foreign_key "auth_group_permissions", "auth_group", column: "group_id", name: "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id"
  add_foreign_key "auth_group_permissions", "auth_permission", column: "permission_id", name: "auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id"
  add_foreign_key "auth_group_profile", "auth_group", column: "group_ptr_id", name: "auth_group_profile_group_ptr_id_365fce7f_fk_auth_group_id"
  add_foreign_key "auth_group_profile", "personnel_company", column: "company_id", name: "auth_group_profile_company_id_5b832dad_fk_personnel_company_id"
  add_foreign_key "auth_group_profile_group_user", "auth_group_profile", column: "groupprofile_id", primary_key: "group_ptr_id", name: "auth_group_profile_group_user_groupprofile_id_ff65a508_fk_auth_group_profile_group_ptr_id"
  add_foreign_key "auth_group_profile_group_user", "auth_user", column: "myuser_id", name: "auth_group_profile_group_user_myuser_id_43d03228_fk_auth_user_id"
  add_foreign_key "auth_permission", "django_content_type", column: "content_type_id", name: "auth_permission_content_type_id_2f476e4b_fk_django_content_type_id"
  add_foreign_key "auth_user_groups", "auth_group", column: "group_id", name: "auth_user_groups_group_id_97559544_fk_auth_group_id"
  add_foreign_key "auth_user_groups", "auth_user", column: "myuser_id", name: "auth_user_groups_myuser_id_d03e8dcc_fk_auth_user_id"
  add_foreign_key "auth_user_user_permissions", "auth_permission", column: "permission_id", name: "auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id"
  add_foreign_key "auth_user_user_permissions", "auth_user", column: "myuser_id", name: "auth_user_user_permissions_myuser_id_679b1527_fk_auth_user_id"
  add_foreign_key "authtoken_token", "auth_user", column: "user_id", name: "authtoken_token_user_id_35299eff_fk_auth_user_id"
  add_foreign_key "base_adminlog", "auth_user", column: "user_id", name: "base_adminlog_user_id_ecf659f8_fk_auth_user_id"
  add_foreign_key "base_adminlog", "django_content_type", column: "content_type_id", name: "base_adminlog_content_type_id_3e553c30_fk_django_content_type_id"
  add_foreign_key "base_adminlog", "personnel_company", column: "company_id", name: "base_adminlog_company_id_bc0e756f_fk_personnel_company_id"
  add_foreign_key "base_autoexporttask", "personnel_company", column: "company_id", name: "base_autoexporttask_company_id_efb12456_fk_personnel_company_id"
  add_foreign_key "base_bookmark", "auth_user", column: "user_id", name: "base_bookmark_user_id_5f2d5ca2_fk_auth_user_id"
  add_foreign_key "base_bookmark", "django_content_type", column: "content_type_id", name: "base_bookmark_content_type_id_b6a0e799_fk_django_content_type_id"
  add_foreign_key "base_bookmark", "personnel_company", column: "company_id", name: "base_bookmark_company_id_67ca1aa0_fk_personnel_company_id"
  add_foreign_key "base_dbbackuplog", "personnel_company", column: "company_id", name: "base_dbbackuplog_company_id_8f93ee2e_fk_personnel_company_id"
  add_foreign_key "base_dbmigrate", "personnel_company", column: "company_id", name: "base_dbmigrate_company_id_e1709280_fk_personnel_company_id"
  add_foreign_key "base_linenotifysetting", "personnel_department", column: "line_notify_dept_id", name: "base_linenotifysetting_line_notify_dept_id_0643a5ed_fk_personnel_department_id"
  add_foreign_key "base_membership", "auth_user", column: "user_id", name: "base_membership_user_id_41d22f2f_fk_auth_user_id"
  add_foreign_key "base_membership", "personnel_company", column: "company_id", name: "base_membership_company_id_a76e12ab_fk_personnel_company_id"
  add_foreign_key "base_membership", "personnel_company", column: "vendor_company_id", name: "base_membership_vendor_company_id_05daafa1_fk_personnel_company_id"
  add_foreign_key "base_membership_auth_area", "base_membership", column: "membership_id", name: "base_membership_auth_area_membership_id_83d2efbb_fk_base_membership_id"
  add_foreign_key "base_membership_auth_area", "personnel_area", column: "area_id", name: "base_membership_auth_area_area_id_e58abb05_fk_personnel_area_id"
  add_foreign_key "base_membership_auth_dept", "base_membership", column: "membership_id", name: "base_membership_auth_dept_membership_id_22e9a747_fk_base_membership_id"
  add_foreign_key "base_membership_auth_dept", "personnel_department", column: "department_id", name: "base_membership_auth_dept_department_id_c1d95e5b_fk_personnel_department_id"
  add_foreign_key "base_membership_auth_pos", "base_membership", column: "membership_id", name: "base_membership_auth_pos_membership_id_82d704d4_fk_base_membership_id"
  add_foreign_key "base_membership_auth_pos", "personnel_position", column: "position_id", name: "base_membership_auth_pos_position_id_ae22a7d3_fk_personnel_position_id"
  add_foreign_key "base_paralleldb", "personnel_company", column: "company_id", name: "base_paralleldb_company_id_2842487e_fk_personnel_company_id"
  add_foreign_key "base_paralleldbexport", "personnel_company", column: "company_id", name: "base_paralleldbexport_company_id_4028fc3e_fk_personnel_company_id"
  add_foreign_key "base_sftpsetting", "personnel_company", column: "company_id", name: "base_sftpsetting_company_id_f270bcdb_fk_personnel_company_id"
  add_foreign_key "base_systemsetting", "personnel_company", column: "company_id", name: "base_systemsetting_company_id_e59b9b82_fk_personnel_company_id"
  add_foreign_key "cloud_discount", "auth_user", column: "create_user_id", name: "cloud_discount_create_user_id_0506f480_fk_auth_user_id"
  add_foreign_key "cloud_order", "auth_user", column: "create_user_id", name: "cloud_order_create_user_id_1c5f3fc4_fk_auth_user_id"
  add_foreign_key "cloud_order", "cloud_pricestrategy", column: "price_strategy_id", name: "cloud_order_price_strategy_id_237d5d03_fk_cloud_pricestrategy_id"
  add_foreign_key "cloud_order", "personnel_company", column: "company_id", name: "cloud_order_company_id_a339bfc4_fk_personnel_company_id"
  add_foreign_key "cloud_order_feature", "cloud_feature", column: "feature_id", name: "cloud_order_feature_feature_id_dd677eee_fk_cloud_feature_id"
  add_foreign_key "cloud_order_feature", "cloud_order", column: "order_id", name: "cloud_order_feature_order_id_ceff3969_fk_cloud_order_id"
  add_foreign_key "cloud_paymentrecord", "cloud_order", column: "order_id", name: "cloud_paymentrecord_order_id_296426c6_fk_cloud_order_id"
  add_foreign_key "cloud_pricestrategy", "auth_user", column: "create_user_id", name: "cloud_pricestrategy_create_user_id_e5b9e9d1_fk_auth_user_id"
  add_foreign_key "cloud_pricestrategy", "cloud_discount", column: "discount_id", name: "cloud_pricestrategy_discount_id_fbf0d75e_fk_cloud_discount_id"
  add_foreign_key "cloud_pricestrategy", "personnel_company", column: "vendor_id", name: "cloud_pricestrategy_vendor_id_427cf2a3_fk_personnel_company_id"
  add_foreign_key "cloud_pricestrategy_feature", "cloud_feature", column: "feature_id", name: "cloud_pricestrategy_feature_feature_id_574f3192_fk_cloud_feature_id"
  add_foreign_key "cloud_pricestrategy_feature", "cloud_pricestrategy", column: "pricestrategy_id", name: "cloud_pricestrategy_feature_pricestrategy_id_79e0e309_fk_cloud_pricestrategy_id"
  add_foreign_key "django_admin_log", "auth_user", column: "user_id", name: "django_admin_log_user_id_c564eba6_fk_auth_user_id"
  add_foreign_key "django_admin_log", "django_content_type", column: "content_type_id", name: "django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id"
  add_foreign_key "djcelery_periodictask", "djcelery_crontabschedule", column: "crontab_id", name: "djcelery_periodictask_crontab_id_75609bab_fk_djcelery_crontabschedule_id"
  add_foreign_key "djcelery_periodictask", "djcelery_intervalschedule", column: "interval_id", name: "djcelery_periodictask_interval_id_b426ab02_fk_djcelery_intervalschedule_id"
  add_foreign_key "djcelery_taskstate", "djcelery_workerstate", column: "worker_id", name: "djcelery_taskstate_worker_id_f7f57a05_fk_djcelery_workerstate_id"
  add_foreign_key "guardian_groupobjectpermission", "auth_group", column: "group_id", name: "guardian_groupobjectpermission_group_id_4bbbfb62_fk_auth_group_id"
  add_foreign_key "guardian_groupobjectpermission", "auth_permission", column: "permission_id", name: "guardian_groupobjectpermission_permission_id_36572738_fk_auth_permission_id"
  add_foreign_key "guardian_groupobjectpermission", "django_content_type", column: "content_type_id", name: "guardian_groupobjectpermission_content_type_id_7ade36b8_fk_django_content_type_id"
  add_foreign_key "guardian_userobjectpermission", "auth_permission", column: "permission_id", name: "guardian_userobjectpermission_permission_id_71807bfc_fk_auth_permission_id"
  add_foreign_key "guardian_userobjectpermission", "auth_user", column: "user_id", name: "guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id"
  add_foreign_key "guardian_userobjectpermission", "django_content_type", column: "content_type_id", name: "guardian_userobjectpermission_content_type_id_2e892405_fk_django_content_type_id"
  add_foreign_key "iclock_biodata", "personnel_employee", column: "employee_id", name: "iclock_biodata_employee_id_ff748ea7_fk_personnel_employee_id"
  add_foreign_key "iclock_biophoto", "personnel_employee", column: "employee_id", name: "iclock_biophoto_employee_id_3dba5819_fk_personnel_employee_id"
  add_foreign_key "iclock_deviceconfig", "personnel_company", column: "company_id", name: "iclock_deviceconfig_company_id_0fec1982_fk_personnel_company_id"
  add_foreign_key "iclock_errorcommandlog", "iclock_terminal", column: "terminal_id", name: "iclock_errorcommandlog_terminal_id_3b2d7cbd_fk_iclock_terminal_id"
  add_foreign_key "iclock_events", "personnel_company", column: "company_id", name: "iclock_events_company_id_98a3c764_fk_personnel_company_id"
  add_foreign_key "iclock_privatemessage", "personnel_employee", column: "employee_id", name: "iclock_privatemessage_employee_id_e84a34c0_fk_personnel_employee_id"
  add_foreign_key "iclock_publicmessage", "iclock_terminal", column: "terminal_id", name: "iclock_publicmessage_terminal_id_c3b5e4cf_fk_iclock_terminal_id"
  add_foreign_key "iclock_terminal", "personnel_area", column: "area_id", name: "iclock_terminal_area_id_c019c6f0_fk_personnel_area_id"
  add_foreign_key "iclock_terminal", "personnel_company", column: "company_id", name: "iclock_terminal_company_id_f2ecaaba_fk_personnel_company_id"
  add_foreign_key "iclock_terminalcommand", "iclock_terminal", column: "terminal_id", name: "iclock_terminalcommand_terminal_id_3dcf836f_fk_iclock_terminal_id"
  add_foreign_key "iclock_terminallocation", "iclock_terminal", column: "terminal_id", name: "iclock_terminallocation_terminal_id_effc55a3_fk_iclock_terminal_id"
  add_foreign_key "iclock_terminallog", "iclock_terminal", column: "terminal_id", name: "iclock_terminallog_terminal_id_667b3ea7_fk_iclock_terminal_id"
  add_foreign_key "iclock_terminalparameter", "iclock_terminal", column: "terminal_id", name: "iclock_terminalparameter_terminal_id_443872e3_fk_iclock_terminal_id"
  add_foreign_key "iclock_terminaluploadlog", "iclock_terminal", column: "terminal_id", name: "iclock_terminaluploadlog_terminal_id_9c9a7664_fk_iclock_terminal_id"
  add_foreign_key "iclock_terminalworkcode", "personnel_company", column: "company_id", name: "iclock_terminalworkcode_company_id_77625f26_fk_personnel_company_id"
  add_foreign_key "iclock_transaction", "iclock_terminal", column: "terminal_id", name: "iclock_transaction_terminal_id_451c81c2_fk_iclock_terminal_id"
  add_foreign_key "iclock_transaction", "personnel_company", column: "company_id", name: "iclock_transaction_company_id_e7aede63_fk_personnel_company_id"
  add_foreign_key "iclock_transaction", "personnel_employee", column: "emp_id", name: "iclock_transaction_emp_id_60fa3521_fk_personnel_employee_id"
  add_foreign_key "iclock_transactionproofcmd", "iclock_terminal", column: "terminal_id", name: "iclock_transactionproofcmd_terminal_id_08b81e1e_fk_iclock_terminal_id"
  add_foreign_key "iclock_unregister", "iclock_terminal", column: "terminal_id", name: "iclock_unregister_terminal_id_7c0e4a51_fk_iclock_terminal_id"
  add_foreign_key "iclock_unregister", "personnel_company", column: "company_id", name: "iclock_unregister_company_id_e76c1e27_fk_personnel_company_id"
  add_foreign_key "iclock_unregister", "personnel_employee", column: "emp_id", name: "iclock_unregister_emp_id_e51e996d_fk_personnel_employee_id"
  add_foreign_key "mobile_announcement", "personnel_company", column: "company_id", name: "mobile_announcement_company_id_46c8203d_fk_personnel_company_id"
  add_foreign_key "mobile_announcement", "personnel_employee", column: "receiver_id", name: "mobile_announcement_receiver_id_ddf2a860_fk_personnel_employee_id"
  add_foreign_key "mobile_applist", "personnel_company", column: "company_id", name: "mobile_applist_company_id_5a52be94_fk_personnel_company_id"
  add_foreign_key "mobile_appnotification", "personnel_employee", column: "receiver_id", name: "mobile_appnotification_receiver_id_90c4a355_fk_personnel_employee_id"
  add_foreign_key "mobile_gpsfordepartment", "personnel_department", column: "department_id", name: "mobile_gpsfordepartment_department_id_988ccf22_fk_personnel_department_id"
  add_foreign_key "mobile_gpsforemployee", "personnel_employee", column: "employee_id", name: "mobile_gpsforemployee_employee_id_982b7cef_fk_personnel_employee_id"
  add_foreign_key "payroll_allowancetype", "personnel_company", column: "company_id", name: "payroll_allowancetype_company_id_4eb737ec_fk_personnel_company_id"
  add_foreign_key "payroll_deductionformula", "personnel_company", column: "company_id", name: "payroll_deductionformula_company_id_0a591c19_fk_personnel_company_id"
  add_foreign_key "payroll_emploan", "personnel_employee", column: "employee_id", name: "payroll_emploan_employee_id_97a251ef_fk_personnel_employee_id"
  add_foreign_key "payroll_emppayrollprofile", "personnel_employee", column: "employee_id", name: "payroll_emppayrollprofile_employee_id_6c97078c_fk_personnel_employee_id"
  add_foreign_key "payroll_exceptionformula", "personnel_company", column: "company_id", name: "payroll_exceptionformula_company_id_0541a53f_fk_personnel_company_id"
  add_foreign_key "payroll_extradeduction", "personnel_employee", column: "employee_id", name: "payroll_extradeduction_employee_id_53072441_fk_personnel_employee_id"
  add_foreign_key "payroll_extraincrease", "personnel_employee", column: "employee_id", name: "payroll_extraincrease_employee_id_f902e6bb_fk_personnel_employee_id"
  add_foreign_key "payroll_increasementformula", "personnel_company", column: "company_id", name: "payroll_increasementformula_company_id_2fdef254_fk_personnel_company_id"
  add_foreign_key "payroll_leaveformula", "att_leavecategory", column: "category_id", name: "payroll_leaveformula_category_id_945b2054_fk_att_leavecategory_id"
  add_foreign_key "payroll_leaveformula", "personnel_company", column: "company_id", name: "payroll_leaveformula_company_id_a4d269d1_fk_personnel_company_id"
  add_foreign_key "payroll_monthlysalary", "personnel_employee", column: "employee_id", name: "payroll_monthlysalary_employee_id_97fdc6a9_fk_personnel_employee_id"
  add_foreign_key "payroll_overtimeformula", "personnel_company", column: "company_id", name: "payroll_overtimeformula_company_id_f55f42e4_fk_personnel_company_id"
  add_foreign_key "payroll_purposetype", "personnel_company", column: "company_id", name: "payroll_purposetype_company_id_12048ee6_fk_personnel_company_id"
  add_foreign_key "payroll_reimbursement", "payroll_allowancetype", column: "allowance_type_id", name: "payroll_reimbursement_allowance_type_id_e5d0c005_fk_payroll_allowancetype_id"
  add_foreign_key "payroll_reimbursement", "payroll_purposetype", column: "purpose_type_id", name: "payroll_reimbursement_purpose_type_id_b32cc304_fk_payroll_purposetype_id"
  add_foreign_key "payroll_reimbursement", "personnel_company", column: "company_id", name: "payroll_reimbursement_company_id_55bbbb1b_fk_personnel_company_id"
  add_foreign_key "payroll_reimbursement", "personnel_employee", column: "employee_id", name: "payroll_reimbursement_employee_id_c4bbde36_fk_personnel_employee_id"
  add_foreign_key "payroll_reimbursement", "workflow_abstractexception", column: "workflow_abstractException_id", name: "payroll_reimbursement_workflow_abstractException_id_1c15b3c1_fk_workflow_abstractexception_id"
  add_foreign_key "payroll_salaryadvance", "personnel_employee", column: "employee_id", name: "payroll_salaryadvance_employee_id_2abd43e5_fk_personnel_employee_id"
  add_foreign_key "payroll_salarystructure", "personnel_employee", column: "employee_id", name: "payroll_salarystructure_employee_id_98996e15_fk_personnel_employee_id"
  add_foreign_key "payroll_salarystructure_deductionformula", "payroll_deductionformula", column: "deductionformula_id", name: "payroll_salarystructure_deductionformula_deductionformula_id_b174d5b6_fk_payroll_deductionformula_id"
  add_foreign_key "payroll_salarystructure_deductionformula", "payroll_salarystructure", column: "salarystructure_id", name: "payroll_salarystructure_deductionformula_salarystructure_id_5ca7cdb5_fk_payroll_salarystructure_id"
  add_foreign_key "payroll_salarystructure_exceptionformula", "payroll_exceptionformula", column: "exceptionformula_id", name: "payroll_salarystructure_exceptionformula_exceptionformula_id_8f6dadb3_fk_payroll_exceptionformula_id"
  add_foreign_key "payroll_salarystructure_exceptionformula", "payroll_salarystructure", column: "salarystructure_id", name: "payroll_salarystructure_exceptionformula_salarystructure_id_3c087208_fk_payroll_salarystructure_id"
  add_foreign_key "payroll_salarystructure_increasementformula", "payroll_increasementformula", column: "increasementformula_id", name: "payroll_salarystructure_increasementformula_increasementformula_id_3cd77082_fk_payroll_increasementformula_id"
  add_foreign_key "payroll_salarystructure_increasementformula", "payroll_salarystructure", column: "salarystructure_id", name: "payroll_salarystructure_increasementformula_salarystructure_id_8752401c_fk_payroll_salarystructure_id"
  add_foreign_key "payroll_salarystructure_leaveformula", "payroll_leaveformula", column: "leaveformula_id", name: "payroll_salarystructure_leaveformula_leaveformula_id_049f9024_fk_payroll_leaveformula_id"
  add_foreign_key "payroll_salarystructure_leaveformula", "payroll_salarystructure", column: "salarystructure_id", name: "payroll_salarystructure_leaveformula_salarystructure_id_cf98fdd7_fk_payroll_salarystructure_id"
  add_foreign_key "payroll_salarystructure_overtimeformula", "payroll_overtimeformula", column: "overtimeformula_id", name: "payroll_salarystructure_overtimeformula_overtimeformula_id_40ad89ef_fk_payroll_overtimeformula_id"
  add_foreign_key "payroll_salarystructure_overtimeformula", "payroll_salarystructure", column: "salarystructure_id", name: "payroll_salarystructure_overtimeformula_salarystructure_id_64f75042_fk_payroll_salarystructure_id"
  add_foreign_key "personnel_area", "personnel_area", column: "parent_area_id", name: "personnel_area_parent_area_id_39028fda_fk_personnel_area_id"
  add_foreign_key "personnel_area", "personnel_company", column: "company_id", name: "personnel_area_company_id_59750eb5_fk_personnel_company_id"
  add_foreign_key "personnel_certification", "personnel_company", column: "company_id", name: "personnel_certification_company_id_c1b1bd00_fk_personnel_company_id"
  add_foreign_key "personnel_company_feature", "cloud_feature", column: "feature_id", name: "personnel_company_feature_feature_id_67123392_fk_cloud_feature_id"
  add_foreign_key "personnel_company_feature", "personnel_company", column: "company_id", name: "personnel_company_feature_company_id_d330e85b_fk_personnel_company_id"
  add_foreign_key "personnel_department", "personnel_company", column: "company_id", name: "personnel_department_company_id_00867fd8_fk_personnel_company_id"
  add_foreign_key "personnel_department", "personnel_department", column: "parent_dept_id", name: "personnel_department_parent_dept_id_d0b44024_fk_personnel_department_id"
  add_foreign_key "personnel_employee", "personnel_company", column: "company_id", name: "personnel_employee_company_id_95b3fd72_fk_personnel_company_id"
  add_foreign_key "personnel_employee", "personnel_department", column: "department_id", name: "personnel_employee_department_id_068bbd08_fk_personnel_department_id"
  add_foreign_key "personnel_employee", "personnel_location", column: "location_id", name: "personnel_employee_location_id_494a1f8d_fk_personnel_location_id"
  add_foreign_key "personnel_employee", "personnel_position", column: "position_id", name: "personnel_employee_position_id_c9321343_fk_personnel_position_id"
  add_foreign_key "personnel_employee_area", "personnel_area", column: "area_id", name: "personnel_employee_area_area_id_64c21925_fk_personnel_area_id"
  add_foreign_key "personnel_employee_area", "personnel_employee", column: "employee_id", name: "personnel_employee_area_employee_id_8e5cec21_fk_personnel_employee_id"
  add_foreign_key "personnel_employee_flow_role", "personnel_employee", column: "employee_id", name: "personnel_employee_flow_role_employee_id_c27f8a56_fk_personnel_employee_id"
  add_foreign_key "personnel_employee_flow_role", "workflow_workflowrole", column: "workflowrole_id", name: "personnel_employee_flow_role_workflowrole_id_4704db32_fk_workflow_workflowrole_id"
  add_foreign_key "personnel_employeecertification", "personnel_certification", column: "certification_id", name: "personnel_employeecertification_certification_id_faabed40_fk_personnel_certification_id"
  add_foreign_key "personnel_employeecertification", "personnel_employee", column: "employee_id", name: "personnel_employeecertification_employee_id_b7bd3867_fk_personnel_employee_id"
  add_foreign_key "personnel_employeeprofile", "personnel_employee", column: "emp_id", name: "personnel_employeeprofile_emp_id_3a69c313_fk_personnel_employee_id"
  add_foreign_key "personnel_location", "personnel_company", column: "company_id", name: "personnel_location_company_id_46ad1d50_fk_personnel_company_id"
  add_foreign_key "personnel_location", "personnel_location", column: "parent_location_id", name: "personnel_location_parent_location_id_667cb9ac_fk_personnel_location_id"
  add_foreign_key "personnel_position", "personnel_company", column: "company_id", name: "personnel_position_company_id_f06c5d2a_fk_personnel_company_id"
  add_foreign_key "personnel_position", "personnel_position", column: "parent_position_id", name: "personnel_position_parent_position_id_a496a36b_fk_personnel_position_id"
  add_foreign_key "personnel_resign", "personnel_employee", column: "employee_id", name: "personnel_resign_employee_id_dd9b7e08_fk_personnel_employee_id"
  add_foreign_key "staff_stafftoken", "personnel_employee", column: "user_id", name: "staff_stafftoken_user_id_39c937fa_fk_personnel_employee_id"
  add_foreign_key "workflow_abstractexception", "personnel_company", column: "company_id", name: "workflow_abstractexception_company_id_0bf5003a_fk_personnel_company_id"
  add_foreign_key "workflow_nodeinstance", "auth_user", column: "approver_admin_id", name: "workflow_nodeinstance_approver_admin_id_dff58806_fk_auth_user_id"
  add_foreign_key "workflow_nodeinstance", "personnel_department", column: "departments_id", name: "workflow_nodeinstance_departments_id_b0dc2bdb_fk_personnel_department_id"
  add_foreign_key "workflow_nodeinstance", "personnel_employee", column: "approver_employee_id", name: "workflow_nodeinstance_approver_employee_id_d36cd45d_fk_personnel_employee_id"
  add_foreign_key "workflow_nodeinstance", "workflow_workflowinstance", column: "workflow_instance_id", name: "workflow_nodeinstance_workflow_instance_id_afe84fe4_fk_workflow_workflowinstance_id"
  add_foreign_key "workflow_nodeinstance", "workflow_workflownode", column: "node_engine_id", name: "workflow_nodeinstance_node_engine_id_4533f12d_fk_workflow_workflownode_id"
  add_foreign_key "workflow_workflowengine", "django_content_type", column: "content_type_id", name: "workflow_workflowengine_content_type_id_f7345c20_fk_django_content_type_id"
  add_foreign_key "workflow_workflowengine", "personnel_company", column: "company_id", name: "workflow_workflowengine_company_id_c42adcb0_fk_personnel_company_id"
  add_foreign_key "workflow_workflowengine", "personnel_department", column: "departments_id", name: "workflow_workflowengine_departments_id_0f06d4c7_fk_personnel_department_id"
  add_foreign_key "workflow_workflowengine", "personnel_position", column: "applicant_position_id", name: "workflow_workflowengine_applicant_position_id_8a65e03a_fk_personnel_position_id"
  add_foreign_key "workflow_workflowengine_employee", "personnel_employee", column: "employee_id", name: "workflow_workflowengine_employee_employee_id_803a409e_fk_personnel_employee_id"
  add_foreign_key "workflow_workflowengine_employee", "workflow_workflowengine", column: "workflowengine_id", name: "workflow_workflowengine_employee_workflowengine_id_6ebcc5f2_fk_workflow_workflowengine_id"
  add_foreign_key "workflow_workflowinstance", "personnel_employee", column: "employee_id", name: "workflow_workflowinstance_employee_id_c7cff08e_fk_personnel_employee_id"
  add_foreign_key "workflow_workflowinstance", "workflow_abstractexception", column: "exception_id", name: "workflow_workflowinstance_exception_id_6c82a5d8_fk_workflow_abstractexception_id"
  add_foreign_key "workflow_workflowinstance", "workflow_workflowengine", column: "workflow_engine_id", name: "workflow_workflowinstance_workflow_engine_id_1e6ac40f_fk_workflow_workflowengine_id"
  add_foreign_key "workflow_workflownode", "personnel_company", column: "company_id", name: "workflow_workflownode_company_id_44989997_fk_personnel_company_id"
  add_foreign_key "workflow_workflownode_approver", "workflow_workflownode", column: "workflownode_id", name: "workflow_workflownode_approver_workflownode_id_d814c941_fk_workflow_workflownode_id"
  add_foreign_key "workflow_workflownode_approver", "workflow_workflowrole", column: "workflowrole_id", name: "workflow_workflownode_approver_workflowrole_id_c8e00d42_fk_workflow_workflowrole_id"
  add_foreign_key "workflow_workflownode_notifier", "workflow_workflownode", column: "workflownode_id", name: "workflow_workflownode_notifier_workflownode_id_57298016_fk_workflow_workflownode_id"
  add_foreign_key "workflow_workflownode_notifier", "workflow_workflowrole", column: "workflowrole_id", name: "workflow_workflownode_notifier_workflowrole_id_73de7fc2_fk_workflow_workflowrole_id"
  add_foreign_key "workflow_workflowrole", "personnel_company", column: "company_id", name: "workflow_workflowrole_company_id_bbb75590_fk_personnel_company_id"
end
