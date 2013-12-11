# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# UserRole.create!(
#   :role => "Media"
#   )

# UserRole.create!(
#   :role => "Source"
#   )
# Callout.create!(
#   :subject => "This is the first callout",
#   :deadline => "2013-12-13 18:34:00",
#   :description => "This is the first sample callout description",
#   :user_id => 1
#   )
# Callout.create!(
#   :subject => "This is the second callout",
#   :deadline => "2013-12-13 18:34:00",
#   :description => "This is the second sample callout description",
#   :user_id => 1
#   )
# Callout.create!(
#   :subject => "This is the third callout",
#   :deadline => "2013-12-13 18:34:00",
#   :description => "This is the third sample callout description",
#   :user_id => 1
#   )
# Callout.create!(
#   :subject => "This is the fourth callout",
#   :deadline => "2013-12-13 18:34:00",
#   :description => "This is the fourth sample callout description",
#   :user_id => 1
#   )

  location = [
    ["North America", 0],
     ["South America", 0], 
     ["Africa", 0], 
     ["Europe", 0], 
     ["Asia", 0], 
     ["Australia", 0], 
     ["Canada", 1], 
     ["USA", 1], 
     ["Mexico", 1], 
     ["Central America", 2], 
     ["Latin America", 2], 
     ["Subsaharan", 3], 
     ["East Africa", 3], 
     ["West Africa", 3], 
     ["Central Africa", 3], 
     ["Western Europe", 4], 
     ["Eastern Europe", 4], 
     ["Russia", 4], 
     ["Middle East", 5], 
     ["India", 5], 
     ["Central Asia", 5], 
     ["China", 5], 
     ["Southeast Asia", 5], 
     ["Micronesia", 6], 
     ["New Zealand", 6]
]


  location.each do |l|
    Interest.create!(
      :name => l[0],
      :parent_id => l[1],
      :topic => "Location"
      )
  end

issue = [["Human Rights", 0], ["Enviroment", 0], ["Poverty", 0]]

issue.each do |i|
  Interest.create!(
    :name => i[0],
    :parent_id => i[1],
    :topic => "Issue"
    )
end


