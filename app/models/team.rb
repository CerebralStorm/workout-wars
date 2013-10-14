class Team < ActiveRecord::Base
  has_many :team_subscriptions, dependent: :destroy
  has_many :users, through: :team_subscriptions
  has_many :competition_subscriptions, dependent: :destroy
  has_many :competitions, through: :competition_subscriptions

  def registered?(user)
    team_subscriptions.find_by(user_id: user.id, team_id: self.id).present?
  end

  def total_xp_for_competition(competition)
    users.sum{|u| u.total_xp_for_competition(competition)}
  end

  def total_for_competition_by_exercise_type(competition, exercise_type)
  end

end
