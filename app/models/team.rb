class Team < ActiveRecord::Base
  has_many :team_subscriptions, dependent: :destroy
  has_many :users, through: :team_subscriptions
  has_many :team_competition_subscriptions, dependent: :destroy
  has_many :team_competitions, through: :team_competition_subscriptions

  def registered?(user)
    team_subscriptions.find_by(user_id: user.id, team_id: self.id).present?
  end

end
