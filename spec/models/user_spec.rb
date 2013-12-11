require 'spec_helper'

describe User do
  before do
    @user = FactoryGirl.build(:user)
  end
  
  it 'should be valid when first built' do 
    @user.should be_valid
  end

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

  end

  # it 'should permit the creation of another user as long as the email is unique'  do 
  #   @user2 = FactoryGirl.create(:user, email: "anemail@email.com")
  #   @user2.should be_valid
  # end

 


end