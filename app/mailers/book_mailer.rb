class BookMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.book_mailer.create.subject
  #
  default from: 'bookyours@example.com'

  def create
    params[:email]
    params[:title]
    params[:publish_year]
    params[:author_name]

    mail to: params[:email], subject: "Success Create Books"
  end
end
