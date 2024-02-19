class Bug < ApplicationRecord
  belongs_to :project
  belongs_to :user, optional: true


  validates :b_Title, presence: true
  validates :status, presence: true
  validates :b_type, presence: true

  enum b_type: {bug:0, feature:1}
  enum status: {newly:0, started:1, resolved:2, completed:3}



end
