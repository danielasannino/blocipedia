class User < ActiveRecord::Base
  has_many :wikis, dependent: :destroy
  has_many :collaborators, dependent: :destroy
  has_many :wikis, through: :collaborators

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  before_save { self.role ||= :standard }

  enum role: [:standard, :premium, :admin]
end
