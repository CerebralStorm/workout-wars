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

  has_many :workouts
  has_many :exercises, through: :workouts
  has_many :competitions, through: :competition_subscriptions
  has_many :competition_subscriptions

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user.nil?
      user = User.create(name:auth.extra.raw_info.name, provider:auth.provider, 
                         uid:auth.uid, email:auth.info.email, password:Devise.friendly_token[0,20])
    end
    user
  end

  def xp
    self.workouts.map {|w| w.xp }.sum
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

  def check_levelup
    while xp >= next_level_xp
      self.level += 1
      self.xp_level += 1
      self.xp_multiplier += 100
    end 
    self.save
  end

  def check_leveldown
    while xp < previous_level_xp
      break if self.xp_level == 1
      self.level -= 1
      self.xp_level -= 1
      self.xp_multiplier -= 100
    end 
    self.save
  end
end
