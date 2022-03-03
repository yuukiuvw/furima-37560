class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :encrypted_password, presence: true
         validates :nickname, presence: true
         validates :birthday, presence: true
         validates :name, presence: true
         validates :name, presence: true
         validates :surname, presence: true
         validates :name_pseudonym, presence: true
         validates :surname_pseudonym, presence: true

        end
