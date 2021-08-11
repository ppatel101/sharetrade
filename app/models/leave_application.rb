class LeaveApplication < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  enum status: { pending:0 , approved: 1 , rejected: 2}
  has_rich_text :description
  validates :subject, :description, :to_date, :from_date, presence: true
  validate :date_scope,on: :create

  def total_days
    (to_date - from_date).to_i + 1
  end

  private
  def date_scope
    
    if to_date.present? && from_date.present?
      if to_date < from_date
        errors.add(:from_date, "must be past to to_date or equal")
      end
    end

    if half_day?
      if !to_time.present?
        errors.add(:to_time, "can't be blank")
      end

      if !from_time.present?
        errors.add(:from_time, "can't be blank")
      end

      if to_date.present? && from_date.present?
        if to_date != from_date
          errors.add(:to_date, "& from date must be same")
        end
      end
    else
      if to_time.present?
        errors.add(:to_time, "must be blank if half_day not checked")
      end
      if from_time.present?
        errors.add(:from_time, "must be blank if half_day not checked")
      end
    end
  end
end
