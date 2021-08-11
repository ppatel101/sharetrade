module ApplicationHelper
  def unread_notification_count
    current_user.notify_users.unread.count
  end
end
