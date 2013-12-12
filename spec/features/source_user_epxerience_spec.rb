require 'spec_helper'

feature "sources' visibility in the site" do #, :type => :feature do
  background :each do
    FactoryGirl.create(:user)
  end
  
  scenario "logs in with proper credentials" do
    visit '/user_sessions/new'
    fill_in 'Email', :with => 'Doe@doe.com'
    fill_in 'Password', :with => 'pass'
    click_button 'Log in'
    expect(page).to have_content 'Login successful'
  end

  scenario "source rejected when it logs in with wrong credentials" do
    visit '/user_sessions/new'
    fill_in 'Email', :with => 'Doe@doe.com'
    fill_in 'Password', :with => 'nope'
    click_button 'Log in'
    expect(page).to have_content 'Login failed'
  end

  scenario "source can see media callouts and story suggestions" do 
    visit '/user_sessions/new'
    fill_in 'Email', :with => 'Doe@doe.com'
    fill_in 'Password', :with => 'pass'
    click_button 'Log in'

    visit '/callouts'
    expect(page).to have_content 'Callouts'
    

  end

  scenario "source can see story suggests" do 
    visit '/user_sessions/new'
    fill_in 'Email', :with => 'Doe@doe.com'
    fill_in 'Password', :with => 'pass'
    click_button 'Log in'

    visit '/callouts'
    expect(page).to have_content 'Suggestions'
  end

  scenario "source can post a response less than 300 chars" do 
    visit '/user_sessions/new'
    fill_in 'Email', :with => 'Doe@doe.com'
    fill_in 'Password', :with => 'pass'
    click_button 'Log in'

    visit '/callouts'
    click_link "Callout"
    fill_in 'Comment', :with => 'A response!'
    click_button 'Post comment'
    expect(page).to have_content 'A response!'
  end

  scenario "a response is rejected if it exceeds 300 characters" do 

  end

  scenario "source can see a response to its response" do 

  end

  scenario "source can only see the response it posts or responses to its posts" do

  end




end