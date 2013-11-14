class Exercise < ActiveRecord::Base
  belongs_to :user
  belongs_to :exercise_type
  has_many :xp_transactions
  has_many :competable_transactions, dependent: :destroy
  after_save :update_user
  after_destroy :remove_xp

  delegate :category, to: :exercise_type
  delegate :name, to: :exercise_type
  delegate :use_reps, to: :exercise_type
  delegate :use_distance, to: :exercise_type
  delegate :use_duration, to: :exercise_type
  delegate :use_weight, to: :exercise_type
  delegate :use_calories, to: :exercise_type
  validates_presence_of :exercise_type_id

  def xp_from(metric)
    return 0 if metric.nil?
    (metric * exercise_type.xp_multiplier).floor
  end

  def total_xp
    result = 0
    result += xp_from(reps)
    result += xp_from(duration)
    result += xp_from(distance)
    result += xp_from(weight) 
    result += xp_from(calories)
    result   
  end

  def update_user
    create_xp  
    user.create_competable_transactions(self)
  end

  def create_xp
    transaction = XpTransaction.find_by user_id: user.id , xp_source_type: "exercise", xp_source_id: self.id
    if transaction
      transaction.amount = total_xp
      transaction.save
    else
      XpTransaction.create(amount: total_xp, user_id: user.id, xp_source_type: "exercise", xp_source_id: self.id)
    end
    user.set_level
  end

  def remove_xp
    XpTransaction.find_by(user_id: user.id , xp_source_type: "exercise", xp_source_id: self.id).destroy
    user.set_level
  end
end
