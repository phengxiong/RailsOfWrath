class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.newsletter.subject
  #
  def newsletter(newsletter, user)
    @newsletter = newsletter
    @greeting = "Hi"

    mail to: user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contactUs.subject
  #
  def contactUs
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
