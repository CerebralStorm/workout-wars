class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  validates :email, presence: true
  validates_presence_of :password_confirmation, on: :create
  validates :password, presence: true, on: :create
  validates :password, length: { minimum: 6 }, unless: Proc.new { |u| u.password.blank? }

  after_create :setup_global_competition 

  has_many :xp_transactions
  has_many :exercises
  has_many :competitions, through: :competition_subscriptions
  has_many :competition_transactions, dependent: :destroy
  has_many :competition_subscriptions, dependent: :destroy

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user.nil?
      user = User.create(name:auth.extra.raw_info.name, provider:auth.provider, 
                         uid:auth.uid, email:auth.info.email, password:Devise.friendly_token[0,20])
    end
    user
  end

  def exercises_by_date(date)
    exercises.where("date(created_at) = (?)", date)
  end

  def xp
    self.xp_transactions.sum(:amount)
  end

  def next_level_xp
    self.xp_level * self.xp_multiplier
  end

  def previous_level_xp
    (self.xp_level-1) * (self.xp_multiplier-100)
  end

  def xp_for_levelup
    next_level_xp - xp
  end

  def set_level
    while xp >= next_level_xp
      self.level += 1
      self.xp_level += 1
      self.xp_multiplier += 100
    end 
    while xp < previous_level_xp
      break if self.xp_level == 1
      self.level -= 1
      self.xp_level -= 1
      self.xp_multiplier -= 100
    end 
    self.save
  end

  def get_competition_total(competition, exercise_type)
    total = 0
    comp_transactions = competition_transactions.where(competition_id: competition.id)
    comp_transactions.each do |transaction|
      if transaction.exercise.exercise_type == exercise_type
        total += transaction.exercise.total_xp
      end
    end
    total
  end

  def create_competition_transactions(exercise)
    competitions.each do |comp|
      comp.competition_exercises.each do |comp_exercise|
        if exercise.exercise_type == comp_exercise.exercise_type
          CompetitionTransaction.create(user_id: self.id, exercise_id: exercise.id, competition_id: comp.id)
        end
      end
    end
  end

  def setup_global_competition
    global_comp = Competition.find_by(name: "Global")
    CompetitionSubscription.create(user: self, competition: global_comp)
  end
end
