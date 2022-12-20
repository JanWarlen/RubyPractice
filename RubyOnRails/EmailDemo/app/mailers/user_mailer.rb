class UserMailer < ApplicationMailer

  default from: 'emailAddress'

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to our site!')
  end
end