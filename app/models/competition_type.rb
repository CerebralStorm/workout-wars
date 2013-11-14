class CompetitionType < ActiveRecord::Base
  has_many :competitons

  def self.default_scope
    order('name ASC')
  end
end
