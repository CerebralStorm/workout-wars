require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }

  context "find_for_facebook_oauth" do
    # it "should find an existing user" do
    #   user.save
    #   result = User.find_for_facebook_oauth("facebook", "12345")
    #   result.should == user
    # end

    # it "should create a new user" do
    #   user.save
    #   result = User.find_for_facebook_oauth("facebook", "12345")
    #   result.should == user
    # end
  end

  context "associations" do
    it 'should have many exercises' do
      User.reflect_on_association(:exercises).should_not be_nil
      User.reflect_on_association(:exercises).macro.should eql(:has_many)
    end

    it 'should have many competitions' do
      User.reflect_on_association(:competitions).should_not be_nil
      User.reflect_on_association(:competitions).macro.should eql(:has_many)
    end

    it 'should belong to a user' do
      User.reflect_on_association(:competable_registrations).should_not be_nil
      User.reflect_on_association(:competable_registrations).macro.should eql(:has_many)
    end
  end

  context "validations" do
    it "should require an email address" do
      FactoryGirl.build(:user, email: "").should_not be_valid
    end

    it "should require a password at least 6 digits" do
      FactoryGirl.build(:user, password: "12345").should_not be_valid
      FactoryGirl.build(:user, password: "abcde").should_not be_valid
      FactoryGirl.build(:user, password: "abc123def").should be_valid
      FactoryGirl.build(:user, password: "Abc123deF").should be_valid
    end

    it 'should have a nickname' do
      user = FactoryGirl.create(:user)
      user.nickname.should_not be_nil
    end
  end

  context "experience" do
    it "should return my experience" do
      FactoryGirl.create(:exercise, user: user)
      user.xp.should == 95
    end

    it "should tell me how much xp I need for the next level" do 
      FactoryGirl.create(:exercise, user: user)
      user.xp_for_levelup.should == 405
    end

    it "should tell me how much xp I needed for the previous level" do 
      6.times { FactoryGirl.create(:exercise, user: user) }
      user.previous_level_xp.should == 500
    end

    it "should tell me the total xp needed for the next level" do 
      user.next_level_xp.should == 500
    end
  end

  context "leveling up" do
    it "should increase my level when I earn enough experience" do
      6.times { FactoryGirl.create(:exercise, user: user) }
      user.xp.should == 570
      user.set_level
      user.xp_level.should == 2
      user.level.should == 2
    end

    it "should reduce my level if delete enough exercises" do
      6.times { FactoryGirl.create(:exercise, user: user) }
      user.set_level
      user.xp_level.should == 2
      2.times { user.exercises.last.destroy }
      user.set_level
      user.level.should == 1
    end
  end

  context "exercises" do
    it "should return my exercises by date" do
      exercise1 = FactoryGirl.create(:exercise, user: user, created_at: 2.days.ago)
      exercise2 = FactoryGirl.create(:exercise, user: user, created_at: Date.today)
      user.exercises_by_date(Date.today).should == [exercise2]
    end

    it "should count my exercises toward my competitions" do
      competition = FactoryGirl.create(:competition)
      exercise_type = FactoryGirl.create(:exercise_type)
      FactoryGirl.create(:competable_exercise, competable: competition, exercise_type: exercise_type)
      FactoryGirl.create(:competable_registration, user: user, registerable: competition)      
      exercise = FactoryGirl.create(:exercise, exercise_type: exercise_type, user: user)
      user.competition_total_for(competition, exercise_type, :total_xp).should == 95
    end
  end

  context "competitions" do
    before do 
      @individual_comp = FactoryGirl.create(:competition)
      @team_comp = FactoryGirl.create(:team_competition)
      @subscription1 = FactoryGirl.create(:competable_registration, user: user, registerable: @individual_comp) 
      FactoryGirl.create(:competable_registration, user: user, registerable: @team_comp, team: @team_comp.teams.first) 
    end

    it "should return my active competitions" do
      user.active_competitions.should =~ [@individual_comp, @team_comp]
    end

    it "should remove competitions from my active ones when they are completed" do 
      @individual_comp.active = false
      @individual_comp.save
      user.active_competitions.should =~ [@team_comp]
    end

    it "should return my active team competitions" do
      user.active_team_competitions.should == [@team_comp]
    end

    it "should return my active individual competitions" do
      user.active_individual_competitions.should == [@individual_comp]
    end

    it "should return my competitions_won" do      
      @subscription1.rank = 1
      @subscription1.save
      user.competitions_won.should == [@individual_comp ]     
    end

    it "should return my competition transactions for a given competition" do
      exercise = FactoryGirl.create(:exercise, user: user)
      trans = FactoryGirl.create(:competable_transaction, transactable: @individual_comp, user: user, exercise: exercise)      
      user.competable_transactions_for_competition(@individual_comp).should == [trans]
    end  

    it "should return my exercises for a given competition" do  
      exercise = FactoryGirl.create(:exercise, user: user)  
      FactoryGirl.create(:competable_transaction, transactable: @individual_comp, user: user, exercise: exercise)
      user.exercises_for_competition(@individual_comp).should == [exercise]
    end 
    
  end

end
