class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
         validates :nickname, presence: true
         validates :birthday, presence: true
         
         with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
         validates :name
         validates :surname
         end
         
         with_options presence: true, format: { with: /\A[ァ-ヶー-]+\z/ } do
         validates :name_pseudonym
         validates :surname_pseudonym
         end

         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
        validates :password,length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX}

        end
