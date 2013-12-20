
UserRole.create!(
  :role => "Media"
  )

UserRole.create!(
  :role => "Source"
  )
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
issue = [["Human Rights", 0], ["Enviroment", 0], ["Poverty", 0], ["Education", 0], ["Health", 0], ["Women", 0], ["Microfinance", 0], ["Disability Inclusion", 0], ["Refugees", 0]]

location = [
   ["North America", 0],
   ["South America", 0], 
   ["Africa", 0], 
   ["Europe", 0], 
   ["Asia", 0], 
   ["Oceania", 0], 
   ["Canada", 1], 
   ["USA", 1], 
   ["Mexico", 1], 
   ["Central America", 2],
   ["Brazil", 2],
   ["Hispanic America", 2]
   ["Northern Africa", 3], 
   ["Western Africa", 3], 
   ["Eastern Africa", 3], 
   ["Central Africa", 3], 
   ["Southern Africa", 3], 
   ["Western Europe", 4], 
   ["Eastern Europe", 4], 
   ["Russia", 4], 
   ["British Isles", 4],
   ["Scandinavia", 4],
   ["Southern Europe", 4],
   ["Middle East", 5], 
   ["South Asia", 5], 
   ["India", 5],
   ["Central Asia", 5], 
   ["China", 5], 
   ["Southeast Asia", 5], 
   ["Micronesia", 6], 
   ["Australia and New Zealand", 6]
]

medium = [["Article", 0], ["Quote", 0], ["Video", 0], ["TV Appearance", 0], ["Radio Appearance", 0], ["Photo", 0], ["Travel to the Field", 0]]

location.each do |l|
  Interest.create!(
    :name => l[0],
    :parent_id => l[1],
    :topic => "Location"
    )
end

issue.each do |i|
  Interest.create!(
    :name => i[0],
    :parent_id => i[1],
    :topic => "Issue"
    )
end

medium.each do |i|
  Interest.create!(
    :name => i[0],
    :parent_id => i[1],
    :topic => "Medium"
    )
end


# #This should create a group of users who are interested in everything 'American'
# names = ["John", "Jack", "Phil", "Caleb", "Graham"]
# americans = []
# names.each do |n|
#   User.create!(
#     :email => "#{n}@#{n}.com",
#     :first_name => "#{n}",
#     :last_name => "#{n}",
#     :password => "pass",
#     :password_confirmation => "pass",
#     :user_role_id => 1
#     )
#   americans << User.last
# end

# all_interests = Interest.all

# american_interests = all_interests.select{|i| i.name.include?("America")}

# americans.each do |u|
#   u.interests = american_interests
# end

# #This creates a group of users who are interested in everything 'African'

# african_names = ["Jane", "Jill", "Hillary"]
# africans = []

# african_names.each do |n|
#   User.create!(
#     :email => "#{n}@#{n}.com",
#     :first_name => "#{n}",
#     :last_name => "#{n}",
#     :password => "pass",
#     :password_confirmation => "pass",
#     :user_role_id => 1
#     )
#   africans << User.last
# end

# african_interests = all_interests.select{|i| i.name.include?("Africa")}

# africans.each do |u|
#   u.interests = african_interests
# end


# all_interests = Interest.all

# american_callouts = []
# american_topics = ["Inequality", "Development", "Democracy", "Transparency", "Socialism"]
# iterating_id = 1
# american_topics.each do |c|
#   Callout.create!(
#     :subject => "#{c} in the hemisphere",
#     :deadline => "2013-12-14 02:23:00",
#     :description => "#{c} and its effects on countries on both continents.",
#     :user_id => iterating_id
#     )
#   iterating_id += 1
#   american_callouts << Callout.last
# end

# american_interests = all_interests.select{|i| i.name.include?("America")}

# american_callouts.each do |c|
#   c.interests << american_interests
# end


# african_topics = ["Inequality", "Development", "Democracy"]
# african_callouts = []
# iterating_id = 6
# african_topics.each do |c|
#   Callout.create!(
#     :subject => "#{c} in Africa",
#     :deadline => "2013-12-14 02:23:00",
#     :description => "#{c} and its effects on countries on both continents.",
#     :user_id => iterating_id
#     )
#   iterating_id += 1
#   african_callouts << Callout.last
# end

# african_interests = all_interests.select{|i| i.name.include?("Africa")}

# african_callouts.each do |c|
#   c.interests << african_interests
# end




