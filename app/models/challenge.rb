class Challenge < ActiveRecord::Base
  belongs_to :challenge_type
  belongs_to :end_condition
  has_many :xp_transactions, as: :xp_source

  validates_presence_of :name
end
