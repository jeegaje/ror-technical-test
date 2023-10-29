class NotificationJob
  include Sidekiq::Job

  def perform(*args, email, title, publish_year, author_name)
    # Do something
      BookMailer.with(email: email, title: title, publish_year: publish_year, author_name: author_name).create.deliver_later
  end
end
