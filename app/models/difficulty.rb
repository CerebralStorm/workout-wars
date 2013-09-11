class Difficulty < ActiveRecord::Base
  has_many :competitions

  validates_presence_of :level
end
