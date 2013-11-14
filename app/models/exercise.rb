class Exercise < ActiveRecord::Base
  belongs_to :user
  belongs_to :exercise_type
  has_one :experience_source, as: :experienceable, dependent: :destroy
  has_many :competable_transactions, dependent: :destroy

  delegate :category, to: :exercise_type
  delegate :name, to: :exercise_type
  delegate :use_reps, to: :exercise_type
  delegate :use_distance, to: :exercise_type
  delegate :use_duration, to: :exercise_type
  delegate :use_weight, to: :exercise_type
  delegate :use_calories, to: :exercise_type

  validates_presence_of :exercise_type_id
  validates_presence_of :user_id

  after_save :update_experience_source_and_user

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

  def update_experience_source_and_user
    if experience_source.nil?
      create_experience_source!(amount: total_xp, user: user)
    else
      experience_source.amount = total_xp
      experience_source.save
    end
    user.set_level
    user.create_competable_transactions(self)
  end
end
