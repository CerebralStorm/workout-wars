class TeamCompetitionSubscription < ActiveRecord::Base  
  belongs_to :team
  belongs_to :team_competition
end
