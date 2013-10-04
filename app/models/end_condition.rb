class EndCondition < ActiveRecord::Base
  belongs_to :category
  has_many :competitions
  has_many :challenges

  def fields
    results = []
    results << :rep_limit unless rep_limit.nil?
    results << :distance_limit unless distance_limit.nil?
    results << :duration_limit unless duration_limit.nil?
    results << :weight_limit unless weight_limit.nil?
    results << :calorie_limit unless calorie_limit.nil?
    results << :date_limit unless date_limit.nil?
    results << :most_reps if most_reps
    results << :most_distance if most_distance
    results << :most_duration if most_duration
    results << :most_weight if most_weight
    results << :most_calories if most_calories
    results
  end
  
end
