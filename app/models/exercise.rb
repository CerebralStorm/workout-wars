class Exercise < ActiveRecord::Base
  belongs_to :workout
  belongs_to :exercise_type
  has_many :xp_transactions
  after_save :create_xp
  after_destroy :remove_xp

  validates_presence_of :exercise_type_id

  def total_reps
    return 0 if reps.nil?
    return reps if sets.nil?
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

  def create_xp
    user = self.workout.user
    transaction = XpTransaction.find_by user_id: user.id , xp_source_type: "exercise", xp_source_id: self.id
    if transaction
      transaction.amount = total_xp
      transaction.save
    else
      XpTransaction.create(amount: total_xp, user_id: user.id, xp_source_type: "exercise", xp_source_id: self.id)
    end
  end

   def remove_xp
    user = self.workout.user
    XpTransaction.find_by(user_id: user.id , xp_source_type: "exercise", xp_source_id: self.id).destroy
  end
end
