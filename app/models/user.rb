class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  has_many :leave_applications, dependent: :destroy
  has_many :daily_updates, dependent: :destroy
  has_many :notify_users, dependent: :destroy
  has_many :systems, dependent: :destroy
  has_and_belongs_to_many :projects, dependent: :destroy
  belongs_to :organization
  has_many :notifications, through: :notify_users
  has_rich_text :address
  has_rich_text :native_address
  validates_format_of :mobile_number, :parent_mobile_number,
    :with => /[0-9]{3}-[0-9]{3}-[0-9]{4}/,
    :message => " must be in xxx-xxx-xxxx format.",
    :allow_blank => true
  validates_length_of :mobile_number, :parent_mobile_number, is: 12,
  message: "must be 12 digit long", :allow_blank => true
  validate :validate_age
  validates_confirmation_of :password

  private

  def validate_age
    if birth_date.present? && birth_date > 18.years.ago
        errors.add(:birth_date, 'should be over 18 years old.')
    end
  end
end
