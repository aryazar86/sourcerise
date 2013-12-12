require 'spec_helper'




describe "the signin process", :type => :feature do
  before :each do
    FactoryGirl.create(:user)
  end

  it "signs me in" do
    visit '/user_sessions/new'
    fill_in 'Email', with: 'Doe@doe.com'
    fill_in 'Password', with: 'pass'
    click_button 'Log in'
  

    expect(page).to have_content 'Login successful'

  end

  it "rejects your login if you provide the wrong password" do
    visit '/user_sessions/new'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'wrong'
    click_button 'Log in'
  

    expect(page).to have_content 'failed'
  end



end

