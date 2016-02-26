# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Log.destroy_all

200.times do
  log = Log.new
  log.staff_last_name = Faker::Name.last_name
  log.member_last_name = Faker::Name.last_name
  log.member_first_name = Faker::Name.first_name
  log.duration = rand(1..120)
  log.start_time = Faker::Time.between(60.days.ago, Time.now).strftime("%I:%M %p")
  log.education_support = [0, 1].sample
  log.pre_vocational = [0, 1].sample
  log.transitional_employment = [0, 1].sample
  log.intensive_supported_employment = [0, 1].sample
  log.ongoing_supported_employment = [0, 1].sample
  log.psychosocial_rehabilitation = [0, 1].sample
  log.habilitation = [0, 1].sample
  log.family_support = [0, 1].sample
  log.face_to_face = [0, 1].sample
  log.activity_log = Faker::Lorem.sentence
  log.follow_up = Faker::Lorem.sentence
  log.date = Faker::Date.between(2.days.ago, Date.today).strftime("%m-%d-%Y")
  log.save!
end
