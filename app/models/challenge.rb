class Challenge < ActiveRecord::Base
  belongs_to :challenge_type
  has_many :xp_transactions, as: :xp_source
end
