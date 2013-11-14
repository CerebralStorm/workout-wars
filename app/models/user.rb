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

  has_many :xp_transactions
  has_many :exercises
  has_many :challenge_attempts
  has_many :challenges, through: :challenge_attempts
  has_many :competable_registrations
  has_many :competitions, through: :competable_registrations, source: :registerable, source_type: 'Competition'
  has_many :teams, through: :competable_registrations, source: :team
  has_many :competition_transactions, dependent: :destroy  
  has_many :friendships, foreign_key: "user_id", dependent: :destroy
  has_many :occurances_as_friend, class_name: "Friendship", foreign_key: "friend_id", dependent: :destroy

  def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user.nil?
      user = User.create(name:auth.extra.raw_info.name, provider:auth.provider, 
                         uid:auth.uid, email:auth.info.email, password:Devise.friendly_token[0,20])
    end
    user
  end

  def index_name
    secondary = name ? name : email
    "#{self.nickname} (#{secondary})"
  end

  def friends
    occurances_as_friend.collect(&:user) + friendships.collect(&:friend)
  end

  def challenge_attempts_by_challenge(challenge)
    challenge_attempts.where(challenge: challenge)
  end

  def competitions_won
    competable_registrations.where(rank: 1).collect{|comp_s| comp_s.registerable}.flatten   
  end

  def active_competitions
    competitions.where(active: true)
  end
  
  def active_team_competitions
    active_competitions.collect{|c| c if c.teams.count > 0}.reject(&:nil?)
  end

  def active_individual_competitions
    competitions.where(active: true, team: false)
  end

  def exercises_by_exercise_type_id(id)
    exercises.where(exercise_type_id: id)
  end

  def exercises_by_date(date)
    exercises.where("date(created_at) = (?)", date)
  end

  def competition_transactions_for_competition(competition)
    return [] if competition.nil?
    self.competition_transactions.where(competition: competition)
  end

  def exercises_for_competition(competition)
    return [] if competition.nil?
    competition_transactions_for_competition(competition).collect {|comp_t| comp_t.exercise}.compact
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

  def competition_total_for(competition, exercise_type, category)
    total = 0
    comp_transactions = competition_transactions.where(competition_id: competition.id)
    comp_transactions.each do |transaction|
      if transaction.exercise.exercise_type == exercise_type
        total += transaction.exercise.send(category)
      end
    end
    total
  end

  def total_xp_for_competition(competition)
    comp_transactions = competition_transactions.where(competition: competition)
    result = 0
    comp_transactions.each do |comp_t|
      result += comp_t.exercise.total_xp
    end
  end

  def create_competition_transactions(exercise)
    comps_for_exercise = active_competitions.collect{|c| c if c.contains_exercise_type?(exercise.exercise_type)}.compact
    comps_for_exercise.each do |comp|
      CompetitionTransaction.create(user_id: self.id, exercise_id: exercise.id, competition_id: comp.id)
    end
  end

  def generate_nickname
    self.nickname = Nickname.get_nickname
  end
end
