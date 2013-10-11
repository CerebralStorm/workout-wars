class TeamCompetition < ActiveRecord::Base
  has_many :team_competition_subscriptions
  has_many :teams, through: :team_competition_subscriptions
end
