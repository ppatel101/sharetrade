class Notification < ApplicationRecord
  has_rich_text :description
  validates :title, :description, presence: true
  has_many :notify_users, dependent: :destroy
  has_many :users, through: :notify_users
  belongs_to :organization
  after_create :create_notify_user

  private
  def create_notify_user
    users << self.organization.users
  end
end
