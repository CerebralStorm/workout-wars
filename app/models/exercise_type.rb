class ExerciseType < ActiveRecord::Base
  has_many :exercises

  def self.default_scope
    order('name ASC')
  end

  def metrics
    results = []
    results << :reps if use_reps?
    results << :distance if use_distance?
    results << :duration if use_duration?
    results << :weight if use_weight?
    results << :calories if use_calories?
    results
  end
end
