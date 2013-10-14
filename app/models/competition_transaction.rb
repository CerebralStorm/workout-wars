class CompetitionTransaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  belongs_to :competition
  belongs_to :exercise

  after_save :check_if_competition_is_won

  def check_if_competition_is_won
    competition.check_win_condition(user)
  end
end
