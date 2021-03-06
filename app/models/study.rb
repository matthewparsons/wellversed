class Study < ActiveRecord::Base
  attr_accessible :piece_id, :times, :user_id

  belongs_to :user
  belongs_to :piece
  belongs_to :studied, class_name: "User"


  validates :piece_id, presence: true
  validates :user_id, presence: true
end
