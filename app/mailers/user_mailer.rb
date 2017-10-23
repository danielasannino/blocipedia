class UserMailer < ApplicationMailer
  default from: " "

  def new_user(user)
    @user = user
    mail(to: user.email, subject: "Welcome to Blocipedia!")
  end
end
