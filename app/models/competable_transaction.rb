class CompetableTransaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :transactable, polymorphic: true
  belongs_to :exercise

  after_save :check_if_competition_is_won

  def check_if_competition_is_won
    transactable.set_win_condition(user)
  end
end
