require 'spec_helper'

describe Callout do 
  before do
    @callout = FactoryGirl.build(:callout)
  end
  
  it 'should be valid when it is first built' do
    @callout.should be_valid
  end

  it 'must have a subject' do 
    @callout.subject = nil

    @callout.should_not be_valid
  end

   it 'must have a deadline' do 
      @callout.deadline = nil

      @callout.should_not be_valid
    end
  
  it 'must have a creator' do
    @callout.user_id = nil
    @callout.should_not be_valid
  end

  

end

