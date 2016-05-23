class Report < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout
  belongs_to :exercise
  has_many :reports
  validates :user, presence: true
end
