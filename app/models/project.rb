class Project < ApplicationRecord
  has_many :joins, dependent: :destroy
  has_many :users, through: :joins

  has_many :bugs
  # has_many :users, through: :bugs
  accepts_nested_attributes_for :joins, allow_destroy: true,
  reject_if: :all_blank


end
