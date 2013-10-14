class Team < ActiveRecord::Base
  has_many :team_subscriptions, dependent: :destroy
  has_many :users, through: :team_subscriptions
  has_many :competition_subscriptions, dependent: :destroy
  has_many :competitions, through: :competition_subscriptions

  def registered?(user)
    team_subscriptions.find_by(user_id: user.id, team_id: self.id).present?
  end

  def get_total_xp_for_competition(competition)
    users.sum{|u| u.get_total_xp_for_competition(competition)}
  end

end
