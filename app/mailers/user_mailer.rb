class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.newsletter.subject
  #
  def newsletter(newsletter, user)
    @newsletter = newsletter
    @greeting = "Repeat Eats Newsletter!"
    mail to: user.email, subject: @newsletter.title
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contactUs.subject
  #



  def contactUs(name, email, phone, question,contact_pref)
    @contact_pref = contact_pref
    @name = name
    @email = email
    @phone = phone
    @question = question
    @greeting =  @name + " " + "Has a question!"
    @subject = "User Question"

    mail to: "bubba99207@gmail.com" , subject: @subject
  end

  def thankyou(name, email, phone, question, contact_pref)
    @contact_pref = contact_pref
    @name = name
    @email = email
    @phone = phone
    @question = question
    @subject =  @name
    @greeting = ("Thank you for Contacting us" + " " + @name )
    mail to: email, subject: @subject
  end

  def sendRecipe(recipe, user)
    @recipe = recipe
    @greeting = "Hello" + user.username
    @subject =  @recipe.title
    mail to: user.email, subject: @subject
  end
end
