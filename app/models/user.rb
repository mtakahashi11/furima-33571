class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
      validates :nickname
      validates :password,            format: {with: /\A[a-zA-Z0-9]+\z/, message: "is invalid. Input half-width characters."}
    
    with_options format: {with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :first_name
      validates :last_name
    end

    with_options format: {with: /\A[ァ-ヶー－]+\z/ } do
      validates :first_name_katakana
      validates :last_name_katakana
    end
    
      validates :date_of_birth
  end
  # has_many :items
  # has_many :purchasers
end