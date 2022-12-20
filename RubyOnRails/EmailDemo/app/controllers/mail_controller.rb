# frozen_string_literal: true
# app/controllers/mail_controller.rb
class MailController < ApplicationController

  def index
    user = User.find(1)
    UserMailer.welcome(user).deliver_now
    @user = user
  end
end