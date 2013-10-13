class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :token_authenticatable,
         :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  validates :email, presence: true
  validates_presence_of :password_confirmation, on: :create
  validates :password, presence: true, on: :create
  validates :password, length: { minimum: 6 }, unless: Proc.new { |u| u.password.blank? }

  before_create :generate_nickname
  after_create :setup_global_competition 

  has_many :xp_transactions
  has_many :exercises
  has_many :challenge_attempts
  has_many :challenges, through: :challenge_attempts
  has_many :competitions, through: :competition_subscriptions
  has_many :competition_transactions, dependent: :destroy
  has_many :competition_subscriptions, dependent: :destroy
  has_many :team_subscriptions, dependent: :destroy
  has_many :teams, through: :team_subscriptions

  delegate :team_competitions, to: :teams

  def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user.nil?
      user = User.create(name:auth.extra.raw_info.name, provider:auth.provider, 
                         uid:auth.uid, email:auth.info.email, password:Devise.friendly_token[0,20])
    end
    user
  end

  def team
    teams.first
  end

  def active_team_competitions
    team_competitions.where(active: true)
  end

  def active_individual_competitions
    competitions.where(active: true)
  end

  def exercises_by_date(date)
    exercises.where("date(created_at) = (?)", date)
  end

  def competition_transactions_for_competition(competition)
    self.competition_transactions.where(competition: competition)
  end

  def exercises_for_competition_by_exercise_type(competition, exercise_type)
    competition_transactions_for_competition(competition).collect{|comp_t| comp_t.exercise if comp_t.exercise.exercise_type_id == exercise_type.id}.compact
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

  def get_competition_total_for(competition, exercise_type, category)
    total = 0
    comp_transactions = competition_transactions.where(competition_id: competition.id)
    comp_transactions.each do |transaction|
      if transaction.exercise.exercise_type == exercise_type
        total += transaction.exercise.send(category)
      end
    end
    total
  end

  def get_total_xp_for_competition(competition)
    comp_transactions = competition_transactions.where(competition: competition)
    comp_transactions.sum{|c_tran| c_tran.exercise.total_xp}
  end

  def create_competition_transactions(exercise)
    active_competitions.each do |comp|
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

  def generate_nickname
    self.nickname = Nickname.get_nickname
  end
end
