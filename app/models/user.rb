class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :date_of_birth

    with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i } do
      validates :password
    end

    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ } do
      validates :first_name
      validates :last_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :first_name_katakana
      validates :last_name_katakana
    end
  end

  has_many :items
  has_many :purchases
end
