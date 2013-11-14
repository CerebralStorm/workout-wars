class Team < ActiveRecord::Base
  has_many :competable_registrations, as: :registerable
  has_many :users, through: :competable_registrations, source: :user
  belongs_to :teamable, polymorphic: true

  def registered?(user)
    competable_registrations.find_by(user_id: user.id, team_id: self.id).present?
  end

  def unregister(user)
    competable_registrations.find_by(user_id: user.id, team_id: self.id).destroy
  end

  def total_xp_for_competition(competition)
    result = 0
    users.each do |user|
      result += user.total_xp_for_competition(competition)
    end 
    result
  end

  def user_exercises_for_competition(competition)
    users.collect{|u| u.exercises_for_competition(competition)}.flatten
  end

  def exercises_for_competition_by_exercise_type(competition, exercise_type)
    comps = user_exercises_for_competition(competition)
    comps.collect{|c| c if c.exercise_type_id = exercise_type.id}.compact
  end

end
