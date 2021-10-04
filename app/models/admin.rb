class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  belongs_to :organization,optional: true
  delegate :users, to: :organization
  delegate :leave_applications, to: :organization
  delegate :notifications, to: :organization
  delegate :systems, to: :organization
  delegate :projects, to: :organization
  has_many :notices
end
