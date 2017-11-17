FactoryGirl.define do
  factory :log do
    staff_last_name "Johnson"
    member_last_name "Washington"
    member_first_name "George"
    duration 60
    end_time "04:12 PM"
    education_support 1
    pre_vocational 0
    transitional_employment 0
    intensive_supported_employment 1
    ongoing_supported_employment 1
    psychosocial_rehabilitation 1
    habilitation 1
    family_support 0
    face_to_face 1
    activity_log "Provided job consultation."
    follow_up "Will ask next time how job search is going."
    date Date.today
  end
end
