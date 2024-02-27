class Project < ApplicationRecord
  has_many :joins, dependent: :destroy, inverse_of: :project
  has_many :users, through: :joins
  accepts_nested_attributes_for :joins, allow_destroy: true, reject_if: :all_blank

  has_many :bugs, dependent: :destroy
  # has_many :users, through: :bugs

  validates :p_Name, presence: :true, uniqueness: true
  validates :p_desc, presence: true


  validate :unique_users_within_project

  def unique_users_within_project
    # Check if there are any duplicate user_ids within the project's collaborations
    if joins.map(&:user_id).uniq.size != joins.size
      errors.add(:base, "Users assigned to the project must be unique.")
    end
  end
  def self.ransackable_attributes(_auth_object = nil)



    "%w(p_Name)"

end
end
