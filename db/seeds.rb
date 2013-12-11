# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

UserRole.create!(
  :role => "Media"
  )

UserRole.create!(
  :role => "Source"
  )
Callout.create!(
  :subject => "This is the first callout",
  :deadline => "2013-12-13 18:34:00",
  :description => "This is the first sample callout description",
  :user_id => 1
  )
Callout.create!(
  :subject => "This is the second callout",
  :deadline => "2013-12-13 18:34:00",
  :description => "This is the second sample callout description",
  :user_id => 1
  )
Callout.create!(
  :subject => "This is the third callout",
  :deadline => "2013-12-13 18:34:00",
  :description => "This is the third sample callout description",
  :user_id => 1
  )
Callout.create!(
  :subject => "This is the fourth callout",
  :deadline => "2013-12-13 18:34:00",
  :description => "This is the fourth sample callout description",
  :user_id => 1
  )