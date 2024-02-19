class Project < ApplicationRecord
  has_many :joins, dependent: :destroy
  has_many :users, through: :joins

  has_many :bugs
  # has_many :users, through: :bugs
  accepts_nested_attributes_for :joins


end
