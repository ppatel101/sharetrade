class System < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :organization
  has_rich_text :description
  validates :name, :description, :purchase_date, presence: true
  validates :warranty_month, inclusion: 0..120
end
