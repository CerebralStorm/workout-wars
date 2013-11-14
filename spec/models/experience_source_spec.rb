require 'spec_helper'

describe ExperienceSource do
  context "associations" do
    it 'should belong to an user' do
      ExperienceSource.reflect_on_association(:user).should_not be_nil
      ExperienceSource.reflect_on_association(:user).macro.should eql(:belongs_to)
    end

    it 'should belong to a experienceable (competition/challenge)' do
      ExperienceSource.reflect_on_association(:experienceable).should_not be_nil
      ExperienceSource.reflect_on_association(:experienceable).macro.should eql(:belongs_to)
    end
  end

  context "validations" do
    it "should require a user" do
      FactoryGirl.build(:experience_source, user_id: "").should_not be_valid
    end

    it "should require a experienceable_id" do
      FactoryGirl.build(:experience_source, experienceable_id: "").should_not be_valid
    end

    it "should require a experienceable_type" do
      FactoryGirl.build(:experience_source, experienceable_type: "").should_not be_valid
    end

    it "should be valid with a user and competition" do
      FactoryGirl.build(:experience_source).should be_valid
    end
  end
end
