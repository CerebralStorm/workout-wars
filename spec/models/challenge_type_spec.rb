require 'spec_helper'

describe ChallengeType do
  context "associations" do
    it 'should belong to a category' do
      ChallengeType.reflect_on_association(:category).should_not be_nil
      ChallengeType.reflect_on_association(:category).macro.should eql(:belongs_to)
    end
  end
end
