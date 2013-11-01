class Team < ActiveRecord::Base
  has_many :team_subscriptions, dependent: :destroy
  has_many :users, through: :team_subscriptions
  belongs_to :competition

  def registered?(user)
    team_subscriptions.find_by(user_id: user.id, team_id: self.id).present?
  end

  def unregister(user)
    team_subscriptions.find_by(user_id: user.id, team_id: self.id).destroy
  end

  def total_xp_for_competition(competition)
    users.sum{|u| u.total_xp_for_competition(competition)}
  end

  def user_exercises_for_competition(competition)
    users.collect{|u| u.exercises_for_competition(competition)}.flatten
  end

  def exercises_for_competition_by_exercise_type(competition, exercise_type)
    comps = user_exercises_for_competition(competition)
    comps.collect{|c| c if c.exercise_type_id = exercise_type.id}.compact
  end

end
