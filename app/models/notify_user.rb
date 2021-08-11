class NotifyUser < ApplicationRecord
  enum status: { unread:0 , read: 1 }
  belongs_to :user
  belongs_to :notification
  STATUS_ORDER = [0, 1]

  scope :order_by_status, -> {
    order_by = ['CASE']
    STATUS_ORDER.each_with_index do |status, index|
      order_by << "WHEN status=#{status} THEN #{index}"
    end
    order_by << 'END'
    order(order_by.join(' '))
  }
end
