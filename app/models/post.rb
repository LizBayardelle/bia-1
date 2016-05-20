class Post < ActiveRecord::Base
  include FriendlyId
  include Bootsy::Container

  friendly_id :title, :use => :slugged
  validates_presence_of :title, :slug, :body

  has_many :comments
  belongs_to :user
  validates :user, presence: true
end
