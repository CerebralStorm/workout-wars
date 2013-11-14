require 'spec_helper'

describe Registration do
  context "associations" do
    it 'should belongs to a competition' do
      Registration.reflect_on_association(:competition).should_not be_nil
      Registration.reflect_on_association(:competition).macro.should eql(:belongs_to)
    end

    it 'should belong to a user' do
      Registration.reflect_on_association(:user).should_not be_nil
      Registration.reflect_on_association(:user).macro.should eql(:belongs_to)
    end
  end

  context "validations" do
    it "should require a user" do
      FactoryGirl.build(:registration, user_id: "").should_not be_valid
    end

    it "should require a competition" do
      FactoryGirl.build(:registration, competition_id: "").should_not be_valid
    end

    it "should be valid with a user and competition" do
      FactoryGirl.build(:registration).should be_valid
    end

    it "should be valid with a user and competition" do
      FactoryGirl.build(:registration).should be_valid
    end
  end
end
