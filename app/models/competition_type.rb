class CompetitionType < ActiveRecord::Base
  has_many :compeititons

  def self.default_scope
    order('name ASC')
  end
end
