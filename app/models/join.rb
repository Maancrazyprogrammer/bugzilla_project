class Join < ApplicationRecord
  belongs_to :user
  belongs_to :project


  # validates :user_id, presence: :true, uniqueness: true


end
