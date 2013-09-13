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

  def get_total_by_exercise_type(exercise_type_id, metric)
    exercises.where(exercise_type_id: exercise_type_id).map{|e| e.send(metric)}.sum
  end
end
