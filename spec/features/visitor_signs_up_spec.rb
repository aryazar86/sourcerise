require 'spec_helper'



#This example comes fron the capybara Github page
<<<<<<< HEAD
describe "the signin process", :type => :feature do
  before :each do
    FactoryGirl.build(:user, :email => 'user@example.com', :password => 'caplin')
  end

  it "signs me in" do
    visit '/user_sessions/new'
    fill_in 'Email', with: 'media'
    fill_in 'Password', with: 'media'
    click_button 'Log in'
  

    expect(page).to have_content 'Users show'

  end

  it "rejects your login if you provide the wrong password" do
    visit '/user_sessions/new'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'wrong'
    click_button 'Log in'
  

    expect(page).to have_content 'failed'
  end



end
=======
# describe "the signin process", :type => :feature do
#   before :each do
#     FactoryGirl.build(:user, :email => 'user@example.com', :password => 'caplin')
#   end

#   it "signs me in" do
#     visit '/sessions/new'
#     within("#session") do
#       fill_in 'Login', :with => 'user@example.com'
#       fill_in 'Password', :with => 'password'
#     end
#     click_link 'Sign in'
#     expect(page).to have_content 'Success'
#   end





  
# end

















>>>>>>> more_tests
