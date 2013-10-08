class Challenge < ActiveRecord::Base
  belongs_to :challenge_type
  has_many :challenge_attempts
  has_many :users, through: :challenge_attempts
  has_many :xp_transactions, as: :xp_source

  validates_presence_of :name
end
