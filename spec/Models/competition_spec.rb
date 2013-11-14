require 'spec_helper'

describe Competition do

  context "associations" do
    it 'should belongs to a competition' do
      Competition.reflect_on_association(:registerable).should_not be_nil
      Competition.reflect_on_association(:registerable).macro.should eql(:belongs_to)
    end

    it 'should belongs to a team' do
      Competition.reflect_on_association(:team).should_not be_nil
      Competition.reflect_on_association(:team).macro.should eql(:belongs_to)
    end

    it 'should belong to a user' do
      Competition.reflect_on_association(:user).should_not be_nil
      Competition.reflect_on_association(:user).macro.should eql(:belongs_to)
    end
  end
  
  context "validations" do
    it "should require a name" do
      FactoryGirl.build(:competition, name: "").should_not be_valid
    end

    it "should be valid with valid data" do
      FactoryGirl.build(:competition).should be_valid
    end
  end

  context "individual registration" do
    it "should have registered users" do
      user = FactoryGirl.create(:user)
      competition = FactoryGirl.create(:competition)
      FactoryGirl.create(:competable_registration, user: user, registerable: competition)
      competition.users.should == [user]
      competition.registered?(user).should be_true
    end 
  end

  context "team registration" do
    it "should have registered teams" do
      user = FactoryGirl.create(:user)
      competition = FactoryGirl.create(:team_competition)
      team = competition.teams.first
      FactoryGirl.create(:competable_registration, user: user, registerable: competition, team: team)
      competition.teams.first.users.should == [user]
      competition.registered?(user).should be_true
    end 
  end

  context "player rank" do 
    it "should return users by rank" do
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      competition = FactoryGirl.create(:competition)
      FactoryGirl.create(:competable_registration, user: user1, registerable: competition)
      FactoryGirl.create(:competable_registration, user: user2, registerable: competition)
      FactoryGirl.create(:exercise, reps: 30, user: user1)
      FactoryGirl.create(:exercise, reps: 50, user: user2)
      competition.users_by_rank.should == [user2, user1]
    end
  end

  context "competition exercises" do 
    it "should contain exercise types" do
      e_type = FactoryGirl.create(:exercise_type)
      comp_e = FactoryGirl.create(:competable_exercise, exercise_type: e_type)
      competition = FactoryGirl.create(:competition, competable_exercises: [comp_e])
      competition.contains_exercise_type?(e_type).should be_true
    end
  end

  context "competition type" do 
    it "should be a team competition" do
      competition = FactoryGirl.create(:team_competition)
      competition.type.should == "Team"
    end

    it "should be a team competition" do
      competition = FactoryGirl.create(:competition, team: false)
      competition.type.should == "Individual"
    end
  end

  context "individual winning" do
    it "should be able to set a winner" do 
      user1 = FactoryGirl.create(:user)
      competition = FactoryGirl.create(:competition)
      FactoryGirl.create(:competable_registration, user: user1, registerable: competition)
      competition.set_winner(user1)
      competition.active.should be_false
      competition.winner.should == user1
    end
  end

  context "team winning" do 
    it "should be able to set a winning team" do 
      user = FactoryGirl.create(:user)
      competition = FactoryGirl.create(:team_competition)
      team = competition.teams.first
      FactoryGirl.create(:competable_registration, team: team , registerable: competition, user: user)
      competition.set_winner(team)
      competition.active.should be_false
      competition.winner.should == team
    end
  end
end
