require 'spec_helper'

describe CompetableTransaction do
  context "associations" do
    it 'should belong to an user' do
      CompetableTransaction.reflect_on_association(:user).should_not be_nil
      CompetableTransaction.reflect_on_association(:user).macro.should eql(:belongs_to)
    end

    it 'should belong to an user' do
      CompetableTransaction.reflect_on_association(:exercise).should_not be_nil
      CompetableTransaction.reflect_on_association(:exercise).macro.should eql(:belongs_to)
    end

    it 'should belong to a transactable (competition/challenge)' do
      CompetableTransaction.reflect_on_association(:transactable).should_not be_nil
      CompetableTransaction.reflect_on_association(:transactable).macro.should eql(:belongs_to)
    end
  end

  context "validations" do
    it "should require a user" do
      FactoryGirl.build(:competable_transaction, user_id: "").should_not be_valid
    end

    it "should require a transactable_id" do
      FactoryGirl.build(:competable_transaction, transactable_id: "").should_not be_valid
    end

    it "should require a transactable_type" do
      FactoryGirl.build(:competable_transaction, transactable_type: "").should_not be_valid
    end

    it "should be valid with a user and competition" do
      FactoryGirl.build(:competable_transaction).should be_valid
    end
  end
end
