class Activity < ActiveRecord::Base
  validates_presence_of :name

  def fields
    fields = []
    fields << :name if name?
    fields << :reps if use_reps?
    fields << :sets if use_sets?
    fields << :duration if use_duration?
    fields << :distance if use_distance?
    fields << :weight if use_weight?
    fields
  end
end
