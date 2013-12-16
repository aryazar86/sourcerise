namespace :modify_user do
  
  desc "TODO"
  task make_user_media: :environment do
    
    users = User.all

    users.each do |u|
        u.user_role_id = 1 if u.user_role_id == nil
        u.save!
    end
  end
end
