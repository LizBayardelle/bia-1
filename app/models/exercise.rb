class Exercise < ActiveRecord::Base
  belongs_to :workout
  belongs_to :user
  has_many :reports
  validates :user, presence: true
end
