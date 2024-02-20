class Project < ApplicationRecord
  has_many :joins, dependent: :destroy, inverse_of: :project
  has_many :users, through: :joins
  accepts_nested_attributes_for :joins, allow_destroy: true, reject_if: :all_blank

  has_many :bugs, dependent: :destroy
  # has_many :users, through: :bugs

  validates :p_Name, presence: :true, uniqueness: true
  validates :p_desc, presence: true
  def self.ransackable_attributes(_auth_object = nil)



    "%w(p_Name)"

end
end
