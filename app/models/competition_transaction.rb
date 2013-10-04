class CompetitionTransaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :competition
  belongs_to :exercise

  after_save :check_competition

  def check_competition
    competition.check_end_condition(user)
  end
end
