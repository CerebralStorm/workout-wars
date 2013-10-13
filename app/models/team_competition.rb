class TeamCompetition < ActiveRecord::Base
  has_many :team_competition_subscriptions
  has_many :teams, through: :team_competition_subscriptions
  has_many :team_competition_exercises

  belongs_to :difficulty
  belongs_to :competition_type
  belongs_to :category
  
  accepts_nested_attributes_for :team_competition_exercises, allow_destroy: true

  def registered?(user)
    all_users = teams.collect{ |t| t.users }
    all_users.flatten.include?(user)
  end
end
