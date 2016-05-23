class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include FriendlyId

  friendly_id :first_name, :use => :slugged
  validates_presence_of :first_name, :slug

  before_save { self.email = email.downcase if email.present? }
  before_save { self.role ||= :member }
  before_save :set_full_name

  validates :first_name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :last_name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, unless: :password_digest
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

  has_many :posts
  has_many :comments
  has_many :workouts
  has_many :exercises
  has_many :reports

  has_secure_password

  enum role: [:member, :all_access, :admin]

  def set_full_name
    self.full_name = "#{first_name} #{last_name}"
  end
end
