class CompetitionTransaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :competiton
  belongs_to :exercise
end
