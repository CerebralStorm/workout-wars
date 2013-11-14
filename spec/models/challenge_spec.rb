require 'spec_helper'

describe Challenge do
  let(:user) { FactoryGirl.create(:user) }
  let(:challenge) { FactoryGirl.create(:challenge) }

  context "associations" do
    it 'should have many challenge_attempts' do
      Challenge.reflect_on_association(:challenge_attempts).should_not be_nil
      Challenge.reflect_on_association(:challenge_attempts).macro.should eql(:has_many)
    end

    it 'should have many competable_registrations' do
      Challenge.reflect_on_association(:competable_registrations).should_not be_nil
      Challenge.reflect_on_association(:competable_registrations).macro.should eql(:has_many)
    end

    it 'should have many competable_exercises' do 
      Challenge.reflect_on_association(:competable_exercises).should_not be_nil
      Challenge.reflect_on_association(:competable_exercises).macro.should eql(:has_many)
    end

    it 'should have many team_users' do 
      Challenge.reflect_on_association(:team_users).should_not be_nil
      Challenge.reflect_on_association(:team_users).macro.should eql(:has_many)
    end

    it 'should have many users' do 
      Challenge.reflect_on_association(:users).should_not be_nil
      Challenge.reflect_on_association(:users).macro.should eql(:has_many)
    end

    it 'should have many teams' do 
      Challenge.reflect_on_association(:teams).should_not be_nil
      Challenge.reflect_on_association(:teams).macro.should eql(:has_many)
    end

    it 'should have many experience_sources' do 
      Challenge.reflect_on_association(:experience_sources).should_not be_nil
      Challenge.reflect_on_association(:experience_sources).macro.should eql(:has_many)
    end
  end

  context "validations" do
    it "should require an name address" do
      FactoryGirl.build(:challenge, name: "").should_not be_valid
    end
  end

  context "#completed_by?" do
    it "should return true for users that have attempted the challenge" do 
      ChallengeAttempt.create(user: user, challenge: challenge)
      challenge.completed_by?(user).should be_true
    end
    
    it "should return false for users that have not attempted the challenge" do 
      challenge.completed_by?(user).should be_false
    end  
  end

  context "#challenge_attempts_by_user" do
    it "should return the challenge_attempts for the given user" do 
      attempt = ChallengeAttempt.create(user: user, challenge: challenge)
      challenge.challenge_attempts_by_user(user).should  =~ [attempt]
    end
    
    it "should not return any attempts for users that have not attempted the challenge" do 
      user2 = FactoryGirl.create(:user)
      attempt = ChallengeAttempt.create(user: user, challenge: challenge)
      challenge.challenge_attempts_by_user(user2).should  == []
    end
  end

  context "#create_teams" do
    it "should create teams for a team challenge" do 
      team_challenge = FactoryGirl.create(:team_challenge)
      team_challenge.teams.count.should == 2
      team_challenge.team.should be_true
    end
    
    it "should not create teams for an individual challenge" do 
      challenge.teams.count.should == 0
      challenge.team.should be_false
    end
  end
end
