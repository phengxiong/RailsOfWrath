class PageController < ApplicationController
  respond_to :html, :js

  def home


  end

  def login

  end

  def recipes

  end

  def forum

  end

  def store

  end

  def contactUs

      @submitted = params["commit"] #submit
      @form_error = false
      @name = params["name"]
      if @name == ("")
        @error_msg = "Name field is required!"
        @form_error = true
      end
      @name = params["name"]
      @email = params["email"]
      if @email == ("")
        @error_msg = "Must enter a valid email!"
        @form_error = true
      end
      @phone = params["phone"]
      if @phone == ("")
        @error_msg = "Must enter a valid Phone number!"
        @form_error = true
      end
      #text area
      @question = params["question"]
      #Radio Buttons
      contact_pref = params["contact_pref"]
      @rad_email = contact_pref == "email " #Bool T F
      @rad_phone = contact_pref == "phone " #Bool T F
      @contact_pref = params["contact_pref"]
      users = User.all
      if @submitted
        UserMailer.contactUs(@name, @email, @phone, @question, @contact_pref).deliver
        UserMailer.thankyou(@name, @email, @phone, @question, @contact_pref).deliver
        redirect_to root_path, notice: 'Email was successfully sent!'
      end

    end
end
