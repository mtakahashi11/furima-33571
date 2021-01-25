class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,            presence: true
         validates :password,  format: { with: /\A[a-zA-Z0-9]+\z/, message: "is invalid. Input half-width characters."}
         validates :first_name,          presence: true
         validates :last_name,           presence: true
         validates :first_name_katakana, presence: true
         validates :last_name_katakana,  presence: true
         validates :date_of_birth,       presence: true
   
         has_many :items
         has_many :purchasers
end