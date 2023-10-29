class BookMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.book_mailer.create.subject
  #
  default from: 'bookyours@example.com'

  def create
    # params[:user]
    # params[:book]

    # mail to: params[:user].email, subject: "Success Create Books"
    mail to: "anggajiyanfajar@gmail.com", subject: "Success Create Books"
  end
end
