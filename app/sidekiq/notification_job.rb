class NotificationJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
    notification = Notification.find_by(is_sent: 0)
    if notification.present?
      BookMailer.create.deliver_later
    end
  end
end
