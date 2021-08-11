class Organization < ApplicationRecord
  has_many :admins
  has_many :systems, dependent: :destroy
  has_many :users,dependent: :destroy
  has_many :leave_applications
  has_many :daily_updates
  has_many :notifications,dependent: :destroy
  has_many :projects,dependent: :destroy
end
