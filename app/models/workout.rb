class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :exercises, dependent: :destroy
  after_save :set_user_level
  after_destroy :set_user_level

  validates_presence_of :user_id
  validates_presence_of :date

  accepts_nested_attributes_for :exercises, allow_destroy: true

  def set_user_level
    self.user.set_level
  end

end
