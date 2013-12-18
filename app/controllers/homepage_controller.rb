class HomepageController < ActionController::Base

  def homepage
    @user = User.new
  end
  
end
