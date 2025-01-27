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

ActiveRecord::Schema[7.0].define(version: 2023_06_06_012220) do
  create_table "jobs", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs_skills", id: false, force: :cascade do |t|
    t.integer "job_id"
    t.integer "skill_id"
    t.index ["job_id"], name: "index_jobs_skills_on_job_id"
    t.index ["skill_id"], name: "index_jobs_skills_on_skill_id"
  end

  create_table "jobseekers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobseekers_skills", id: false, force: :cascade do |t|
    t.integer "jobseeker_id"
    t.integer "skill_id"
    t.index ["jobseeker_id"], name: "index_jobseekers_skills_on_jobseeker_id"
    t.index ["skill_id"], name: "index_jobseekers_skills_on_skill_id"
  end

  create_table "matching_percentages", force: :cascade do |t|
    t.integer "job_id", null: false
    t.integer "jobseeker_id", null: false
    t.float "percentage", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id", "jobseeker_id"], name: "index_matching_percentages_on_job_id_and_jobseeker_id", unique: true
    t.index ["job_id"], name: "index_matching_percentages_on_job_id"
    t.index ["jobseeker_id"], name: "index_matching_percentages_on_jobseeker_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "matching_percentages", "jobs"
  add_foreign_key "matching_percentages", "jobseekers"
end
