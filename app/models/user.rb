class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :records, class_name: 'Record', foreign_key: 'author_id', dependent: :destroy
  has_many :categories, class_name: 'Category', foreign_key: 'user_id', dependent: :destroy

  validates :name, :email, :password, presence: true
end
