class CreateJobApplicants < ActiveRecord::Migration[7.0]
  def change
    create_table :job_applicants do |t|
      t.string :email, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone_number, null: false
      t.string :work_location, null: false
      t.string :position, null: false
      t.datetime :start_at, null: false
      t.integer :hours_available, null: false
      t.text :unavailability_reason, null: false
      t.string :full_year_availability
      t.string :high_school_attendee_year, null: false
      t.string :college_attendee_year, null: false
      t.text :valid_age_range_work_permit, null: false
      t.text :job_history, null: false
      t.string :fav_icecream_flavor, null: false
      t.string :referee_referrer_name, null: false

      t.index ["email"], name: "index_applicants_on_email", unique: true

      t.timestamps
    end
  end
end
