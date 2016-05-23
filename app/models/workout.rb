class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :exercises
  has_many :reports
  validates :user, presence: true
end
