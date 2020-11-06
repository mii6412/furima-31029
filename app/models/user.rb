class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze}
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    validates :last_name, format: { with: NAME_REGEX }
    validates :first_name, format: { with: NAME_REGEX }
    NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    validates :last_name_kana, format: { with: NAME_KANA_REGEX}
    validates :first_name_kana, format: { with: NAME_KANA_REGEX}
    validates :birthday
  end

  has_many :items
  has_many :purchases
end
