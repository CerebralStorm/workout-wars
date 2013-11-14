class CompetableTransaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  belongs_to :transactable
  belongs_to :exercise

  after_save :check_if_competition_is_won

  def check_if_competition_is_won
    competition.set_win_condition(user)
  end
end
