class CompetableTransaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :transactable, polymorphic: true
  belongs_to :exercise

  after_save :check_if_competition_is_won

  validates_presence_of :user_id
  validates_presence_of :exercise_id
  validates_presence_of :transactable_id
  validates_presence_of :transactable_type

  def check_if_competition_is_won
    transactable.set_win_condition(user)
  end
end
