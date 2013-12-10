require 'spec_helper'

describe User do
  before do
    @user = FactoryGirl.build(:user)
  end
  
  # let(:user) { User.create(:username => "Matt", :email => "Matt@awesomesauce.com", :password => "1234", :password_confirmation => "1234") }

  it 'must have a first and last name' do 
    
    @user.first_name.should_not == "Joe"
    @user.first_name.should == "John"
    @user.last_name.should == "Doe"
  end

  it 'must have a password' do
    @user.password = nil
    @user.should_not be_valid
  end

  it 'must have an email' do
    @user.email = nil
    @user.should_not be_valid
  end

  it 'the email address must be unique' do
    @user2 = FactoryGirl.create(:user)
    @user2.should_not be_valid

    @user.email = "Doe@doe.com"
    @user.should_not be_valid

  end

 


end