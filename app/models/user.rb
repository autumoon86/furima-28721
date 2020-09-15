class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :first_name_kana, presence: true
  validates :family_name_kana, presence: true
  validates :birthday, presence: true
  
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

end
