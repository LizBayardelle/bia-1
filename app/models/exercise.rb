class Exercise < ActiveRecord::Base
  belongs_to :workout
  belongs_to :user
  include Bootsy::Container
end
