class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,            presence: true
  validates :password,            presence: true, format: {with: /\A[a-zA-Z0-9]+\z/, message: "is invalid. Input half-width characters."}
  validates :first_name,          presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name,           presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_katakana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_katakana,  presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :date_of_birth,       presence: true

  has_many :items
  has_many :purchasers
end