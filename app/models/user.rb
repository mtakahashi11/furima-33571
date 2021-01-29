class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password,            format: {with: /\A[a-zA-Z0-9]+\z/, message: "is invalid. Input half-width characters."}
    validates :first_name,          format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name,           format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_katakana, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :last_name_katakana,  format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :date_of_birth
  end
  # has_many :items
  # has_many :purchasers
end