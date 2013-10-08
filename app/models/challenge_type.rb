class ChallengeType < ActiveRecord::Base
  belongs_to :category

  def self.default_scope
    order('name ASC')
  end
end
