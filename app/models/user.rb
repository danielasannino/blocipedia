class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum role: [:standard, :premium, :admin]

  has_many :wikis, dependent: :destroy
  has_many :collaborators
  has_many :wikis, through: :collaborators

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :name,
    length: {minimum: 2, maximum: 100},
    presence: true

  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false},
    length: { minimum: 3, maximum: 254},
    format: { with: VALID_EMAIL_REGEX }

  before_save { self.email = email.downcase if self.email.present? }

  def downgrade!
    ActiveRecord::Base.transaction do
      self.update_attribute(:role, :standard)
      self.wikis.where(private: true).all.each do |wiki|
        wiki.update_attribute(:private, false)
      end
    end
  end
  
  def avatar_url(size)
    gravatar_id = Digest::MD5::hexdigest(self.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
end
