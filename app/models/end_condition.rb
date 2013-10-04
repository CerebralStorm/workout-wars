class EndCondition < ActiveRecord::Base
  belongs_to :category
  has_many :competitions
  has_many :challenges
end
