require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }

  context "find_for_facebook_oauth" do
    # it "should find an existing user" do
    #   user.save
    #   result = User.find_for_facebook_oauth("facbook", "12345")
    #   result.should == user
    # end

    # it "should create a new user" do
    #   user.save
    #   result = User.find_for_facebook_oauth("facbook", "12345")
    #   result.should == user
    # end
  end

  context "validations" do
    it "should require a name" do
      FactoryGirl.build(:user, :name => "").should_not be_valid
    end

    it "should require an email address" do
      FactoryGirl.build(:user, :email => "").should_not be_valid
    end

    it "should require a password at least 6 digits" do
      FactoryGirl.build(:user, :password => "12345").should_not be_valid
      FactoryGirl.build(:user, :password => "abcde").should_not be_valid
      FactoryGirl.build(:user, :password => "abc123def").should be_valid
      FactoryGirl.build(:user, :password => "Abc123deF").should be_valid
    end
  end

end
