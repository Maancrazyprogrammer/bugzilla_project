class User < ApplicationRecord
  has_many :joins, dependent: :destroy
  has_many :projects, through: :joins

  has_many :bugs
  # has_many :projects, through: :bugs

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         enum role: {developer:0, QA:1, manager:2}
end
