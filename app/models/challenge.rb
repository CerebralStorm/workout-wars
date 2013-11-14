class Challenge < ActiveRecord::Base
  belongs_to :challenge_type
  belongs_to :difficulty

  has_many :challenge_attempts
  has_many :competable_registrations, as: :registerable, dependent: :destroy
  has_many :competable_exercises, as: :competable, dependent: :destroy
  has_many :team_users, through: :competable_registrations, source: :user
  has_many :users, through: :challenge_attempts
  has_many :teams, as: :teamable, dependent: :destroy
  has_many :xp_transactions, as: :xp_source

  accepts_nested_attributes_for :competable_exercises, allow_destroy: true

  validates_presence_of :name

  after_create :create_teams, :unless => Proc.new{ self.team == false }

  def completed_by?(user)
    challenge_attempts.exists?(user: user)
  end

  def challenge_attempts_by_user(user)
    challenge_attempts.where(user: user)
  end

  def create_teams
    count = self.number_of_teams - self.teams.count
    count.times do 
      self.teams.create!
    end
  end
end
