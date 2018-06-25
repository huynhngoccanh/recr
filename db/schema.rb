# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180110041953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.float    "lat"
    t.float    "lng"
    t.string   "formatted_address"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["owner_type", "owner_id"], name: "index_addresses_on_owner_type_and_owner_id", using: :btree
  end

  create_table "affiliations", force: :cascade do |t|
    t.integer  "coach_id"
    t.string   "organization_type"
    t.integer  "organization_id"
    t.boolean  "organization_approved"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["coach_id"], name: "index_affiliations_on_coach_id", using: :btree
    t.index ["organization_type", "organization_id"], name: "index_affiliations_on_organization_type_and_organization_id", using: :btree
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "raw_url"
    t.integer  "athlete_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["athlete_id"], name: "index_articles_on_athlete_id", using: :btree
  end

  create_table "athletes", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "height"
    t.integer  "weight"
    t.string   "avatar"
    t.string   "primary_position"
    t.integer  "jersey_number"
    t.integer  "bench_press"
    t.integer  "deadlift"
    t.integer  "squat"
    t.float    "forty_yard_dash"
    t.float    "hundred_yard_dash"
    t.text     "inspirational_quote"
    t.integer  "class_of"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.decimal  "gpa",                 precision: 3, scale: 2
    t.boolean  "display_gpa"
    t.string   "hudl_url"
  end

  create_table "centers", force: :cascade do |t|
    t.integer  "season"
    t.integer  "pancakes"
    t.integer  "sacks_allowed"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "coaches", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role",       default: 0
    t.string   "role_name"
    t.text     "bio"
    t.string   "avatar"
    t.integer  "position",   default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "colleges", force: :cascade do |t|
    t.string   "name"
    t.text     "logo"
    t.integer  "added_by_id"
    t.text     "offensive_schema"
    t.text     "defensive_schema"
    t.integer  "division",                                                 null: false
    t.integer  "enrollment"
    t.string   "team_record"
    t.string   "mascot"
    t.string   "school_email"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.decimal  "gpa_requirement",   precision: 3, scale: 2
    t.boolean  "allow_connections",                         default: true
  end

  create_table "connections", force: :cascade do |t|
    t.integer  "athlete_id"
    t.integer  "college_id"
    t.boolean  "athlete_approved"
    t.boolean  "college_approved"
    t.boolean  "committed",               default: false
    t.boolean  "letter_of_intent_signed", default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "last_modified_by_id"
    t.index ["athlete_id"], name: "index_connections_on_athlete_id", using: :btree
    t.index ["college_id"], name: "index_connections_on_college_id", using: :btree
  end

  create_table "conversations", force: :cascade do |t|
    t.string   "organization_type"
    t.integer  "organization_id"
    t.integer  "athlete_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["athlete_id"], name: "index_conversations_on_athlete_id", using: :btree
    t.index ["organization_type", "organization_id"], name: "index_conversations_on_organization_type_and_organization_id", using: :btree
  end

  create_table "cornerbacks", force: :cascade do |t|
    t.integer  "season"
    t.integer  "sacks"
    t.integer  "interceptions"
    t.integer  "forced_fumbles"
    t.integer  "tackles"
    t.integer  "pass_breakups"
    t.integer  "tackles_for_loss"
    t.integer  "defensive_touchdowns"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "defensive_ends", force: :cascade do |t|
    t.integer  "season"
    t.integer  "sacks"
    t.integer  "interceptions"
    t.integer  "forced_fumbles"
    t.integer  "tackles"
    t.integer  "pass_breakups"
    t.integer  "tackles_for_loss"
    t.integer  "defensive_touchdowns"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "defensive_tackles", force: :cascade do |t|
    t.integer  "season"
    t.integer  "sacks"
    t.integer  "interceptions"
    t.integer  "forced_fumbles"
    t.integer  "tackles"
    t.integer  "pass_breakups"
    t.integer  "tackles_for_loss"
    t.integer  "defensive_touchdowns"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer  "athlete_id"
    t.integer  "high_school_id"
    t.boolean  "high_school_approved"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["athlete_id"], name: "index_enrollments_on_athlete_id", using: :btree
    t.index ["high_school_id"], name: "index_enrollments_on_high_school_id", using: :btree
  end

  create_table "free_safeties", force: :cascade do |t|
    t.integer  "season"
    t.integer  "sacks"
    t.integer  "interceptions"
    t.integer  "forced_fumbles"
    t.integer  "tackles"
    t.integer  "pass_breakups"
    t.integer  "tackles_for_loss"
    t.integer  "defensive_touchdowns"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "fullbacks", force: :cascade do |t|
    t.integer  "season"
    t.integer  "receiving_yards"
    t.integer  "receiving_touchdowns"
    t.integer  "rushing_yards"
    t.integer  "rushing_touchdowns"
    t.integer  "pancakes"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "guards", force: :cascade do |t|
    t.integer  "season"
    t.integer  "pancakes"
    t.integer  "sacks_allowed"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "high_schools", force: :cascade do |t|
    t.string   "name"
    t.text     "logo"
    t.integer  "added_by_id"
    t.text     "offensive_schema"
    t.text     "defensive_schema"
    t.integer  "enrollment"
    t.string   "team_record"
    t.string   "mascot"
    t.string   "school_email"
    t.string   "registration_coach_name"
    t.string   "registration_coach_phone_number"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "counselor_name"
    t.string   "counselor_email"
    t.string   "counselor_phone_number"
  end

  create_table "highlights", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "raw_url"
    t.string   "thumbnail_url"
    t.text     "tagged_positions",        default: [],               array: true
    t.string   "highlightable_type"
    t.integer  "highlightable_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
    t.index ["cached_votes_down"], name: "index_highlights_on_cached_votes_down", using: :btree
    t.index ["cached_votes_score"], name: "index_highlights_on_cached_votes_score", using: :btree
    t.index ["cached_votes_total"], name: "index_highlights_on_cached_votes_total", using: :btree
    t.index ["cached_votes_up"], name: "index_highlights_on_cached_votes_up", using: :btree
    t.index ["cached_weighted_average"], name: "index_highlights_on_cached_weighted_average", using: :btree
    t.index ["cached_weighted_score"], name: "index_highlights_on_cached_weighted_score", using: :btree
    t.index ["cached_weighted_total"], name: "index_highlights_on_cached_weighted_total", using: :btree
    t.index ["highlightable_type", "highlightable_id"], name: "index_highlights_on_highlightable_type_and_highlightable_id", using: :btree
  end

  create_table "inside_linebackers", force: :cascade do |t|
    t.integer  "season"
    t.integer  "sacks"
    t.integer  "interceptions"
    t.integer  "forced_fumbles"
    t.integer  "tackles"
    t.integer  "pass_breakups"
    t.integer  "tackles_for_loss"
    t.integer  "defensive_touchdowns"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "kick_returners", force: :cascade do |t|
    t.integer  "season"
    t.integer  "kick_return_yards"
    t.integer  "kick_return_touchdowns"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "kickers", force: :cascade do |t|
    t.integer  "season"
    t.integer  "kicks_attempted"
    t.integer  "kicks_made"
    t.integer  "longest_kick"
    t.integer  "touchbacks"
    t.integer  "yards_per_attempt"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "left_guards", force: :cascade do |t|
    t.integer  "season"
    t.integer  "pancakes"
    t.integer  "sacks_allowed"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "left_tackles", force: :cascade do |t|
    t.integer  "season"
    t.integer  "pancakes"
    t.integer  "sacks_allowed"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.string   "body"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "display_name"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "middle_linebackers", force: :cascade do |t|
    t.integer  "season"
    t.integer  "sacks"
    t.integer  "interceptions"
    t.integer  "forced_fumbles"
    t.integer  "tackles"
    t.integer  "pass_breakups"
    t.integer  "tackles_for_loss"
    t.integer  "defensive_touchdowns"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "nose_tackles", force: :cascade do |t|
    t.integer  "season"
    t.integer  "sacks"
    t.integer  "interceptions"
    t.integer  "forced_fumbles"
    t.integer  "tackles"
    t.integer  "pass_breakups"
    t.integer  "tackles_for_loss"
    t.integer  "defensive_touchdowns"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "actor_id"
    t.datetime "read_at"
    t.boolean  "completed",       default: false
    t.string   "action"
    t.integer  "notifiable_id"
    t.string   "notifiable_type"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "outside_linebackers", force: :cascade do |t|
    t.integer  "season"
    t.integer  "sacks"
    t.integer  "interceptions"
    t.integer  "forced_fumbles"
    t.integer  "tackles"
    t.integer  "pass_breakups"
    t.integer  "tackles_for_loss"
    t.integer  "defensive_touchdowns"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string   "digits"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_type", "owner_id"], name: "index_phone_numbers_on_owner_type_and_owner_id", using: :btree
  end

  create_table "punt_returners", force: :cascade do |t|
    t.integer  "season"
    t.integer  "punt_return_yards"
    t.integer  "punt_return_touchdowns"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "punters", force: :cascade do |t|
    t.integer  "season"
    t.integer  "punts"
    t.integer  "yards_per_attempt"
    t.integer  "longest_punt"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "quarterbacks", force: :cascade do |t|
    t.integer  "season"
    t.integer  "passing_yards"
    t.integer  "passing_touchdowns"
    t.integer  "rushing_yards"
    t.integer  "rushing_touchdowns"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "references", force: :cascade do |t|
    t.integer  "athlete_id"
    t.string   "relationship"
    t.string   "name"
    t.string   "contact_method"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["athlete_id"], name: "index_references_on_athlete_id", using: :btree
  end

  create_table "right_guards", force: :cascade do |t|
    t.integer  "season"
    t.integer  "pancakes"
    t.integer  "sacks_allowed"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "right_tackles", force: :cascade do |t|
    t.integer  "season"
    t.integer  "pancakes"
    t.integer  "sacks_allowed"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "running_backs", force: :cascade do |t|
    t.integer  "season"
    t.integer  "rushing_yards"
    t.integer  "rushing_touchdowns"
    t.integer  "receiving_yards"
    t.integer  "receiving_touchdowns"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "stats", force: :cascade do |t|
    t.integer  "athlete_id"
    t.string   "position_type"
    t.integer  "position_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "last_modified_by_id"
    t.index ["athlete_id"], name: "index_stats_on_athlete_id", using: :btree
    t.index ["position_type", "position_id"], name: "index_stats_on_position_type_and_position_id", using: :btree
  end

  create_table "strong_safeties", force: :cascade do |t|
    t.integer  "season"
    t.integer  "sacks"
    t.integer  "interceptions"
    t.integer  "forced_fumbles"
    t.integer  "tackles"
    t.integer  "pass_breakups"
    t.integer  "tackles_for_loss"
    t.integer  "defensive_touchdowns"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "tackles", force: :cascade do |t|
    t.integer  "season"
    t.integer  "pancakes"
    t.integer  "sacks_allowed"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tight_ends", force: :cascade do |t|
    t.integer  "season"
    t.integer  "receiving_yards"
    t.integer  "catches"
    t.integer  "receiving_touchdowns"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                     default: "", null: false
    t.string   "encrypted_password",        default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "profile_type"
    t.integer  "profile_id"
    t.integer  "role",                      default: 4
    t.datetime "completed_registration_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.string   "invited_by_type"
    t.integer  "invited_by_id"
    t.integer  "invitations_count",         default: 0
    t.string   "provider"
    t.string   "uid"
    t.datetime "last_online_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
    t.index ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
    t.index ["profile_type", "profile_id"], name: "index_users_on_profile_type_and_profile_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  end

  create_table "wide_receivers", force: :cascade do |t|
    t.integer  "season"
    t.integer  "receiving_yards"
    t.integer  "receiving_touchdowns"
    t.integer  "yards_after_catches"
    t.integer  "catches"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_foreign_key "affiliations", "coaches"
  add_foreign_key "articles", "athletes"
  add_foreign_key "connections", "athletes"
  add_foreign_key "connections", "colleges"
  add_foreign_key "conversations", "athletes"
  add_foreign_key "enrollments", "athletes"
  add_foreign_key "enrollments", "high_schools"
  add_foreign_key "messages", "conversations"
  add_foreign_key "references", "athletes"
  add_foreign_key "stats", "athletes"
end
