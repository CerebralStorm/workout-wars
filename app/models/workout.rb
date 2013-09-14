class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :exercises
  after_save :check_user_levelup
  after_destroy :check_user_leveldown 

  validates_presence_of :user_id
  validates_presence_of :date

  accepts_nested_attributes_for :exercises, allow_destroy: true

  def xp
    self.exercises.sum(:xp)
  end

  def check_user_levelup
    self.user.check_levelup
  end

  def check_user_leveldown
    self.user.check_leveldown
  end
end
