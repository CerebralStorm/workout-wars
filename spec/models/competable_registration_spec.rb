require 'spec_helper'

describe CompetableRegistration do
  context "associations" do
    it 'should belongs to a competition' do
      CompetableRegistration.reflect_on_association(:registerable).should_not be_nil
      CompetableRegistration.reflect_on_association(:registerable).macro.should eql(:belongs_to)
    end

    it 'should belongs to a team' do
      CompetableRegistration.reflect_on_association(:team).should_not be_nil
      CompetableRegistration.reflect_on_association(:team).macro.should eql(:belongs_to)
    end

    it 'should belong to a user' do
      CompetableRegistration.reflect_on_association(:user).should_not be_nil
      CompetableRegistration.reflect_on_association(:user).macro.should eql(:belongs_to)
    end
  end

  context "validations" do
    it "should require a user" do
      FactoryGirl.build(:competable_registration, user_id: "").should_not be_valid
    end

    it "should require a registerable_id" do
      FactoryGirl.build(:competable_registration, registerable_id: "").should_not be_valid
    end

    it "should require a registerable_type" do
      FactoryGirl.build(:competable_registration, registerable_type: "").should_not be_valid
    end

    it "should be valid with a user and competition" do
      FactoryGirl.build(:competable_registration).should be_valid
    end
  end
end
