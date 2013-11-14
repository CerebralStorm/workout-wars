require 'spec_helper'

describe CompetitionType do
  context "associations" do
    it 'should have many competitions' do
      CompetitionType.reflect_on_association(:competitons).should_not be_nil
      CompetitionType.reflect_on_association(:competitons).macro.should eql(:has_many)
    end
  end
end
