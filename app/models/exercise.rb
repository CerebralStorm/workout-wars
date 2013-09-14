class Exercise < ActiveRecord::Base
  belongs_to :workout
  belongs_to :exercise_type
  before_save :update_xp

  validates_presence_of :exercise_type_id

  def total_reps
    return 0 if reps.nil? || sets.nil?
    reps * sets
  end

  def xp_from(metric)
    return 0 if metric.nil?
    (metric * exercise_type.xp_multiplier).floor
  end

  def total_xp
    result = 0
    result += xp_from(total_reps)
    result += xp_from(duration)
    result += xp_from(distance)
    result += xp_from(weight)    
  end

  def update_xp
    self.xp = total_xp
  end
end
