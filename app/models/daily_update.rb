class DailyUpdate < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_rich_text :description
  validates :description , :in_time, :out_time, presence: true
  validate :date_scope,on: :create
  scope :with_year_and_month, ->(year_month) {
    where("to_char(created_at,'YYYY-Month') = ?", year_month )
  }

  private
  def date_scope
    if DailyUpdate.where("user_id = ? AND DATE(created_at) = DATE(?)", self.user_id, Time.now).all.any?
      errors.add(:user_id,"can create one update only in one day")
    end
  end
end
