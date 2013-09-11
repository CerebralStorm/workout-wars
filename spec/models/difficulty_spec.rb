require 'spec_helper'

describe Difficulty do
  context "validations" do
    it "should require a name" do
      FactoryGirl.build(:difficulty, level: "").should_not be_valid
    end
  end

  context "associations" do
    it 'should have many competitions' do
      Difficulty.reflect_on_association(:competitions).should_not be_nil
      Difficulty.reflect_on_association(:competitions).macro.should eql(:has_many)
    end
  end
end
