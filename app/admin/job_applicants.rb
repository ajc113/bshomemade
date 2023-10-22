ActiveAdmin.register JobApplicant do
  show do |t|
    attributes_table do
      row :email
      row :first_name
      row :last_name
      row :phone_number
      row :work_location
      row :position
      row :start_at
      row :hours_available
      row :full_year_availability
      row :unavailability_reason
      row :high_school_attendee_year
      row :college_attendee_year
      row :valid_age_range_work_permit
      row :job_history
      row :fav_icecream_flavor
      row :referee_referrer_name
    end
  end
end